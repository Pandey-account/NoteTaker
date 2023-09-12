package com.Servlets;

import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		try {
			int noteId = Integer.parseInt(request.getParameter("note_id").trim());
			
			Session s = FactoryProvider.getFactory().openSession();
			
			Note n= s.get(Note.class, noteId);
			Transaction tx=s.beginTransaction();
			s.delete(n);
			tx.commit();
			s.close();
			response.sendRedirect("all_notes.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		
	}


	
}
