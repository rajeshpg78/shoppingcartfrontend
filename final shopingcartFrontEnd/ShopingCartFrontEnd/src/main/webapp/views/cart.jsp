<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%-- <%response.sendRedirect("home.jsp"); %> --%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>

<body>
<td align="right"><a href="logout">logout</a></td>
<div align="center">
<h1>cart list</h1>
<table border="2" >
<tr>
<th>Options</th>
<th>Id</th>
<th>Photo</th>
<th>Name</th>
<th>Price</th>
<th>Quantity</th>
<th>Sub Total</th>


</tr>

<c:set var="s" value="0"> </c:set>
<c:forEach var="pr" items="${cartList}">
<c:set var="s" value="${s+ pr.price * pr.quantity}"> </c:set>
<tr>
<td><a href="${pageContext.request.contextPath}/cart/remove/${pr.id }" >Remove</a></td>
<td>${pr.id }</td>
<td>photo</td>
<td>${pr.productName }</td>
<td>${pr.price }</td>
<td>${pr.quantity }</td>
<%-- <td>${pr.price * pr.quantity}</td> --%>
<td>${s}</td>
</tr>

</c:forEach>



<tr><td colspan="6" align="right">Sum</td>
<td>${s}</td>

</tr>
</table>
<a href="${pageContext.request.contextPath}/productlist">Shopping</a><br>
<a href="proceed">proceed</a><br>

</div>




</body>
</html> 