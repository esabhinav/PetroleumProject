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
	function submitForm() {
		 
		try {

		} catch (err) {
			alert(err.description);
			return false;
		}
	}
</script>
</head>

<%
	Dealer user = (Dealer) session
			.getAttribute(TNBPDAConstants.AUTH_USER);
	TreeMap<String, String> district = (TreeMap<String, String>) session
			.getAttribute(TNBPDAConstants.DISTRICT);
	Iterator<Map.Entry<String, String>> itd = district.entrySet()
			.iterator();
%>

<body>
	<div id="main_container">

		<div id="main_content" style="height: 95%;">
			<jsp:include page="../menu/header.jsp" />


			<div id="main_content">
				<table border="1" bgcolor="#CFFBC1" width="100%">

					<tr>
						<jsp:include page="../menu/leftnav.jsp" />

						<td width="70%">

							<center>
								<h4>Add/Update Customer</h4>
							</center>
							<form action="<%=request.getContextPath()%>/customer?option=1"
								onsubmit="return submitForm()" method="post" id="fforms"
								name="fforms">
								<div id="err" />
								<table cellpadding="5" cellspacing="5" bgcolor="#C2D6BC">
									<tr>
										<td>Dealer No</td>
										<td><input type="hidden" name="cc"
											value="<%=user.getCcNo()%>" /> <%=user.getCcNo()%></td>
									</tr>
									<tr>
										<td>Transport/CustomerName</td>
										<td><input type="text" name="cname" id="cname" value=""
											size="11" style="font: 10px verdana, arial, helvetica" /></td>
									</tr>


									<tr>
										<td>MobileNo</td>
										<td><input type="text" name="cmobile" id="cmobile"
											value="" size="11"
											style="font: 10px verdana, arial, helvetica" /></td>
									</tr>
									<tr>
										<td>Adhar No</td>
										<td><input type="text" name="adharNo" id="adharNo"
											value="" size="11"
											style="font: 10px verdana, arial, helvetica" /></td>
									</tr>
									<tr>
										<td>Date</td>
										<td><input type="text" name="date" id="date" class="tcal"
											value="" style="font: 10px verdana, arial, helvetica"
											readonly="readonly" /></td>
									</tr>
									<tr>
										<td>TIN</td>
										<td><input type="text" name="tin" id="tin" value=""
											size="11" style="font: 10px verdana, arial, helvetica" /></td>
									</tr>
									<tr>
										<td>Address1</td>
										<td><input type="text" name="addr1" /></td>
									</tr>
									<tr>
										<td>District</td>
										<td><select name="dr" id="dr"
											style="font: 10px verdana, arial, helvetica">
												<%
													while (itd.hasNext()) {
														Map.Entry<String, String> me = itd.next();
												%>
												<option value="<%=me.getValue()%>"><%=me.getKey()%></option>
												<%
													}
												%>
										</select></td>
									</tr>
									<tr>
										<td>Bill Amount</td>
										<td><input type="text" name="bill" id="bill" value=""
											size="11" style="font: 10px verdana, arial, helvetica" /></td>
									</tr>
									<!-- <tr>
										<td>Bill Copy (upload)</td>
										<td><input type="file" name="fi" /></td>
									</tr> -->
	<tr>
										<td>Comments/details</td>
										<td><textarea name="dcomments" rows="5" cols="40"></textarea></td>
									</tr>


									<tr>
										<td></td>
										<td> <input
											src="<%=request.getContextPath()%>/images/sub.jpg"
											onclick="submitForm()" id="searchsubmit" name="searchsubmit"
											type="image" value="" tabindex="2" /></td>
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