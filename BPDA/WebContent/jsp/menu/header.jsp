<%@page import="com.tnbpda.util.TNBPDAConstants"%>
<%@page import="com.tnbpda.vo.Dealer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<style>
.logout {
	align: right;
	color: white;
	text-decoration: none;
}

.logout: visited {
	align: right;
	color: white;
	text-decoration: none;
}
</style>
<body>
	<%
		Dealer user = (Dealer) session
				.getAttribute(TNBPDAConstants.AUTH_USER);
		boolean ud = false;

		String mod = (String) request.getAttribute("module");
		if (mod == null) {
			mod = "home";
		}
		if (!ud) {

		}
		if (request.getAttribute("UD") != null) {
			ud = (boolean) request.getAttribute("UD");
		}
		System.out.println(" UDDDDDDDD "+ud);
		if (user != null) {
	%>
	<table
		style="width: 100%; height: 100%; border: 0; padding: 0; background-color: white;"
		align="center" cellpadding="0" cellspacing="0">
		<tbody>
			<tr bgcolor="#FFFFFF"
				style="background-image: url(<%=request.getContextPath()%>/images/bp_bg.jpg); background-repeat: no-repeat;">
				<td valign="top">
					<table width="100%" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tbody>

							<tr>
								<td valign="top">
									<table width="100%" border="0" align="center" cellpadding="0"
										cellspacing="0">
										<tbody>
											<tr style="color: white">
												<%-- <td><img
													align="bottom"
													src="<%=getServletContext().getInitParameter("file-upload")%>/<%=user.getCcNo() %>.JPG"
													width="200" height="80"></td> --%>
												<td><b>Welcome, <%=user.getAccessLevel()%> [<%=user.getRoName()%>]
														<br />CC: <%=user.getCcNo()%> &nbsp;&nbsp;&nbsp; <%
 	if (!ud) {
 %> <a
														href="<%=request.getContextPath()%>/dealer?option=3&did=<%=user.getCcNo()%>">Edit
															Profile</a>&nbsp;&nbsp;<%-- <a
																href="<%=request.getContextPath()%>/jsp/dealer/update_picture.jsp">Change
																Profile Picture</a> --%></b> <%
 	}
 %></td>
												<td align="right">
													<%-- 
															<a
																href="<%=request.getContextPath()%>/dealer?option=6&ccNo=<%=user.getCcNo()%>">RO
																Profile</a> &nbsp; &nbsp; <a
																href="<%=request.getContextPath()%>/dealer?option=8&ccNo=<%=user.getCcNo()%>">View
																RO Profile</a>&nbsp; &nbsp;
																<body link="red"> </body> --%> <b><a class=logout
														href="<%=request.getContextPath()%>/login?option=3">[Logout]</a></b><br />
													<%
														if (session.getAttribute(TNBPDAConstants.SUBSCRIPTION) != null) {
																String warning = (String) session
																		.getAttribute(TNBPDAConstants.SUBSCRIPTION);
																int daysRemaining = (Integer) session
																		.getAttribute(TNBPDAConstants.DAYS_REMAINING);
													%> <b><font style="color: #800000">This Account
															will expire in <%=daysRemaining%> days !
													</font></b> <%
 	}
 %>
												</td>
											</tr>
											<tr valign="top">
												<td width="87%"><br> <img align="bottom"
													src="<%=request.getContextPath()%>/images/tnbpda.gif"
													width="75" height="80"> &nbsp;&nbsp;<img
													align="bottom"
													src="<%=request.getContextPath()%>/images/connect1.png"
													width="200" height="80"></td>
												<td width="16%" align="center"><div align="right">

														<img align="bottom"
															src="<%=request.getContextPath()%>/images/logo.png"
															width="275" height="100"> <br>

													</div></td>
												<td width="1%">&nbsp;</td>
											</tr>
										</tbody>
									</table>
								</td>

							</tr>
							<tr>
								<td align=center>

									<div id="menu" align="center">
										<%
											if (true) {
										%>
										<ul>
											<li><a
												href="<%=request.getContextPath()%>/home?mod=home"
												<%if (mod.equals("home")) {%>
												style="background-color: #FC0; align: center" <%}%> title=""><font
													color="white"><b>Home</b> </font> </a></li>

											<%-- 	<li><a <%if (mod.equals("commitee")) {%>
												style="background-color: #FC0;align:center" <%}%>
												href="<%=request.getContextPath()%>/commitee?mod=commitee"
												title=""><font color="white"><b>Communication </b>
												</font> </a></li> --%>

											<li><a
												href="<%=request.getContextPath()%>/dealer?option=8&ccNo=<%=user.getCcNo()%>"
												<%if (mod.equals("dealer")) {%>
												style="background-color: #FC0; align: center" <%}%> title="">
													<font color="white"><b>RO Profile</b></font>
											</a></li>
											<li><a
												href="<%=request.getContextPath()%>/trade?mod=trade"
												<%if (mod.equals("trade")) {%>
												style="background-color: #FC0; align: center" <%}%> title="">
													<font color="white"><b>About Trade </b></font>
											</a></li>
											<%
												if (user.getAccessLevel().equals("Admin")
																|| user.getAccessLevel().equals("SuperAdmin")) {
											%><li><a
												href="<%=request.getContextPath()%>/dealer?mod=dealer"
												<%if (mod.equals("dealer")) {%>
												style="background-color: #FCO; <%}%> title="> <font
													color="white"><b>Dealers </b> </font>
											</a> <%  }   %></li>
											<li><a
												href="<%=request.getContextPath()%>/report?mod=report"
												<%if (mod.equals("report")) {%>
												style="background-color: #FC0" <%}%> title=""><font
													color="white"><b>SO Report Demo</b> </font> </a></li>
											<li><a
												href="<%=request.getContextPath()%>/compilance?mod=compilance"
												<%if (mod.equals("compilance")) {%>
												style="background-color: #FC0; align: center" <%}%> title=""><font
													color="white"><b>Video</b> </font> </a></li>

											<li><a
												href="<%=request.getContextPath()%>/feedback?mod=feedback"
												<%if (mod.equals("feedback")) {%>
												style="background-color: #FC0; align: center" <%}%> title=""><font
													color="white"><b>Feedback</b> </font> </a></li>
											<%
												if (user.getAccessLevel().equals("Admin")
																|| user.getAccessLevel().equals("SuperAdmin")) {
											%><li><a
												href="<%=request.getContextPath()%>/SubscriptionController?mod=SubscriptionController&option=0"
												<%if (mod.equals("SubscriptionController")) {%>
												style="background-color: #FCO; <%}%> title="> <font
													color="white"><b>Subscription</b> </font>
											</a> <% } %></li>
										</ul>
										 

										<%
											}
										%>
									</div>
								</td>
							</tr>

						</tbody>
					</table>
				</td>
			</tr>
		</tbody>
	</table>
	<%
		}
	%>
</body>
</html>