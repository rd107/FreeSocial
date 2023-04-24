<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Editing...</title>
</head>
<body>

	<%
	String firstname = (String)session.getAttribute("firstname");
	String lastname = (String)session.getAttribute("lastname");
	String email = (String)session.getAttribute("memail");
	String dob = request.getParameter("dob");
	String sex = request.getParameter("sex");
	int i=0;
	
	%>

	<%
	
	Connection con = null;
	
	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/freesocial","root","Bl117@!#");
		PreparedStatement ps = con.prepareStatement("insert into profile(email,firstname,lastname,dob,sex,flag) values(?,?,?,?,?,?)");
		ps.setString(1, email);
		ps.setString(2, firstname);
		ps.setString(3, lastname);
		ps.setString(4, dob);
		ps.setString(5, sex);
		ps.setString(6, String.valueOf(1));
		i=ps.executeUpdate();
		
		if(i>0)
		{
			%>
			<h3 style="color: white; background-color: black;">
			Record Edited. 
			</h3>
			<%		
		}
		else
		{
			%>
			<h3 style="color: white; background-color: black;">
			Record Not Edited. 
			</h3>
			<%
		}
		
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
	
	%>
	
	<%
	
	con.close();
	
	%>

</body>
</html>