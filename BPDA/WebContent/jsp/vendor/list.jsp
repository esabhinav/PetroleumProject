<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="com.tnbpda.util.TNBPDAConstants"%>
<%@page import="com.tnbpda.vo.User"%>
<%@page import="com.tnbpda.vo.Dealer"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TNBPDA</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style.css" media="screen" />
<script type="text/javascript" language="javascript"
	src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<link rel="stylesheet" type="text/css"
	href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.css" />

<script type="text/javascript" charset="utf8"
	src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>


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
	padding: 6px 12px;
	border: 1px solid #ccc;
	border-top: none;
}
</style>
</head>
<%
	User user = (User) session.getAttribute(TNBPDAConstants.AUTH_USER);
	if (user != null) {
%>
<body>
	<div id="main_container">

		<div id="main_content" style="height: 95%;">
			<jsp:include page="../menu/header.jsp" />
			<%
				List<Dealer> dealersList = (List<Dealer>) request
							.getAttribute(TNBPDAConstants.DEALERS_LIST);
					System.out.println("in JSP " + dealersList);
			%>
			<div class="container">

				<ul class="nav nav-tabs nav-justified">
					<li><a data-toggle="tab" href="#tlc">TankLorryChasis</a></li>
					<li><a data-toggle="tab" href="#tf">TankFabricator </a></li>
					<li><a data-toggle="tab" href="#uni">Uniform</a></li>
					<li><a data-toggle="tab" href="#air">AirGuage/N2</a></li>

					<li><a data-toggle="tab" href="#lli">Lighting</a></li>
					<li><a data-toggle="tab" href="#cctv">CCTV</a></li>
					<li><a data-toggle="tab" href="#airComp">AirCompressor</a></li>
					<li><a data-toggle="tab" href="#pb">Paverblocks</a></li>

					<li><a data-toggle="tab" href="#canopy">Canopy</a></li>
					<li><a data-toggle="tab" href="#generator">Generator</a></li>
					<li><a data-toggle="tab" href="#ins">Insurance</a></li>
					<li><a data-toggle="tab" href="#pte">Scientific-Equipment</a></li>
				</ul>
				<div class="tab-content">

					<div id="tlc" class="tab-pane fade">
						<h3>Tank Lorry Chasis</h3>
					</div>
					<div id="tf" class="tab-pane fade">
						<h3>Tank Fabricator</h3>
					</div>
					<div id="uni" class="tab-pane fade">
						<h3>Uniform</h3>
					</div>
					<div id="air" class="tab-pane fade">
						<h3>Air Guage/ N2</h3>
					</div>
					
					<div id="lli" class="tab-pane fade">
						<h3>Lighting(LED/induction)</h3>
					</div>
					<div id="cctv" class="tab-pane fade">
						<h3>CCTV</h3>
					</div>
					
					
					<div id="airComp" class="tab-pane fade">
						<h3>Air Compressor</h3>
					</div>
					<div id="pb" class="tab-pane fade">
						<h3>Paverblocks</h3>
					</div>
					
					
					<div id="canopy" class="tab-pane fade">
						<h3>Canopy</h3>
					</div>
					<div id="generator" class="tab-pane fade">
						<h3>Generator</h3>
					</div>
					
					
					<div id="ins" class="tab-pane fade">
						<h3>Insurance</h3>
					</div>
					<div id="pte" class="tab-pane fade">
						<h3>Petroleum-Testing-Equipment</h3>
						<img align="bottom"	src="<%=request.getContextPath()%>/images/tool.jpg"
													width="175" height="180"> 
					</div>
					 
				</div>
			</div>


			<jsp:include page="../menu/footer.jsp" />
		</div>
		<!--end of main container-->
</body>
<%
	} else {
%>
<jsp:forward page="../login.jsp" />
<%
	}
%>

</html>