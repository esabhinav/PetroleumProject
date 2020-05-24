<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.tnbpda.vo.LorryRenewal"%>
<%@page import="com.tnbpda.vo.Dealer"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.tnbpda.util.TNBPDAConstants"%>
<%@page import="com.tnbpda.vo.User"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TNBPDA</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style.css" media="screen" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/tcal.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/tcal.js"></script>
<script type="text/javascript">
	function submitForm() {
		alert("inside form");
		try {

		} catch (err) {
			alert(err.description);
			return false;
		}
	}
</script>
</head>
<%
	Dealer user = (Dealer) session .getAttribute(TNBPDAConstants.AUTH_USER);
	LorryRenewal lorryRenewal = (LorryRenewal) request
			.getAttribute(TNBPDAConstants.LORRY_RENEWAL);
%>

<body>
	<div id="main_container">

		<div id="main_content" style="height: 95%;">
			<jsp:include page="../menu/header.jsp" />


			<div id="main_content">
				<table border="1">

					<tr>
						<jsp:include page="../menu/leftnav.jsp" />
						<td width="70%">
<% if(true) { %>
							<center>
								<h4>Renewal Expiry Information</h4>
							
								<div id="err" />
									<legend><b> Tank Lorry Renewals Dates Information</b></legend>
									<table cellpadding="5" cellspacing="5" bgcolor="#C2D6BC">
									<tr>
											<td><b>TL Insurance expire date is</b>&nbsp;&nbsp;<b><%=lorryRenewal.gettLInsurDate()%></b></td>
											<!-- td>Period <select name=""><option value="1">1
														year</option>
													<option value="6">6 months</option></select></td>
											<td>Exp.Date <input type="text" name="edate" id="edate" size="10"
												class="tcal" value="" />&nbsp;&nbsp;Reminder : <select name=""><option
														value="15">15 days</option>
													<option value="30">30 days</option></select></td> -->
										</tr>
										<tr>
											<td><b>CLL Insurance is expire date is</b>&nbsp;&nbsp;<b><%=lorryRenewal.getcLLInsurDate()%></td>
											<!-- <td>Period <select name=""><option value="1">1
														year</option>
													<option value="6">6 months</option></select></td>
											<td>Exp.Date <input type="text" name="edate" id="edate" size="10"
												class="tcal" value="" />&nbsp;&nbsp;Reminder : <select name=""><option
														value="15">15 days</option>
													<option value="30">30 days</option></select></td> -->
										</tr>
										<tr>
											<td><b>FC expire date is</b>&nbsp;&nbsp;<b><%=lorryRenewal.getfCDate()%></td>
									<!-- <td>Period <select name=""><option value="1">1
														year</option>
													<option value="6">6 months</option></select></td>
											<td>Exp.Date <input type="text" name="edate" id="edate" size="10"
												class="tcal" value="" />&nbsp;&nbsp;Reminder : <select name=""><option
														value="15">15 days</option>
													<option value="30">30 days</option></select></td> -->
										</tr>
										<tr>
											<td><b>Calibration expire date is</b>&nbsp;&nbsp;<b><%=lorryRenewal.getCalibrationDate()%></td>
											<!-- <td>Period <select name=""><option value="1">1
														year</option>
													<option value="6">6 months</option></select></td>
											<td>Exp.Date <input type="text" name="edate" id="edate" size="10"
												class="tcal" value="" />&nbsp;&nbsp;Reminder : <select name=""><option
														value="15">15 days</option>
													<option value="30">30 days</option></select></td> -->
													</tr>
										<tr>
											<td><b>Explosive expire date is</b>&nbsp;&nbsp;<b><%=lorryRenewal.getExplosiveDate()%></td>
										<!-- <td>Period <select name=""><option value="1">1
														year</option>
													<option value="6">6 months</option></select></td>
											<td>Exp.Date <input type="text" name="edate" id="edate" size="10"
												class="tcal" value="" />&nbsp;&nbsp;Reminder : <select name=""><option
														value="15">15 days</option>
													<option value="30">30 days</option></select></td> -->
										</tr>
										<tr>
											<td><b>RoadTax expire date is</b>&nbsp;&nbsp;<b><%=lorryRenewal.getRoadTaxDate()%></td>
										<!-- <td>Period <select name=""><option value="1">1
														year</option>
													<option value="6">6 months</option></select></td>
											<td>Exp.Date <input type="text" name="edate" id="edate" size="10"
												class="tcal" value="" />&nbsp;&nbsp;Reminder : <select name=""><option
														value="15">15 days</option>
													<option value="30">30 days</option></select></td> -->
										</tr>
										<tr>
											<td><b>Permit expire date is</b>&nbsp;&nbsp;<b><%=lorryRenewal.getPermitDate()%></td>
										<!-- <td>Period <select name=""><option value="1">1
														year</option>
													<option value="6">6 months</option></select></td>
											<td>Exp.Date <input type="text" name="edate" id="edate" size="10"
												class="tcal" value="" />&nbsp;&nbsp;Reminder : <select name=""><option
														value="15">15 days</option>
													<option value="30">30 days</option></select></td> -->
										</tr>
										<tr>
											<td><b>Fire Gun Servicing expire date is</b>&nbsp;&nbsp;<b><%=lorryRenewal.getFireGunDate()%></td>
											<!-- <td>Period <select name=""><option value="1">1
														year</option>
													<option value="6">6 months</option></select></td>
											<td>Exp.Date <input type="text" name="edate" id="edate" size="10"
												class="tcal" value="" />&nbsp;&nbsp;Reminder : <select name=""><option
														value="15">15 days</option>
													<option value="30">30 days</option></select></td> -->
										</tr>
										<tr>
											<td><b>Crew Insurance </b>&nbsp;<input type="text" name="edate" <%if(lorryRenewal.isCrewInsurance()){%>value="Insured"<%} else {%>value="Not Insured"<%}%> readonly/></td>
											<!-- <td><input type="radio" name="insured" value="Yes">Yes<br>
											<td><input type="radio" name="insured" value="No">No<br> -->
										</tr>
										<tr>
											<td><b>Lorry Toll (Monthly)</b>&nbsp;<input type="text" name="edate" <%if(lorryRenewal.isLorryToll()){%>value="Paid"<%} else {%>value="Not Paid"<%}%> readonly/></td>
											<!-- <td><input type="radio" name="toll" value="Yes">Renewed<br>
											<td><input type="radio" name="toll" value="No">Not Renewed<br> -->
										</tr>
										<tr>
											<td><b>Rental Bill</b>&nbsp;<input type="text" name="edate" <%if(lorryRenewal.isRentalBill()){%>value="Paid"<%} else {%>value="Not Paid"<%}%> readonly/></td>
											<!-- <td><input type="radio" name="bill" value="Yes">Paid<br>
											<td><input type="radio" name="bill" value="No">Not Paid<br> -->
										</tr>
									<!-- 	<tr>
											<td colspan="2"><input
												src="/tnbpda/images/sub.jpg"
												id="searchsubmit" name="searchsubmit" type="image" value=""
												tabindex="2" /></td>
										</tr> -->
								</table>
								</center>
							</form>
							<%} else{ %>
							
							<%} %>
						</td>
					</tr>
				</table>
			</div>
		</div>
		<!--end of left content-->
		<!--end of right content-->


		<div style="clear: both;"></div>

		<jsp:include page="../menu/footer.jsp" />
	</div>
	<!--end of main container-->
</body>
</html>