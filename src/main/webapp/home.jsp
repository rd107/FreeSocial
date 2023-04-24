<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FreeSocial</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<style type="text/css">
.navbar
{
	background-color: green; 
	font-family: sans-serif;
	font: italic;
	color: black;
}
.mess-notif {
    color: #fff;
    background: red;
    padding: 2px;
    border-radius: 2px;
    position: absolute;
    top: -6px;
    right: 0px;
    font-size: 13px;
}
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
		String dob = "";
		String sex = "";
	%>
	
	<%
	
	Connection con = null;
	
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/freesocial","root","Bl117@!#");
		PreparedStatement ps = con.prepareStatement("select * from profile where email = ?");
		ps.setString(1, email);
		ResultSet rs = ps.executeQuery();
		
		if(rs.next())
		{
			dob = rs.getString(4);
			sex = rs.getString(5);
		}
		else
		{
			%>
			<h3 style="color: white; background-color: black;">
			No Such Data Found. Please go to edit profile. 
			</h3>
			<%
		}
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
	%>
	<h1>Welcome <%= firstname+" "+lastname%></h1>
	
	<div class="navbar">
	<nav class="container-fluid">
        <div class="row">
            <div class="col-md-6">
                <div id="search-box">
                <form action="search-record.jsp">
                    <input type="text" name="search-friend" placeholder="Search Friends">
                    <button class="btn btn-primary">Search</button>
                    </form>
                </div>
            </div>
            <div class="col-md-6">
                <ul>
                    <li>
                        <a href="home.jsp"><img class="img-rounded" src="/FreeSocial/src/main/webapp/photo/3.jpg"><%= firstname%></a>
                    </li>
                    <li>
                        <a href="/">Friend Requests</a>
                        <span class="mess-notif">2</span>
                    </li>
                    <li>
                        <a href="/">Message</a>
                        <span class="mess-notif">5</span>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
	</div>
	
	<br>
	<br>
	
	<img alt="" src="">
	
	<br>
	<br>
	
	<table class="table table-bordered">
	<thead>
	<tr>
	<th>FirstName</th><th>LastName</th><th>Date Of Birth</th><th>Sex</th>
	</tr>
	</thead>
	<tbody>
	<tr>
	<td><%= firstname%></td><td><%= lastname%></td><td><%= dob%></td><td><%= sex%></td>
	</tr>
	</tbody>
	</table>
	<br>
	<br>
	<a href="profile.jsp">Edit Profile</a>
	<br>
	<br>
	<a href="logout.jsp">Log out</a>
	
	<%
	
	con.close();
	
	%>
</body>
</html>