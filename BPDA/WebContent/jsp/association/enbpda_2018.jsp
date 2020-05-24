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
				<tr bgcolor="yellow">
					<!-- <td colspan="3">
						<h4>
							<marquee>Welcome, TamilNadu Bharat Petroleum Dealers
							Assocation Members</marquee>
						</h4> <br /> <marquee direction="right">
						<h2>http://www.tnbpda.com</h2>
						</marquee>
					</td> -->
					<%-- <td colspan="4">We heartly welcome to our portal;  To view <a
						href="<%=request.getContextPath()%>/commitee?option=4"> Secretary's
							message </a>on Yercaurd AGM   <!--  <a href="<%=request.getContextPath()%>/login"> Login</a> --></td> --%>
				</tr>
				<tr><td colspan="4"> <b>EDBPDA Meeting</b></td></tr>
				<tr>
					<td width="50%"><img  width="100%" height="450"
						src="<%=request.getContextPath()%>/images/edbpda/IMG-20180228-WA0009.jpg"></td>
					<td width="50%"><img width="100%" height="450" 
						src="<%=request.getContextPath()%>/images/edbpda/IMG-20180228-WA0010.jpg"></td>
					<%-- <td width="300"><img   width="600" height="600"
						src="<%=request.getContextPath()%>/images/agms/DSC_0033.JPG"></td>
					<td width="300"><img   width="300" height="300"
						src="<%=request.getContextPath()%>/images/agms/bpcl_delegates.jpg"></td>
						 
				</tr>
						<tr>
					<td width="300"><img  width="300" height="300"
						src="<%=request.getContextPath()%>/images/agms/DSC_0035.JPG"></td>
					<td width="300"><img width="300" height="300" 
						src="<%=request.getContextPath()%>/images/agms/DSC_0058.JPG"></td>
					<td width="300"><img   width="300" height="300"
						src="<%=request.getContextPath()%>/images/agms/DSC_0060.JPG"></td>
					<td width="300"><img   width="300" height="300"
						src="<%=request.getContextPath()%>/images/agms/DSC_0063.JPG"></td>
						 
				</tr>
						<tr>
					<td width="300"><img  width="300" height="300"
						src="<%=request.getContextPath()%>/images/agms/DSC_0070.JPG"></td>
					<td width="300"><img width="300" height="300" 
						src="<%=request.getContextPath()%>/images/agms/DSC_0074.JPG"></td>
					<td width="300"><img   width="300" height="300"
						src="<%=request.getContextPath()%>/images/agms/DSC_0088.JPG"></td>
					<td width="300"><img   width="300" height="300"
						src="<%=request.getContextPath()%>/images/agms/DSC_0104.JPG"></td>
						 
				</tr>
						<tr>
					<td width="300"><img  width="300" height="300"
						src="<%=request.getContextPath()%>/images/agms/DSC_0106.JPG"></td>
					<td width="300"><img width="300" height="300" 
						src="<%=request.getContextPath()%>/images/agms/DSC_0110.JPG"></td>
					<td width="300"><img   width="300" height="300"
						src="<%=request.getContextPath()%>/images/agms/DSC_0148.JPG"></td>
					<td width="300"><img   width="300" height="300"
						src="<%=request.getContextPath()%>/images/agms/DSC_0149.JPG"></td> --%>
						 
				</tr>
				
				<%-- 	<tr><td colspan="3" align="left"> <b>EC Meeting</b></td></tr>
				<tr>
					<td width="300"><img  width="300" height="300"
						src="<%=request.getContextPath()%>/images/agm/ec1.jpg"></td>
					
					<td width="300"><img   width="300" height="300"
						src="<%=request.getContextPath()%>/images/agm/ec3.jpg"></td>
					<td width="300"><img   width="300" height="300"
						src="<%=request.getContextPath()%>/images/agm/salem.jpg"></td>
						<td width="300"><img   width="300" height="300"
						src="<%=request.getContextPath()%>/images/agm/castia.jpg"></td>	 
				</tr>
				<tr>
				<td  colspan="3" ><img width="950" height="256" 
						src="<%=request.getContextPath()%>/images/agm/ec2.jpg"></td>
						<td width="300"></td>
						</tr> --%>
			</table>
		</div>
		<!--end of left content-->