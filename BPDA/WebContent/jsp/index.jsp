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
<title>Integration and Messaging</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style.css" media="screen" />

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/tcal.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/tcal.js"></script>

</head>


<body>
	<div id="main_container">

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

												<tr valign="top">
													<td width="83%"><br> <br> <br> <img
																	align="bottom"
																	src="<%=request.getContextPath()%>/images/tnbpda.gif"
																	width="75" height="80"> &nbsp;&nbsp;<img
																		align="bottom"
																		src="<%=request.getContextPath()%>/images/connect1.png"
																		width="200" height="80"></td>
													<td width="16%" align="center"><br> <br> <br>
																	<div align="right">
																		<img align="bottom"
																			src="<%=request.getContextPath()%>/images/logo.png"
																			width="240" height="80"> <br>
																	</div></td>
													<td width="1%">&nbsp;</td>
												</tr>
											</tbody>
										</table>
									</td>

								</tr>

							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
		<div id="main_content">
			<table cellpadding="5" cellspacing="5" border="1" width="100%">
			 
				<tr><td colspan="3"> <b>Welcome to Tamil Nadu Bharat Petroleum Dealer Association..  </b></td><td>User Login:<a href="<%=request.getContextPath()%>/login">Login</a></td></tr>
				 <tr><td colspan="4"></td></tr>
					 
			 
			</table>
		</div>
		<!--end of left content-->




		<jsp:include page="menu/footer.jsp" />
	</div>
	<!--end of main container-->
</body>
</html>
