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
<title>Displaying Profile</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
<style>
.profile
{
	background-color: black;
	color: white;
}
</style>
</head>
<body>
	<%
		String firstname = request.getParameter("search-firstname");
		String lastname = request.getParameter("search-lastname");
	
		String mfirstname = "";
		String mlastname = "";
		String dob = "";
		String sex = "";
		
		Connection con = null;
		%>
		<div class="profile">
		<table class="table table-bordered">
		<thead>
		<tr><th>Firstname</th><th>Lastname</th><th>DOB</th><th>Sex</th></tr>
		</thead>
		<tbody>
		<%
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/freesocial","root","Bl117@!#");
			PreparedStatement ps = con.prepareStatement("select * from profile where firstname = ? and lastname = ?");
			ps.setString(1, firstname);
			ps.setString(2, lastname);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				mfirstname = rs.getString("firstname");
				mlastname = rs.getString("lastname");
				dob = rs.getString("dob");
				sex = rs.getString("sex");
				%>
					<tr><td style="color: white"><%= mfirstname%></td><td style="color: white"><%= mlastname%></td><td style="color: white"><%= dob%></td><td style="color: white"><%= sex%></td>
					<td style="color: white"><form action="addfriends.jsp"><input type="hidden" name="email" value="<%= rs.getString("email")%>"><button class="btn btn-primary">Add Friend</button></form>
					</td>
					</tr>
				<%
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	%>
	</tbody>
	</table>
	</div>
	
	<%
		con.close();
	%>
</body>
</html>