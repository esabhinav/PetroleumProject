<%@page import="com.tnbpda.util.TNBPDAConstants"%>
<%@page import="com.tnbpda.vo.Dealer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style.css" media="screen" />
<title>Subscription Alert!</title>
<%
	if (request.getAttribute("UD") != null) {
		request.getAttribute("UD");
	}
	request.setAttribute("UD", true);
%>
<%
	Dealer user = (Dealer) session
			.getAttribute(TNBPDAConstants.AUTH_USER);
	boolean ud = false;

	String mod = (String) request.getAttribute("module");
	if (mod == null) {
		mod = "home";
	}
	if (!ud) {

	}
	if (request.getAttribute("UD") != null) {
		ud = (boolean) request.getAttribute("UD");
	}
	if (user != null) {
	}
%>
</head>
<style>
.button1:link, .button:visited {
	border-radius: 10px;
	width: 100px;
	border: none;
	color: white;
	padding: 10px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 17px;
	margin: 4px 2px;
}

.button {
	border-radius: 10px;
	width: 100px;
	border: none;
	color: white;
	padding: 12px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 17px;
	margin: 4px 2px;
}

.button1 {
	background-color: #4CAF50;
	cursor: pointer; /* Green */
}
</style>
<body>
	<div id="main_container">
		<div id="header" style="background-image: url(../images/bp11.jpg)">
			<jsp:include page="../menu/header.jsp" />
		</div>
		<table width="100%">
			<tr>
				<td width=25%></td>
				<td width=50%>
					<center>
						<b>Alert..! You are not a member of TNBPDA. <br />To avail
							this site further please subscribe soon. <br />
						</b>
					</center>
					<br/>
					<table frame="box" align="center">
						<tr>
							<td><b>Account Name:</b></td>
							<td>T.N.Bharat Petroleum DLR ASSN</td>
						</tr>
						<tr>
							<td><b>Account Number:&nbsp;&nbsp;</b></td>
							<td>00000011012890293</td>
						</tr>
						<tr>
							<td><b>IFSC Code:</b></td>
							<td>SBIN0012795</td>
						</tr>
						<tr>
							<td><b>Bank:</b></td>
							<td>State Bank of India, THILLAI NAGAR, TIRUCHIRAPALLI</td>
						</tr>
					</table>
				</td>
				<td width=25%></td>
			</tr>
		</table>
		<br>

		<jsp:include page="../menu/footer.jsp" />
	</div>
</body>
</html>