package com.tracking.Controller;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;
import com.tracking.DAO.ActivityDao;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Home", value = "/Home")
public class Home extends HttpServlet {
    private static final long serialVersionUID = 1L;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("login") == null) {
            this.getServletContext().getRequestDispatcher("/WEB-INF/views/SignInPage.jsp").forward(request, response);
        }else {
            ActivityDao act=new ActivityDao((MongoClient) request.getServletContext()
                    .getAttribute("MONGO_CLIENT"));
            List<DBObject> activities = act.readAllActivities(session.getAttribute("id").toString());
            request.setAttribute("activities", activities);
            this.getServletContext().getRequestDispatcher("/WEB-INF/views/home.jsp").forward(request, response);
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
