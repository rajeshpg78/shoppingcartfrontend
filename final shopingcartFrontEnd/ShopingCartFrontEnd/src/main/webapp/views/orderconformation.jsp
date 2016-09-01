 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style type="text/css">
  h1{
  font-family: "Palace Script MT", Times, serif;
  }
  </style>
</head>
<body>

<center><h1><font color=blue style="Gabriola">Thanks for shopping</font></h1></center>

<table class="table table-inverse">
  <thead>
    <tr>
    <th>S.NO</th>
      <th>Shipping Adress</th>
      <th>total amount</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>${shippingAddress}</td>
      <td>${Totalamount}</td>
    </tr>
    </tbody>
    </table>
${message}<br>
Your Shipping Address is ${shippingAddress}<br>

Total Amount is ${Totalamount}



</body>
</html>