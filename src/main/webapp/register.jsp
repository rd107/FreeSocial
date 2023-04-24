<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>

<h1 style="background-color: black; color: white;">Register Here</h1>

<div class="register">
<div class="m-4">
    <form action="save-record.jsp" method="post">
        <div class="mb-3">
            <label class="form-label" for="inputFirstName">First Name</label>
            <input type="text" name="firstname" class="form-control" id="inputfirstname" placeholder="First Name" required>
        </div>
        <div class="mb-3">
            <label class="form-label" for="inputLastName">Last Name</label>
            <input type="text" name="lastname" class="form-control" id="inputlastname" placeholder="Last Name" required>
        </div>
        <div class="mb-3">
            <label class="form-label" for="inputEmail">Email</label>
            <input type="email" name="email" class="form-control" id="inputEmail" placeholder="Email" required>
        </div>
        <div class="mb-3">
            <label class="form-label" for="inputPassword">Password</label>
            <input type="password" name="password" class="form-control" id="inputPassword" placeholder="Password" required>
        </div>
        <button type="submit" class="btn btn-primary">Register</button>
    </form>
</div>
</div>

</body>
</html>