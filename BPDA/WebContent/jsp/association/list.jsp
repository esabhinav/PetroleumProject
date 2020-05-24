<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" language="javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/jquery.dataTables.css">

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
</head>

<body>
	<div id="main_container">

		<div id="main_content" style="height: 95%;">
			<jsp:include page="../menu/headeragm.jsp" />

			<div class="container">

			<!-- 	<ul class="nav nav-tabs nav-justified">
	 
					<li><a data-toggle="tab" href="#Secretary">Secretary</a></li>
			 
				</ul> -->
				<div class="tab-content">

					<div id="president" class="tab-pane fade in active">
			 

					</div>
					<div id="Secretary" class="tab-pane fade in active ">
						<h3>Secretary</h3>
						<table>
							<tr>
								<td>  I ( as a Secretary) take this opportunity to
						thank the Dealers who attended the EC meeting on 5th Evening and
						our AGM on 6th Jan at Yercaurd.<br/> The attendence was packed hall of
						abt 300 and experssed most of our issues / views to the State
						head. He took little long time to share the Industry information.
						He clarified some of the points and assured us to clear few more
						also noted what ever points which he wil get back after taking it
						up with appropriate departments.<br/> We once again thank the members
						of the TNBPDA who extends their cooperation with their
						participatipn and by way of becoming members with subscription
						payments.<br/> We from the Association office bearers welcome the
						suggestions of the members and we assure you that the general /
						common reapeted issues wil be tabelled to the appropriate
						officials. Due to shortage of time two more points 1- constitution
						of next year office bearers selction comitee 2- registration of
						the Association in society act, same wil be discussed and decided
						in next EC meeting and communicated.<br/> Also note our official
						website launched in the AGM wil be tuned and released to the
						members for their used only upon getting their full details in the
						site as a safety measure. <br/>
						<b>Thanks,<br/>
						S.P.Venkatesan <br/> Secretary<br/>
						TNBPDA.</b>  <br />
								</td>
								<td> </td>
							</tr>
							 
						</table>
					</div>
					 
				</div>
			</div>
		 

		</div>

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