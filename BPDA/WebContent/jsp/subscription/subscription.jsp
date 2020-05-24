<%@page import="com.tnbpda.util.TNBPDAUtil"%>
<%@page import="com.tnbpda.vo.Subscription"%>
<%@page import="com.tnbpda.util.TNBPDAConstants"%>
<%@page import="com.tnbpda.vo.Dealer"%>
<%@page import="com.tnbpda.vo.SubscriptionPayment"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style.css" media="screen" />
<title>Membership</title>
<%
	Dealer user = (Dealer) session
	.getAttribute(TNBPDAConstants.AUTH_USER);
	if (request.getAttribute("UD") != null) {
		request.getAttribute("UD");
	}
	request.setAttribute("UD", true);
%>
</head>
<style>
.button2 {
border-radius: 10px;
	width: 40px;
	border: none;
	color: white;
	padding: 12px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 4px 2px;
	background-color: #5370f4;
	cursor: pointer;
}
.button1 {
	border-radius: 10px;
	width: 100px;
	border: none;
	color: white;
	padding: 15px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 15px;
	margin: 4px 2px;
	background-color: #4CAF50;
	cursor: pointer;
}

.button {
	border-radius: 10px;
	width: 150px;
	border: none;
	color: white;
	padding: 15px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 12px;
	margin: 4px 2px;
	background-color: #4CAF50;
	cursor: pointer;
}
</style>
<script type="text/javascript">
	function enableyearly() {
		if (document.getElementById("life_subscription_no").checked == true) {
			document.getElementById("yearly_subscription_yes").disabled = false;
			document.getElementById("yearly_subscription_no").disabled = false;
			document.getElementById("subscription_year").disabled = false;

		} else if (document.getElementById("life_subscription_yes").checked == true) {
			document.getElementById("subscription_year").disabled = true;
			document.getElementById("yearly_subscription_yes").disabled = true;
			document.getElementById("yearly_subscription_no").disabled = true;
		}
	}
</script>
<body>
	<div id="main_container">
		<jsp:include page="../menu/header.jsp" />



		<div align="center">
			<a class="button2"
				href="<%=request.getContextPath()%>/SubscriptionController?option=4">List</a>
			<table cellpadding="5" cellspacing="5" width="100%" border="1">
				<tr>
					<td width="25%">
						<form
							action="<%=request.getContextPath()%>/SubscriptionController?option=2"
							method="post" id="fforms" name="fforms">
							<table>
								<tr>
									<th>Please Enter</th>
									<td><input type="text" name="ccode" id="ccode"
										value="  CC" readonly disabled size="2"
										style="font: 10px verdana, arial, helvetica" /> <input
										type="text" name="cci" id="cc" value="" size="6" maxlength="6"
										style="font: 15px verdana, arial, helvetica" required /></td>
									<td>&nbsp;&nbsp; <input class="button" type="submit"
										name="searchsubmit" value="Get Payment Details" tabindex="2"></td>
								</tr>

							</table>
						</form>
					</td>
					<td width="45%">
						<%
							if (request.getAttribute("SUBSCRIBER") != null) {
						%>
						<table cellpadding="5" cellspacing="5" width="100%"
							bgcolor="#CCEEF2" border="0">
							<tr>
								<td><b> Payment History Details</b></td>
							</tr>
							<%
							System.out.print("YOUTUBE before "+request.getAttribute("SUBSCRIBER"));
								Subscription youTube = (Subscription) request
											.getAttribute("SUBSCRIBER");
							System.out.print("YOUTUBE "+youTube);
							if(youTube.getCcNo()!=0)
									if (youTube.isLifeLongSubscription()) {
							%>
							<tr>
								<td><%=youTube.getCcNo()%> has a life long Membership.</td>
							</tr>
							<%
								}
									if (youTube.isYearlySubscription()) {
							%>
							<tr>
								<th>SubSciptionDate</th>
								<th>SubscriptionYear</th>
								<th>Amount</th>
								<th>Delete</th>
							</tr>
							<%
								if (request.getAttribute("PAYMENT") != null) {
											List<SubscriptionPayment> listPayment = (List<SubscriptionPayment>) request
													.getAttribute("PAYMENT");
											for (SubscriptionPayment sp : listPayment) {
							%>
							<tr align="center">
								<td><%if(youTube.getSubscriptionDate()!=null){%><%=TNBPDAUtil.convertDateToString(youTube.getSubscriptionDate(), "dd-MMM-YY")%><%} else {%>-<%}%></td>
								<td><%=sp.getSubscriptionYear()%></td>
								<td><%=sp.getAmount()%></td>
								<td><a
									href="<%=request.getContextPath()%>/SubscriptionController?option=3&year=<%=sp.getSubscriptionYear()%>&cc=<%=youTube.getCcNo()%>"
									onclick="return confirm('Are you sure you want to delete this item?');">>Delete</a></td>
							</tr>
							<%
								}
										}
									}
							%>
						</table> <%
 	}
 %>
					</td>
				</tr>
				<tr>
					<td colspan="2" bgcolor="#9EEEF2">
						<form
							action="<%=request.getContextPath()%>/SubscriptionController?option=1"
							method="post" id="fforms" name="fforms">

							<table cellpadding="5" cellspacing="5">
								<tr>
									<td colspan="2"><b><u>Add Payment details</u></b></td>
								</tr>
								<%
									if (request.getAttribute("SUBSCRIBER") != null) {
										Subscription youTube = (Subscription) request
												.getAttribute("SUBSCRIBER");
								%>
								<tr>
									<td colspan="2"><b>CC:&nbsp;<input type="text"
											name="cc" size="3" value="<%=youTube.getCcNo()%>"
											readonly="readonly"></b></td>
								</tr>
								<tr>
									<td>Life Long Subscription:</td>
									<td><input type="radio" name="life_subscription"
										id="life_subscription_yes" value="true"
										onchange="enableyearly()" />Yes &nbsp;&nbsp;<input
										type="radio" name="life_subscription"
										id="life_subscription_no" value="false"
										onchange="enableyearly()" />No</td>
								</tr>

								<tr>
									<td>Yearly Subscription:</td>
									<td><input type="radio" name="yearly_subscription"
										id="yearly_subscription_yes" value="true" disabled />Yes
										&nbsp;&nbsp;<input type="radio" id="yearly_subscription_no"
										name="yearly_subscription" id="yearly_subscription_no"
										value="false" disabled />No Select Year : <select
										name="subscription_year" id="subscription_year" disabled>
											<!-- 		<option value="2015">2015</option>
											<option value="2016">2016</option> -->
											<option value="2017">2017</option>
											<option value="2018">2018</option>
											<!-- <option value="2019">2019</option>
											<option value="2020">2020</option>
											<option value="2021">2021</option>
											<option value="2022">2022</option>
											<option value="2023">2023</option>
											<option value="2024">2024</option> -->

									</select></td>
								</tr>

								<tr>
									<td colspan="2"><input class="button1" type="submit"
										name="searchsubmit" value="Submit" tabindex="2"
										onclick="return confirm('Are you sure ?');"></td>
								</tr>
								<%
									}
								%>
							</table>
						</form>
					</td>
				</tr>
			</table>

		</div>
		<jsp:include page="../menu/footer.jsp" />
	</div>
</body>
</html>
