<%@ page contentType="text/html; charset=US-ASCII"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">

<title>Upload Car</title>
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
<body>

<%@ include file="header.jsp"%>
		<div class="container text-start text-info mt-5 py-2 rounded-4">
	<h3 class="text-center">Upload a Car</h3>
		
				<sf:form action="saveCar" method="post" class="was-validated"
								modelAttribute="car" enctype="multipart/form-data">
									<div class="mb-3">
										<label for="model" class="form-label">Model:</label>
										<sf:input type="text" class="form-control"
											placeholder="Enter model" name="model" path="model" value="${model}"
											required="true" />
					
									</div>
									<div class="mb-3">
										<label for="year" class="form-label">Manufacture
											Year:</label>
											<sf:input type="text" class="form-control"
											placeholder="Enter manufacture year" name="year" path="year" value="${year}"
											required="true" />
									
									</div>
									<div class="mb-3">
										<label for="maker" class="form-label">Distributor:</label>
										<sf:input type="text" class="form-control"
											placeholder="Enter distributor" name="maker" path="maker" value="${maker}"
											required="true" />
							
									</div>
									<div class="mb-3">
										<label for="price" class="form-label">Price
											(Php):</label>
										<sf:input type="text" class="form-control" id="price"
											placeholder="Enter car price" name="price" path="price" value="${price}"
											required="true" />
										
									</div>
									
									<div class="mb-3">
										<label for="registration" class="form-label">Registration Year:</label>
										<sf:input type="text" class="form-control"
											placeholder="Enter registration year" name="registration" path="registration" value="${registration}"
											required="true" />
							
									</div>
								<div class="mb-3">
										<label class="form-label">Photo:</label> <input
											type="file" class="form-control" name="picture" id="photo"
											accept="image/png, image/jpeg" required="true" />
									</div>
									
									<div class="holder border border-info"
										style="height: 300px; width: 300px; margin: auto;">
										<img id="imgPreview" src="#" alt="image preview"
											style="width: inherit;" />
									</div> 
									<div class="mb-3">
										<label for="description" class="form-label">Description:</label>
										<textarea type="text" class="form-control"
											placeholder="Describe car" name="description"
											path="description" required="true">${description}</textarea>
										
									</div>
									<sf:hidden path="id" value="${id}"/>
									
									<button type="submit" class="btn btn-primary d-flex">Post</button>
								</sf:form>
							 	<script>
					            $(document).ready(() => {
					            	
						               $("#photo").change(function () {
						                   const file = this.files[0];
						                   if (file) {
						                       let reader = new FileReader();
						                       reader.onload = function (event) {
						                           $("#imgPreview")
						                             .attr("src", event.target.result);
						                       };
						                       reader.readAsDataURL(file);
						                   }
						               });
						           });
						       </script> 

</div>
<%@ include file="footer.jsp"%>

</body>
</html>
