<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page session="true"%>
<!doctype html>
<html ng-app lang="en">
<head>
<title>Login Page</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="expires" content="0">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="cache-control" content="no-store">
<meta http-equiv="cache-control" content="must-revalidate">


<meta name="viewport" content="width=device-width, initial-scale=1">


<link href="extResources/bootstrap/css/bootstrap.css" rel="stylesheet" />
<link href="appResources/css/login_main.css" rel="stylesheet" />

<script src='extResources/jquery/jquery-1.8.1.min.js'></script>
<script src="extResources/angular/js/angular.min-1.2.16.js"></script>
<script src="extResources/bootstrap/js/bootstrap.js"></script>
<style>
.form-horizontal input.ng-invalid.ng-dirty {
	background-color: #FA787E;
}

.form-horizontal input.ng-valid.ng-dirty {
	background-color: #78FA89;
}
</style>
</head>
<body onload='document.loginForm.username.focus();' class="container">

	<header>

		<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target=".navbar-responsive-collapse">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#/"><i>L</i>ife<i>S</i>tyle</a>
				</div>
				<!-- Place everything within .nav-collapse to hide it until above 768px -->
				<div class="navbar-collapse collapse navbar-responsive-collapse">
					<ul class="nav navbar-nav pull-right nav-pills ">
						<li class=""><a href="#/home">Home</a></li>
						<li class=""><a href="#/desktop">About Us</a></li>
						<li class=""><a href="#/customers">Our Services</a></li>
						<li><a href="http://blog.codiqa.com">Contact</a></li>
						<li class="navbar-btn btn-warning btn   "><a href="#/signIn">Sign in</a></li>
					</ul>

				</div>
			</div>
		</div>

	</header>

	<section class='middle container'>

		<div id="login-box" class='row' ng-controller="loginController">
			<div class="col-md-7"></div>
			<div class="col-md-5">
				<h3>Login with Username and Password</h3>

				<c:if test="${not empty error}">
					<div class="alert alert-danger">${error}</div>
				</c:if>
				<c:if test="${not empty msg}">
					<div class="alert alert-info">${msg}</div>
				</c:if>

				<form class="form-horizontal" role="form" name='loginForm'
					action="<c:url value='/auth/login_check?targetUrl=${targetUrl}' />"
					method='POST'>
					<div class="form-group">
						<label for="username" class="col-sm-2 control-label">User:</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="username"
								name='username' ng-model='user.username' required
								placeholder="username">
						</div>
					</div>
					<div class="form-group"
						ng-show="loginForm.username.$dirty && loginForm.username.$invalid">
						<label class="col-sm-2 control-label">Invalid:</label>
						<div class="col-sm-10"
							ng-show="loginForm.username.$error.required">Tell us your
							user Id.</div>
					</div>

					<div class="form-group">
						<label for="password" class="col-sm-2 control-label">Password:</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="password"
								name='password' ng-model='user.password' required
								placeholder="Password">
						</div>
					</div>
					<div class="form-group"
						ng-show="loginForm.password.$dirty && loginForm.password.$invalid">
						<label class="col-sm-2 control-label">Invalid:</label>
						<div class="col-sm-10"
							ng-show="loginForm.password.$error.required">Tell us your
							password.</div>
					</div>
					<c:if test="${empty loginUpdate}">
						<div class="form-group">
							<div class="col-sm-offset-2 col-sm-10">
								<div class="checkbox">
									<label> <input type="checkbox"
										name="_spring_security_remember_me"> Remember me
									</label>
								</div>
							</div>
						</div>
					</c:if>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" name="submit" class="btn btn-primary"
								ng-disabled="loginForm.$invalid">Sign in</button>
							<a href="#newUser">New User Sign Up here</a>
						</div>
					</div>

					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
				</form>
			</div>
		</div>
	</section>
	<script>
		function loginController($scope) {
			$scope.user = {
				username : '',
				password : ''
			};
		};
	</script>



</body>
</html>