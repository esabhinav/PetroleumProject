<%@page import="com.tnbpda.vo.LorryRenewal"%>
<%@page import="com.tnbpda.util.TNBPDAConstants"%>
<%@page import="com.tnbpda.vo.Dealer"%>
<%@page import="com.tnbpda.vo.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>TNBPDA</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style.css" media="screen" />

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style.css" media="screen" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/tcal.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/tcal.js">function validateForm() {
	    var x = document.forms["forms"]["insured"].value;
	    if (x == "") {
	        alert("Are crew insured?");
	        return false;
	    }
	    var x = document.forms["forms"]["toll"].value;
	    if (x == "") {
	        alert("Is monthly toll paid?");
	        return false;
	    }
	    var x = document.forms["forms"]["bill"].value;
	    if (x == "") {
	        alert("Is rental bill paid?");
	        return false;
	    }

	        alert("Enter Vendor ID");
	        return false;
	}</script>
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
								<h4>Lorry Renewal Information</h4>
							</center>
			<form action="/tnbpda/lorryRenewal?option=1&ccid=<%=user.getCcNo()%>&regno=<%=lorryRenewal.getRegistrationNo()%>"
						onsubmit="return submitForm()" method="post" id="forms"
								name="forms" onsubmit="return validateForm()">
					<input type="hidden" name="cc" value="null" />
									<legend><b> Tank Lorry Renewals Dates</b></legend>
									<table cellpadding="5" cellspacing="5" border="0" width="100%">
										<!-- <tr valign="top" bgcolor="#0AC059">
										<td align="center" > 
									</td></tr> -->

										<tr>
											<td><b>TL Insur</b></td>
											<td>Period <select name="tlperiod"><option value="1">1
														year</option>
													<option value="6">6 months</option></select></td>
											<td>Exp.Date <input type="text" name="tldate" id="tldate" size="10"
												class="tcal" <%if(lorryRenewal.gettLInsurDate()==null){%>value=""<%}else{%>value="<%=lorryRenewal.gettLInsurDate()%>"<%}%> required/>&nbsp;&nbsp;Reminder :
												 <select name="tlreminder"><option
														value="15">15 days</option>
													<option value="30">30 days</option></select></td>
										</tr>
										<tr>
											<td><b>CLL Insur</b></td>
											<td>Period <select name="cllperiod"><option value="1">1
														year</option>
													<option value="6">6 months</option></select></td>
											<td>Exp.Date <input type="text" name="clldate" id="clldate" size="10"
												class="tcal" <%if(lorryRenewal.getcLLInsurDate()==null){%>value=""<%}else{%>value="<%=lorryRenewal.getcLLInsurDate()%>"<%}%> required/>&nbsp;&nbsp;Reminder : 
												<select name="cllreminder"><option
														value="15">15 days</option>
													<option value="30">30 days</option></select></td>
										</tr>
										<tr>
											<td><b>FC</b></td>
									<td>Period <select name="fcperiod"><option value="1">1
														year</option>
													<option value="6">6 months</option></select></td>
											<td>Exp.Date <input type="text" name="fcdate" id="fcdate" size="10"
												class="tcal" <%if(lorryRenewal.getfCDate()==null){%>value=""<%}else{%>value="<%=lorryRenewal.getfCDate()%>"<%}%> required/>&nbsp;&nbsp;Reminder :
												 <select name="fcreminder"><option
														value="15">15 days</option>
													<option value="30">30 days</option></select></td>
										</tr>
										<tr>
											<td><b>Calibration</b></td>
											<td>Period <select name="caliperiod"><option value="1">1
														year</option>
													<option value="6">6 months</option></select></td>
											<td>Exp.Date <input type="text" name="calidate" id="calidate" size="10"
												class="tcal" <%if(lorryRenewal.getCalibrationDate()==null){%>value=""<%}else{%>value="<%=lorryRenewal.getCalibrationDate()%>"<%}%> required/>&nbsp;&nbsp;Reminder : 
												<select name="calireminder"><option
														value="15">15 days</option>
													<option value="30">30 days</option></select></td>
													</tr>
										<tr>
											<td><b>Explosive</b></td>
										<td>Period <select name="eperiod"><option value="1">1
														year</option>
													<option value="6">6 months</option></select></td>
											<td>Exp.Date <input type="text" name="edate" id="edate" size="10"
												class="tcal" <%if(lorryRenewal.getExplosiveDate()==null){%>value=""<%}else{%>value="<%=lorryRenewal.getExplosiveDate()%>"<%}%> required/>&nbsp;&nbsp;Reminder : 
												<select name="ereminder"><option
														value="15">15 days</option>
													<option value="30">30 days</option></select></td>
										</tr>
										<tr>
											<td><b>RoadTax</b></td>
										<td>Period <select name="roperiod"><option value="1">1
														year</option>
													<option value="6">6 months</option></select></td>
											<td>Exp.Date <input type="text" name="rodate" id="rodate" size="10"
												class="tcal" <%if(lorryRenewal.getRoadTaxDate()==null){%>value=""<%}else{%>value="<%=lorryRenewal.getRoadTaxDate()%>"<%}%> required/>&nbsp;&nbsp;Reminder :
												 <select name="roreminder"><option
														value="15">15 days</option>
													<option value="30">30 days</option></select></td>
										</tr>
										<tr>
											<td><b>Permit</b></td>
										<td>Period <select name="peperiod"><option value="1">1
														year</option>
													<option value="6">6 months</option></select></td>
											<td>Exp.Date <input type="text" name="pedate" id="pedate" size="10"
												class="tcal" <%if(lorryRenewal.getPermitDate()==null){%>value=""<%}else{%>value="<%=lorryRenewal.getPermitDate()%>"<%}%> required/>&nbsp;&nbsp;Reminder :
												 <select name="pereminder"><option
														value="15">15 days</option>
													<option value="30">30 days</option></select></td>
										</tr>
										<tr>
											<td><b>Fire Gun Servicing</b></td>
											<td>Period <select name="fgperiod"><option value="1">1
														year</option>
													<option value="6">6 months</option></select></td>
											<td>Exp.Date <input type="text" name="fgdate" id="fgdate" size="10"
												class="tcal" <%if(lorryRenewal.getFireGunDate()==null){%>value=""<%}else{%>value="<%=lorryRenewal.getFireGunDate()%>"<%}%> required/>&nbsp;&nbsp;Reminder :
												 <select name="fgreminder"><option
														value="15">15 days</option>
													<option value="30">30 days</option></select></td>
										</tr>
										<tr>
											<td><b>Crew Insurance</b></td>
											<td><input type="radio" name="insured" value="true" <%if(lorryRenewal.getfCDate()!=null){%><%if(lorryRenewal.isCrewInsurance()){%> checked <%}}%>required="required">Yes<br>
											<td><input type="radio" name="insured" value="false"<%if(lorryRenewal.getfCDate()!=null){%><%if(!(lorryRenewal.isCrewInsurance())){%> checked <%}}%>required="required">No<br>
										</tr>
										<tr>
											<td><b>Lorry Toll (Monthly)</b></td>
											<td><input type="radio" name="toll" value="true" <%if(lorryRenewal.getfCDate()!=null){%><%if(lorryRenewal.isCrewInsurance()){%> checked <%}}%>required="required">Renewed<br>
											<td><input type="radio" name="toll" value="false" <%if(lorryRenewal.getfCDate()!=null){%><%if(!(lorryRenewal.isCrewInsurance())){%> checked <%}}%>required="required">Not Renewed<br>
										</tr>
										<tr>
											<td><b>Rental Bill</b></td>
											<td><input type="radio" name="bill" value="true" <%if(lorryRenewal.getfCDate()!=null){%><%if(lorryRenewal.isCrewInsurance()){%> checked <%}}%>required="required">Paid<br>
											<td><input type="radio" name="bill" value="false" <%if(lorryRenewal.getfCDate()!=null){%><%if(!(lorryRenewal.isCrewInsurance())){%> checked <%}}%>required="required">Not Paid<br>
										</tr>
										<tr>
											<td colspan="2"><input
												src="/tnbpda/images/sub.jpg"
												id="searchsubmit" name="searchsubmit" type="image" value=""
												tabindex="2" /></td>
										</tr>
									</table>
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