<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FreeSocial</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<style type="text/css">
.heading
{
	background-color: blue;
	text-align: center;
	color: white;
	padding: 10px;
}
.myheading
{
	background-color: black;
	text-align: center;
	color: white;
	padding: 10px;	
}
.myheadingone
{
	background-color: aqua;
	text-align: center;
	color: white;
	padding: 10px;
}
</style>
</head>
<body>

<div class="myheading">
<h1>Welcome To FreeSocial</h1>
</div>

<div class="heading">
<form action="login.jsp" method="get">
<fieldset>
<legend>
<label>Email</label><br>
<input type="email" name="email" required="required" placeholder="email"><br>
<label>Password</label><br>
<input type="password" name="password" required="required" placeholder="password"><br>
<button class="btn btn-primary">Log In</button><br>
</legend>
</fieldset>
</form>
</div>

<div class="myheadingone">
<h4>Not Registered ?</h4><br>
<a href="register.jsp">Register Here</a><br>
</div>

</body>
</html>