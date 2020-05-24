<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.tnbpda.vo.Dealer"%>
<%@page import="com.tnbpda.vo.Lorry"%>
<%@page import="com.tnbpda.vo.Answer"%>
 
<%@page import="java.util.List"%>
<%@page import="com.tnbpda.vo.Question"%>
<%@page import="com.tnbpda.vo.User"%>
<%@page import="com.tnbpda.util.TNBPDAConstants"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TNBPDA</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style.css" media="screen" />
	<script type="text/javascript" language="javascript"
	src="<%=request.getContextPath() %>/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/css/jquery.dataTables.css">

	<script type="text/javascript" charset="utf8"
		src="<%=request.getContextPath() %>/js/jquery.dataTables.js"></script>
		<script type="text/javascript">
		$(document).ready(function() {
			//alert("indide");
			$('#myTable').DataTable({
				"dom" : '<"top"fi>rt<"bottom"lp><"clear">'
			});
		});
	</script>
</head>
<%
Dealer user = (Dealer) session
.getAttribute(TNBPDAConstants.AUTH_USER); 
	List<Lorry> lorryList = (List<Lorry>) request
		.getAttribute(TNBPDAConstants.LORRY_LIST);
	System.out.println("inside list ...." + lorryList);
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
							<center>
								<b>Total Lorries: <%
									if (lorryList == null || lorryList.isEmpty()) {
											out.print(0);
										} else {
											out.print(lorryList.size());
										}
								%>
								</b>
								<hr />
							</center>
							<table width="100%" border="0" cellpadding="5" cellspacing="5" bgcolor="#CFCFFC" id="myTable"
								class="display">

								<thead>
									<tr>
										<th width="20%">Registration No</th>
										<th width="20%">Capacity</th>
										<th width="20%">Date of Registration</th>
										<th width="10%">Vendor ID</th>
										<th width="5%">View</th>
										<th width="5%">Edit</th>
										<th width="5%">Delete</th>
									</tr>
								</thead>
								<%
									if (lorryList != null)
											for (Lorry lor : lorryList) {
								%>
									<td><%=lor.getRegistrationNo()%></td>
									<td><%=lor.getCapacity()%></td>
									<td><%=lor.getDateOfRegistration()%></td>
									<td><%=lor.getVendorId()%></td>
									<td><a
										href="<%=request.getContextPath()%>/lorryRenewal?option=0&ccid=<%=user.getCcNo()%>&regno=<%=lor.getRegistrationNo()%>">View</a></td>
									<td><a
										href="<%=request.getContextPath()%>/lorryRenewal?option=2&ccid=<%=user.getCcNo()%>&regno=<%=lor.getRegistrationNo()%>">Edit</a></td>
									<td><a
										href="<%=request.getContextPath()%>/lorry?option=2&ccid=<%=user.getCcNo()%>&regno=<%=lor.getRegistrationNo()%>" onclick="return confirm('Are you sure want to delete?')">Delete</a></td>
								</tr>
								<%
									}
								%>
							</table>
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