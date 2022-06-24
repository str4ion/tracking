package com.tracking.Controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.mongodb.DBObject;
import com.mongodb.MongoClient;

import com.tracking.DAO.UserDao;
import org.bson.types.ObjectId;



@WebServlet(name = "Login", value = "/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("login") == null) {
			this.getServletContext().getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
		}else {
			this.getServletContext().getRequestDispatcher("/WEB-INF/views/homePage.jsp").forward(request, response);	
		}
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String login = request.getParameter("login");
		String password = request.getParameter("password");
		UserDao userDao=new UserDao((MongoClient) request.getServletContext()
				.getAttribute("MONGO_CLIENT"));
		//Read User from database...
		DBObject user = userDao.readUser(login,password);
		if (user == null) {
			this.getServletContext().getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);

		}else {
			ObjectId idObj = (ObjectId)user.get("_id");
			String id = idObj.toString();
			HttpSession session = request.getSession();
			session.setAttribute("login", user.get("login"));
			session.setAttribute("id", id);
			session.setAttribute("email", user.get("email"));
			session.setMaxInactiveInterval(60*30);
			response.sendRedirect("/webapp/Home");
		}
	
	}
}
