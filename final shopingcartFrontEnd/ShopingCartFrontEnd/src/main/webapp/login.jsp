<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>

<title>Shopping chart</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style >
  
  .jumbotron {
  margin-bottom: 0px;
  height: 350px;
  color: white;
  text-shadow: black 0.3em 0.3em 0.3em;
   background-image:url(resources/images/book2.jpg);
  background-size: cover;
}
  
  </style>
 

</head>
<body>

Please login with your credentials  <br>

	
	<c:url var="action" value="/isValidUser"></c:url>
${message}

<div class="container">
<div class="jumbotron">
<div class="col-md-4">
</div>

	<div class="col-md-4">
	
	<form action="${action}" method="post"> 
 				USERNAME: <input type="text" name="name" class="form-control"
 					required="true" /><br></br> 
 					 PASSWORD:<input type="password" 
 					name="password" class="form-control" required="true" /><br></br>
 		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
				<button type="Submit" class="btn active btn-primary" onclick="alert('hello welcome to my books')"> 
 					&nbsp;&nbsp;&nbsp;LOGIN</button>
 					</form>
	</div>


</div>
</div>
	


</body>
</html>