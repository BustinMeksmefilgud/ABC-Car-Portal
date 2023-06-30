<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">

<title>Cars</title>
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
<div class="p-5">
  
       <h1>Car Manager</h1>
  
		<table class="table table-active">
			<thead class="bg-info">
				<tr>
					<th>Model</th>
					<th>Manufactured</th>
					<th>Distributor</th>
					<th>Registration</th>
					<th>Price</th>
					<th>Seller</th>
					<th>Highest Bid</th>
					<th>Winning Bidder</th>
					<th>Action</th>
					
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${listOfCars}" var="u">
					<tr>
						<td>${u.getModel()}</td>
						<td>${u.getYear()}</td>
						<td>${u.getMaker()}</td>
						<td>${u.getRegistration()}</td>
						<td>Php ${u.getPrice()}</td>
						<td>${u.getEmail()}</td>
						<td>${u.getHighestBid()}</td>
						<td>${u.getBidder()}</td>
						<td><a type="button" class="btn btn-info" href="/detail?cid=${u.id}"><i class="far fa-eye"></i></a>
						
							<button type="button" class="btn btn-info" data-bs-toggle="modal"
								data-bs-target="#editModal${u.id}">
								<i class="fas fa-edit"></i>
							</button>
						
							
							<div class="modal fade" id="editModal${u.id}" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="editModalLabel">Update Car</h5>
											<button type="button" class="btn-close" data-bs-dismiss="modal"
												aria-label="Close"></button>
										</div>
										<div class="modal-body">
				
											<!-- User Update Form -->
											<sf:form action="updateCar?cid=${u.id}" method="post" class="was-validated"
												modelAttribute="user">
												<div class="mb-3">
													<label for="model" class="form-label">Model:</label> <input
														type="text" class="form-control" id="model"
														placeholder="Enter model" name="model" path="model"
														value="${u.model}" required="true" />
												</div>
												<div class="mb-3">
													<label for="year" class="form-label">Manufacture Year:</label> <input
														type="text" class="form-control" placeholder="Enter manufacture year"
														name="year" path="year" value="${u.year}" required="true" />
												</div>
												<div class="mb-3">
													<label for="maker" class="form-label">Distributor:</label> <input
														type="text" class="form-control" id="maker"
														placeholder="Enter distributor" name="maker" path="maker"
														value="${u.maker}" required="true" />
												</div>
												<div class="mb-3">
													<label for="registration" class="form-label">Registration Year:</label> <input
														type="text" class="form-control" id="registration"
														placeholder="Enter registration" name="registration" path="registration"
														value="${u.registration}" required="true" />
												</div>
													<div class="mb-3">
													<label for="price" class="form-label"> Starting Price:</label> <input
														type="text" class="form-control" id="price"
														placeholder="Enter price" name="price" path="price"
														value="${u.price}" required="true" />
												</div>
						
												<button type="submit" class="btn btn-primary">Update</button>
											</sf:form>
											<!-- User Update Form -->
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-secondary"
												data-bs-dismiss="modal">Close</button>
				
										</div>
									</div>
								</div>
				
							</div>
							
							
						    <a type="button" class="btn btn-danger" href="/deleteCar?cid=${u.id}"><i class="far fa-trash-alt"></i></a>
						</td>
						    
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

</body>
</html>
