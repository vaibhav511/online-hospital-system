<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>About the Online Appointment System</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Around Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- bootstrap-css -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!--// bootstrap-css -->
<!-- css -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<!--// css -->
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet"> 
<!-- //font-awesome icons -->
<!-- font -->
<link href='//fonts.googleapis.com/css?family=Francois+One' rel='stylesheet' type='text/css'>
<!-- //font -->
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event){		
			event.preventDefault();
			$('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
		});
	});
</script>	
<!--animate-->
<link href="css/animate.css" rel="stylesheet" type="text/css" media="all">
<script src="js/wow.min.js"></script>
	<script>
		 new WOW().init();
	</script>
<!--//end-animate-->
</head>
</head>
<body>
	<!-- header -->
	<div class="header">
		<div class="top-header">
			<div class="container">
				<div class="top-header-info">
					<div class="top-header-left wow fadeInLeft animated" data-wow-delay=".5s">
						<p>Hey! Now You can book your appointment online</p>
					</div>
					<div class="top-header-right wow fadeInRight animated" data-wow-delay=".5s">
						<div class="top-header-right-info">
							<ul>
							<%
							if(session.getAttribute("username")!=null)
							{
							%>
								<li><a href="#" >Hi <%=session.getAttribute("username") %></a></li>
								<li><a href="logout" onclick="alert('Logout Succesfully..')">Logout</a></li>
								<%} else{%>
								<li>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&empty;
								<li><a href="login.jsp" >Login</a></li>
								<li><a href="signup.jsp">Sign up</a></li>
								<%} %>								
							</ul>
						</div>
						
						<div class="social-icons">
							<ul>
								<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a class="twitter facebook" href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a class="twitter google" href="#"><i class="fa fa-google-plus"></i></a></li>
							</ul>
						</div> 
						<div class="clearfix"> </div>
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
		</div>
		<div class="bottom-header">
			<div class="container">
				<div class="logo wow fadeInDown animated" data-wow-delay=".5s">
					<h1><a href="index.jsp"><img src="images/logo.png" alt="" /></a></h1>
				</div>
				<div class="top-nav wow fadeInRight animated" data-wow-delay=".5s">
					<nav class="navbar navbar-default">
						<div class="container">
							<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">Menu						
							</button>
						</div>
						<!-- Collect the nav links, forms, and other content for toggling -->
						<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
							<ul class="nav navbar-nav">
							
							<%String acctype=(String)session.getAttribute("acctype"); 
							if(acctype==null){ %>
								<li><a href="index.jsp" >Home</a></li>
								<li><a href="gallery1.jsp">Gallery</a></li>
								<li><a href="about.jsp" class="active">About</a></li>
								<li><a href="contact.jsp">Contact</a></li>
							
							<%}if((acctype!=null) && (acctype.equals("Admin"))){ %>
								<li><a href="index.jsp" >Home</a></li>
								<li><a href="loginlist.jsp">LoginList</a></li>
								<li><a href="doctor.jsp">Doctor</a></li>
								<li><a href="patient.jsp">Patient</a></li>
								<li><a href="appointment.jsp">Appointment</a></li>
								<li><a href="rooms.jsp">Rooms</a></li>
								<li><a href="bills.jsp">Bills</a></li>
								<li><a href="pathalogies.jsp">Pathalogy</a></li>
								<li><a href="gallery1.jsp">Gallery</a></li>
								<li><a href="about.jsp" class="active">About</a></li>
								<li><a href="contact.jsp">Contact</a></li>
	
								<%}if((acctype!=null) && (acctype.equals("Doctor"))){ %>
								<li><a href="index.jsp" >Home</a></li>
								<li><a href="editdoctor.jsp">Profile</a></li>
								<li><a href="patient.jsp">Patient</a></li>
								<li><a href="appointment.jsp">Appointment</a></li>
								<li><a href="rooms.jsp">Rooms</a></li>
								<li><a href="bills.jsp">Bills</a></li>
								<li><a href="pathalogies.jsp">Pathalogy</a></li>
								<li><a href="gallery1.jsp">Gallery</a></li>
								<li><a href="about.jsp" class="active">About</a></li>
								<li><a href="contact.jsp">Contact</a></li>
								
								<%}if((acctype!=null) && (acctype.equals("Patient"))){ %>
								<li><a href="index.jsp">Home</a></li>
								<li><a href="editpatient1.jsp">Profile</a></li>
								<li><a href="appointment.jsp">Appointment</a></li>
								<li><a href="rooms.jsp">Rooms</a></li>
								<li><a href="bills.jsp">Bills</a></li>
								<li><a href="pathalogies.jsp">Pathalogy</a></li>
								<li><a href="gallery1.jsp">Gallery</a></li>
								<li><a href="about.jsp"  class="active">About</a></li>
								<li><a href="contact.jsp">Contact</a></li><%}%>
								
																
							</ul>	
							<div class="clearfix"> </div>
						</div>	
					</nav>		
				</div>
			</div>
		</div>
	</div>
		<!-- //header -->
	
	<!-- about -->
	<div class="about">
		<div class="about-heading">
			<div class="container">
				<h2 class="wow fadeInDown animated" data-wow-delay=".5s">About Us</h2>
				<p class="wow fadeInUp animated" data-wow-delay=".5s">It is India's first MNC hospital committed to the advanced medical care that enhances the value of human life. We are providing online appointment booking for those who do not waste his time and money.We are providing better solution for patient. </p>
			</div>
		</div>
		<div class="about-top">
			<div class="container">
				<div class="about-bottom">
					<img class="wow fadeInUp animated" data-wow-delay=".5s" src="images/ab.jpg" alt="" />
					<p class="wow fadeInUp animated" data-wow-delay=".5s">The Online Appointment System is committed to advanced medical care through innovative and efficient services, creating an environment of continued quality improvement and expertise of the best physicians. We utilise the most recent medical technologies, advanced clinical methods and develop protocols to improve our outcomes ensuring the good health of the community around us.</p>
				</div>
			</div>
		</div>
		
		<!-- team -->
		<div class="team">
			<div class="container">
				<div class="popular-heading team-heading">
					<h3 class="wow fadeInUp animated" data-wow-delay=".5s">Our Team</h3>
					<p class="wow fadeInUp animated" data-wow-delay=".5s">At the outset I would take this opportunity to invoke our scriptures to wish all of you the very best of health always.  As the head of this glorious hospital I would like to reiterate that whenever you do require  to come to our hospital, our committed team would endeavor for an expeditious  and best possible treatment both clinical and otherwise.  We are driven towards excellence and believe that rewards for any hospital both monetary and non-monetary would also be a consequence of good patient care and not the other way around.  Our patients and their attendants would be the best ambassadors and would be the best judge of our services.
In the end I would quote Rockland groups vision " To be the most trusted health care brand nationally and Internationally".
Wishing you pink of health always</p>
				</div>
				<div class="team-grids">
					<div class="col-md-4 team-grid wow fadeInLeft animated" data-wow-delay=".5s">
						<img src="images/t1.jpg" alt="" />
						<h4>Vaibhav Bhardwaz</h4>
						<p>Software Engineer at HCL Technologies Limited, Noida</p>
						<div class="social-icons team-icons">
							<ul>
								<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a class="twitter facebook" href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a class="twitter google" href="#"><i class="fa fa-google-plus"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-4 team-grid wow fadeInUp animated" data-wow-delay=".5s">
						<img src="images/t2.jpg" alt="" />
						<h4>Nasirul Hasan</h4>
						<p>Student at NIIT, Delhi</p>
						<div class="social-icons team-icons">
							<ul>
								<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a class="twitter facebook" href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a class="twitter google" href="#"><i class="fa fa-google-plus"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="col-md-4 team-grid wow fadeInRight animated" data-wow-delay=".5s">
						<img src="images/t3.jpg" alt="" />
						<h4>Paretra molestie</h4>
						<p>Proin vitae luctus dui, sit amet ultricies leo. Donec condimentum, mauris et pharetra molestie, dolor dui dignissim metus, a malesuada elit odio non velit.</p>
						<div class="social-icons team-icons">
							<ul>
								<li><a class="twitter" href="#"><i class="fa fa-twitter"></i></a></li>
								<li><a class="twitter facebook" href="#"><i class="fa fa-facebook"></i></a></li>
								<li><a class="twitter google" href="#"><i class="fa fa-google-plus"></i></a></li>
							</ul>
						</div>
					</div>
					<div class="clearfix"> </div>
				</div>
			</div>
		</div>
		<!-- //team -->
	</div>
	<!-- //about -->
	
	<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="footer-grids">
				<div class="col-md-3 footer-nav wow fadeInLeft animated" data-wow-delay=".5s">
					<h4>Navigation</h4>
					<ul>
						<li><a href="about.jsp">About</a></li>
						<li><a href="gallery1.jsp">Gallery</a></li>
						<li><a href="contact.jsp">Contact Us</a></li>
					</ul>
				</div>
				<div class="col-md-5 footer-nav wow fadeInUp animated" data-wow-delay=".5s">
					<h4>Newsletter</h4>
					<p>Subscribe with us and get more information and latest update on your email.</p>
					<form>
						<input type="email" id="mc4wp_email" name="EMAIL" placeholder="Enter your email here" required="">
						<input type="submit" value="Subscribe">
					</form>
				</div>
				<div class="col-md-4 footer-nav wow fadeInRight animated" data-wow-delay=".5s">
					<h4>Achievements</h4>
					<div class="news-grids">
						<div class="news-grid">
							<!-- <h6>09/01/2016 : <a href="single.jsp">Cras at felis congue</a></h6>
							<h6>13/07/2016 : <a href="single.jsp">Volutpat neque eget</a></h6>
							<h6>13/02/2016 : <a href="single.jsp">Agittis tellus ut dictum</a></h6>
							<h6>28/11/2016 : <a href="single.jsp">Habitant morbi et netus</a></h6>
							<h6>19/01/2016 : <a href="single.jsp">pellentesque habitant morbi</a></h6>
							<h6>23/02/2016 : <a href="single.jsp">Maecenas volutpat lacus</a></h6>
							 -->
							<h6>Accrediated by NABH & NABL.</h6>
							<h6>Performed 1700 Cardiac Surgeries.</h6>
							<h6>1st Successful Live Liver Transplant.</h6>
							<h6>Performed 2000+ Cardiac Surgeries.</h6>
							<h6>Helped one person each month, relive the happy moments through Liver transplantation.</h6>
							
						</div>
					</div>
				</div>
				<div class="clearfix"> </div>
			</div>
			<div class="copyright wow fadeInUp animated" data-wow-delay=".5s">
				<p>© 2017 Online Hospital Information System . All Rights Reserved . Design & Developed by <a href="http://fb.com/vbhardwaj511">Vaibhav Bhardwaz</a></p>
			</div>
		</div>
	</div>
	<!-- //footer -->
</body>
</html>