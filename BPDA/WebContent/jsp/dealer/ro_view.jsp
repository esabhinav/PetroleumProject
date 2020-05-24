<%@page import="com.tnbpda.vo.EDFS"%>
<%@page import="com.tnbpda.vo.Pump"%>
<%@page import="com.tnbpda.vo.Tank"%>
<%@page import="com.tnbpda.vo.MPD"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.tnbpda.vo.RO"%>
<%@page import="com.tnbpda.util.TNBPDAUtil"%>
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
</head>
<%
	Dealer nallaya = (Dealer) session
			.getAttribute(TNBPDAConstants.AUTH_USER);
	RO ro = (RO) request.getAttribute(TNBPDAConstants.RO);
 
	HashMap<String, MPD> mpd = (HashMap<String, MPD>) ro.getMpdList();
	HashMap<String, Tank> tank = (HashMap<String, Tank>) ro.getTankList();
	HashMap<String, Pump> pump= (HashMap<String, Pump>) ro.getPumpList();
	System.out.println(" RO updated in JSP: "+ro.isUpdated());
%>
<body>
	<div id="main_container">
		<jsp:include page="../menu/header.jsp" />

		<div id="main_content" style="height: 95%;"><br/>
		<center> <% if(!ro.isUpdated()) { %> If you want to EDit RO details. please   <a
																href="<%=request.getContextPath()%>/dealer?option=6&ccNo=<%=nallaya.getCcNo()%>">Edit
																RO Profile</a> <% } else { %><!--  You have submitted already RO details.  You have to Wait for further notification for providing Edit option. -->EDit RO details. please   <a
																href="<%=request.getContextPath()%>/dealer?option=6&ccNo=<%=nallaya.getCcNo()%>">Edit
																RO Profile</a>  </center>
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
													<td> <%=ro.getRot()%>
													</td>
												</tr>
												<tr>
													<td>RO Standard</td>
													<td><%=ro.getRoType()%></td>
												</tr>
												<tr>
													<td>Date Of Commission</td>
													<td><%=ro.getCommisionDate() %></td>
												</tr>

												<tr>
													<td>Status of Dealer ship</td>
													<td><%= ro.getDealShipStatus() %></td>
												</tr>
											</table>
										</fieldset></td>
								</tr>
								<tr>

									<td colspan="2"><fieldset>
											<legend>Other features</legend>
											<table cellpadding="2" cellspacing="2" border="1">
												<tr>
													<td>Canopy: &nbsp; <%if(ro.isCanopy()==true){%>Yes<%}else{%>No<%}%></td>
														
													<td colspan="1">Canopy Celling Lights:</td>
													<td><%if(ro.getCanopyLights()==null){%>None<%}else{%><%=ro.getCanopyLights()%><%}%></td>
												</tr>
												<tr>
													<td>Pavor: &nbsp;<%if(ro.isPayOver()==true){%>Yes<%}else{%>No<%}%>
														</td>
													<td>Yard/Street Light:&nbsp;</td>
													<td> <%if(ro.getStreetLights() ==null){%>None<%}else{%><%=ro.getStreetLights() %><%}%> </td>
												</tr>

												<tr>
													<td colspan="3">ATM: &nbsp;<%if(ro.isATM()==true){%>Yes<%}else{%>No<%}%> </td>
												</tr>
												<tr>
													<td colspan="3">In&nbsp;Out: <% if(ro.isInOut()==true){%>Yes<%}else{%>No<%}%> </td>
												</tr>
												<tr>
													<td colspan="3">Automation: &nbsp; <% if(ro.isAutomated()==true){%>Yes<%}else{%>No<%}%></td>
												</tr>
												<tr>
													<td>Generator:&nbsp;<% if(ro.getGenerator().isAvailable() ==true){%>Yes<%}else{%>No<%}%>
													</td>
													<td>Capacity (in KVA): <%if(ro.getGenerator().getCapacity()==0){%><%}else{%><%=ro.getGenerator().getCapacity()%><%}%>
													</td>
													<td>Make: <%if(ro.getGenerator().getMake()==null){%><%}else{%><%=ro.getGenerator().getMake()%><%}%></td>
												</tr>
												<tr>
													<td>Solar:&nbsp;<% if(ro.getSolar().isAvailable() ==true){%>Yes<%}else{%>No<%}%>
														</td>
													<td>Capacity (in KVA): <%if(ro.getSolar().getCapacity()==0){%><%}else{%><%=ro.getSolar().getCapacity()%><%}%>
													</td>
													<td>Make: <%if(ro.getSolar().getMake()==null){%><%}else{%><%=ro.getSolar().getMake()%><%}%></td>
												</tr>
												<tr>
													<td colspan="1">POS swiping machine:&nbsp;<% if(ro.getPos().isAvailable() ==true){%>Yes<%}else{%>No<%}%></td>
													<td>Quantity:&nbsp;<%if(ro.getPos().getQuantity() ==0){%><%}else{%><%=ro.getPos().getQuantity()%><%}%>
													</td>
													<td>Bank(s): <%if(ro.getPos().getBanks()==null){%><%}else{%><%=ro.getPos().getBanks()%><%}%></td>
												</tr>
												<tr>
													<td>CMS swiping machine:&nbsp;<% if(ro.getFleet().isAvaialble() ==true){%>Yes<%}else{%>No<%}%></td>
													<td>Type: <%if(ro.getFleet().getMacType()==null){%><%}else{%><%=ro.getFleet().getMacType()%><%}%></td>
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
													<td><%=tank.get(TNBPDAConstants.MS).getNoOfTanks() %></td>
													<td><%=tank.get(TNBPDAConstants.MS).getCapacity() %></td>
												</tr>
												<tr>
													<td>Speed</td>
													<td><%=tank.get(TNBPDAConstants.SPEED).getNoOfTanks() %></td>
													<td><%=tank.get(TNBPDAConstants.SPEED).getCapacity() %></td>
												</tr>
												<tr>
													<td>Speed 97</td>
													<td><%=tank.get(TNBPDAConstants.SPEED97).getNoOfTanks() %></td>
													<td><%=tank.get(TNBPDAConstants.SPEED97).getCapacity() %></td>
												</tr>
												<tr>
													<td>HSD</td>
												<td><%=tank.get(TNBPDAConstants.HSD).getNoOfTanks() %></td>
													<td><%=tank.get(TNBPDAConstants.HSD).getCapacity() %></td>
												</tr>
												<tr>
													<td>Hi Speed</td>
												<td><%=tank.get(TNBPDAConstants.HISPEED).getNoOfTanks() %></td>
													<td><%=tank.get(TNBPDAConstants.HISPEED).getCapacity() %></td>
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
													<td><%=mpd.get(TNBPDAConstants.MS).getNoOfNozzle()%></td>
													<td><%=mpd.get(TNBPDAConstants.MS).getAverageSales()%></td>
												</tr>
												<tr align="center">
													<td>Speed (Nozzles)</td>
													<td><%=mpd.get(TNBPDAConstants.SPEED).getNoOfNozzle()%></td>
													<td><%=mpd.get(TNBPDAConstants.SPEED).getAverageSales()%></td>
												</tr>
												<tr align="center">
													<td>Speed 97 (Nozzles)</td>
												<td><%=mpd.get(TNBPDAConstants.SPEED97).getNoOfNozzle()%></td>
													<td><%=mpd.get(TNBPDAConstants.SPEED97).getAverageSales()%></td>
												</tr>
												<tr align="center">
													<td>HSD (Nozzles)</td>
													<td><%=mpd.get(TNBPDAConstants.HSD).getNoOfNozzle()%></td>
													<td><%=mpd.get(TNBPDAConstants.HSD).getAverageSales()%></td>
												</tr>
												<tr align="center">
													<td>Hi Speed(Nozzles)</td>
													<td><%=mpd.get(TNBPDAConstants.HISPEED).getNoOfNozzle()%></td>
													<td><%=mpd.get(TNBPDAConstants.HISPEED).getAverageSales()%></td>
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
												<td><%=pump.get(TNBPDAConstants.MIDCO).getUnit()%></td>
												<td><%=pump.get(TNBPDAConstants.MIDCO).getYear()%></td>
												</tr>
												<tr>
													<td>L&T</td>
												<td><%=pump.get(TNBPDAConstants.LT).getUnit()%></td>
												<td><%=pump.get(TNBPDAConstants.LT).getYear()%></td>
												</tr>
												<tr>
													<td>Gilbergo</td>
												<td><%=pump.get(TNBPDAConstants.GILBERGO).getUnit()%></td>
												<td><%=pump.get(TNBPDAConstants.GILBERGO).getYear()%></td>
												</tr>
												<tr>
													<td>Wayne</td>
												<td><%=pump.get(TNBPDAConstants.WAYNE).getUnit()%></td>
												<td><%=pump.get(TNBPDAConstants.WAYNE).getYear()%></td>
												</tr>
												<tr>
													<td>Tokheim</td>
												<td><%=pump.get(TNBPDAConstants.TOKHEIM).getUnit()%></td>
												<td><%=pump.get(TNBPDAConstants.TOKHEIM).getYear()%></td>
												</tr>
											</table>
										</fieldset></td>
								<td>
									<table width="100%"><tr><td>
									<br /><fieldset>
											<legend>
												<b>Tank Lorry</b>
												<!-- Do you have <input type="checkbox" name="istank"/> -->
											</legend>

											<!-- No of Tank Lorry:<input type="text" name="noOfTankLorry" size="3"/> -->
											<br />How many 12KL  :<%=ro.getLorry12kl() %>
											&nbsp; 20KL :  &nbsp;<%=ro.getLorry20kl() %>
											24KL : &nbsp;<%=ro.getLorry24kl() %>
										</fieldset><br /></td></tr>
										<tr>
										<td bgcolor="#ce9bff">
										<fieldset>
											<legend>
												<b>EDFS</b>
											</legend>
											<br />
											 Have you availed EDFS : <%if(((EDFS)ro.getEdfs())!=null){%><%if(((EDFS)ro.getEdfs()).isAvailed()){%> Yes (Bank: 
											 <%=ro.getEdfs().getBank()%>)<%}} else {%>No<%}%>
										</fieldset><br /></td></tr><tr><td>
										<fieldset>
											<legend>
												<b>General Comments</b>
											</legend>
											<br />
											 <%=ro.getGeneralComments() %>
										</fieldset></td></tr>
										</table>
								</td>
							</tr>
							</table> <%-- <table border="0" width="100%">
							<tr>
								<td><img src="<%= request.getContextPath() %>/images/bp.jpg"/>
								</td>
							</tr>
						</table> --%>
					</tr>
				</table>
			<%} %>
		</div>
		<!--end of left content-->




		<jsp:include page="../menu/footer.jsp" />
	</div>
	<!--end of main container-->
</body>
</html>
