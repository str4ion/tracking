package com.tracking.Controller;

import com.mongodb.MongoClient;
import com.tracking.DAO.ActivityDao;
import com.tracking.DAO.PositionDao;
import org.bson.Document;
import org.bson.types.ObjectId;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(name = "StartActivity", value = "/StartActivity")
public class StartActivity extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("login") == null) {
            this.getServletContext().getRequestDispatcher("/WEB-INF/views/SignInPage.jsp").forward(request, response);
        }else {
            this.getServletContext().getRequestDispatcher("/WEB-INF/views/LancerActivitePage.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Database Get All collections of Position and activities...
        MongoClient mongo = (MongoClient) request.getServletContext()
                .getAttribute("MONGO_CLIENT");
        ActivityDao act=new ActivityDao(mongo);
        PositionDao pos=new PositionDao(mongo);
        //================================================================================//
        String datedebut = request.getParameter("datedebut");
        String datefin = request.getParameter("datefin");
        String nbrminutes = request.getParameter("nbrminutes");
        String sport = request.getParameter("sport");
        String coords = request.getParameter("iteneraire");
        HttpSession session = request.getSession();
        JSONArray array;
        List<Document> positions = new ArrayList<>();
        try {
            array = new JSONArray(coords);
            for(int i=0; i < array.length(); i++)
            {
                JSONObject object = array.getJSONObject(i);
                positions.add(new Document("Latitude", object.getString("lat"))
                        .append("Longitude",object.getString("lng")));
                //Persist Position...
                pos.getPositions_collection().insertOne(new Document("Latitude", object.getString("lat"))
                        .append("Longitude",object.getString("lng")));
            }
        } catch (JSONException e1) {
            e1.printStackTrace();
        }
        // format date ...
        Date datestart = null;
        try {
            datestart = (new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ"))
                    .parse(datedebut.replaceAll("Z$", "+0000"));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        Date datefinish = null;
        try {
            datefinish = (new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ"))
                    .parse(datefin.replaceAll("Z$", "+0000"));
        } catch (ParseException e) {
            e.printStackTrace();
        }
        // persist Activity...
        Document activity = new Document("_id", new ObjectId());
        activity.append("datedebut", datestart).append("positions", positions).append("datefin", datefinish)
                .append("nbrminutes", nbrminutes).append("nomactivite", sport).append("iduser",session.getAttribute("id"));
        act.getActivities_collection().insertOne(activity);
        response.sendRedirect("/webapp/Home");
    }
}
