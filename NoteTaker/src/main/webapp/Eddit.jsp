<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.entities.Note"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ include file="all_js_css.jsp" %>

<title>Update your Content</title>
</head>
<body>

<div class="container">

<%@ include file="navbar.jsp" %>
<h1>Edit your Note</h1>
<br>


<%

int noteId = Integer.parseInt(request.getParameter("note_id"));

Session s = FactoryProvider.getFactory().openSession();

Note n = (Note)s.get(Note.class, noteId);

s.close();
%>

<form action="UpdateServlet" method="POST">

   <input value="<%=n.getId()%>"name="noteId" type="hidden"/>
  <div class="form-group">
  
    <label for="title">Note title</label>
    <input type="text" 
    class="form-control"
    name="title"
     id="title"
      aria-describedby="emailHelp"
       required="required" 
       placeholder="Enter here"
       value="<%= n.getTitle() %>"
       />
       
    
  </div>
  
  
  <div class="form-group">
  
    <label for="Content">Note Content</label>
    <textarea  id="Content"
    required
     placeholder="Enter your Content"
     name="content"
      class="form-control"
      style="height:300px;">
      <%=n.getContent() %>
      </textarea>
    
  </div>
   <div class="container text-center">
  <button type="submit" class="btn btn-success">save your note</button>
  </div>
  
</form>
</div>

</body>
</html>