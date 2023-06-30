<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">

<title>What about us?</title>
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
		<h2>About us</h2>
		
		<h6>We let you download cars</h6>
		<div class="container">
			<p>
				Have a car you want to sell? ABCUsedCars is the site for you. Post your car, set a price and wait for
				potential bidders who will download your car. Of course downloading a car is just a fancy term we used to refer to
				car bidding. You won't actually download a car unfortunately. You wouldn't download a car, would you?.
			</p>
			
			<img class="img-fluid" src="/images/car.jpg" width="650" height="400">
		</div>
		

</div>
<%@ include file="footer.jsp"%>
</body>
</html>
