<%@page import="com.tnbpda.vo.Dealer"%>
<%@page import="com.tnbpda.vo.User"%>
<%@page import="java.util.TreeMap"%>
<%@page import="com.tnbpda.util.TNBPDAConstants"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TNBPDA</title>
<script type="text/javascript">
	function verifyMS() {

		try {
			var total = document.getElementById("currentMSStock").value
					- document.getElementById("previousMSStock").value;
			//	alert(total);
			var totalReading = document.getElementById("currentMSReading").value - (Number(document.getElementById("previousMSReading").value)+Number(document.getElementById("previousMSTestReading").value));
 			//	alert(totalReading);
			var re = (totalReading)/total;
			alert("total " + total);
			alert("totalReading :" + totalReading);
			document.getElementById("ms").innerHTML = re;
			//alert("Total tank sales "+total + "; "+"Total meter Reading "+totalReading);var reas= totalReading*100/total;
			//	alert(reas);
		} catch (err) {
			alert(err.description);
		}
	}
	function verifyHSD() {
		alert("HSD");
		{
		}
		try {
			var total = document.getElementById("currentHSDStock").value
					- document.getElementById("previousHSDStock").value;
			//		alert(total);
			var totalReading = document.getElementById("currentHSDReading").value
					- document.getElementById("previousHSDReading").value;
			
			//		alert(totalReading);
				var testReading = document.getElementById("previousHSDTestReading").value;
			var re = total / (totalReading-testReading);
			document.getElementById("hsd").innerHTML = re;
		} catch (err) {
			alert(err.description);
		}
	}

	function verifyHSD() {
		alert("HSD");
		{
		}
		try {
			var total = document.getElementById("currentSpeedStock").value
					- document.getElementById("previousSpeedStock").value;
			//		alert(total);
			var totalReading = document.getElementById("currentSpeedReading").value
					- document.getElementById("previousSpeedReading").value;
			//		alert(totalReading);
				var testReading = document.getElementById("previousSpeedTestReading").value;
			var re = total / (totalReading-testReading);
			document.getElementById("speed").innerHTML = re;
		} catch (err) {
			alert(err.description);
		}
	}
	
	function enabledBlock(opt) {
		// alert(opt);
		try{
		if(opt=='ms') {
			document.getElementById("currentMSStock").disabled = false;
		 	document.getElementById("previousMSStock").disabled = false;
		 	document.getElementById("currentMSReading").disabled = false;
		    document.getElementById("previousMSReading").disabled = false;
			document.getElementById("previousMSTestReading").disabled=false;
			document.getElementById("mc").disabled=false;
			
			document.getElementById("currentHsdStock").disabled = true;
		 	document.getElementById("previousHsdStock").disabled = true;
		 	document.getElementById("currenHsdtReading").disabled = true;
		    document.getElementById("previousHsdReading").disabled = true;
			document.getElementById("previousHSDTestReading").disabled=true;
			document.getElementById("hc").disabled=true;
			
			document.getElementById("currentSpeedStock").disabled = true;
			document.getElementById("previousSpeedStock").disabled = true;
			document.getElementById("currentSpeedReading").disabled = true;
		    document.getElementById("previousSpeedReading").disabled = true;
			document.getElementById("previousSpeedTestReading").disabled=true;
			document.getElementById("sc").disabled=true;
			
		//	document.getElementById("currentHsdStock").disabled;
		} else if(opt=='hsd') {
			document.getElementById("currentMSStock").disabled = true;
		 	document.getElementById("previousMSStock").disabled = true;
		 	document.getElementById("currentMSReading").disabled = true;
		    document.getElementById("previousMSReading").disabled = true;
			document.getElementById("previousMSTestReading").disabled=true;
			document.getElementById("mc").disabled=false;
			
			document.getElementById("currentHsdStock").disabled = false;
		 	document.getElementById("previousHsdStock").disabled = false;
		 	document.getElementById("currenHsdtReading").disabled = false;
		    document.getElementById("previousHsdReading").disabled = false;
			document.getElementById("previousHSDTestReading").disabled=false;
			document.getElementById("hc").disabled=true;
			
			document.getElementById("currentSpeedStock").disabled = true;
			document.getElementById("previousSpeedStock").disabled = true;
			document.getElementById("currentSpeedReading").disabled = true;
		    document.getElementById("previousSpeedReading").disabled = true;
			document.getElementById("previousSpeedTestReading").disabled=true;
			document.getElementById("sc").disabled=true;
			
		//	document.getElementById("currentHsdStock").disabled;
		}
		}catch(err) {
			alert(err.description);
		}
	}
</script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style.css" media="screen" />
</head>
<%
	Dealer user = (Dealer) session
			.getAttribute(TNBPDAConstants.AUTH_USER);
	System.out.println("USR :" + user);
%>
<body>
	<div id="main_container">
		<jsp:include page="../menu/header.jsp" />

		<div id="main_content" style="height: 95%;">
			<table cellpadding="5" cellspacing="5" border="1">
				<tr>

					<td width="70%">
						<center>
							<a href="<%=request.getContextPath()%>/jsp/dealer/ro.jsp">RO
								Profile</a>
						</center>
						<center>Sales officer Report.</center>
						<br /> <b>Instructions:</b>
						<ul>
							<li>Calculate all tank stocks together</li>
							<li> <font color="red">Allowed Loss under MDG</font></li>
							
							<li> MS upto annual Sales of 600KL , 0.75% & 0.60% above 600kl</li>
							<li> HSD 0.25% upto 600kl & 0.20 beyond 600kl</li>
						</ul> 
							<table cellpadding="5" cellspacing="5">
								<tr>
									<td><input type="radio" name="opt" value="ms" onclick="enabledBlock('ms')"/> MS&nbsp;<input
										type="radio" name="opt" value="hsd" onclick="enabledBlock('hsd')"/>HSD&nbsp;<input
										type="radio" name="opt" value="speed" onclick="enabledBlock('speed')"/>Speed MS&nbsp;</input></td>
								</tr>
								<tr>
									<td><fieldset>
											<legend>MS </legend>
											<table cellpadding="5" cellspacing="5">
											<tr><td><b><u>Tank</u></b></td><td></td></tr>
												<tr>
													<td>Current tank Stock(in ltrs)</td>
													<td><input type="text" name="currentMSStock"
														id="currentMSStock" value="300"
														style="font: 10px verdana, arial, helvetica" /></td>
												</tr>
												<tr>
													<td>Previous tank Stock(in ltrs)</td>
													<td><input type="text" name="previousMSStock"
														id="previousMSStock" value="300"
														style="font: 10px verdana, arial, helvetica" /></td>
												</tr>
												<tr>
													<td colspan="2"><hr /></td>
												</tr>
													<tr><td><b><u>Meter</u></b></td><td></td></tr>
												<tr>
													<td>Current Totaliser(meter) Reading (All MS )</td>
													<td><input type="text" name="currentMSReading"
														id="currentMSReading" value="300"
														style="font: 10px verdana, arial, helvetica" /></td>
												</tr>
												<tr>
													<td>Previous meter Stock(All MS)</td>
													<td><input type="text" name="previousMSReading"
														id="previousMSReading" value="300"
														style="font: 10px verdana, arial, helvetica" /></td>
												</tr>
													<tr>
													<td>Test(All MS)</td>
													<td><input type="text" name="previousMSTestReading"
														id="previousMSTestReading" value="25"
														style="font: 10px verdana, arial, helvetica" /></td>
												</tr>
												<tr>
													<td align="right">Check :</td>
													<td><input type="checkbox" id="mc" name=""
														onclick="verifyMS()" /></td>
												</tr>
												<tr>
													<td align="right">Variation(+/-) :</td>
													<td><div id="ms"></div></td>
												</tr>

											</table>
										</fieldset></td>
									<td><fieldset>
											<legend>HSD </legend>
											<table cellpadding="5" cellspacing="5">
												<tr><td><b><u>Tank</u></b></td><td></td></tr>
												<tr>
													<td>Current tank Stock(HSD)</td>
													<td><input type="text" name="currentHsdStock" id="currentHsdStock"
														value="200" style="font: 10px verdana, arial, helvetica" /></td>
												</tr>
												<tr>
													<td>Previous tank Stock(HSD)</td>
													<td><input type="text" name="previousHsdStock" id="previousHsdStock"
														value="200" style="font: 10px verdana, arial, helvetica" /></td>
												</tr>
												<tr>
													<td colspan="2"><hr /></td>
												</tr>
													<tr><td><b><u>Meter</u></b></td><td></td></tr>
												<tr>
													<td>Current Reading (All HSD )</td>
													<td><input type="text" name="currenHsdtReading" id="currenHsdtReading"
														value="200" style="font: 10px verdana, arial, helvetica" /></td>
												</tr>
												<tr>
													<td>Previous Stock(All HSD)</td>
													<td><input type="text" name="previousHsdReading" id="previousHsdReading"
														value="200" style="font: 10px verdana, arial, helvetica" /></td>
												</tr>
													<tr>
													<td>Test(All HSD)</td>
													<td><input type="text" name="previousHSDTestReading"
														id="previousHSDTestReading" value="25"
														style="font: 10px verdana, arial, helvetica" /></td>
												</tr>
												<tr>
													<td align="right">Check :</td>
													<td><input type="checkbox" id="hc" name=""
														onclick="verifyHSD()" /></td>
												</tr>
												<tr>
													<td align="right">Variation(+/-):</td>
													<td><div id="hsd"></div></td>
												</tr>

											</table>
										</fieldset></td>
									<td><fieldset>
											<legend>Speed MS </legend>
											<table cellpadding="5" cellspacing="5">
												<tr><td><b><u>Tank</u></b></td><td></td></tr>
												<tr>
													<td>Current tank Stock(Speed MS)</td>
													<td><input type="text" name="currentSpeedStock" id="currentSpeedStock"
														value="100" style="font: 10px verdana, arial, helvetica" /></td>
												</tr>
												<tr>
													<td>Previous tank Stock(Speed MS)</td>
													<td><input type="text" name="previousSpeedStock" id="previousSpeedStock"
														value="100" style="font: 10px verdana, arial, helvetica" /></td>
												</tr>
												<tr>
													<td colspan="2"><hr /></td>
												</tr>
													<tr><td><b><u>Meter</u></b></td><td></td></tr>
												<tr>
													<td>Current Reading (All )</td>
													<td><input type="text" name="currentSpeedReading" id="currentSpeedReading"
														value="100" style="font: 10px verdana, arial, helvetica" /></td>
												</tr>
												<tr>
													<td>Previous Stock(All )</td>
													<td><input type="text" name="previousSpeedReading" id="previousSpeedReading"
														value="100" style="font: 10px verdana, arial, helvetica" /></td>
												</tr>
													<tr>
													<td>Test(All Speed)</td>
													<td><input type="text" name="previousSpeedTestReading"
														id="previousSpeedTestReading" value="25"
														style="font: 10px verdana, arial, helvetica" /></td>
												</tr>
												<tr>
													<td align="right">Check :</td>
													<td><input type="checkbox" name="" id="sc"
														onclick="verifySpeed()" /></td>
												</tr>
												<tr>
													<td align="right">Variation(+/-) :</td>
													<td><div id="speed"></div></td>
												</tr>

											</table>
										</fieldset></td>
								</tr>

							<%-- 	<tr>
									<td></td>
									<td><input
										src="<%=request.getContextPath()%>/images/sub.jpg"
										id="searchsubmit" name="searchsubmit" type="image" value=""
										tabindex="2" /></td>
								</tr> --%>


							</table>
					</td>

				</tr>
			</table>
		</div>
		<!--end of left content-->




		<jsp:include page="../menu/footer.jsp" />
	</div>
	<!--end of main container-->
</body>
</html>
