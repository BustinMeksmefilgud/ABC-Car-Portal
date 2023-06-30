<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>

<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>
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

		<c:if test="${error_string != null}">

			<div class="alert alert-danger">${error_string}
				Did you <a href="register_user"> register</a> an account?
			</div>

		</c:if>

		<c:if test="${success_login != null}">
			<div class="alert alert-success">${success_login}
				Go <a href="home"> Home</a>
			</div>
		</c:if>

		<c:if test="${success_logout != null}">
			<div class="alert alert-success">${success_logout}
				Click here to <a href="login">Login</a>
			</div>
			
		</c:if>
		
		<c:if test="${success_register != null}">

			<div class="alert alert-success">${success_register} Login below</div>

		</c:if>
		<c:if test="${ (success_logout == null) && (success_login == null) }">

			<h3>Login</h3>

			<form action="/login" method="post" class="was-validated">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			
					<label for="username" class="form-label">Username:</label> <br />
					<div class="row mb-3 justify-content-center">
						<input
							type="text" class="form-control w-50" id="userName"
							placeholder="Enter username" name="username" value="" required>
						<div class="valid-feedback">Valid.</div>
						<div class="invalid-feedback">Enter Username</div>
					</div>
				
					<label for="password" class="form-label">Password:</label> <br />
					<div class="row mb-3 justify-content-center">
						<input
							type="password" class="form-control w-50" id="password"
							placeholder="Enter password" name="password" value="" required>
						<div class="valid-feedback">Valid.</div>
						<div class="invalid-feedback">Remember?</div>
					</div>

				<input type="submit" name="Login" value="Sign In"
					class="btn btn-info"></input>
			</form>

			<p class="mt-3">
				New User? Click here to <a href="register_user">Register</a>
			</p>
			<div style="margin: 80px;"></div>
		</c:if>
	</div>
<%@ include file="footer.jsp"%>

</body>
</html>







