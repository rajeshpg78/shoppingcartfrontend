<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 //EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<style type="text/css">
h7 {
	color:white;
}
</style>




<title>home page</title>
</head>
<body>



	MY BOOKs
	<div class="w3-hide-large w3-hide-large w3-padding-12"
		style="margin-top: 8px;"red"">
		<div class="w3-center">
			<a class='w3schools-logo' href='#'> <span class='dotcom'>.com</span>
			</a>
		</div>


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
							<li class="active"><a href="newuser"><span
									class="glyphicon glyphicon-user">SignUp</span></a></li>
							<li><a href="loginhere"><spanclass ="glyphicon
										glyphicon-user>SignIn</span></a></li>
							<!-- drop down -->
						</c:when>
						<c:when test="${not empty loggedInUser}">
				<h7>welcome ${loggedInUser}</h7>
				<td align="right"><a href="logout">logout</a></td>
						</c:when>
					</c:choose>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Categories<b class="caret"></b></a>

						<ul class="dropdown-menu">
							<li class="dropdown-header">Book's</li>
							<li><a href="#">storie's</a></li>
							<li><a href="#">CSE</a></li>
							<li><a href="#">ECE</a></li>
							<li><a href="#">MEC</a></li>
						</ul></li>
					<!-- dropdown end -->
				</ul>


			</div>

		</div>
		</div>
		<div id="newuser">
			<c:if test="${isUserClickedRegisterHere==true }">
				<%@ include file="/views/signup.jsp"%>

			</c:if>
		</div>
		<div id="loginhere">
			<c:if test="${isUserClickedLoginUserHere==true }">
				<%@ include file="/views/signin.jsp"%>

			</c:if>
		</div>
		<div id="login">
		<c:if test="${ isValidUser==true}">
		<%@ include file="/views/adminHome.jsp" %>
		</c:if>
		</div>
		<!-- close col-md --> <!-- row close --> </nav>
		<div class="jumbotron">
			<div class="container">
				<div class="row">
					<div class="col-md-12">

						<!-- Carousel
        ================================================== -->
						<div id="myCarousel" class="carousel slide" data-ride="carousel">
							<!-- Indicators -->
							<ol class="carousel-indicators">
								<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
								<li data-target="#myCarousel" data-slide-to="1"></li>
								<li data-target="#myCarousel" data-slide-to="2"></li>
							</ol>
							<div class="carousel-inner" role="listbox">
								<div class="item active">
									<img class="first-slide home-image"
									src="http://www.uglydogbooks.com/wp-content/uploads/2014/04/books.jpg"

										alt="First slide">
									<div class="container-fluid">
										<div class="carousel-caption">
											<h1>Welcome to MY BOOK'S</h1>
											<p>Here you can browse and buy Stories books,moral books
												and.......</p>
										</div>
									</div>
								</div>
								<div class="item">
									<img class="second-slide home-image"
										src="http://images.freeimages.com/images/premium/previews/2833/28330832-row-of-education-books.jpg"
									alt="Second slide">

								</div>
								<div class="item">
									<img class="third-slide home-image "
										src="http://www.bookicious.com/img/bk.jpg"
										alt="Third slide">

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
						<!-- carousel -->



					</div>
				</div>
			</div>
		</div>
		<p>
		<h1>

			<!--<%=session.getAttribute("loggedInUser")%>  -->

		</h1>
		</p>



		
		</div>





		<script
			src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script
			src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>