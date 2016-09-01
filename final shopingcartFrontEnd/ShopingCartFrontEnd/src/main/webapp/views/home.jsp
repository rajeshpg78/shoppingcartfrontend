<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page session="true"%>
<html>
<head>
<!-- <meta http-equiv="refresh" content="0; URL=./onLoad" /> -->
<spring:url value="resources/menu.css" var="menuCSS" />
<link href="${menuCSS}" rel="stylesheet" />
<link href="css/bootstrap.min.css" rel="stylesheet">
 
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="/resource/css/bootstrap.min.css">
 <link href="sticky-footer-navbar.css" rel="stylesheet">
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
<title>Shopping Cart</title>

<style>
#head {
	color: blue
}
/* Main */
#menu {
	width: 100%;
	margin: 0;
	padding: 10px 0 0 0;
	list-style: none;
	background-color: #111;
	background-image: linear-gradient(#444, #111);
	border-radius: 50px;
	box-shadow: 0 2px 1px #9c9c9c;
}

#menu li {
	float: left;
	padding: 0 0 10px 0;
	position: relative;
}

#menu a {
	float: left;
	height: 25px;
	padding: 0 25px;
	color: #999;
	text-transform: uppercase;
	font: bold 12px/25px Arial, Helvetica;
	text-decoration: none;
	text-shadow: 0 1px 0 #000;
}

#menu li:hover>a {
	color: #fafafa;
}

* html #menu li a:hover { /* IE6 */
	color: #fafafa;
}

#menu li:hover>ul {
	display: block;
}

/* Sub-menu */
#menu ul {
	list-style: none;
	margin: 0;
	padding: 0;
	display: none;
	position: absolute;
	top: 35px;
	left: 0;
	z-index: 99999;
	background-color: #444;
	background-image: linear-gradient(#444, #111);
	-moz-border-radius: 5px;
	border-radius: 5px;
}

#menu ul li {
	float: none;
	margin: 0;
	padding: 0;
	display: block;
	box-shadow: 0 1px 0 #111111, 0 2px 0 #777777;
}

#menu ul li:last-child {
	box-shadow: none;
}

#menu ul a {
	padding: 10px;
	height: auto;
	line-height: 1;
	display: block;
	white-space: nowrap;
	float: none;
	text-transform: none;
}

* html #menu ul a { /* IE6 */
	height: 10px;
	width: 150px;
}

*:first-child+html #menu ul a { /* IE7 */
	height: 10px;
	width: 150px;
}

#menu ul a:hover {
	background-color: #0186ba;
	background-image: linear-gradient(#04acec, #0186ba);
}

#menu ul li:first-child a {
	border-radius: 5px 5px 0 0;
}

  #menu ul li:last-child a {
	border-radius: 0 0 5px 5px;
}

/* Clear floated elements */
#menu:after {
	visibility: hidden;
	display: block;
	font-size: 0;
	content: " ";
	clear: both;
	height: 0;
}

* html #menu {
	zoom: 1;
} /* IE6 */
*:first-child+html #menu {
	zoom: 1;
} /* IE7 */
.container{
width=500px;
}
  
</style>
</head>
<body>


	<!-- starting nav -->


	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">

		<div class="container-fluid">
			<!-- container -->
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-collapse">
				<span class="sr-only"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#"> WELCOME TO SHOPPING CART</a>

			<div class="collapse navbar-collapse">
				<!-- navbar collapse -->

				<ul class="nav navbar-nav navbar-right">
					<!-- nav right -->

					<c:choose>
						<c:when test="${empty loggedInUser}">

							<li class="active"><a href="memberShip"><span
									class="glyphicon glyphicon-user">SignUp</span></a></li>
							<li><a href="loginhere"><spanclass ="glyphicon
										glyphicon-user>SignIn</span></a></li>
							
							<!-- drop down -->
						</c:when>
						<c:when test="${not empty loggedInUser}">
							<li><font color=white>welcome&nbsp;${loggedInUser }</font></li>
							<li class="active"><a href="myCart"><spanclass
										="glyphicon glyphicon-cart>
									</span>MYCART( ${cartSize} )</a></li>
							
							<li class=active><a href="logout"><spanclass ="glyphicon
										glyphicon-logout>logout</span></a></li>
						</c:when>
					</c:choose>
				</ul>
				</div>
				</div>
	</nav>
<br>

</br>

<!-- end of nav -->

 



	<div id="admin">
<font color=red>${message333}</font>
		<c:if test="${isAdmin==true}">

			<%@ include file="/views/adminHome.jsp"%>
		</c:if>
		<c:if test="${isAdminClickedCategories==true}">
		
				<%@ include file="/views/adminHome.jsp"%>
				<%@ include file="/views/category.jsp"%>
			</c:if>
		<c:if test="${isAdmin==false}">

			<%@ include file="/views/productlist.jsp"%>

		</c:if>
		<c:if test="${isAdminClickedProducts==true}">
				<%@ include file="/views/adminHome.jsp"%>%>
				<%@ include file="/views/product.jsp"%>
			</c:if>
			<c:if test="${isAdminClickedSuppliers==true}">
				<%@ include file="/views/adminHome.jsp"%>
				<%@ include file="/views/supplier.jsp"%>
			</c:if>
		
	</div>
	
	
	
	<div id=user>
	<c:if test="${isUserClickedAddCart==true}">
	<%@ include file="/views/cart.jsp"%>
	</c:if>
	<c:if test="${ isUserClickedShopping==true}">
	<%@ include file="/views/productlist.jsp"%>
	</c:if>
	<c:if test="${ isUserClickedProceed ==true}">
	<%@ include file="/views/order.jsp"%>
	</c:if>
	<c:if test="${isUserClickedPlaceOrder==true}">
	<%@ include file="/views/orderconformation.jsp"%>
	</c:if>
	
	</div>
<!-- 	<div id="/categories"> -->
<%-- 			<c:if test="${isAdminClickedCategories==true}"> --%>
<%--  				<%@ include file="/views/adminHome.jsp"%>  --%>
<%-- 				<%@ include file="/views/category.jsp"%> --%>
<%-- 			</c:if> --%>
<!-- 		</div> -->

<!-- 		<div id="/products"> -->
<%-- 			<c:if test="${isAdminClickedProducts==true}"> --%>
<%-- 				<%@ include file="/views/adminHome.jsp"%> --%>
<%-- 				<%@ include file="/views/product.jsp"%> --%>
<%-- 			</c:if> --%>
<!-- 		</div> -->

<!-- 		<div id="/suppliers"> -->
<%-- 			<c:if test="${isAdminClickedSuppliers==true}"> --%>
<%-- 				<%@ include file="/views/adminHome.jsp"%> --%>
<%-- 				<%@ include file="/views/supplier.jsp"%> --%>
<%-- 			</c:if> --%>
<!-- 		</div> -->
	
	
	<div id="loginhere">
 <br></br>
	 &nbsp;&nbsp;&nbsp;<font color=red>${message1}${errorMessage}</font> 

		<c:if
			test="${isUserClickedLoginUserHere==true ||invalidCredentials==true }">

			<div id="error">${errorMessage}</div>
			<%@ include file="/views/login.jsp"%>

		</c:if>

		<c:if test="${not empty submitDone}">
			<script>
				alert("Form submitted");
			</script>
		</c:if>
		<c:if
			test="${isUserClickedRegisterHere==true||invalidCredentails==true }">
<%-- 			<div id="error">${message}</div> --%>
			<%@ include file="/views/register.jsp"%>
		</c:if>

	</div>
	
	 
	<div>
	
	
	
	
	</div>
	<br></br>
	<c:if test="${UserId ne 6161}">
<div class="container">
		
			<div class="row">
				<div class="col-md-12">
					<div id="myCarousel" class="carousel slide" data-ride="carousel">
						<!-- Indicators -->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel" data-slide-to="1"></li>
							<li data-target="#myCarousel" data-slide-to="2"></li>
						</ol>
						<div class="carousel-inner" role="listbox">
						<div class="container-fluid">
									<div class="carousel-caption">
										<h1><font color=yellow>Welcome to MY BOOK'S</h1></font></
										<p><font color=orange>Here you can browse and buy Technical Books
											and.......</font></p>
									</div>
								</div>
							<div class="item active">
								<img class="first-slide home-image"
									src="resources/images/Books-for-Survey.jpg" alt="First slide">
								
							</div>
							<div class="item">
								<img class="second-slide home-image"
									src="resources/images/new1.jpg"
									alt="Second slide">

							</div>
							<div class="item">
								<img class="third-slide home-image "
									src="resources/images/book6.jpg" alt="Third slide">

							</div>
						</div>
						<a class="left carousel-control" href="#myCarousel" role="button"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a> <a class="right carousel-control" href="#myCarousel"
							role="button" data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
</div>
</div>
</div>

</c:if>
					<!-- 	<table width="100%"> -->
					<!-- 		<tr> -->
					<!-- 			<td>Exist user <a href="login.jsp"> Login here</a> <br></td> -->
					<!-- 			<td align="center">New user<a href="views/register.jsp"> -->
					<!-- 					Register here</a></td> -->
					<%-- 			<td align="right"> <a href="myCart">  My Cart  </a>( ${cartSize} )</td> --%>


					<!-- 		</tr> -->
					<!-- 	</table> -->
					<hr color="red" size="5">

					<ul id="menu">
						<c:forEach items="${categoryList}" var="category">
							<li><a href=${category.name}>${category.name}</a>
								<ul>
									<c:forEach items="${category.products}" var="product">

										<li><a href="<c:url value='product/get/${product.id}' />">${product.name}</a></li>

									</c:forEach>

								</ul></li>
						</c:forEach>

					</ul>
					<hr color="red" size="5">
					<br>
					<br>
					<br>
					<div>
						<c:if test="${!empty selectedProduct.name}">
							<table>
								<tr>
									<th align="left" width="80">Product ID</th>
									<th align="left" width="120">Product Name</th>
									<th align="left" width="200">Product Description</th>
									<th align="left" width="80">Price</th>
									<th align="left" width="200">Product Category</th>
									<th align="left" width="200">Product Supplier</th>
									<th align="left" width="200">order</th>

								</tr>
								<tr>
									<td align="left">${selectedProduct.id}</td>
									<td align="left">${selectedProduct.name}</td>
									<td align="left">${selectedProduct.description}</td>
									<td align="left">${selectedProduct.price}</td>
									<td align="left">${selectedProduct.category.name}</td>
									<td align="left">${selectedProduct.supplier.name}</td>
									<td align="left"><a href="login">order</a>
								</tr>
							</table>
						</c:if>
					</div>

					<div id="displayCart">
						<c:if test="${displayCart==true}">

							<table>
								<tr>
									<th align="left" width="80">Cart ID</th>
									<th align="left" width="120">Product Name</th>
									<th align="left" width="200">Quantity</th>
									<th align="left" width="80">Price</th>
									<th align="left" width="60">Delete from Cart</th>

								</tr>
								<c:forEach items="${cartList}" var="cart">
									<tr>
										<td align="left">${cart.id}</td>
										<td align="left">${cart.productName}</td>
										<td align="left">${cart.quantity}</td>
										<td align="left">${cart.price}</td>
										<td align ="left">${cart.odrder }</td>
										<td align="left"><a
											href="<c:url value='/cart/delete/${cart.id}'  />">Delete</a></td>
										<td align="left"><a
											href="<c:url value='pay/${cart.id}' />"> Proceed</a></td>
									</tr>
								</c:forEach>

							</table>

							<h2>Total cost : ${totalAmount}</h2>
							<%-- <a href="<c:url value='/pay/${cart.userID}'/>">Proceed</a>  --%>
							<a href="<c:url value='/pay/${cart.id}'/>">Proceed</a>
						</c:if>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a href="prod?name=LetUsC"> <img
							src=<c:url value="/resources/images/bksdstc2.jpg"/>
							class="img-circle" alt="Cinque Terre" width="300" height="236" />
						</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						 <a href="prod?name=C++"> <img
							src=<c:url value="/resources/images/programmingincpp.jpg"/>
							class="img-circle" alt="CinquTerre" width="300" height="236" />
						</a>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;				
						 <a href="prod?name=java"> <img
							src=<c:url value="/resources/images/{9E60640B-CB0B-40A5-8AC0-77089E20028C}Img100.jpg"/>
							class="img-circle" alt="CinquTerre" width="300" height="236" />
						</a>
						
					</div>
					
<!-- <div class="container-fluid"> -->
    <nav class="footer navbar-inverse footer-fixed-down" role="navigation">
  
   <a class="footer-brand" href="#"> Copyright © Your My book'S website 2016</a>
    </nav>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="../../assets/js/vendor/jquery.min.js"><\/script>')</script>
    <script src="../../dist/js/bootstrap.min.js"></script>
    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>