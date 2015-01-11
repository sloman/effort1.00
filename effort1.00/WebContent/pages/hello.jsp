<%@taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html ng-app lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=8" />
<meta http-equiv="expires" content="0">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="cache-control" content="no-store">
<meta http-equiv="cache-control" content="must-revalidate">
<meta http-equiv="Cache-Control"
	content="no-cache, no-store, must-revalidate" />
<meta http-equiv="Pragma" content="no-cache" />
<META HTTP-EQUIV="Expires" CONTENT="0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>welcome</title>

<link href="extResources/bootstrap/css/bootstrap.css" rel="stylesheet" />
<link rel="stylesheet" href="appResources/css/templatemo_main.css">
<script src='extResources/jquery/jquery-1.8.1.min.js'></script>
<script src="extResources/angular/js/angular.min-1.2.16.js"></script>
<script src="extResources/bootstrap/js/bootstrap.js"></script>
<script src="extResources/jquery/jquery.backstretch.min.js"></script>
</head>
<body>
	<div id="main-wrapper">
		<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 affix text-center"
			style="z-index: 1;">
			<h1 class="templatemo-site-title">
				<a href="welcome" rel="nofollow">${title}</a> <img
					src="appResources/images/btn-menu.png" alt="main menu" id="m-btn"
					class="pull-left visible-xs visible-sm">
			</h1>
			<h4 class="templatemo-site-title2">
			${message}
			<c:if test="${pageContext.request.userPrincipal.name != null}">				
					 ${pageContext.request.userPrincipal.name} | <a
						href="javascript:formSubmit()"> Logout</a>
							</c:if>
			</h4>
			<ul id="responsive" style="display: none" class="hidden-lg hidden-md"></ul>
			<!-- /.responsive -->
		</div>

		<div class="menu visible-md visible-lg">
			<ul id="menu-list">
				<li class="active home-menu"><a href="#home">Home</a></li>
				<li class="about-menu"><a href="#about">About Us</a></li>
				<li class="services-menu"><a href="#services">Our Services</a></li>
				<li class="testimonial-menu"><a href="#testimonial">Testimonials</a></li>
				<li class="contact-menu"><a href="#contact">Contact</a></li>
			</ul>
		</div>

			<div class="image-section">
                <div class="image-container">
                    <img src="appResources/images/nature1.jpg" id="home-img" class="main-img inactive" alt="Home">
                    <img src="appResources/images/nature2.jpg" id="about-img" class="inactive" alt="About">
                    <img src="appResources/images/nature3.jpg" id="services-img"  class="inactive" alt="Services">
                    <img src="appResources/images/nature4.jpg" id="testimonial-img" class="inactive" alt="Testimonial">
                    <img src="appResources/images/nature5.jpg" id="contact-img" class="inactive" alt="Contact">
                </div>
            </div>

		<sec:authorize access="hasRole('ROLE_USER')">
			<!-- For login user -->
			<c:url value="/j_spring_security_logout" var="logoutUrl" />
			<form action="${logoutUrl}" method="post" id="logoutForm">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />
			</form>
			<script>
			function formSubmit() {
				document.getElementById("logoutForm").submit();
			}
		</script>
		</sec:authorize>
		<div class="row">
                <div class="col-lg-10 col-md-10 col-sm-12 col-xs-12 col-lg-offset-2 col-md-offset-2 templatemo-content-wrapper">
                    <div class="templatemo-content">
                        
                        <section id="home-text" class="active templatemo-content-section">
                            <div class="col-sm-12 col-md-12 col-lg-12">
                                <h2>Welcome to Nature</h2>
                                <p><a href="http://www.templatemo.com/preview/templatemo_398_nature">Nature</a> is <a href="http://www.templatemo.com/page/1" target="_parent">free HTML5 template</a> by templatemo. You may download and apply this <a href="http://www.tooplate.com">template</a> for any purpose. Credit goes to <a href="http://unsplash.com" rel="nofollow">Unsplash</a> for background images used in this template. Maecenas adipiscing, leo a facilisis tempor, mi quam feugiat eros, ullamcorper porttitor elit turpis ac risus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Suspendisse non sem a leo mattis dapibus.</p>
                                <p>Quisque non tempus lacus, non placerat arcu. Donec nibh ipsum, pharetra nec pellentesque at, mattis ut lorem. Fusce dapibus tristique neque, eget ultricies lorem tincidunt vitae. Aliquam erat volutpat. Integer vulputate ultricies nisl, sed vehicula justo accumsan non.</p>
                            </div>
                        </section><!-- /.home-text -->    

                        <section id="about-text" class="inactive">
                            <h2 class="text-center">About Us</h2>
                            <div class="col-sm-6 col-md-6">
                                <p>Nullam sit amet enim vitae magna malesuada pharetra. Etiam sodales consequat purus non vulputate. Aliquam erat volutpat. Pellentesque rutrum, ligula vel fermentum imperdiet, lectus eros volutpat urna, id mollis dolor justo vulputate justo ut sit amet ante luctus metus.</p>
                            </div>
                            <div class="col-sm-6 col-md-6">
                                <p>Vestibulum sodales nulla eu tortor condimentum venenatis. In tellus ipsum, ullamcorper vitae justo sit amet, mattis consequat tortor. Suspendisse risus urna, posuere id orci ut, facilisis accumsan ipsum. Sed vehicula lacinia porta. Vivamus faucibus dui nulla, a aliquet nunc porta in.</p>
                            </div>
                        </section><!-- /.about-text --> 

                        <section id="services-text" class="inactive">
                            <h2 class="text-center">Our Services</h2>
                            <div class="col-sm-4 col-md-4">
                                <h3>Web Design</h3>
                                <p>Integer posuere quam a orci tempor, ut eleifend est vulputate. Nullam vitae lectus dui. Donec vulputate ac tortor id convallis. Sed nisi mauris, laoreet vitae lacus at, viverra viverra neque. Curabitur nec aliquam lacus.</p>
                            </div>
                            <div class="col-sm-4 col-md-4">
                                <h3>Mobile Ready</h3>
                                <p>This is a <a href="http://www.templatemo.com">mobile website template</a> that can be viewed in mobile phones. Maecenas aliquam vitae urna sit amet elementum. Cras consequat libero nisi, vel condimentum nibh eleifend ut. Donec consequat arcu id diam viverra.</p>
                            </div>
                            <div class="col-sm-4 col-md-4">
                                <h3>Pixel Perfect</h3>
                                <p>Vestibulum sodales nulla eu tortor condimentum venenatis. In tellus ipsum, ullamcorper vitae justo sit amet, mattis consequat tortor. Suspendisse risus urna, posuere id orci ut, facilisis accumsan ipsum. Sed vehicula lacinia porta.</p>
                            </div>
                        </section><!-- /.services-text --> 

                        <section id="testimonial-text" class="inactive">
                            <div class="col-sm-12 col-md-12">
                                <h2>Testimonials</h2>
                                <p>Aenean quis semper metus. Maecenas adipiscing, leo a facilisis tempor, mi quam feugiat eros, ullamcorper porttitor elit turpis ac risus. Lorem ipsum dolor sit amet, consectetur adipiscing elit.  Suspendisse non sem a leo mattis dapibus. Duis vel ornare arcu. Quisque at malesuada tortor.</p>
                                <p>Quisque non tempus lacus, non placerat arcu. Donec nibh ipsum, pharetra nec pellentesque at, mattis ut lorem. Fusce dapibus tristique neque, eget ultricies lorem tincidunt vitae. Aliquam erat volutpat. Integer vulputate ultricies nisl, sed vehicula justo accumsan non.</p>
                            </div>
                        </section><!-- /.testimonial-text --> 

                        <section id="contact-text" class="inactive">
                            <div class="col-sm-12 col-md-12">
                                <div class="row">
                                    <div class="col-sm-12 col-md-12"><h2>Contact</h2></div>
                                    <div class="clearfix"></div>
                                </div>
                                
                                <div class="row">
                                    <div class="col-sm-6 col-md-6">
                                        <div id="map-canvas"></div>
                                        <p>120 Aenean quis semper. Maecenas adipiscing, facilisis tempor, mi quam feugiat 10450</p>
                                    </div>

                                    <div class="col-sm-6 col-md-6">
                                        <form action="#" method="post">

                                                <div class="form-group">
                                                    <!--<label for="contact_name">Name:</label>-->
                                                    <input type="text" id="contact_name" class="form-control" placeholder="Name" />
                                                </div>
                                                <div class="form-group">
                                                    <!--<label for="contact_email">Email:</label>-->
                                                    <input type="text" id="contact_email" class="form-control" placeholder="Email Address" />
                                                </div>
                                                <div class="form-group">
                                                    <!--<label for="contact_message">Message:</label>-->
                                                    <textarea id="contact_message" class="form-control" rows="9" placeholder="Write a message"></textarea>
                                                </div>
                                                <button type="submit" class="btn btn-primary">Send</button>

                                        </form>
                                    </div>
                                    
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </section><!-- /.contact-text --> 
                    </div><!-- /.templatemo-content -->  
                </div><!-- /.templatemo-content-wrapper --> 
            </div><!-- /.row --> 
		<div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 footer">
                    <p class="footer-text">Copyright &copy; 2014 Effort1.01 
                    <!--  <a href="http://www.templatemo.com">HTML5 Template</a> by <a href="http://www.templatemo.com/preview/templatemo_398_nature">Nature</a>
                    -->
                    </p>
                </div><!-- /.footer --> 
           </div>
	</div>
	
	 <div id="preloader">
            <div id="status">&nbsp;</div>
        </div><!-- /#preloader -->
	<script src="appResources/js/templatemo_script.js"></script>
</body>
</html>