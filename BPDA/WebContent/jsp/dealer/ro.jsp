<%@page import="com.tnbpda.vo.Tank"%>
<%@page import="com.tnbpda.vo.MPD"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.tnbpda.vo.RO"%>
<%@page import="com.tnbpda.util.TNBPDAConstants"%>
<%@page import="com.tnbpda.vo.Dealer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TNBPDA</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style.css" media="screen" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/tcal.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"/>
<link rel="stylesheet" href="/resources/demos/style.css"/>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$( function() {
  $( "#fDate" ).datepicker({
    changeMonth: true,
    changeYear: true,
    yearRange: '-99:+10',
    showOn: "button",
    buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
    buttonImageOnly: true,
    dateFormat: 'dd-mm-yy'
  });
} );
</script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/tcal.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/rovalidation.js"></script>
<style type="text/css">
input {
	font: 12px verdana, arial, helvetica;
}

</style>


<script type="text/javascript">
            function Validate(){
                var e = document.getElementById("roType");
                var strUser = e.options[e.selectedIndex].value;
                if(strUser==0)
                {
                    alert("Please select a user");
                }
            }
            function somefunction(){
            	var mst = document.forms["fforms"]["mst"].value;
            	var mss = document.forms["fforms"]["mss"].value;
            	var msz = document.forms["fforms"]["msz"].value;
            	var mszs = document.forms["fforms"]["mszs"].value;
            	var hsdt = document.forms["fforms"]["hsdt"].value;
            	var hsds= document.forms["fforms"]["hsds"].value;
            	var hsdz = document.forms["fforms"]["hsdz"].value;
            	var hsdzs = document.forms["fforms"]["hsdzs"].value;
            	
            	if(mst==0||mss==0){
	            	alert("MS(Tank) cannot be 0");
	            	return false;
           			}
            	if(hsdt==0||hsds==0){
                	alert("HSD(Tank) cannot be 0");
                	return false;
               		}
            	if(msz==0||mszs==0){
                	alert("MS(Nozzles) cannot be 0");
                	return false;
               		}
            	if(hsdz==0||hsdzs==0){
                	alert("HSD(Nozzles) cannot be 0");
                	return false;
               		}
            	
            	
            	
            	
            }
            function enableGenerator(){
            	var generatorCheckBox = document.getElementById("generator");
            	
            	if(generatorCheckBox.checked == true){
            		document.getElementById("gcapacity").disabled = false;
            		document.getElementById("generatorMake").disabled = false;
            	}
            	else{
            		document.getElementById("gcapacity").disabled = true;
            		document.getElementById("generatorMake").disabled = true;
            	}
            }
            function enableSolar(){
            	if(document.getElementById("solar").checked == true){
            		document.getElementById("scapacity").disabled = false;
            		document.getElementById("solarMake").disabled = false;
            	}
            	else{
            		document.getElementById("scapacity").disabled = true;
            		document.getElementById("solarMake").disabled = true;
            	}
            }
            function enablePOS(){
            	if(document.getElementById("pos").checked == true){
            		document.getElementById("posQuantity").disabled = false;
            		document.getElementById("posBanks").disabled = false;
            	}
            	else{
            		document.getElementById("posQuantity").disabled = true;
            		document.getElementById("posBanks").disabled = true;
            	}
            }
            function enableEDFSY(){
            	if(document.getElementById("EDFSYes").value == "Yes"){
            		document.getElementById("EDFSSelectBank").disabled=false;
            	}
            	else{
            		document.getElementById("EDFSSelectBank").disabled = true;
            		document.getElementById("EDFSBank").disabled=true;
            	}
            }
            function enableEDFSN(){
            		document.getElementById("EDFSSelectBank").value="";
            		document.getElementById('hidden_div').style.display = "none";
            		document.getElementById("EDFSSelectBank").disabled = true;
            		document.getElementById("EDFSBank").disabled=true;
            }
            function enableEDFSBank(){
            	if(document.getElementById("EDFSSelectBank").value == "Other"){
            		document.getElementById("EDFSSelectBank").disabled = false;
            		document.getElementById('hidden_div').style.display = "block";
            	}
            	else{
            		document.getElementById('hidden_div').style.display = "none";
            	}
            }
        </script>
</head>
<%
	Dealer nallaya = (Dealer) session
			.getAttribute(TNBPDAConstants.AUTH_USER);
	RO ro = (RO) request.getAttribute(TNBPDAConstants.RO);

	HashMap<String, MPD> mpd = (HashMap<String, MPD>) ro.getMpdList();
	HashMap<String, Tank> tank = (HashMap<String, Tank>) ro
			.getTankList();
%>
<body>
	<div id="main_container">
		<jsp:include page="../menu/header.jsp" />

		<div id="main_content" style="height: 95%;">
		<!-- onsubmit="return submitForm()" -->
			<form action="<%=request.getContextPath()%>/dealer?option=5"
				 method="post" id="fforms"
				name="fforms" onsubmit="return somefunction()">
				<table cellpadding="5" cellspacing="5" width="100%" border="1"
					bgcolos="#F6FA71">
					<tr>
						<td><input type="hidden" name="ccNo"
							value="<%=nallaya.getCcNo()%>" />
							<table cellpadding="5" cellspacing="5" width="100%">
								<tr>
									<td colspan="2" bgcolor="#DDDECB"><fieldset>
											<legend>Basic Profile</legend>
											<table cellpadding="5" cellspacing="5" width="100%">
												<tr>
													<td>CCNo</td>
													<td colspan="1"><%=nallaya.getCcNo()%> - <%=nallaya.getRoName()%></td>
												</tr>

												<tr>
													<td>RO Type</td>
													<td>CC <input type="radio" name="rot" value="CC" required<%if(ro.getRot()!=null && ro.getRot().equalsIgnoreCase("CC")){%>checked="checked"<%}%>/>
														&nbsp;&nbsp;DC <input type="radio" name="rot" value="DC" required<%if(ro.getRot()!=null && ro.getRot().equalsIgnoreCase("DC")) {%>checked="checked"<%}%>/>
														&nbsp;&nbsp;
													</td>
												</tr>
												<tr>
													<td>RO Standard</td>
													<td><select name="roType" id="roType" required><option<%if(ro.getRoType()!=null){%>value="<%=ro.getRoType()%>"<%}else{%>value=""<%}%>></option>
															<option value="Pure For Sure" >Pure For Sure</option>
															<option value="Platinum">Platinum</option>
															<option value="Normal">Normal</option></select></td>
												</tr>
												<tr>
													<td>Date Of Commission</td>
													<td><input type="text" name="dob" id="fDate"
														value="<%if(ro.getCommisionDate()!=null){%><%=ro.getCommisionDate()%><%}else{%><%}%>" />[Format
														: dd-mm-yyyy]</td>
												</tr>

												<tr>
													<td>Status of Dealer ship</td>
													<td><select name="sds" required><option<%if(ro.getDealShipStatus()!=null){%> value="<%=ro.getDealShipStatus()%>"<%}else{%>value=""<%}%>></option>
															<option value="Propiritor">Propiritor</option>
															<option value="Partner ship">Partner ship</option>
															<option value="Others">Others</option>
													</select></td>
												</tr>
											</table>
										</fieldset></td>
								</tr>
								<tr>

									<td colspan="2"><fieldset>
											<legend>Other features</legend>
											<table cellpadding="2" cellspacing="2" border="1">
												<tr>
													<td><input type="checkbox" name="can" value="Y" />
														&nbsp;Canopy</td>
													<td colspan="1">Canopy Celling Lights:</td>
													<td><select name="Canopylights"><option
																value="Induction">Induction</option>
															<option value="LED">LED</option>
															<option value="MetalAloyed">Metal Aloyed</option></select></td>
												</tr>
												<tr>
													<td><input type="checkbox" name="pav" value="Y" />
														&nbsp;Pavor</td>
													<td>Yard/Street Light&nbsp;</td>
													<td><select name="Streetlights"><option
																value="SodiumVapour">SodiumVapour</option>
															<option value="Mercury">Mercury</option>
															<option value="LED">LED</option>
															<option value="Induction">Induction</option>
															<option value="TubeLight">TubeLight</option></select></td>
												</tr>

												<tr>
													<td colspan="3"><input type="checkbox" name="atm"
														value="Y" /> &nbsp;ATM</td>
												</tr>
												<tr>
													<td colspan="3"><input type="checkbox" name="inout"
														value="Y" /> &nbsp;In&nbsp;Out</td>
												</tr>
												<tr>
													<td colspan="3"><input type="checkbox"
														name="automated" value="Y" /> &nbsp;Automation</td>
												</tr>
												<tr>
													<td><input type="checkbox" name="generator" id="generator" value="Y" onchange="enableGenerator()"/>&nbsp;Generator
													</td>
													<td>Capacity (in KVA):<input type="text"
														name="gcapacity" id="gcapacity" value="" size="3" disabled required onkeypress='return event.charCode >= 48 && event.charCode <= 57'/>&nbsp;
													</td>
													<td>Make : <select name="generatorMake" id="generatorMake" disabled required>
															<option value="">--select--</option>
															<option value="Mahindra">Mahindra</option>
															<option value="Kirloskar">Kirloskar</option>
															<option value="Others">others</option></select></td>
												</tr>
												<tr>
													<td><input type="checkbox" name="solar" id="solar" value="Y" onchange="enableSolar()"/>
														&nbsp;Solar</td>
													<td>Capacity (in KW):<input type="text"
														name="scapacity" id="scapacity" value="" size="3" disabled required onkeypress='return event.charCode >= 48 && event.charCode <= 57'/>&nbsp;
													</td>
													<td>Make <input type="text" name="solarMake" id="solarMake" value="" disabled required/></td>
												</tr>
												<tr>
													<td colspan="1"><input type="checkbox" name="pos" id="pos"
														value="Y" onchange="enablePOS()"/> &nbsp;POS swiping machine</td>
													<td>Quantity:<input type="text" name="posQuantity" id="posQuantity"
														size="3" disabled required onkeypress='return event.charCode >= 48 && event.charCode <= 57'/> &nbsp;
													</td>
													<td>Bank(s):<input type="text" name="posBanks" id="posBanks"
														value="" disabled required/></td>
												</tr>
												<tr>
													<td><input type="checkbox" name="cms" value="Y" />
														&nbsp;CMS swiping machine&nbsp;</td>
													<td>Wireless:<input type="radio" name="cmsType"
														value="Wireless" /></td>
													<td>Wired:<input type="radio" name="cmsType"
														value="Wired" /></td>
												</tr>

											</table>
										</fieldset></td>
								</tr>

								<tr>
									<td></td>
									<td><input
										src="<%=request.getContextPath()%>/images/sub.jpg"
										id="searchsubmit" name="searchsubmit" type="image" value=""
										tabindex="2" /></td>
								</tr>


							</table></td>
						<td valign="top">
							<table cellpadding="5" cellspacing="5" width="100%" border="0">
								<tr>
									<!-- <td>Tank & Pump Details:</td> -->
									<td bgcolor="#C2D6BC"><fieldset>
											<legend>
												<b>Tank Details</b>
											</legend>
											<table cellpadding="5" cellspacing="5" width="100%"
												border="0">
												<tbody>
													<tr>
														<th><u>Product</u></th>
														<th><u>No.of<br /> Tank
														</u></th>
														<th><u>Capacity<br />(in KL)
														</u></th>
													</tr>
												</tbody>

												<tr>
													<td>MS</td>
													<td><input type="text" name="mst" size="3" id="mst" value="<%=tank.get("MS").getNoOfTanks()%>"/></td>
													<td><input type="text" name="mss" size="3" id="mss"
														value="<%=tank.get("MS").getCapacity()%>"
														style="font: 10px verdana, arial, helvetica" /></td>
												</tr>
												<tr>
													<td>Speed</td>
													<td><input type="text" name="speedt" size="3"
														id="speedt" value="<%=tank.get("Speed").getNoOfTanks()%>" /></td>
													<td><input type="text" name="speeds" size="3" value="<%=tank.get("Speed").getCapacity()%>"
														id="speeds" style="font: 10px verdana, arial, helvetica" /></td>
												</tr>
												<tr>
													<td>Speed 97</td>
													<td><input type="text" name="speed97t" size="3"
														id="speed97t"
														value="<%=tank.get("Speed97").getNoOfTanks()%>" /></td>
													<td><input type="text" name="speed97s" size="3"
														value="<%=tank.get("Speed97").getCapacity()%>" id="speed97s"
														style="font: 10px verdana, arial, helvetica" /></td>
												</tr>
												<tr>
													<td>HSD</td>
													<td><input type="text" name="hsdt" size="3" id="hsdt"
														value="<%=tank.get("HSD").getNoOfTanks()%>" /></td>
													<td><input type="text" name="hsds" size="3" id="hsds"
														value="<%=tank.get("HSD").getCapacity()%>" style="font: 10px verdana, arial, helvetica" /></td>
												</tr>
												<tr>
													<td>Hi Speed</td>
													<td><input type="text" name="hispeedt" size="3"
														id="hispeedt"
														value="<%=tank.get("HiSpeed").getNoOfTanks()%>" /></td>
													<td><input type="text" name="hispeeds" id="hispeeds"
														size="3" value="<%=tank.get("HiSpeed").getCapacity()%>"
														style="font: 10px verdana, arial, helvetica" /></td>
												</tr>
											</table>
										</fieldset></td>
									<td bgcolor="#A2D6BC"><fieldset>
											<legend>
												<b>Nozzles & Sales Details</b>
											</legend>
											<table cellpadding="5" cellspacing="5" border="0">
												<tbody>
													<tr>
														<th><u>Product</u></th>
														<th><u>No.of <br /> Nozzle
														</u></th>
														<th><u>Avg.Sales<br />Per day(In Ltrs)
														</u></th>
													</tr>
												</tbody>

												<tr align="center">
													<td>MS (Nozzles)</td>
													<td><input type="text" name="msz" id="msz" size="3"
														value="0" required/></td>
													<td><input type="text" name="mszs" size="5" id="mszs"
														value="0"  required/></td>
												</tr>
												<tr align="center">
													<td>Speed (Nozzles)</td>
													<td><input type="text" name="speedz" id="speedz"
														size="3" value="0" /></td>
													<td><input type="text" name="speedzs" size="5"
														id="speedzs" value="0" /></td>
												</tr>
												<tr align="center">
													<td>Speed 97 (Nozzles)</td>
													<td><input type="text" name="speed97z" size="3"
														id="speed97z" value="0" /></td>
													<td><input type="text" name="speed97zs" size="5"
														id="speed97zs" value="0" /></td>
												</tr>
												<tr align="center">
													<td>HSD (Nozzles)</td>
													<td><input type="text" name="hsdz" size="3" id="hsdz"
														value="0" /></td>
													<td><input type="text" name="hsdzs" size="5"
														id="hsdzs" value="0" /></td>
												</tr>
												<tr align="center">
													<td>Hi Speed(Nozzles)</td>
													<td><input type="text" name="hspeedz" size="3"
														id="hspeedz" value="0" /></td>
													<td><input type="text" name="hspeedzs" size="5"
														id="hspeedzs" value="0" /></td>
												</tr>
											</table>
										</fieldset></td>

								</tr>
								<tr>
									<td colspan="" bgcolor="#ACFF33"><fieldset>
											<legend>
												<b>Pump & Make Details</b>
											</legend>
											<table cellpadding="5" cellspacing="5" width="100%">
												<tbody>
													<tr>
														<th>Make</th>
														<th>No of Unit</th>
														<th>Year</th>
													</tr>
												</tbody>
												<tr>
													<td>Midco</td>
													<td><input type="text" name="midcoQty" id="midcoQty"
														size="3" value="0" /></td>
													<td><input type="text" name="midcoYr" id="midcoYr"
														size="3" value="0" /></td>
												</tr>
												<tr>
													<td>L&T</td>
													<td><input type="text" name="ltQty" id="ltQty"
														size="3" value="0" /></td>
													<td><input type="text" name="ltYr" id="ltYr"
														size="3" value="0" /></td>
												</tr>
												<tr>
													<td>Gilbergo</td>
													<td><input type="text" name="gilbergoQty"
														id="gilbergoQty" size="3" value="0" /></td>
													<td><input type="text" name="gilbergoYr" id="gilbergoYr"
														size="3" value="0" /></td>
												</tr>
												<tr>
													<td>Wayne</td>
													<td><input type="text" name="wayneQty" id="wayneQty"
														size="3" value="0" /></td>
													<td><input type="text" name="wayneYr" id="wayneYr"
														size="3" value="0" /></td>
												</tr>
												<tr>
													<td>Tokheim</td>
													<td><input type="text" name="tokheimQty"
														id="tokheimQty" size="3" value="0" /></td>
													<td><input type="text" name="tokheimYr" id="tokheimYr"
														size="3" value="0" /></td>
												</tr>
											</table>
										</fieldset></td>
									<td valign="top">
									<table><tr><td><fieldset>
											<legend>
												<b>Tank Lorry Quantity</b>
												<!-- Do you have <input type="checkbox" name="istank"/> -->
											</legend>

											<!-- No of Tank Lorry:<input type="text" name="noOfTankLorry" size="3"/> -->
											<br />12KL &nbsp;<input type="text" name="12kl" size="1" value="0"/>
											&nbsp; 20KL&nbsp;<input type="text" name="20kl" size="1" value="0" /> &nbsp;
											24KL<input type="text" name="24kl" size="1" value="0"/>
										</fieldset></td></tr><tr><td bgcolor="#ce9bff">
										<fieldset>
											<legend>
												<b>EDFS</b>
											</legend>
											<br />
											 Have you availed EDFS ? :&nbsp;&nbsp; Yes:<input type="radio" name="EDFS" id="EDFSYes"
														value="Yes" onchange="enableEDFSY()" required/>&nbsp;
													No:<input type="radio" name="EDFS" id="EDFSNo"
														value="No" onchange="enableEDFSN()" required/><br /><br />
											Select Bank:<select name="EDFSBank" id="EDFSSelectBank" disabled required onchange="enableEDFSBank()">
															<option value="">--select--</option>
															<option value="SBI" >SBI</option>
															<option value="ICICI">ICICI</option>
															<option value="HDFC">HDFC</option>
															<option value="Other">Other</option></select>&nbsp;&nbsp;
											<%-- <%if(request.getParameter("EDFSSelectBank").equals("Other")){ %> --%>
											<br/><br/>
											<div id="hidden_div" style="display: none;" >						
											Bank Name:<input type="text" name="EDFSBankOther" id="EDFSBank"
														size="6"/>(If any other) &nbsp;
											</div>
												
										</fieldset></td></tr><tr><td>
										<fieldset>
											<legend>
												<b>General Comments</b>
											</legend>
											<br />
											<textarea name="gc" rows="5" cols="50"></textarea>
										</fieldset></td>
								</tr>

							</table> <%-- <table border="0" width="100%">
							<tr>
								<td><img src="<%= request.getContextPath() %>/images/bp.jpg"/>
								</td>
							</tr>
						</table> --%>
						</td>
					</tr>
				</table>
				</td>
				</tr>
				</table>
			</form>
		</div>
		<!--end of left content-->




		<jsp:include page="../menu/footer.jsp" />
	</div>
	<!--end of main container-->
</body>
</html>
