<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logging Out</title>
<style type="text/css">

.logout
{
	background-color: black;
	color: white;
}
</style>

</head>
<body>
	<%
		session.invalidate();
	%>
	
	<div class="logout">
	<h2>You have logged out.</h2>
	</div>
</body>
</html>