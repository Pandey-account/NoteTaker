<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@ include file="all_js_css.jsp" %>

<title>Add Notes</title>
</head>
<body>


<div class="container">

<%@ include file="navbar.jsp" %>

<h1>Please fill your note details</h1>
<br>


<!-- this is add form -->



<form action="SaveNoteServlet" method="POST">

  <div class="form-group">
  
    <label for="title">Note title</label>
    <input type="text" 
    class="form-control"
    name="title"
     id="title"
      aria-describedby="emailHelp"
       required="required" 
       placeholder="Enter here"/>
    
  </div>
  
  
  <div class="form-group">
  
    <label for="Content">Note Content</label>
    <textarea  id="Content"
    required
     placeholder="Enter your Content"
     name="content"
      class="form-control"
      style="height:300px;">
      </textarea>
    
  </div>
   <div class="container text-center">
  <button type="submit" class="btn btn-primary">add</button>
  </div>
  
</form>

</body>
</html>
</div>