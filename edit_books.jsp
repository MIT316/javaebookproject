<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.BookDtls" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin:Add Books</title>
<%@include file="allCss.jsp" %>
<style type="text/css">
/* Your CSS styles */
.navbar {
    background-color: purple !important;
}
</style>
</head>
<body style="background-color:#f0f2f2;">
<%@include file="navbar.jsp"%>
<div class="container">
<div class="row">
<div class="col-md-4 offset-md-4">
<div class="card">
<div class="card-body">
<h4 class="text-center">Edit Books</h4>



<%
int id = Integer.parseInt(request.getParameter("id"));
BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
BookDtls b = dao.getBookById(id);
%>

<form action="../editbooks" method="post" enctype="multipart/form-data">
<input type="hidden" name="id" value="<%=b.getBookId() %>">

<div class="form-group">
    <label for="exampleInputEmail">Book Name</label>
    <input name="bname" type="text" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp" value=<%=b.getBookName() %>>
</div>

<div class="form-group">
    <label for="exampleInputEmail">Author Name</label>
    <input name="author" type="text" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp" value=<%=b.getAuthor() %>>
</div>

<div class="form-group">
    <label for="exampleInputEmail">Price</label>
    <input name="price" type="text" class="form-control" id="exampleInputEmail" aria-describedby="emailHelp" value=<%=b.getPrice() %>>
</div>


<div class="form-group">
    <label for="inputstatus">Book Status</label>
    <select id="inputstatus" name="status" class="form-control">
       
       <% 
      if ("Active".equals(b.getStatus())){
       %> 
          <option value="Active">Active</option>
          <option value="Inactive">Inactive</option>
           <% 
      }else{
    	  %>
    	   <option value="Active">Active</option> 
    	   <% 
      }
       %>
      
        
    </select>
</div>

  
<button type="submit" class="btn btn-primary">Update</button>

</form>
</div>
</div>
</div>
</div>
</div>
<div style="margin-top:20px;">
<%@include file="footer.jsp" %></div>
</body>
</html>
