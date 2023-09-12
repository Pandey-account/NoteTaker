package com.Servlets;

import java.io.IOException;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		try {
			
			String title=request.getParameter("title");
			String content =request.getParameter("content");
			int notId=Integer.parseInt(request.getParameter("noteId").trim());
			
			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx= s.beginTransaction();
			
		    Note n=	s.get(Note.class, notId);
		    n.setTitle(title);
		    n.setContent(content);
		    n.setAddedDate(new Date());
			
			tx.commit();
			s.close();
			
			response.sendRedirect("all_notes.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
