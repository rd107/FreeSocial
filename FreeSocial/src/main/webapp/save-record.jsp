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
<title>Saving...</title>
</head>
<body>

<%
	int i=0;
	String firstname = request.getParameter("firstname");
	String lastname = request.getParameter("lastname");
	String email = request.getParameter("email");
	String password = request.getParameter("password");

	Connection con = null;


	try
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/freesocial","root","Bl117@!#");
		PreparedStatement ps = con.prepareStatement("insert into credentials(firstname, lastname, email, password) values(?,?,?,?)");
		ps.setString(1, firstname);
		ps.setString(2, lastname);
		ps.setString(3, email);
		ps.setString(4, password);
		i = ps.executeUpdate();
		
		if(i>0)
		{
			%>
			<hr color="blue">
			<h3 style="background-color:black; color: white;">Save Record Successful</h3>
			<hr color="blue" >
			<%
			response.sendRedirect("index.jsp");
		}
		else
		{
			%>
			<hr color="blue">
			<h3 style="background-color:black; color: white;">Save Record Unsuccessful</h3>
			<hr color="blue" >
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