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
<title>Adding Friends</title>
<style type="text/css">
.friendcenter
{
	background-color: blue;
	color: white;
}
</style>
</head>
<body>
	<%
		String memail = (String)session.getAttribute("memail");
		String email = request.getParameter("email");
		int i = 0;
		
	Connection con = null;
	
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/freesocial","root","Bl117@!#");
		PreparedStatement ps = con.prepareStatement("select * from friendship where email = ? and otheremail = ?");
		ps.setString(1, memail);
		ps.setString(2, email);
		ResultSet rs = ps.executeQuery();
		if(rs.next())
		{
			String status = rs.getString("status");
			if(status.equalsIgnoreCase("friends"))
			{
			%>
			<div align="center" class = "friendcenter">
			<h3>Already Friends</h3>
			</div>
			<%
			}
			
		}
		else
		{
				PreparedStatement ps2 = con.prepareStatement("insert into friendship(email,otheremail,status) values(?,?,?)");
				ps2.setString(1, memail);
				ps2.setString(2, email);
				ps2.setString(3, "friends");
				i = ps2.executeUpdate();
				if(i>0)
				{
					%>
					<h2>Adding friend successful.</h2>
					<%
				}
				else
				{
					%>
					<h2>Failed to add friend.</h2>
					<%
				}
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	%>
	
	<a href="home.jsp">Home</a>
	
	<%
	con.close();
	%>
</body>
</html>