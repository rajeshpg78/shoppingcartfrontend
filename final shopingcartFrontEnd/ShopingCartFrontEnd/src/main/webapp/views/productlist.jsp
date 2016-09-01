 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%--   <%@ language="java"  --%>
<%--     import="java.util.regex.*"%>   --%>
<%--  <%@  --%>
<%--     String name = request.getParameter("name"); --%>

<%--     final String NAME_PATTERN = "^[a-zA-Z]{3,15}$"; --%>
<%--     Pattern pattern = Pattern.compile(NAME_PATTERN); --%>

<%--     Matcher matcher = pattern.matcher(name); --%>

<%--     if (matcher.matches() == true){ --%>
<%--         response.sendRedirect("productlist.jsp"); --%>

<%--     } else { --%>
<%--         response.sendRedirect("NewFile1.jsp"); --%>
<%--     } --%>

<%-- %> --%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Index Page</title>
<link rel="stylesheet" href="bootstrap.min.css">
<link rel="stylesheet" href="bootstrap-table.css">
<link rel="stylesheet"
	href="/ShoppingFrontEnd/resource/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="/ShoppingFrontEnd/resource/js/bootstrap.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script src="/ShoppingFrontEnd/resource/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
<center><h1>Spring MVC And Hibernate Shopping Cart</h1></center>
<!-- <div class="container"> -->
<!-- <table data-toggle="table"> -->
<!-- <tr> -->
<!--  <td align="left" width="50">  Id  </td> -->
<!-- <td align="left" width="50"> Description </td> -->
<!-- <td align="left" width="50"> Name </td> -->
<!-- <td align="left" width="50">  Price  </td> -->
<!-- <td align="left" width="50"> supplier </td> -->
<!-- <td align="left" width="50">  Order  </td> -->
<!--  </tr> -->
<%--  <c:forEach var="product" items="${productList}"> --%>


<!-- <tr> -->

<%-- <td>${product.id }</td> --%>
<%-- <td>${product.description}</td> --%>
<%-- <td>${product.name}</td> --%>
<%-- <td>${product.price}</td> --%>
<%-- <td>${product.supplier.name}</td> --%>




<%-- <td><a href="${pageContext.request.contextPath}/cart/add/${product.id}">OrderNow</a></td> --%>

<!-- </tr> -->

<%-- </c:forEach> --%>
<!-- </table> -->
<!-- </div> -->
<div class=container>
<table class="table table-bordered" align="center" ><tr>
 
<th align="left" width="50">  Id  </th>
<th align="left" width="50"> Description </th>
<th align="left" width="50"> Name </th>
<th align="left" width="50">  Price  </th>
<th align="left" width="50"> supplier </th>
<th align="left" width="50">  Order  </th>



</tr>


<c:forEach var="product" items="${productList}">


<tr>

<td>${product.id }</td>
<td>${product.description}</td>
<td>${product.name}</td>
<td>${product.price}</td>
<td>${product.supplier.name}</td>




<td><a href="${pageContext.request.contextPath}/cart/add/${product.id}">OrderNow</a></td>

</tr>

</c:forEach>
</table>
</div>
</body>
</html>
 