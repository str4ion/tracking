package com.tracking.Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mongodb.MongoClient;
import com.tracking.DAO.UserDao;
@WebServlet(name = "Register", value = "/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.getServletContext().getRequestDispatcher("/WEB-INF/views/register.jsp").forward(request, response);
	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String login = request.getParameter("login");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String confirm_password = request.getParameter("confirm_password");
		if( password.equals(confirm_password)) {
			UserDao userdao = new UserDao((MongoClient) request.getServletContext()
					.getAttribute("MONGO_CLIENT"));
			//Save User to database....
			userdao.saveUser(login, email, password);
			response.sendRedirect("/webapp/Login");
		}
		else {
			response.sendRedirect("/webapp/Login");
		}

	}

}
