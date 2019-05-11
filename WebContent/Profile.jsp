<%@ page language ="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="chitkara.dao.UserDao" %>
<!DOCTYPE html>
<html>
<%UserDao user=(UserDao)session.getAttribute("user");%>
<head>
<jsp:useBean id="c1" class="chitkara.operation.ProfileOperation"></jsp:useBean>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/Footer-white.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
	background-repeat: no-repeat;
	background-image: url("11.jpg");
	background-size: cover;
	font-family: "Lato", sans-serif;
}

th, td {
	font-size: 18px;
	color: white;
	padding-left: 400px;
	border: 1px solid white;
}

.sidenav {
	height: 100%;
	width: 0;
	position: fixed;
	z-index: 1;
	top: 0;
	left: 0;
	background-color: #111;
	overflow-x: hidden;
	transition: 0.5s;
	padding-top: 60px;
}

.sidenav a {
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 25px;
	color: #818181;
	display: block;
	transition: 0.3s;
}

.sidenav a:hover {
	color: #f1f1f1;
}

.sidenav .closebtn {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px;
	margin-left: 50px;
}

.logout {
	color: gray;
	font-size: 25px;
	margin-left: 600px;
}

#main {
	color: white;
	transition: margin-left .5s;
	padding: 16px;
}

@media screen and (max-height: 450px) {
	.sidenav {
		padding-top: 15px;
	}
	.sidenav a {
		font-size: 18px;
	}
}

#myFooter {
	padding-top: 32px;
}

#myFooter .container {
	margin-top: 200px;
	text-align: center;
}

#myFooter .footer-copyright {
	margin-bottom: 35px;
	text-align: center;
	color: white;
}

#myFooter ul {
	list-style-type: none;
	padding: 0;
	margin-bottom: 18px;
}

#myFooter a {
	color: white;
	font-size: 18px;
}

#myFooter li {
	display: inline-block;
	margin: 0px 15px;
	line-height: 2;
}

#myFooter .footer-social {
	text-align: center;
	padding-top: 25px;
	padding-bottom: 25px;
}

#myFooter .fa {
	font-size: 36px;
	margin-right: 15px;
	margin-left: 20px;
	background-color: white;
	color: blue;
	border-radius: 51%;
	padding: 10px;
	height: 60px;
	width: 60px;
	text-align: center;
	line-height: 43px;
	text-decoration: none;
	transition: color 0.2s;
}

#myFooter .fa-facebook:hover {
	color: #2b55ff;
}

#myFooter .fa-facebook:focus {
	color: #2b55ff;
}

#myFooter .fa-google-plus:hover {
	color: red;
}

#myFooter .fa-google-plus:focus {
	color: red;
}

#myFooter .fa-twitter:hover {
	color: #00aced;
}

#myFooter .fa-twitter:focus {
	color: #00aced;
}

@media screen and (max-width: 767px) {
	#myFooter {
		text-align: center;
	}
}

.content {
	flex: 1 0 auto;
	-webkit-flex: 1 0 auto;
	min-height: 300px;
}

html {
	height: 100%;
}

body {
	display: flex;
	display: -webkit-flex;
	flex-direction: column;
	-webkit-flex-direction: column;
	height: 100%;
}
</style>
</head>
<body>

	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<a href="Dashboard.jsp">Dashboard</a> <a href="Profile.jsp">Profile</a>
		<a href="Complaint.jsp">Complaint</a>
	</div>
	<nav class="navbar navbar-expand-sm bg-dark navbar-dark"
		style="height: 300px;">
		<div id="main">
			<span style="font-size: 30px; cursor: pointer" onclick="openNav()"><img
				src="menulogo.png" style="width: 50px; height: 50px;"></span>
		</div>

		<script>
			function openNav() {
				document.getElementById("mySidenav").style.width = "250px";
				document.getElementById("main").style.marginLeft = "250px";
			}

			function closeNav() {
				document.getElementById("mySidenav").style.width = "0";
				document.getElementById("main").style.marginLeft = "0";
			}
		</script>
		<h1 style="color: white;">Hostel Management</h1>
		<a href="Index.html" class="logout">LOGOUT</a>
	</nav>
	<hr>
	<div class="content">
		<img src="icon.jpg"
			style="margin-left: 600px; width: 150px; height: 150px;">
		<table style="margin-left: 80px; margin-top: 20px;">
			<% ResultSet rs=c1.showProfile(user.getUid());
				if(rs.next())
				{
				%>
					<thead>
						<h3 style="margin-left: 600px; color:white;"">
						</center><strong>Personal info ::</strong>
						</h3>
					</thead>
					</tr>
						<tr>
							<th>Roll no</th>
							<td>:<%=rs.getString("uid")%></td>
						</tr>
						<tr>
					<tr>
						<th>Firstname</th>
						<td><%=rs.getString("first_name")%></td>

					</tr>

					<tbody>
						<tr>
							<th>Lastname</th>
							<td>:<%=rs.getString("last_name") %></td>
						<tr>
							<th>Contact No</th>
							<td>:<%=rs.getString("contact") %></td>
						</tr>
						<tr>
							<th>E-mail</th>
							<td><%=rs.getString("email") %></td>
						</tr>
						<th><h3>
								<strong>Correspondence Address ::</strong>
							</h3></th>
						<tr>
							<th>Address</th>
							<td>:<%=rs.getString("address")%></td>
						</tr>
						<tr>
							<th>City</th>
							<td>:<%=rs.getString("city")%></td>
						</tr>
						<tr>
							<th>State</th>
							<td><%=rs.getString("state")%></td>
						</tr>
						<tr>
							<th>Country</th>
							<td>:<%=rs.getString("country")%></td>
						</tr>

						<th><h3>
								<strong>Parents Information ::</strong>
							</h3></th>
						<tr>
							<th>Father's Name</th>
							<td>:<%=rs.getString("father_name")%></td>
						</tr>
						<tr>
							<th>Mother's Name</th>
							<td>:<%=rs.getString("mother_name")%></td>
						</tr>
						<tr>
							<th>Father's mobile no</th>
							<td>:<%=rs.getString("father_mobile")%></td>
						</tr>
						<tr>
							<th>Mother's mobile no</th>
							<td>:<%=rs.getString("mother_mobile")%></td>
						</tr>
						<tr>
							<th>Occupation</th>
							<td>:<%=rs.getString("father_occupation")%></td>
						</tr>
						<tr>
							<th>Category</th>
							<td>:<%=rs.getString("category")%></td>
						</tr>
						<tr>
							<th>Room no</th>
							<td>:<%=rs.getString("room_no")%></td>
						</tr>
						<tr>
							<th>Hostel name</th>
							<td>:<%=rs.getString("hostel_name")%></td>
						</tr>
						<tr>
							<th>Branch</th>
							<td>:<%=rs.getString("branch")%></td>
						</tr>
						<% } 
						else
						{
							%>
							<center><h1>no data found plz insert data</h1></center>
							<% 
						}
							%>
	
			
		</table>
	</div>
	<footer id="myFooter">
		<div class="container">
			<ul>
				<li><a href="#">Company Information</a></li>
				<li><a href="#">Contact us</a></li>
				<li><a href="#">Reviews</a></li>
				<li><a href="#">Terms of service</a></li>
			</ul>
			<p class="footer-copyright">© 2019 Copyright Text</p>
		</div>
		<div class="footer-social">
			<a href="#" class="social-icons"><i class="fa fa-facebook"></i></a> <a
				href="#" class="social-icons"><i class="fa fa-google-plus"></i></a>
			<a href="#" class="social-icons"><i class="fa fa-twitter"></i></a>
		</div>
	</footer>
</body>
</html>
