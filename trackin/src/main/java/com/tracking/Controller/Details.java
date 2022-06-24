package com.tracking.Controller;

import java.io.IOException;
import java.util.ArrayList;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mongodb.MongoClient;
import com.tracking.DAO.ActivityDao;

import org.bson.Document;
import org.bson.types.ObjectId;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.mongodb.client.MongoCollection;

import static com.mongodb.client.model.Filters.*;
import static com.mongodb.client.model.Sorts.descending;


@WebServlet(name = "Details", value = "/Details")
public class Details extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ActivityDao act=new ActivityDao((MongoClient) request.getServletContext()
				.getAttribute("MONGO_CLIENT"));
		MongoCollection<Document> activities_collection = act.getActivities_collection();
		String id = request.getParameter("id");
		HttpSession session = request.getSession();
		if (session.getAttribute("login") == null) {
			this.getServletContext().getRequestDispatcher("/WEB-INF/views/SignInPage.jsp").forward(request, response);	
		}else {
			Document activity = activities_collection.find(eq("_id",new ObjectId(id))).first();
			ArrayList<JSONObject> positions = new ArrayList<JSONObject>();  
			JSONObject object = null;
			try {
			
				object = new JSONObject(activity.toJson());
				System.out.println("json sami-----------------------------------------"+object.get("positions"));
				JSONObject jsonObject = (JSONObject) object;               
				JSONArray msg = (JSONArray) jsonObject.get("positions");
				System.out.println("json sami-----------------------------------------"+msg);
				int len = msg.length();
				for (int i=0;i<len;i++){ 
					JSONObject test = (JSONObject) msg.get(i);
					positions.add(test);
				}
			} catch (JSONException e) {
				//some exception handler code.
			}
			

			request.setAttribute("positions", positions);
			this.getServletContext().getRequestDispatcher("/WEB-INF/views/DetailActivite.jsp").forward(request, response);	
		}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}
