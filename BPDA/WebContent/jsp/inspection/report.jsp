<%@page import="com.tnbpda.vo.RO"%>
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

//Permissible Limit +/- 430

//Case 1 : If Tank Variation is less than  +600 (then "outlet may be closed - Danger")

//Case 2 : If Tank variation is +/- 400 (Variation is within permissible limit)

//Case 3 : If Tank variation is -573,       573-430= 143 (-143)

//Variation (sales) = 143/ (actual Nozzle sales 179530)*100,     143/179530 = 0.079%    (MS allowed 0.60%) so result "Variation within limits"
	function checkNu(va) {
		//alert("s"+va.value);
		if (isNaN(va.value)) {
			document.getElementById('cstock').innerHTML = "<font color='red'>Not a Number</font>";

			document.getElementById('zip').value = "";
		} else {
			document.getElementById('cstock').innerHTML = "";
		}

	}
	function verify() {
		try {
			
		 document.getElementById("mc").checked = false;
			var product = document.getElementById("product").value;
			
			var cs = Number(document.getElementById("closingStock").value);
			var total = Number(document.getElementById("receipt").value)
					+ Number(document.getElementById("openingStock").value)
					- cs;
			//alert(cs + ": "+Number(document.getElementById("receipt").value) + " : "+Number(document.getElementById("receipt").value));
			document.getElementById("salesTank").innerHTML =  total;
			var tankPermiStock = (cs * .04).toFixed(0);
			document.getElementById("perLimit").innerHTML = ": <b> " + tankPermiStock+"</b>";	
			var nozzle = document.getElementById("noOfNozzle").value;

			var testingProdReading = 0;
			var previousProdReading = 0;
			var currentProdReading = 0;
			for (var i = 1; i <= nozzle; i++) {
				//alert(currentProdReading);
				currentProdReading += Number(document
						.getElementById("currentProdReading" + i).value);
				previousProdReading += Number(document
						.getElementById("previousProdReading" + i).value);
				testingProdReading += Number(document
						.getElementById("testingProdReading" + i).value);
			}
	 
			document.getElementById("previous").innerHTML = previousProdReading;
			document.getElementById("current").innerHTML = currentProdReading;
			document.getElementById("testing").innerHTML = testingProdReading;

			var actualSales = currentProdReading
					- (previousProdReading + testingProdReading);
			var difference = actualSales - total;
			document.getElementById("ac").innerHTML = actualSales;
			
			
			// gong to write actual variation.
			var finalRes = difference-tankPermiStock ;
			if(difference>0) {
			if(finalRes>0){
				document.getElementById("var").innerHTML =  "+"+difference;
			}else
				document.getElementById("var").innerHTML = difference;
			} else {
				//var finalRes = Number(difference)+Number(tankPermiStock) ;
				document.getElementById("var").innerHTML = finalRes;
			}
			var finalRes = Number(difference)+Number(tankPermiStock) ;
			percentage = (finalRes * 100 / actualSales).toFixed(2);
			if(difference>tankPermiStock) {
				alert("case1 Danger");
				document.getElementById("vpercent").style.visibility= "visible";
				document.getElementById("varp").innerHTML= "<font color='red'><b>..**DANGER (RO May closed)**..</b></font>"
				document.getElementById("result").innerHTML = "Variation is with in Permissible	limits :<font color='red'>NO</font>"
			} else if(difference<tankPermiStock && difference>(-tankPermiStock)) {
				alert("case 2 No issue");
				document.getElementById("var").innerHTML = difference;
				document.getElementById("vpercent").style.visibility= "hidden";
				document.getElementById("result").innerHTML = "Variation is with in Permissible	limits :<font color='green'>YES</font>";
			}else {
				 //-573. res = -573+430= 143 (-143)
				 alert("case 3  - ve case");
				netLoss = finalRes;
				
				result=  (netLoss * 100 / actualSales).toFixed(2);
				percent= (netLoss * 100 / actualSales).toFixed(2)+"%";
				document.getElementById("var").innerHTML = difference;
				document.getElementById("vpercent").style.visibility= "visible";
				document.getElementById("varp").style.visibility= "visible";
				document.getElementById("varp").innerHTML = "Variation(+/-) (in %):"+ percent;
				alert("result : "+result);
				var prod = document.getElementById("product").value;
				if ((prod = 'MS' && (Number(result)) > -0.60) || (prod = 'HSD' && (Number(result)) > -0.25)) {
					document.getElementById("result").innerHTML = "Variation is with in Permissible	limits :<font color='green'>YES</font>";
				} else {
					document.getElementById("result").innerHTML = "Variation is with in Permissible	limits :<font color='red'>NO</font><b><br/><font color='red'>Could be tank loss, Pipeline Leakage, Excess Delivery</font></b>"
				}
			}
			 
			
			
		} catch (err) {
			alert(err.description);
		}
		
	
	}
	function enabledBlock(opt) {
		//alert(opt);

		try {
			document.getElementById("product").value = opt;
			document.getElementById("prodForm").submit();
		} catch (err) {
			alert(err.description);
		}
	}

	function printPage() {
		window.print();
	}
</script>
</script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style.css" media="screen" />
</head>
<%
	Dealer user = (Dealer) session
			.getAttribute(TNBPDAConstants.AUTH_USER);
	RO ro = (RO) session.getAttribute(TNBPDAConstants.RO);
	int noOfNozzle = (int) request
			.getAttribute(TNBPDAConstants.NOOF_NOZZLE);

	String product = (String) request
			.getAttribute(TNBPDAConstants.PRODUCT);

	System.out.println("noOfNozzle :" + noOfNozzle);
%>
<body>
	<div id="main_container">
		<jsp:include page="../menu/header.jsp" />

		<div id="main_content" style="height: 95%;">
			<table cellpadding="5" cellspacing="5" border="0" width="100%" bgcolor="#90C382"  >
				<tr>

					<td width="70%"><center>This module is to do self inspection by ourself
							as like Sales officer Report. The no of nozzles are automatically
							fetch from RO Profile</center> <br/>
					Note: Assume, your RO profile is update. if not, here is the link: 	<a
																href="<%=request.getContextPath()%>/dealer?option=6&ccNo=<%=user.getCcNo()%>">RO
																Profile</a> &nbsp; &nbsp;
          <br/>
						<br /> Please select
						product
						
						<table cellpadding="5" cellspacing="5">
							<tr>
								<td><form action="<%=request.getContextPath()%>/report"
										id="prodForm">
										<input type="hidden" name="option" value="2" /> <input
											type="hidden" name="product" id="product"
											value="<%=product%>" /> <input type="hidden"
											name="noOfNozzle" id="noOfNozzle" value="<%=noOfNozzle%>" />

										<table>
											<tr>
												<td><input type="radio" name="opt" value="ms"
													onclick="enabledBlock('MS')" /> MS</td>
												<td><input type="radio" name="opt" value="hsd"
													onclick="enabledBlock('Speed')" />Speed</td>
												<td><input type="radio" name="opt" value="hsd"
													onclick="enabledBlock('Speed97')" />Speed 97</td>
												<td><input type="radio" name="opt" value="hsd"
													onclick="enabledBlock('HSD')" />HSD</td>
												<td><input type="radio" name="opt" value="hsd"
													onclick="enabledBlock('HiSpeed')" />Hi Speed</td>

											</tr>
										</table>
									</form></td>
							</tr>
							<%if (product != null){
							if(noOfNozzle==0){%>
							<tr><td align="center"><b><u><%=product%> has no Nozzle</u></b></td></tr>
							<%}else{%>
							<tr>
								<td bgcolor="white"><fieldset>
										<legend>
											<b><%=product%> </b>
										</legend>
										<table cellpadding="5" cellspacing="5" border="0" bgcolor="#C2D6BC">
											<tr>
												<td><b><u>Tank</u></b></td>
												<td><table cellpadding="5" cellspacing="5" >

														<tr>
															<td>Opening stock(Closing at Last report of S.O.)</td>
															<td>:<input type="text" name="openingStock"
																onkeyup="checkNu(this)" id="openingStock" value=""
																style="font: 10px verdana, arial, helvetica" /><div id="cstock"></div></td>
														</tr>
														<tr>
															<td>Receipts after S.O. Report (ltrs)</td>
															<td>:<input type="text" name="receipt" id="receipt"
																onkeyup="checkNu(this)" value=""
																style="font: 10px verdana, arial, helvetica" /></td>
														</tr>
														<tr>
															<td>Closing stock (on report date - today)</td>
															<td>:<input type="text" name="closingStock"
																onkeyup="checkNu(this)" id="closingStock" value=""
																style="font: 10px verdana, arial, helvetica" /></td>
														</tr>
													</table></td>
											</tr>
											<tr>
												<td colspan="2"><hr /></td>
											</tr>

											<tr>
												<td><b><u>Totaliser</u></b></td>
												<td colspan="1"><table border="0" cellpadding="5">
														<thead>
															<tr>
																<th>Nozzle No</th>
																<th>Closing reading (Today)</th>
																<th>Previous inspection Reading</th>
																<th>Testing</th>
															</tr>
														</thead>
														<%
															for (int i = 1; i <= noOfNozzle; i++) {
														%><tr>
															<td>N<%=i%></td>
															<td><input type="text"
																name="currentProdReading<%=i%>"
																id="currentProdReading<%=i%>" value=""
																onkeyup="checkNu(this)"
																style="font: 10px verdana, arial, helvetica" /></td>
															<td align="center"><input type="text"
																name="previousProdReading<%=i%>"
																id="previousProdReading<%=i%>" value=""
																onkeyup="checkNu(this)"
																style="font: 10px verdana, arial, helvetica" /></td>
															<td align="center"><input type="text"
																name="testingProdReading<%=i%>"
																id="testingProdReading<%=i%>" value="" size="5"
																onkeyup="checkNu(this)"
																style="font: 10px verdana, arial, helvetica" /></td>
														</tr>
														<%
															}
														%>
														<tr>
															<td colspan="4"><hr /></td>
														</tr>

														<tr>
															<td>Total</td>
															<td><div id="current" /> <!-- <input type="text" name="current" id="current"
																value="" readonly="readonly"
																style="font: 10px verdana, arial, helvetica" /> --></td>
															<td><div id="previous" /> <!-- <input type="text" name="previous" id="previous"
																value="" readonly="readonly"
																style="font: 10px verdana, arial, helvetica" /> --></td>
															<td><div id="testing" /> <!-- <input type="text" name="testing" id="testing"
																value="" readonly="readonly" size="5"
																style="font: 10px verdana, arial, helvetica" /> --></td>
														</tr>


														<tr>
															<td	 colspan="4"><hr /></td>
														</tr>
													</table></td>

											</tr>
											<tr><td colspan="2"><hr/></td></tr>
											<tr>
												<td align="right">Verify :</td>
												<td><input type="checkbox" id="mc" name="mcv"
													onclick="verify()" /></td>
											</tr>
											
											<tr><td><b><u>Results</u></b></td><td></td></tr>
											<tr>
												<td align="right">Actual Nozzles Sales(in ltrs):</td>
												<td><div id="ac" /></td>
												<!-- <td>Difference :</td>
												<td><div id="diff" /></td> -->
											</tr>
											<tr>
												<td align="right">Sales as per Tank (in ltrs):</td>
												<td><div id="salesTank" /></td>
											</tr>
											<tr>
												<td align="right">Variation(+/-) (in ltrs):</td>
												<td><table cellpadding="5" cellspacing="5">
														<tr>
															<td><div id="var" /></td>
															<td align="right">(Permissible limit (+/-) 4% of Stock</td>
															<td><b><div id="perLimit"></div></b></td>
															<td>) <div id="varpp"></div></td>
														</tr>
													</table></td>
											</tr>
											<tr id="vpercent" style="visibility:hidden">
												<td align="right"></td>
												<td align="left"><div id="varp"></div></td>
											</tr>


											
											<tr>
												<td colspan="2" align="center" id="result">
													
												</td>
												
											</tr>
											<tr><td colspan="2" align="center" > <a onclick="printPage()"
													target="_blank"><img
													align="bottom"
													src="<%=request.getContextPath()%>/images/report.png"
													width="100" height="20"/></a> </td></tr>
										</table>
									</fieldset></td>
								<td align="left"><fieldset>
										<legend>Instructions</legend>

										<table>
											<tr>
												<td><table cellpadding="5" cellspacing="5">
														<tr>
															<td>.</td>
															<td><font color=" ">Permissible limit + / -
																	4% of Tank Stock, <br /> If variation is possitive &
																	beyond + 4% danger RO may be closed
															</font></td>
														</tr>
														<tr>
															<td>.</td>
															<td>Annual sales:</td>
														</tr>
														<tr>
															<td colspan="2"><table cellpadding="5"
																	cellspacing="0" border="1">
																	<thead>
																		<tr>
																			<th>Product</th>
																			<th>Upto 600KL</th>
																			<th>Above 600KL</th>
																		</tr>
																	</thead>
																	<tr>
																		<td>MS</td>
																		<td>0.75%</td>
																		<td>0.60%</td>
																	</tr>
																	<tr>
																		<td>HSD</td>
																		<td>0.25%</td>
																		<td>0.20%</td>
																	</tr>
																</table></td>
														</tr>

													</table></td>
											</tr>
										</table>
									</fieldset></td>
							</tr>

							<%
							}}
							%>
						</table>
					</td>

				</tr>
			</table>


		</div>
		<!--end of left content-->




		<%-- <jsp:include page="../menu/footer.jsp" /> --%>
	</div>
	<!--end of main container-->
</body>
</html>
