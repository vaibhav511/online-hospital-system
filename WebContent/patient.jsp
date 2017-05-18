<%@page import="dao.MyConnection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Patient List</title>
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
							String username=null;
							if(session.getAttribute("username")!=null)
							{
								username=session.getAttribute("username").toString();
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
								<li><a href="index.jsp" class="active">Home</a></li>
								<li><a href="gallery1.jsp">Gallery</a></li>
								<li><a href="about.jsp">About</a></li>
								<li><a href="contact.jsp">Contact</a></li>
							
							<%}if((acctype!=null) && (acctype.equals("Admin"))){ %>
								<li><a href="index.jsp" >Home</a></li>
								<li><a href="loginlist.jsp">LoginList</a></li>
								<li><a href="doctor.jsp">Doctor</a></li>
								<li><a href="patient.jsp" class="active">Patient</a></li>
								<li><a href="appointment.jsp">Appointment</a></li>
								<li><a href="rooms.jsp">Rooms</a></li>
								<li><a href="bills.jsp">Bills</a></li>
								<li><a href="pathalogies.jsp">Pathalogy</a></li>
								<li><a href="gallery1.jsp">Gallery</a></li>
								<li><a href="about.jsp">About</a></li>
								<li><a href="contact.jsp">Contact</a></li>
	
								<%}if((acctype!=null) && (acctype.equals("Doctor"))){ %>
								<li><a href="index.jsp">Home</a></li>
								<li><a href="editdoctor.jsp">Profile</a></li>
								<li><a href="patient.jsp" class="active">Patient</a></li>
								<li><a href="appointment.jsp">Appointment</a></li>
								<li><a href="rooms.jsp">Rooms</a></li>
								<li><a href="bills.jsp">Bills</a></li>
								<li><a href="pathalogies.jsp">Pathalogy</a></li>
								<li><a href="gallery1.jsp">Gallery</a></li>
								<li><a href="about.jsp">About</a></li>
								<li><a href="contact.jsp">Contact</a></li>
								
								<%}if((acctype!=null) && (acctype.equals("Patient"))){ %>
								<li><a href="index.jsp" class="active">Home</a></li>
								<li><a href="editpatient1.jsp">Profile</a></li>
								<li><a href="appointment.jsp">Appointment</a></li>
								<li><a href="rooms.jsp">Rooms</a></li>
								<li><a href="bills.jsp">Bills</a></li>
								<li><a href="pathalogies.jsp">Pathalogy</a></li>
								<li><a href="gallery1.jsp">Gallery</a></li>
								<li><a href="about.jsp">About</a></li>
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
	
	<!-- contact -->
	<div class="contact">
		<div class="container">
			<div class="contact-heading">
					<h2 class="wow fadeInDown animated" data-wow-delay=".5s">Patient List</h2>
					</div>
					<hr>
					<div class="col-md-4 footer-nav wow fadeInRight animated" data-wow-delay=".5s">
					<a href="signup.jsp">Add New Patient</a><br><hr>
					<%
					if (request.getAttribute("success") != null) {
				%>
				<label name="success" style="color: red; font-family: sans-serif;"><%=request.getAttribute("success")%></label>
				<%} %>
					
					</div><br><hr>
					
					
					
					
					<div class="top-nav wow fadeInRight animated"  style="float: left;">

				<%
						String docid=null;
						String patientid=null;
							ResultSet resultset1,resultset=null;
							MyConnection con=new MyConnection();
							Statement statement,statement1;
							statement=con.OpenConnection();
							statement1=con.OpenConnection();
							
														
							if(acctype.equals("Admin"))
							{
							resultset=statement.executeQuery("select * from patient");
					
							}
							else if(acctype.equals("Doctor"))
							{
								
								resultset1=statement1.executeQuery("select PatientID from Appointments where DoctorID=(select DoctorID from Doctor where DEmail='"+username+"') ");
								if (resultset1.next())
									patientid=resultset1.getString(1);
								System.out.print(patientid);
								resultset=statement.executeQuery("select * from patient where patientid='"+patientid+"'");
							}
							
							if (!resultset.next()) {
				                        out.println("Sorry, could not find the data. ");
				                    }
							else {
				%>

				<TABLE border="5"
					style="border-color: purple; border-width: medium; border-style: solid; text-align: center;">
					<TR style="font-family: sans-serif;">
						<TH style="padding: 10px; padding-left: 20px">PatientID</TH>
						<TH style="padding: 10px; padding-left: 80px; padding-right: 80px">PEmail</TH>
						<TH style="padding: 10px; padding-left: 80px; padding-right: 80px">PName</TH>
						<TH style="padding: 10px; padding-left: 80px; padding-right: 80px">PAddress</TH>
						<TH style="padding: 10px;">PCity</TH>
						<TH style="padding: 10px;">PZip</TH>
						<TH style="padding: 10px; padding-left: 50px; padding-right: 50px">PContact</TH>
						<TH style="padding: 10px;">Delete</TH>
						
					</TR>
					<%
						do {
					%>

					<TR>
						<form action="deletePatient" method="post">
							<TD><%=resultset.getString(1)%></TD>
							<TD><%=resultset.getString(2)%></TD>
							<TD><%=resultset.getString(3)%></TD>
							<TD><%=resultset.getString(4)%></TD>
							<TD><%=resultset.getString(5)%></TD>
							<TD><%=resultset.getString(6)%></TD>
							<TD><%=resultset.getString(7)%></TD>
							<TD><input type="submit" name="delete" value="Delete"
								style="background-color: red; color: white;"> <input type="hidden"
								name="patientid" value="<%=resultset.getString(1)%>"></TD>
						</form>

					<%
						resultset.next();
					            } while (resultset.isAfterLast() != true);
				                    }
							statement.close();
							statement1.close();
							
							con.CloseConnection();
							con.CloseConnection();
							
					%>
				</TABLE>
			</div>

					
					
					
					
					</div></div>
					
	<!-- //contact -->
	
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