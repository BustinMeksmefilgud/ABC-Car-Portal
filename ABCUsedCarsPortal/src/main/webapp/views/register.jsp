<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>  

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<title>Register</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
</head>

<body>


	<%@ include file="header.jsp"%>

	<div class="container text-center text-info my-3">

		
		<h3>Register</h3>

		
		<sf:form action="register" method="post" class="was-validated text-info text-center" modelAttribute="user">
			<label for="name" class="form-label">Name:</label> <br />
			<div class="row mb-3 justify-content-center">
				
				<sf:input
					type="text" class="form-control w-50" 
					placeholder="Enter name" name="name" path="name" required="true" />
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Enter a name</div>
			</div>
			<label for="userName" class="form-label">Username:</label> <br />
			<div class="row mb-3 justify-content-center">
				<sf:input
					type="text" class="form-control w-50" id="userName"
					placeholder="Enter username" name="userName" path="userName" required="true" />
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Enter your Username</div>
			</div>
			<label for="email" class="form-label">Email:</label> <br />
			<div class="row mb-3 justify-content-center">
				<sf:input
					type="email" class="form-control w-50" 
					placeholder="Enter username" name="email" path="email" required="true" />
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Enter email</div>
			</div>
						<label for="password" class="form-label">Password:</label> <br />
			<div class="row mb-3 justify-content-center">
				<sf:input
					type="password" class="form-control w-50" id="password"
					placeholder="Enter password" name="password" path="password" required="true" />
				<div class="valid-feedback">Valid.</div>
				<div class="invalid-feedback">Enter password, don't forget it</div>
			</div>

			<input type="submit" value="Register"
				class="btn btn-info" />
		</sf:form>
<%@ include file="footer.jsp"%>

</body>
</html>
