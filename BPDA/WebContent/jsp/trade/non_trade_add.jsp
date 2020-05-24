<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.tnbpda.vo.Dealer"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.tnbpda.vo.User"%>
<%@page import="com.tnbpda.util.TNBPDAConstants"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TNBPDA</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style.css" media="screen" />
</head>
<%
	TreeMap<String, String> district = (TreeMap<String, String>) session
			.getAttribute(TNBPDAConstants.DISTRICT);
	Iterator<Map.Entry<String, String>> itd = district.entrySet()
			.iterator();
	Dealer nallaya = (Dealer) session
			.getAttribute(TNBPDAConstants.AUTH_USER);
%>
<body>
	<div id="main_container">

		<div id="main_content" style="height: 95%;">
			<jsp:include page="../menu/header.jsp" />


			<div id="main_content">
				<table border="1" width="100%">

					<tr>
						<jsp:include page="../menu/leftnav.jsp" />

						<td>
							<form action="<%=request.getContextPath()%>/trade?option=2"
								onsubmit="return submitForm()" method="post" id="fforms"
								name="fforms">
								<input type="hidden" name="mod" value="nttrade" />
								<table cellpadding="5" cellspacing="5">
									<tr>
										<td>CCNo</td>
										<td><%=nallaya.getCcNo()%><input type="hidden"
											name="ccNo" value="<%=nallaya.getCcNo()%>" /></td>
									</tr>

									<tr>
										<td>RO Name</td>
										<td><%=nallaya.getRoName()%></td>
									</tr>


									<tr>
										<td>District</td>
										<td><select name="dr" id="dr"
											style="font: 10px verdana, arial, helvetica">
												<option value="">--select--</option>
												<%
													while (itd.hasNext()) {
														Map.Entry<String, String> me = itd.next();
														String select = "";
														if (nallaya.getDistrict() != null
																&& nallaya.getDistrict().equals(me.getKey())) {
															select = "selected";
														}
												%>
												<option value="<%=me.getKey()%>" <%=select%>><%=me.getKey()%></option>
												<%
													}
												%>
										</select></td>
									</tr>

									<tr>
										<td>Type</td>
										<td>I Have <input type="radio" name="bType" value="Sell" />
											&nbsp;&nbsp;&nbsp; I Want<input type="radio"   name="bType" value="Wanted" /></td>
									</tr>

									<tr>
										<td>Business Category</td>
										<td><select name="bc"
											style="font: 10px verdana, arial, helvetica"><option
													value="College">College</option>
												<option value="School">School</option>
												<option value="Hotel">Hotel</option>
												<option value="Transport_Logistics">Transport&Logistics</option>
												<option value="Agriculture">Agriculture</option>
												<option value="Poultry">Poultry</option>

												<option value="Lawyer">Lawyer</option>
												<option value="Civil">Civil(contractor)</option>
												<option value="Hospital">Hospital</option>

												<option value="Resort">Resort</option>
												<option value="Automobile">Automobile</option>
												<option value="CarShowroom">Car showroom</option>

												<option value="other">Others</option>


										</select></td>
									</tr>
									<tr>
										<td>Business Name</td>
										<td><input type="text" name="bname" /></td>
									</tr>

									<tr>
										<td>Contact Person</td>
										<td><input type="text" name="cname"
											style="font: 10px verdana, arial, helvetica" /></td>
									</tr>
									<tr>
										<td>Contact Mobile</td>
										<td><input type="text" name="bmobile"
											style="font: 10px verdana, arial, helvetica" /></td>
									</tr>
									<tr>
										<td>Link</td>
										<td><input type="text" name="link"
											style="font: 10px verdana, arial, helvetica" /></td>
									</tr>
									<tr>
										<td>Address</td>
										<td><textarea name="caddr" rows="5" cols="50"></textarea></td>
									</tr>
									<tr>
										<td>Comments</td>
										<td><textarea name="comments" rows="5" cols="50"></textarea></td>
									</tr>

									<tr>
										<td></td>
										<td><input
											src="<%=request.getContextPath()%>/images/sub.jpg"
											id="searchsubmit" name="searchsubmit" type="image" value=""
											tabindex="2" /></td>
									</tr>
								</table>
							</form>
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