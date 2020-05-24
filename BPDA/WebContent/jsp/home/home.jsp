<%@page import="com.tnbpda.vo.Reminder"%>
<%@page import="com.tnbpda.util.TNBPDAUtil"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.tnbpda.vo.Item"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.tnbpda.vo.Dealer"%>
<%@page import="com.tnbpda.vo.Message"%>
<%@page import="com.tnbpda.util.TNBPDAConstants"%>
<%@page import="com.tnbpda.vo.User"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TNBPDA</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style.css" media="screen" />
<style>
.zoom:hover {
	-ms-transform: scale(1.6); /* IE 9 */
	-webkit-transform: scale(1.6); /* Safari 3-8 */
	transform: scale(1.6);
}
</style>

<style>
.hide {
	display: none;
	padding: 2px;
	margin: 0px;
	border: 5px gray;
	z-index: 1;
	position: 'relative';
	left: 0em;
	top: -1em;
	background-color: #fff;
}

.anchor {
	position: relative;
}

.notification {
	valign: top;
	color: red;
	text-decoration: none;
	/* text-shadow: 0 0 3px #FF0000; */
}

.notification: visited {
	valign: top;
	color: red;
	text-decoration: none;
	/* text-shadow: 0 0 3px #FF0000;
 */
}

.message_table {
	overflow: scroll;
	height: 200px;
}
</style>
<script type="">
function showbox(x){
document.getElementById(x).style.display = 'block';
}
function hidebox(x)
{
document.getElementById(x).style.display = 'none';
}
</script>
</head>
<body>
	<%
		Dealer user = (Dealer) session.getAttribute(TNBPDAConstants.AUTH_USER);
		List<Reminder> listReminder = (List<Reminder>) request.getAttribute(TNBPDAConstants.CALIB);
		Integer count = (Integer) session.getAttribute("count");

		//TNBPDAUtil.dateToString(me.getValue().getExpDate())
		if (user != null) {
	%>
	<div id="main_container">
		<div id="header" style="background-image: url(../images/bp11.jpg)">
			<jsp:include page="../menu/header.jsp" />
		</div>

		<div id="main_content" style="height: 100%;">
			<table border="0" width="100%">
				<tr>
					<td>
						<table width="100%">
							<tr>
								<td bgcolor="#FFF" align="left" valign="top" width="100%"
									colspan="2"><b><img
										src="<%=request.getContextPath()%>/images/pointer.png"
										width="25" height="20" align="left" />&nbsp;To know the
										latest announcements from the committee</b><img
									src="<%=request.getContextPath()%>/images/alert-icon-red-11.png"
									width="25" height="20" /><b><a class="notification"
										href="<%=request.getContextPath()%>/home?mod=home&option=2"
										target="_blank">(Click Here)</a></b></td>
							</tr>
							<%
								if (session.getAttribute(TNBPDAConstants.SUBSCRIPTION) != null) {
										String warning = (String) session.getAttribute(TNBPDAConstants.SUBSCRIPTION);
							%>
							<tr>
								<td><b>Your Account will expire soon.<a
										class="notification"
										href="<%=request.getContextPath()%>/SubscriptionController?option=5"
										target="_blank"> Please click to view details. </a>
								</b></td>
							</tr>
							<%
								}
							%>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%" border="2">
							<tr valign="top">
								<td width="50%">
									<table cellpadding="5" cellspacing="5" width="100%">
										<tr bgcolor="#888CCC">
											<td align="center" colspan="2"><img
												src="<%=request.getContextPath()%>/images/bell-512.png"
												width="24" height="20" align="left" />TNBPDA MOM</td>
										</tr>
										<tr>
											<td align="left">
												<table border="2" width="100%">
													<tr>
														<th>Events</th>
														<th>Date</th>
														<th>Photos</th>
														<th>Minutes of meeting</th>
													</tr>
													<tr>
														<td>TNBPDA AGM-2018 at Yercaud</td>
														<td>05 January 2018</td>
														<td><a
															href="<%=request.getContextPath()%>/jsp/association/agm_2018.jsp"
															target="_blank">Photos</a></td>
														<td><a
															href="<%=request.getContextPath()%>/tnbpda/docs/TNBPDASECRETARY.pdf"
															target="_blank">PDF</a></td>
													</tr>
													<tr>
														<td>EBPDA AGM-2018 at Erode</td>
														<td>25 February 2018</td>

														<td><a
															href="<%=request.getContextPath()%>/jsp/association/enbpda_2018.jsp"
															target="_blank">Photos</a></td>
														<td>PDF</td>
													</tr>
												</table>
											</td>
										</tr>

									</table>
								</td>
								<td width="50%">
									<table cellpadding="5" cellspacing="5" width="100%">
										<tr bgcolor="#AAAAAA">
											<td align="center" colspan="2"><img
												src="<%=request.getContextPath()%>/images/note(1).png"
												width="25" height="20" align="left" /><b>To Do List</b></td>
										</tr>
										<tr>
											<td><a target="_blank"
												href="<%=request.getContextPath()%>/jsp/dealer/upload.jsp">Upload
													Reminder details</a></td>
											<td><a target="_blank"
												href="<%=request.getContextPath()%>/tnbpda/docs/Sample.xls">Sample
													Download</a></td>
											<td><a target="_blank"
												href="<%=request.getContextPath()%>/home?option=3">Download
													Reminder Details</a></td>
										</tr>
										<tr>
											<td colspan="2"><table cellpadding="3" cellspacing="3"
													border="2">
													<%
														if (listReminder == null) {
													%>

													<%
														} else {
													%>
													<tr>
														<th>ITEM</th>
														<th>Exp Date</th>
														<!-- <th>Period (months)</th> -->
													</tr>
													<%
														Iterator<Reminder> it = listReminder.iterator();
																while (it.hasNext()) {
																	Reminder re = it.next();
													%>
													<tr>
														<td><%=re.getRenewalType()%></td>
														<td><%=re.getExpDate()%></td>
														<%-- <td><%=re.getPeriod()%></td> --%>
													</tr>
													<%
														}
															}
													%>
												</table> <%
 	}
 %></td>
										</tr>

									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table width="100%" border="2">
							<tr valign="top">
								<td width="50%">
									<table cellpadding="5" cellspacing="5" width="100%">
										<tr bgcolor="lightblue">
											<td align="center" colspan="2"><img
												src="<%=request.getContextPath()%>/images/graph.png"
												width="25" height="20" align="left" /><b>Price Trend</b></td>
										</tr>
										<tr>
											<td>
												<!-- Widget -->
												<div class="box-widget column50 clear">
													<div class="column50_1 align-centre">
														<!-- Left -->

														&nbsp;&nbsp;&nbsp;&nbsp;
														<div id="brent_preview" class="zoom" align="center">
															<script type="text/javascript"
																src="https://oilprice.com/widgets/brent/brentchart.js"></script>
															<noscript>
																<!--Please Enable Javascript for this <a href="https://oilprice.com">Oil Price</a> widget to work-->
															</noscript>
														</div>

														<!-- /Left -->

													</div>
												</div>
											</td>
											<td>
												<!-- CURRENCY-CONVERTER.ORG.UK CURRENCY CHARTS START -->
												<div class="zoom"
													style="width: 180px; margin: 0; padding: 0; border: 1px solid #2D6AB4; background: #e6f2fa;">
													<div
														style="width: 180px; text-align: center; margin: 2px; padding: 2px 0px; background: #2D6AB4; font-family:; font-size: 11px; color: #ffffff; font-weight: bold; vertical-align: middle;">
														USD/INR CHARTS <a rel="nofollow"
															style="color: #ffffff; text-decoration: none; font-size: 9px;"
															href="https://www.currency-converter.org.uk/currency-rates/convert/GBP-EUR-rate.html"
															target="_new" title="GBP EUR charts"><i>» More</i></a>
													</div>
													<div style="padding: 2px;">
														<script type="text/javascript">
															var dcf = 'USD';
															var dct = 'INR';
															var mcol = '2D6AB4';
															var mbg = 'e6f2fa';
															var tc = 'ffffff';
															var tz = 'userset';
														</script>
														<script type="text/javascript"
															src="https://www.currency-converter.org.uk/widget/CCUK-CHART-1.php"></script>
													</div>
												</div> <!-- CURRENCY-CONVERTER.ORG.UK CURRENCY CHARTS END -->
											</td>
										</tr>
									</table>
								</td>
								<td width="50%"><table cellpadding="5" cellspacing="5"
										width="100%">
										<tr bgcolor="lightgreen">
											<td align="center" width="100%"><img
												src="<%=request.getContextPath()%>/images/link.png"
												width="25" height="20" align="left" />Company Useful links</td>
										</tr>
										<tr>
											<td><table>
													<tr>
														<td>Access BPCL Email :</td>
														<td><a href="https://mail.bpclretail.in/owa/"
															target="_blank">Email</a></td>
													</tr>
													<tr>
														<td>Mobi Connect Guide</td>
														<td><a target="_blank"
															href="<%=request.getContextPath()%>/tnbpda/docs/MobeConnect_android.pdf">mobi
																connect link</a></td>
													</tr>
													<tr>
														<td>BPCL SOA</td>
														<td><a href="https://efp.bpcl.in/irj/portal"
															target="_blank">SOA</a></td>
													</tr>
													<tr>
														<td>Company website</td>
														<td><a href="https://www.bharatpetroleum.com"
															target="_blank">BPCL website</a></td>
													</tr>
												</table></td>
										</tr>

									</table></td>

							</tr>

							<!-- <tr valign="top">

					<td width="50%"><table cellpadding="5" cellspacing="5"
							width="100%" border="0">
							<tr bgcolor="white">
								<td align="center">BirthDay Wishes</td>
							</tr>
							<tr><td></td></tr>
						</table></td>
				</tr> -->
						</table>
					</td>
				</tr>
				<%-- <tr>
					<td width="100%">
					<div class="message_table">
						<table cellpadding="5" cellspacing="5" width="100%"  border="0"> 
							<tr bgcolor="#888CCC" >
							<td align="center"><img src="<%=request.getContextPath() %>/images/excalim.gif"  width="24" height="20" align="left"/>Message</td>
							</tr>
							<tr>
							<jsp:include page="../association/dispmess.jsp" ><jsp:param name="cc" value="113908"/></jsp:include>
							</tr>
						</table>	
					</div>
					</td>
				</tr> --%>
				<tr>
					<td colspan="3">
						<table width="100%">
							<tr>
								<td align="left"><b>Total Registrations : <%=count%></b></td>
								<td align="right"><b>Quote : </b> <i>"Without your
										involvement you cannot succeed, with your involvement you
										can't fail" </i></td>
							</tr>
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
