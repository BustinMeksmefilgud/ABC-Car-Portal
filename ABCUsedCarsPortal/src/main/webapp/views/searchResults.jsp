<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<title>Look at all those cars</title>
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
	<div class="jumbotron text-center text-info" style="height: 100%">
		<h1 class="display-4">Used Cars and Junk</h1>
		<p class="lead">Want to download a car? You can do that here!</p>
		<hr class="my-4">
		
		<sec:authorize access="!isAuthenticated()">
		<div class="container text-center text-info">
			<p>Login to upload a car</p>
			<p class="lead">
				<a class="btn btn-primary btn-lg" href="login" role="button">Login</a>
			</p>
			<p>Don't have an account?</p>
			<p class="lead">
				<a class="btn btn-info btn-lg" href="register_user" role="button">Register</a>
			</p>
		</div>
	</sec:authorize>
	
	<sec:authorize access="isAuthenticated()">
		<div class="container text-center text-info">
		<c:if test="${not empty carList}">
		 	<sec:authorize access="hasRole('Users')">
			<h2 class="lead">Car for ${searchKey}. Got a car to sell? <a href="addCar">Post a Car here!</a></h2>
			</sec:authorize>
			
			<sec:authorize access="hasRole('Admin')">
			<h2 class="lead">Car for ${searchKey}</h2>
			</sec:authorize>
		</c:if>
		</div>
   </sec:authorize>

	</div>
	<div>
		<c:if test="${empty carList}">
		<div class="container text-info text-center">
			<h3>No results for ${searchKey} found</h3>
			<p>Search for Model, Year, Distributor, Price</p>
		</div>
		</c:if>
		<c:if test="${not empty carList}">
			<div class="row d-flex flex-wrap text-info text-center mx-5">
	<c:forEach items="${carList}" var="u">
			<div class="card" style="width: 450px;">
						<img class="card-img-top img-fluid" src="${u.photoPath}"
						alt="${u.photo}" width="650" style="height: 50%;">
						<div class="card-body">		
							<h1 class="card-title">${u.getYear()} ${u.getModel()}</h1>
							<h3 class="card-text"><i class="fas fa-tags"></i>&nbsp;Php ${u.getPrice()}</h3>
							<a class="btn btn-info mb-3" href="/detail?cid=${u.id}">Detail</a>
						</div>
			</div>
	</c:forEach>
	</div>
				
		</c:if>

	</div>

</body>
</html>