<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>

<style type="text/css">
h1 {
	color: black;
}
</style>



</head>
<body>

	<%

    response.sendRedirect("views/home.jsp");
%>
	<h1>

		<%=session.getAttribute("loggedInUser")%>

	</h1>
	
	
 
	<div id="adminHome">
		<a href="manageCategories">Manage Categories</a> &nbsp; &nbsp; <a
			href="manageSuppliers">Manage Suppliers</a> &nbsp; &nbsp; <a
			href="manageProducts">Manage Products</a> &nbsp; &nbsp;

	</div>


</body>
</html>