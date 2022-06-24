package com.tracking.Controller;

import java.io.IOException;


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

import com.mongodb.client.MongoCollection;

import static com.mongodb.client.model.Sorts.descending;

@WebServlet(name = "Delete", value = "/Delete")
public class Delete extends HttpServlet {
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
		activities_collection.deleteOne(new Document("_id", new ObjectId(id)));
			response.sendRedirect("/webapp/Home");
		}
	}
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
	}

}