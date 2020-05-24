<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.util.List"%>
<%@page import="com.tnbpda.vo.Dealer"%>
<%@page import="com.tnbpda.vo.Customer"%>
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
<script type="text/javascript">
	function submitForm() {
	 
		try {

		} catch (err) {
			alert(err.description);
			return false;
		}
	}
</script>
<style type="text/css">
input{
 font: 10px verdana, arial, helvetica;
}
</style>
</head>

<%
List<String> userList = (List<String>)session
.getAttribute(TNBPDAConstants.USER_ACCESS);

	Dealer user = (Dealer) session
			.getAttribute(TNBPDAConstants.AUTH_USER);
	Customer siva = (Customer) request.getAttribute("CUST");
	TreeMap<String, String> district = (TreeMap<String, String>) session
			.getAttribute(TNBPDAConstants.DISTRICT);
	Iterator<Map.Entry<String, String>> itd = district.entrySet()
			.iterator();
	 String strL = (String)request.getAttribute("L");
%>

<body>
	<div id="main_container">

		<div id="main_content" style="height: 95%;">
			<jsp:include page="../menu/header.jsp" />


			<div id="main_content">
				<table border="1">

					<tr>
						<jsp:include page="../menu/leftnav.jsp" />

						<td width="70%">
							
							<center>Here display pending customer details. please contact customer and go for approval/ Reject. </center>
							<form action="<%=request.getContextPath()%>/customer?option=2"
								onsubmit="return submitForm()" method="post" id="fforms"
								name="fforms">
								<div id="err" />
								<input type="hidden" name="cid" value="<%=siva.getCid()%>"></input>
								<table cellpadding="5" cellspacing="5" border="0">
									<tr>
										<td>Dealer No</td>
										<td><input type="hidden" name="cc"
											value="<%=user.getUserName()%>" /> <%=user.getUserName()%></td>
									</tr>
									<tr>
										<td>Name</td><td><%=siva.getName()%></td>
										<%-- <td><input type="text" name="cname" id="cname"
											value="<%=siva.getName()%>" size="11"
											style="font: 10px verdana, arial, helvetica" /></td> --%>
									</tr>


									<tr>
										<td>MobileNo</td><td><%=siva.getMobileNo()%></td>
										<%-- <td><input type="text" name="cmobile" id="cmobile"
											value="<%=siva.getMobileNo()%>" value="" size="11"
											style="font: 10px verdana, arial, helvetica" /></td> --%>
									</tr>
									<tr>
										<td>Adhar No</td><td><%=siva.getAharNo()%></td>
										<%-- <td><input type="text" name="adharNo" id="adharNo"
											value="<%=siva.getAharNo()%>" value="" size="11"
											style="font: 10px verdana, arial, helvetica" /></td> --%>
									</tr>
									<tr>
										<td>TIN</td><td><%=siva.getTno()%></td>
										<%-- <td><input type="text" name="tin" id="tin"
											value="<%=siva.getTno()%>" size="11"
											style="font: 10px verdana, arial, helvetica" /></td> --%>
									</tr>
									<tr>
										<td>Address1</td><td><%=siva.getAddress()%></td>
										<%-- <td><input type="text" name="addr1"
											value="<%=siva.getAddress()%>" /></td> --%>
									</tr>
									<tr>
										<td>District</td>
										 
												<%
													while (itd.hasNext()) {
														Map.Entry<String, String> me = itd.next();
														String str = "";
														if (siva.getDistrict() == Integer.parseInt(me.getValue())) {%>
														 <td>	<%=me.getKey()%></td>
														<%}
												%>

											
												<%
													}
												%>
										 
									</tr>
									<tr>
										<td>Bill Amount</td><td><%=siva.getDueAmount()%></td>
										<%-- <td><input type="text" name="bill" id="bill"
											value="<%=siva.getDueAmount()%>
										value="
											" size="11" style="font: 10px verdana, arial, helvetica" /></td> --%>
									</tr>
									<%
										if (userList.contains(user.getCcNo()+"") && strL!=null && 	 strL.equals("c")) {
									%>
									<tr>
										<td>Status</td>
										<td><input type="radio" name="stat"  value="A"/>&nbsp;Approve  <input
											type="radio" name="stat" value="R"/>&nbsp;Reject &nbsp;&nbsp;<!-- <input
											type="radio" name="stat" value="C"/>&nbsp;Closed --></td>
									</tr>
									<tr>
										<td>Approver Comments</td>
										<td><textarea cols="45" rows="5" name="ac"><%=siva.getApproverComments() %></textarea></td>
									</tr>
									<%
										} if(strL!=null && 	 strL.equals("c")) {
									%>
									<tr>
										<td>Status</td>
										<td><input type="radio" name="C" />&nbsp;closed</td>
									</tr>
									<tr>
										<td>Dealer Comments</td>
										<td><textarea cols="45" rows="5" name="ac"></textarea></td>
									</tr>
									<%} %>
									<tr>
										<td></td>
										<td><!-- <input type="submit" name="sub" value="submit" /> --><input
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