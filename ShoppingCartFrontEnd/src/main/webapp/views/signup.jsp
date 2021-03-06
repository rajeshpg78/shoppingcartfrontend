<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register User</title>
</head>
<body>

	<h2>Please fill the details</h2>

	<form:form action="userregister" method="post" commandName="user">
		<table>
			<tr>
				<td><form:label path="id">
						<spring:message text="ID" />
					</form:label></td>

				<td><form:input path="id" pattern=".{4,7}" required="true"
						title="id should contains 4 to 7 characters" /></td>
			</tr>
			<tr>
				<td><form:label path="name">
						<spring:message text="User Name" />
					</form:label></td>

				<td><form:input path="name" required="true"
						title="name should not be empty" /></td>
			</tr>
			<tr>
				<td><form:label path="password">
						<spring:message text="Password" />
					</form:label></td>

				<td><form:input path="password" pattern=".{4,15}"
						required="true"
						title="password should contains 4 to 15 characters" /></td>
			</tr>
			<tr>
				<td><form:label path="mobile">
						<spring:message text="Mobile" />
					</form:label></td>

				<td><form:input type="tel" path="mobile" pattern="^\d{10}$" required="true"
						title="Please enter valid mobile number" /></td>
			</tr>

			<tr>
				<td><form:label path="email">
						<spring:message text="Email" />
					</form:label></td>

				<td><form:input type="email" path="email" /></td>
			</tr>

			<tr>
				<td><form:label path="address">
						<spring:message text="Address" />
					</form:label></td>

				<td><form:textarea path="address" rows="5" cols="30" required="true"/></td>
			</tr>
			
		<tr>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
		</tr>
		<tr>
		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit"
					value="RESET" ></td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="submit"
					value="REGISTER" ></td>
		</tr>
		
		</table>

	</form:form>

</body>
</html>