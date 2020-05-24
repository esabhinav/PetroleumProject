<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.tnbpda.vo.Reminder"%>
<%@page import="com.tnbpda.vo.Message"%>
<%@page import="java.util.List"%>
<%@page import="com.tnbpda.util.TNBPDAConstants"%>
<%@page import="com.tnbpda.vo.Dealer"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TNBPDA</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style.css" media="screen" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/jquery.dataTables.css"/>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" language="javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>

<script type="text/javascript" charset="utf8"
		src="<%=request.getContextPath()%>/js/jquery.dataTables.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//alert("indide");
		$('#myTable').DataTable({
			"dom" : '<"top"fi>rt<"bottom"lp><"clear">'
		});
	});
</script>

<style type="text/css">

/* Style the tab */
.tab {
	font-family: Arial, Helvetica, sans-serif display : none;
	overflow: hidden;
	border: 1px solid #ccc;
	background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
	background-color: inherit;
	float: left;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 14px 16px;
	transition: 0.3s;
	font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
	background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
	background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
	font-family: Arial, Helvetica, sans-serif display : none;
	display: none;
	padding: 6px 12px;
	border: 1px solid #ccc;
	border-top: none;
}
</style>

	<%
		Dealer user = (Dealer) session
			.getAttribute(TNBPDAConstants.AUTH_USER);
			List<Reminder> listReminder = (List<Reminder>) request
			.getAttribute(TNBPDAConstants.CALIB);
			Integer count = (Integer) session.getAttribute("count");

			//TNBPDAUtil.dateToString(me.getValue().getExpDate())
			if (user != null) {
	%>
</head>
<body>

	<div id="main_container">

		<div id="main_content" style="height: 95%;">
		<jsp:include page="../menu/header.jsp" />
		<div>
			<jsp:include page="../menu/headeragm.jsp" />

			<div class="container">

				<ul class="nav nav-tabs nav-justified">
					<li><a data-toggle="tab" href="#president">President </a></li>
					<li><a data-toggle="tab" href="#Secretary">Secretary</a></li>
					<li><a data-toggle="tab" href="#Treasure">Treasure</a></li>
				</ul>
				<div class="tab-content">

					<div id="president" class="tab-pane">
						<h3>President</h3>
						<table  >
							<tr>
								<td>10 Facts About Petroleum Petroleum is one of the major
									commodities around the world. Used to fuel vehicles and heat
									homes, a large quantity of the world's supply spends most of
									the time inside an oil tank, just waiting to be used. However,
									when it comes to the fuel itself petroleum is a very versatile
									and fascinating substance. Want to know more? We've put
									together our top ten facts to get you up to speed. <br />
									Crude Oil Tanks Petroleum is extracted from the earth and, in
									its original form, is a thick, black liquid. Crude oil is
								
								</td>
								<td><img align="bottom"
									src="<%=request.getContextPath()%>/images/manimaran.PNG" width="160"
									height="180"/></td>
							</tr>
							<tr>
								<td colspan="2"><hr />
									<br />
								<b>Messages</b></td>
							</tr>
					<jsp:include page="dispmess.jsp" ><jsp:param name="cc" value="113908"/></jsp:include>
							<tr>
								<td colspan="2"></td>
							</tr>
						</table>

					</div>
					<div id="Secretary" class="tab-pane ">
						<h3>Secretary</h3>
						<table>
							<tr>
								<td>  including
									petroleum. Popular alternatives to this fossil fuel include
									vegetable oil which is derived from plants and other natural
									products. <br /> Where does Crude Oil Come From <br /> The
									crude oil itself comes from the fossils of animals and plants.
									Crude oil is the main component of the petroleum that we use
									all over the world! <br /> Petroleum as Fuel Petroleum is
									often used to fuel vehicles and machines, alongside diesel and
									other fuel sources. It is efficient and prices can be very
									competitive, meaning it is a viable fuel for planes, cars,
									trucks and motorcycles amongst many others. <br /> It is All
									Around You and You Don't Even Know <br /> Oil is extremely
									important in your daily life. You can use it as fuel for
									vehicles and other means of transportation. Even the lipstick
									you use every morning, the paint you bought for working on the
									interior walls and even some medicines you take have petroleum
									in them. <br />
								</td>
								<td><img align="bottom"
									src="<%=request.getContextPath()%>/images/manimaran.PNG" width="160"
									height="180"/></td>
							</tr>
							<tr>
								<td colspan="2"><hr />
									<br />
								<b>Messages</b></td>
							</tr>
				<jsp:include page="dispmess.jsp" ><jsp:param name="cc" value="113908"/></jsp:include>
							<tr>
								<td colspan="2"></td>
							</tr>
						</table>
					</div>
					<div id="Treasure" class="tab-pane">
						<h3>Treasure</h3>
						<table>
							<tr>
								<td>  including
									petroleum. Popular alternatives to this fossil fuel include
									vegetable oil which is derived from plants and other natural
									products. <br /> Where does Crude Oil Come From <br /> The
									crude oil itself comes from the fossils of animals and plants.
									Crude oil is the main component of the petroleum that we use
									all over the world! <br /> Petroleum as Fuel Petroleum is
									often used to fuel vehicles and machines, alongside diesel and
								<!-- 	other fuel sources. It is efficient and prices can be very
									competitive, meaning it is a viable fuel for planes, cars,
									trucks and motorcycles amongst many others. <br /> It is All
									Around You and You Don't Even Know <br /> Oil is extremely
									important in your daily life. You can use it as fuel for
									vehicles and other means of transportation. Even the lipstick
									you use every morning, the paint you bought for working on the
									interior walls and even some medicines you take have petroleum
									in them. --> <br />
								</td>
								<td><img align="bottom"
									src="<%=request.getContextPath()%>/images/MC3.jpg" width="200"
									height="180"/></td>
							</tr>
							<tr>
								<td colspan="2"><hr />
									<br />
								<b>Messages</b></td>
							</tr>
							<jsp:include page="dispmess.jsp" ><jsp:param name="cc" value="113908"/></jsp:include>
							<tr>
								<td colspan="2"></td>
							</tr>
						</table>
					</div>
				</div>
				</div>
			</div>
			<!-- 	<div class="tab" style="width: 100%">
				<button class="tablinks" onclick="openCity(event, 'President')">President</button>
				<button class="tablinks" onclick="openCity(event, 'Secretary')">Secretary</button>
				<button class="tablinks" onclick="openCity(event, 'Treasure')">Treasure</button>
			</div>

			<div id="President" class="tabcontent">
				<h3>President</h3>
				<table>
					<tr>
						<td>Intro</td>
						<td>photo</td>
					</tr>
						<tr>
						<td>Messages</td>
						<td></td>
					</tr>
				</table>
				<p>Some content in president.</p>
			</div>
			<div id="Secretary" class="tabcontent">
				<h3>Secretary</h3>
				<p>Some content in Secretary.</p>
			</div>
			<div id="Treasure" class="tabcontent">
				<h3>Treasure</h3>
				<p>Some content in Treasure.</p>
			</div> -->

		</div>
<%} %>
		<div style="clear: both;"></div>
		<script>
			function openCity(evt, cityName) {
				var i, tabcontent, tablinks;
				tabcontent = document.getElementsByClassName("tabcontent");
				for (i = 0; i < tabcontent.length; i++) {
					tabcontent[i].style.display = "none";
				}
				tablinks = document.getElementsByClassName("tablinks");
				for (i = 0; i < tablinks.length; i++) {
					tablinks[i].className = tablinks[i].className.replace(
							" active", "");
				}
				document.getElementById(cityName).style.display = "block";
				evt.currentTarget.className += " active";
			}

			// Get the element with id="defaultOpen" and click on it
			document.getElementById("defaultOpen").click();
		</script>
		<jsp:include page="../menu/footer.jsp" />
	</div>
	<!--end of main container-->
</body>
</html>