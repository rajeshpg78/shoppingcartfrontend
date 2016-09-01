<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register User</title>
</head>
<body>

 

	<h2>Please fill the details</h2>
	<c:url var="action" value="register"></c:url>

<div>
	<form:form action="${action}" method="post">
	
		<table>
			<tr>
				<td>User ID:</td>
				<td><input type="text" name="id" required="true"></td>
			</tr>
			<tr>
				<td>User Name:</td>
				<td><input type="text" name="name" required="true"></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type="password" name="password" required="true"></td>
			</tr>
			<tr>
				<td>Mobile No:</td>
				<td><input type="text" name="mobile" required="true"></td>
			</tr>

			<tr>
				<td>Email:</td>
				<td><input type="email" name="email" required="true"></td>
			</tr>
			<tr>
				<td>Addres:</td>
				<td><input type="textarea" width="20" height="10"
					name="address" required="true"></td>
			</tr>


			<tr>
				<td><input type="submit" value="Register">
				<td><input type="reset" value="Reset">
			</tr>

		</table>

	</form:form>
</div>
</body>
</html>