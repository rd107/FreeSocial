<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FreeSocial</title>
</head>
<body>
	<%
		String firstname = (String)session.getAttribute("firstname");
		String lastname = (String)session.getAttribute("lastname");
	%>
	<h1>Welcome <%= firstname+" "+lastname%></h1>
	
	<div class="navbar">
	
	</div>
	
</body>
</html>