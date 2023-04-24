<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<style type="text/css">
.editform
{
	color: white;
	background-color: blue;
	padding: 10px;
}
</style>
</head>
<body>

	<%
	String firstname = (String)session.getAttribute("firstname");
	String lastname = (String)session.getAttribute("lastname");
	String email = (String)session.getAttribute("memail");
	%>

	<div class="editform">
	<form action="edit-record.jsp" method="post">
	<input type="text" name="firstname" value="<%= firstname%>"><br>
	<input type="text" name="lastname" value="<%= lastname%>"><br>
	<input type="date" name="dob"><br>
	<input type="radio" name="sex" value="male">
  	<label>Male</label><br>
  	<input type="radio" name="sex" value="female">
  	<label>Female</label><br>
	<button class="btn btn-primary">Save Changes</button>
	</form>
	</div>

</body>
</html>