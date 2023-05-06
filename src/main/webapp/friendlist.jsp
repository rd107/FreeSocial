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
<title>Insert title here</title>
</head>
<body>
	<%
		String memail = (String)session.getAttribute("memail");
	
		Connection con = null;
		%>
		
		<label>View Profile -></label><br>
		
		<%
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/freesocial","root","Bl117@!#");
			PreparedStatement ps = con.prepareStatement("select * from friendship where email = ?");
			ps.setString(1,memail);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				%>
				<label><%= rs.getString("otheremail")%></label>
				<form action="viewprofile.jsp" method="post">
				<input type="hidden" name="profiler" value="<%= rs.getString("otheremail")%>">
				<button>View Profile</button>
				</form><br>
				<%
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();			
		}
	%>
</body>
</html>