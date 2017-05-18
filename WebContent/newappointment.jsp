<%@page import="dao.MyConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>New Appoinment</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Around Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<script type="application/x-javascript">
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 

</script>
<!-- bootstrap-css -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css"
	media="all" />
<!--// bootstrap-css -->
<!-- css -->
<link rel="stylesheet" href="css/style.css" type="text/css" media="all" />
<!--// css -->
<!-- font-awesome icons -->
<link href="css/font-awesome.css" rel="stylesheet">
<!-- //font-awesome icons -->
<!-- font -->
<link href='//fonts.googleapis.com/css?family=Francois+One'
	rel='stylesheet' type='text/css'>
<!-- //font -->
<script src="js/jquery-1.11.1.min.js"></script>
<script src="js/bootstrap.js"></script>
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$(".scroll").click(function(event) {
			event.preventDefault();
			$('html,body').animate({
				scrollTop : $(this.hash).offset().top
			}, 1000);
		});
	});
</script>
<!--animate-->
<link href="css/animate.css" rel="stylesheet" type="text/css"
	media="all">
<script src="js/wow.min.js"></script>
<script>
	new WOW().init();
</script>
<!--//end-animate-->


<script type="text/javascript">
	function checkDate() {
		
		
		
		var EnteredDate = document.getElementById("txtdate").value;

		if (("-" != EnteredDate.substring(7, 8))
				&& ("-" != EnteredDate.substring(4, 5))) {
			alert("Date should be greater then today and should be in dd-mm-yyyy format(IE:yyyy-mm-dd).");
			return false;
		}
		var date = EnteredDate.substring(8, 10);
		var month = EnteredDate.substring(5, 7);
		var year = EnteredDate.substring(0, 4);

		var myDate = new Date(year, month - 1, date);
		var today = new Date();

		if (myDate > today) {
			//alert("Entered date is greater than today's date ");
			return true;
		} else {
			alert("Date should be greater then today and should be in dd-mm-yyyy format(IE:yyyy-mm-dd)."
					+ EnteredDate.substring(7, 8)
					+ "hh"
					+ EnteredDate.substring(4, 5));
			document.getElementById("dep").selectedIndex = 0;
			//document.getElementById("doctorname").options[0].text="Select Doctor";
			document.getElementById('dropdownid').selectedIndex = -1;
			return false;
		}
	}

	function showDoctor(dep) {
		checkDate();

		var xmlhttp;

		if (window.XMLHttpRequest) {
			// code for IE7+, Firefox, Chrome, Opera, Safari 
			xmlhttp = new XMLHttpRequest();
		} else {// code for IE6, IE5 
			xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}

		xmlhttp.onreadystatechange = function() {
			if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
				document.getElementById("doctorname").innerHTML = xmlhttp.responseText;

				var doctor = document.getElementById("doctorname").value;

				if (doctor != "") {

				} else {
					alert("No Doctors available on give dates..");

					document.getElementById("dep").selectedIndex = 0;
				}
			}
		};

		var txtdate = document.getElementById("txtdate").value;
		xmlhttp.open("GET", "getdoctor.jsp?dep=" + dep + "&txtdate=" + txtdate,
				true);
		xmlhttp.send();

	}

	function defdep() {
		document.getElementById("dep").selectedIndex = 0;
		//document.getElementById("doctor").;
		$('#doctorname')
				.empty()
				.append(
						'<option selected="selected" value="">Select Doctor Name</option>');
	}

	function loadpatient() {

	}
</script>



</head>

<body>
	<!-- header -->
	<div class="header">
		<div class="top-header">
			<div class="container">
				<div class="top-header-info">
					<div class="top-header-left wow fadeInLeft animated"
						data-wow-delay=".5s">
						<p>Hey! Now You can book your appointment online</p>
					</div>
					<div class="top-header-right wow fadeInRight animated"
						data-wow-delay=".5s">
						<div class="top-header-right-info">
							<ul>
								<%
									if (session.getAttribute("username") != null) {
								%>
								<li><a href="#">Hi <%=session.getAttribute("username")%></a></li>
								<li><a href="logout"
									onclick="alert('Logout Succesfully..')">Logout</a></li>
								<%
									} else {
								%>
								<li>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&empty;

								
								<li><a href="login.jsp">Login</a></li>
								<li><a href="signup.jsp">Sign up</a></li>
								<%
									}
								%>
							</ul>
						</div>

						<div class="social-icons">
							<ul>
								<li><a class="twitter" href="#"><i
										class="fa fa-twitter"></i></a></li>
								<li><a class="twitter facebook"
									href="http://fb.com/vbhardwaj511"><i class="fa fa-facebook"></i></a></li>
								<li><a class="twitter google" href="#"><i
										class="fa fa-google-plus"></i></a></li>
							</ul>
						</div>
						<div class="clearfix"></div>
					</div>
					<div class="clearfix"></div>
				</div>
			</div>
		</div>
		<div class="bottom-header">
			<div class="container">
				<div class="logo wow fadeInDown animated" data-wow-delay=".5s">
					<h1>
						<a href="index.jsp"><img src="images/logo.png" alt="" /></a>
					</h1>
				</div>
				<div class="top-nav wow fadeInRight animated" data-wow-delay=".5s">
					<nav class="navbar navbar-default">
					<div class="container">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1">Menu</button>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav">

							<%
								String acctype = (String) session.getAttribute("acctype");
								if (acctype == null) {
							%>
							<li><a href="index.jsp" class="active">Home</a></li>
							<li><a href="gallery1.jsp">Gallery</a></li>
							<li><a href="about.jsp">About</a></li>
							<li><a href="contact.jsp">Contact</a></li>

							<%
								}
								if ((acctype != null) && (acctype.equals("Admin"))) {
							%>
							<li><a href="index.jsp">Home</a></li>
							<li><a href="loginlist.jsp">LoginList</a></li>
							<li><a href="doctor.jsp">Doctor</a></li>
							<li><a href="patient.jsp">Patient</a></li>
							<li><a href="appointment.jsp" class="active">Appointment</a></li>
								<li><a href="rooms.jsp">Rooms</a></li>
								<li><a href="bills.jsp">Bills</a></li>
								<li><a href="pathalogies.jsp">Pathalogy</a></li>
							<li><a href="gallery1.jsp">Gallery</a></li>
							<li><a href="about.jsp">About</a></li>
							<li><a href="contact.jsp">Contact</a></li>

							<%
								}
								if ((acctype != null) && (acctype.equals("Doctor"))) {
							%>
							<li><a href="index.jsp">Home</a></li>
							<li><a href="editdoctor.jsp">Profile</a></li>
							<li><a href="patient.jsp">Patient</a></li>
							<li><a href="appointment.jsp" class="active">Appointment</a></li>
								<li><a href="rooms.jsp">Rooms</a></li>
								<li><a href="bills.jsp">Bills</a></li>
								<li><a href="pathalogies.jsp">Pathalogy</a></li>
							<li><a href="gallery1.jsp">Gallery</a></li>
							<li><a href="about.jsp">About</a></li>
							<li><a href="contact.jsp">Contact</a></li>

							<%
								}
								if ((acctype != null) && (acctype.equals("Patient"))) {
							%>
							<li><a href="index.jsp">Home</a></li>
							<li><a href="editpatient1.jsp">Profile</a></li>
							<li><a href="appointment.jsp" class="active">Appointment</a></li>
								<li><a href="rooms.jsp">Rooms</a></li>
								<li><a href="bills.jsp">Bills</a></li>
								<li><a href="pathalogies.jsp">Pathalogy</a></li>
							<li><a href="gallery1.jsp">Gallery</a></li>
							<li><a href="about.jsp">About</a></li>
							<li><a href="contact.jsp">Contact</a></li>
							<%
								}
							%>


						</ul>
						<div class="clearfix"></div>
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
					<h1>New Appointment</h1>
				</div>
				<div class="login-info">
					<form action="newappointment" onsubmit="return checkDate()">

						<%
							if (request.getAttribute("success") != null) {
						%>
						<label name="success" style="color: green; font-family: sans-serif;"><%=request.getAttribute("success")%></label>
						<%
							request.setAttribute("success", "");
							}
						%><br><br>

						<label>Select Patient</label> <select id="patientname"
							name="patientname" required>
							<option disabled selected value="">Select Patient Name</option>
							<%
								MyConnection con = new MyConnection();
								ResultSet resultSet = null;
								try {
									Statement statement = con.OpenConnection();
									if ((acctype.equals("Admin")) || (acctype.equals("Doctor"))) {
										resultSet = statement
												.executeQuery("select PatientID,PName,PEmail from Patient");
									} else {
										resultSet = statement
												.executeQuery("select PatientID,PName,PEmail from Patient where PEmail='"
														+ session.getAttribute("username")
																.toString() + "'");
									}
									while (resultSet.next()) {
							%>
							<option value="<%=resultSet.getString(1)%>"><%=resultSet.getString(2)%></option>
							<%
								}
									resultSet.close();
									statement.close();
									con.CloseConnection();
								} catch (Exception e) {
									out.print(e);
								}
							%>

						</select> <label>Select Appointment Date</label> <input type="date"
							required id="txtdate" name="appdate" onchange="defdep()">

						<label>Select Department</label> <select id="dep"
							name="department" required="true"
							onchange="showDoctor(this.value)">
							<option disabled selected value="">Select Department</option>
							<option value="Skin">Skin</option>
							<option value="Eye">Eye</option>
							<option value="ENT">ENT</option>
							<option value="Surgary">Surgary</option>
						</select> <label>Select Doctor</label> <select id="doctorname"
							name="doctorname" required>
							<option disabled selected value="">Select Doctor Name</option>
							<!-- <option >Docter1</option>
						<option >Docter1</option>
						<option >Docter1</option>
						<option >Docter1</option>
							 -->
						</select> <label>Specify Illness Details</label> <input type="text"
							class="user" name="illnessdet"
							placeholder="Describe your illness briefly.." required="">


						<!-- 
						<label>Select Time</label>
						<select name="time" required>
						<option>09:00:00</option>
						<option>10:00:00</option>
						<option>11:00:00</option>
						<option>12:00:00</option>
						<option>01:00:00</option>
						<option>02:00:00</option>
						</select> -->


						<label>Status</label> <input type="text" readonly="readonly"
							value="Pending" class="user" name="status" required=""> <input
							type="submit" name="submit" value="Submit">
						<!-- <div class="signup-text">
							<a href="login.jsp">Already have an account? Login here.</a>
						</div> -->
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- //login -->

	<!-- footer -->
	<div class="footer">
		<div class="container">
			<div class="footer-grids">
				<div class="col-md-3 footer-nav wow fadeInLeft animated"
					data-wow-delay=".5s">
					<h4>Navigation</h4>
					<ul>
						<li><a href="about.jsp">About</a></li>
						<li><a href="gallery1.jsp">Gallery</a></li>
						<li><a href="contact.jsp">Contact Us</a></li>
					</ul>
				</div>
				<div class="col-md-5 footer-nav wow fadeInUp animated"
					data-wow-delay=".5s">
					<h4>Newsletter</h4>
					<p>Subscribe with us and get more information and latest update
						on your email.</p>
					<form>
						<input type="email" id="mc4wp_email" name="EMAIL"
							placeholder="Enter your email here" required=""> <input
							type="submit" value="Subscribe">
					</form>
				</div>
				<div class="col-md-4 footer-nav wow fadeInRight animated"
					data-wow-delay=".5s">
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
							<h6>Helped one person each month, relive the happy moments
								through Liver transplantation.</h6>

						</div>
					</div>
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="copyright wow fadeInUp animated" data-wow-delay=".5s">
				<p>
					© 2017 Online Hospital Information System . All Rights Reserved . Design &
					Developed by <a href="http://fb.com/vbhardwaj511">Vaibhav
						Bhardwaz</a>
				</p>
			</div>
		</div>
	</div>
	<!-- //footer -->
</body>
</html>