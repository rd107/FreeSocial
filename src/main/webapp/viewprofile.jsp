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
	String email = request.getParameter("profiler");
	
	Connection con = null;
	%>
	
	<%
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/freesocial","root","Bl117@!#");
			PreparedStatement ps = con.prepareStatement("select * from profile where email = ?");
			ps.setString(1,email);
			ResultSet rs = ps.executeQuery();
			
			if(rs.next())
			{
				%>
				<label><%= rs.getString("firstname")%></label><label><%= rs.getString("lastname")%></label><label><%= rs.getString("dob")%></label><label><%= rs.getString("sex")%></label>
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