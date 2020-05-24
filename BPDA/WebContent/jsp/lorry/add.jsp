<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
var Msg ='<%=session.getAttribute(TNBPDAConstants.GET_ALERT)%>';
if (Msg=="Yes") {
	 alert("Registration Number exists");
}
function validateForm() {
    var x = document.forms["llorry"]["registrationNo"].value;
    if (x == "") {
        alert("Enter Registraion number");
        return false;
    }

        alert("Enter Vendor ID");
        return false;
}
	function submitForm() {
		var a = confirm("Do you want to submit?");
		if(a==true)
			return true;
		else
			return false;
		}
</script>
</head>

<%
Dealer user = (Dealer) session.getAttribute(TNBPDAConstants.AUTH_USER);
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
								<h4>Add Lorry</h4>
							</center>
							<form action="<%=request.getContextPath()%>/lorry?option=1"
								onsubmit="return submitForm()" method="post" id="llorry"
								name="llorry" onsubmit="return validateForm()">
								
								<div id="err" />
									<table cellpadding="5" cellspacing="5" bgcolor="#C2D6BC">
									<tr>
										<td>Dealer No</td>
										<td><input type="hidden" name="ccid"
											value="<%=user.getCcNo()%>"/><%=user.getCcNo()%></td>
									</tr>
									<tr>
										<td>Registration No</td>
										<td><input type="text" name="registrationNo" id="registrationNo" value=""
											size="15" style="font: 10px verdana, arial, helvetica" required /></td>
									</tr>


									<tr>
										<td>Date of Reg</td>
										<td><input type="text" name="dateOfRegistration" id="dateOfRegistration" class="tcal"
											value="" style="font: 10px verdana, arial, helvetica"
											readonly="readonly" required /></td>
									</tr>
									<tr>
										<td>Capacity</td>
										<td><select name="capacity" id="capacity"
											style="font: 10px verdana, arial, helvetica" >
											<option value="12">12KL</option>
											<option value="20">20KL</option>
											<option value="24">24KL</option>
											<option value="25">25KL</option></select></td>
									</tr>
									<tr>
										<td>Vendor ID</td>
										<td><input type="text" name="vendorId" id="vendorId" value=""
											size="15" style="font: 10px verdana, arial, helvetica" required/></td>
									</tr>
										<td></td>
									<tr>
										<td><input
											src="<%=request.getContextPath()%>/images/sub.jpg"
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