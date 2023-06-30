<!-- Navbar -->
<div class="my-4" style="margin-bottom: 0px;">
	<nav class="navbar navbar-expand-lg navbar-light bg-light text-info">
		<div class="container-fluid">
		
		
			<sec:authorize access="!isAuthenticated()">
				<a href="login" class="navbar-brand" data-toggle="tooltip"
					data-placement="top" title="Home"> 
					<img src="/images/carlogo.png" height="40">
				</a>
			</sec:authorize>
			
			<sec:authorize access="isAuthenticated()">
				<a href="home" class="navbar-brand" data-toggle="tooltip"
					data-placement="top" title="Home"> 
					<img src="/images/carlogo.png" height="40">
				</a>
			</sec:authorize>
			
			<button type="button" class="navbar-toggler"
				data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
				<span class="navbar-toggler-icon"></span>
			</button>
			
		
				
			<div class="collapse navbar-collapse" id="navbarCollapse">
			
					<sec:authorize access="isAuthenticated()">
		
						<div class="navbar-nav">
							<a class="nav-item nav-link" href="home">Home</a>
						</div>
		
					</sec:authorize>

					<div class="navbar-nav">

						<a href="about" class="nav-item nav-link">About Us</a>
					</div>
					<div class="navbar-nav">
						<a href="contact" class="nav-item nav-link">Contact Us</a>
					</div>
				<sec:authorize access="!isAuthenticated()">
					<div class="navbar-nav">

						<a href="register_user" class="nav-item nav-link">Register</a>
					
						<a href="login" class="nav-item nav-link text-info">Login</a>
					</div>
				</sec:authorize>


				<sec:authorize access="isAuthenticated()">


					<div class="navbar-nav">
						<sec:authorize access="hasRole('Users')">
						<a class="nav-item nav-link" href="addCar">Upload Car</a>
						</sec:authorize>
						
						<sec:authorize access="hasRole('Admin')">
						
						<a class="nav-item nav-link" href="carList">Manage Cars</a>
						<a class="nav-item nav-link" href="userList">Manage Users</a>
						
						
					   </sec:authorize>
					   
					   <a class="nav-item nav-link" href="profile">Profile</a>

					</div>
				
						<div class="navbar-nav">
						<form action="logout" method="post" style="padding: 7px;">
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" /> 
								<input type="submit" name="Logout"
								value="Logout" class="btn btn-info"/>
						</form>
					</div>
					
				</sec:authorize>

			

			</div>
			<sec:authorize access="isAuthenticated()">
				<sf:form action="searchCar" method="get" class="d-flex">
						<input type="search" class="form-control rounded "
								placeholder="Enter car model or year" aria-label="Search"
								aria-describedby="search-addon" name="keyword" />
			
						 <button type="submit" class="btn btn-outline-primary">Go!</button>
			
				</sf:form>
	</sec:authorize>	
		</div>
		
		
	</nav>
	
	
</div>









