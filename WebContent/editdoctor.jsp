<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="dao.MyConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Edit Profile</title>
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
								<li><a href="index.jsp" class="active">Home</a></li>
								<li><a href="gallery1.jsp">Gallery</a></li>
								<li><a href="about.jsp">About</a></li>
								<li><a href="contact.jsp">Contact</a></li>
							
							<%}if((acctype!=null) && (acctype.equals("Admin"))){ %>
								<li><a href="index.jsp" >Home</a></li>
							<li><a href="loginlist.jsp">LoginList</a></li>
								<li><a href="doctor.jsp"  class="active">Doctor</a></li>
								<li><a href="patient.jsp">Patient</a></li>
								<li><a href="appointment.jsp">Appointment</a></li>
								<li><a href="rooms.jsp">Rooms</a></li>
								<li><a href="bills.jsp">Bills</a></li>
								<li><a href="pathalogies.jsp">Pathalogy</a></li>
								<li><a href="gallery1.jsp">Gallery</a></li>
								<li><a href="about.jsp">About</a></li>
								<li><a href="contact.jsp">Contact</a></li>
	
								<%}if((acctype!=null) && (acctype.equals("Doctor"))){ %>
								<li><a href="index.jsp">Home</a></li>
								<li><a href="editdoctor.jsp" class="active">Profile</a></li>
								<li><a href="patient.jsp">Patient</a></li>
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
	
	<!-- login -->
	<div class="login">
		<div class="container">
			<div class="login-body">
				<div class="login-heading">
					<h1>Edit Doctor Profile</h1>
				</div>
				<div class="login-info">
				
				
				<%
				if(session.getAttribute("username")!=null && acctype.equals("Doctor"))
				{
				MyConnection con=new MyConnection();
				Statement statement=con.OpenConnection();
				ResultSet resultSet=statement.executeQuery("Select d.DoctorID, d.DEmail, d.DName, d.Department, d.AvailableTime, d.AvailableDays, d.DAddress, d.DCIty, d.DZip, d.DContact, u.Password from doctor d, userlogin u where d.DEmail=u.Email and d.DEmail='"+session.getAttribute("username")+"'");
				while(resultSet.next())
				{
				%>
					<form action="editDoctor">
						<%
							if (request.getAttribute("success") != null) {
						%>
						<label name="success" style="color: red; font-family: sans-serif;"><%=request.getAttribute("success")%></label>
						<%
							}
						%>
						<input type="text" class="user" name="name" placeholder="Name" value="<%=resultSet.getString("DName") %>" required="">
						<label>Select Department</label>
						<select id="dep" name="department" required>
							
							<%if(resultSet.getString("Department").equals("Skin")){ %>
							<option disabled selected value="">Select Department</option>
							<option value="Skin" selected>Skin</option>
							<option value="Eye">Eye</option>
							<option value="ENT">ENT</option>
							<option value="Surgary">Surgary</option>
							
							<%}else if(resultSet.getString("Department").equals("Eye")){%>
							<option disabled selected value="">Select Department</option>
							<option value="Skin">Skin</option>
							<option value="Eye" selected>Eye</option>
							<option value="ENT">ENT</option>
							<option value="Surgary">Surgary</option>
							
							<%}else if(resultSet.getString("Department").equals("ENT")){%>
							<option disabled selected value="">Select Department</option>
							<option value="Skin">Skin</option>
							<option value="Eye">Eye</option>
							<option value="ENT" selected>ENT</option>
							<option value="Surgary">Surgary</option>
							
							<%}else if(resultSet.getString("Department").equals("Surgary")){%>
							<option disabled selected value="">Select Department</option>
							<option value="Skin">Skin</option>
							<option value="Eye">Eye</option>
							<option value="ENT">ENT</option>
							<option value="Surgary selected">Surgary</option>
							
							<%} %>
							
						</select>
						<input type="text" class="user"	name="address" placeholder="Address" value="<%=resultSet.getString("DAddress") %>"  required="">
						<input type="text" class="user"	name="city" placeholder="City"  value="<%=resultSet.getString("DCity") %>" required="">
						<input type="text" class="user" pattern="[0-9]{6}" title="Please enter 6 digit of zip." name="zip"  value="<%=resultSet.getString("DZip") %>" placeholder="Zip" required="">
						<input type="text" class="user"	pattern="[0-9]{10}"	title="Please enter 10 digits of mobile number." name="contact" placeholder="Contact No." value="<%=resultSet.getString("DContact") %>"  required="">
						<input type="email" class="user" name="email" placeholder="Email" value="<%=resultSet.getString("DEmail") %>" required="">
						<input type="text" class="user" pattern="[0-1][0-9][:][0-5][0-9][:][0-5][0-9]" title="Please enter HH:MM format." name="availabletime" value="<%=resultSet.getString("AvailableTime") %>"  placeholder="Available Time in HH:MM" required="">
						<h2>
							Available Days
							<hr>
							
							<%
							Boolean sunFlag=false,monFlag=false,tuesFlag=false,wedFlag=false,thusFlag=false,friFlag=false,satFlag=false;
							
							if(resultSet.getString("AvailableDays").contains("Sunday"))
								sunFlag=true;
							if(resultSet.getString("AvailableDays").contains("Monday"))
								monFlag=true;
							if(resultSet.getString("AvailableDays").contains("Tuesday"))
								tuesFlag=true;
							if(resultSet.getString("AvailableDays").contains("Wednesday"))
								wedFlag=true;
							if(resultSet.getString("AvailableDays").contains("Thursday"))
								thusFlag=true;
							if(resultSet.getString("AvailableDays").contains("Friday"))
								friFlag=true;
							if(resultSet.getString("AvailableDays").contains("Saturday"))
								satFlag=true;
							%>
							
							Sunday<input type="checkbox" value="Sunday" 
							<%if(sunFlag){ %>
							checked
							<%} %>
							name="sunday">&nbsp;&nbsp;&nbsp;&nbsp;
							
							Monday<input type="checkbox" value="Monday" 
							<%if(monFlag){ %>
							checked
							<%} %>
							name="monday">&nbsp;&nbsp;&nbsp;&nbsp;
							
							
							Tuesday<input type="checkbox" value="Tuesday" 
							<%if(tuesFlag){ %>
							checked
							<%} %>
							 name="tuesday">&nbsp;&nbsp;&nbsp;&nbsp;
							 
							 
							Wednesday<input	type="checkbox" value="Wednesday"
							<%if(wedFlag){ %>
							checked
							<%} %>
							  name="wednesday">&nbsp;&nbsp;&nbsp;&nbsp;
							  
							  
							Thursday<input type="checkbox" value="Thursday" 
							<%if(thusFlag){ %>
							checked
							<%} %>
							name="thursday">&nbsp;&nbsp;&nbsp;&nbsp;
							
							
							Friday<input type="checkbox" value="Friday"  
							<%if(friFlag){ %>
							checked
							<%} %>
							 name="friday">&nbsp;&nbsp;&nbsp;&nbsp;
							 
							 
							Saturday<input type="checkbox" value="Saturday" 
							<%if(satFlag){ %>
							checked
							<%} %>
							name="saturday">
						</h2>
						<hr>
						<input type="password" name="password" class="lock"	placeholder="Password" value="<%=resultSet.getString("Password") %>"  required>
							 <input type="submit" name="Add" value="Update Details">
					</form>
					<%
				}
				statement.close();
				con.CloseConnection();
					
				} %>
				</div>
			</div>
		</div>
	</div>
	<!-- //login -->
	
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