<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">

<title>Car</title>
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
<c:forEach items="${car}" var="u" >
<c:set var="model" value="${u.model}"></c:set>
<c:set var="year" value="${u.year}"></c:set>
<c:set var="maker" value="${u.maker}"></c:set>
<c:set var="price" value="${u.price}"></c:set>
<c:set var="description" value="${u.description}"></c:set>
<c:set var="registration" value="${u.registration}"></c:set>
<c:set var="photo" value="${u.photoPath}"></c:set>
<c:set var="highBid" value="${u.highestBid}"></c:set>
<c:set var="bidder" value="${u.bidder}"></c:set>
<c:set var="email" value="${u.email}"></c:set>
<c:set var="id" value="${u.id}"></c:set>
</c:forEach>
<%@ include file="header.jsp"%>
		
<div class="container text-center text-info border border-info rounded-pill">
	<div class="row py-3 justify-content-center">		
				
				<div class="col-md-6 border-end">
					<div class="d-flex flex-column justify-content-center">
						<div class="main_image">
							<img src="${photo}" id="main_product_image" width="100%" height="400">
						</div>
					</div>
					
				</div>
				<div class="col-md-6">
						<div class="p-3 right-side">
							<div class="d-flex justify-content-between align-items-center">
								<h3>${year} ${model}</h3>
							</div>
							<div class="d-flex justify-content-between align-items-center">
								<p class="text-secondary">${email}</p>
							</div>
						</div>
						<div class="my-3 me-5 content">

							<div class="d-flex">
								<div style="width: 300px;">
									<span class="fw-bold">Model:</span>
									<p style="font-size: 16px;">
										<i class="fas fa-car"></i> ${model}
									</p>
								</div>

								<div>
									<span class="fw-bold">Manufacture Year:</span>
									<p style="font-size: 16px;">
										<i class="fas fa-calendar"></i> ${year}
									</p>
								</div>
							</div>

							<div class="d-flex">
								<div style="width: 300px;">
									<span class="fw-bold">Registration Date:</span>
									<p style="font-size: 16px;">
										<i class="fas fa-calendar"></i> ${registration}
									</p>
								</div>

								<div>
									<span class="fw-bold">Starting Price:</span>
									<p style="font-size: 16px;">
										<i class="fas fa-tag"></i> ${price}
									</p>
								</div>
							</div>
							<div class="d-flex">
								<div style="width: 300px;">
									<span class="fw-bold">Highest Bidder:</span>
									<p style="font-size: 16px;">
										<c:if test="${bidder == null}">
											None Yet
										</c:if>
										<c:if test="${bidder != null}">
											<i class="fas fa-user"></i> ${bidder}
										</c:if>
									</p>
								</div>

								<div>
									<span class="fw-bold">Highest Bid:</span>
									<p style="font-size: 16px;">
										<i class="fas fa-bell"></i> ${highBid}
								</div>
							</div>
				       </div>	
				       <div class="my-3 mx-5 content">
				       <p style="font-size: 16px;">
									${description}
									</p>
				       </div>		
	            </div>
	           
      </div>
       <div class="row justify-content-center pb-3">
	            <!-- Button trigger modal -->
	            		<div class="col-md-6">
							<button type="button" class="btn btn-info py-2 px-4" data-bs-toggle="modal"
								data-bs-target="#bidModal">Bid</button>
						</div>
							<!-- Modal -->
							<div class="modal fade" id="bidModal" tabindex="-1"
								aria-labelledby="exampleModalLabel" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h5 class="modal-title" id="exampleModalLabel">Car
												Bidding</h5>
											<button type="button" class="btn-close"
												data-bs-dismiss="modal" aria-label="Close"></button>
										</div>
										<div class="modal-body">

											<!-- Bid Form -->
											<sf:form action="bid" method="post" class="was-validated"
												modelAttribute="car">
												<div class="mb-3 mt-3">
													<label for="highBid" class="form-label">Bid for Car
														(Php):</label> <input type="text" class="form-control"
														placeholder="Enter bidding price" name="highBid"
														required="true" />
														<p class="text-secondary">Price Must be Hire than current Highest Bid</p>
												</div>
												<input type="hidden" name="cid" value="${id}">

												<button type="submit" class="btn btn-info">Submit Bid</button>
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
				<div class="col-md-6">			
					<c:if test="${bidFail != null}">
		
						<div class="alert alert-danger">Bid Price too Low</div>
		
					</c:if>	  
					<c:if test="${bidSucc != null}">
		
						<div class="alert alert-success">You are the highest bidder!</div>
		
					</c:if>	  
				</div>
			</div>	
</div>			  

<%@ include file="footer.jsp"%>
</body>
</html>
