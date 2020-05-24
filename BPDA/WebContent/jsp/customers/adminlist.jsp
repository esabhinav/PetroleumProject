<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tnbpda.vo.Dealer"%>
<%@page import="java.util.List"%>
<%@page import="com.tnbpda.vo.Customer"%>
<%@page import="com.tnbpda.util.TNBPDAConstants"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TNBPDA</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style.css" media="screen" />
<script type="text/javascript" language="javascript"
	src="<%=request.getContextPath()%>/js/jquery-3.2.1.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/jquery.dataTables.css">

	<script type="text/javascript" charset="utf8"
		src="<%=request.getContextPath()%>/js/jquery.dataTables.js"></script>
	<script type="text/javascript">
		$(document).ready(function() {
			//alert("indide");
			$('#myTable').DataTable({
				"dom" : '<"top"fi>rt<"bottom"lp><"clear">'
			});
		});
	</script>
</head>

<body>
	<div id="main_container">

		<div id="main_content" style="height: 95%;">
			<jsp:include page="../menu/header.jsp" />
			<%
				List<String> userList = (List<String>) session
						.getAttribute(TNBPDAConstants.USER_ACCESS);

				TreeMap<String, String> district = (TreeMap<String, String>) session
						.getAttribute(TNBPDAConstants.DISTRICT);
				Iterator<Map.Entry<String, String>> itd = district.entrySet()
						.iterator();
				Dealer user = (Dealer) session
						.getAttribute(TNBPDAConstants.AUTH_USER);
				List<Customer> customerList = (List<Customer>) request
						.getAttribute(TNBPDAConstants.CUSTOMER_LIST);
			%>
			<div id="main_content">
				<table border="1" width="100%">

					<tr>
						<jsp:include page="../menu/leftnav.jsp" />

						<td>

							<table cellpadding="5" cellspacing="5" width="100%" id="myTable">
								<thead>
									<tr align="left">
										<th width="10%">CCNo</th>
										<th width="25%">CustomerName</th>
										<th width="3%">AdharNo</th>
										<th width="15%">MobileNo</th>
										<th width="15%">Due Amount</th>
										<th width="5%">TIN</th>

										<th width="10%">District</th>
										<th width="10%">ApproverComments</th>
										<th width="5%">Status</th>

										<th>Edit</th>


									</tr>
								</thead>
								<%
									if (customerList != null)
										for (Customer customer : customerList) {
								%>

								<tr>

									<td><%=customer.getCcNo()%></td>
									<td><%=customer.getName()%></td>
									<td><%=customer.getAharNo()%></td>
									<td><%=customer.getMobileNo()%></td>
									<td><%=customer.getDueAmount()%></td>
									<td><%=customer.getTno()%></td>
									<%
										String str = "";
												while (itd.hasNext()) {
													Map.Entry<String, String> me = itd.next();

													if (customer.getDistrict() == Integer.parseInt(me
															.getValue())) {
														str = me.getKey();
														break;
													}
												}
									%>

									<td><%=str%></td>
									<td><%=customer.getComments()%></td>

									<td><font color="">PENDING</font></td>

									<td><a
										href="<%=request.getContextPath()%>/customer?option=3&cid=<%=customer.getCid()%>">Edit</a></td>
									<%-- <td><a
										href="<%=request.getContextPath()%>/customer?option=5&cid=<%=customer.getCid()%>">Delete</a></td> --%>

								</tr>
								<%-- 		<tr>

									<td><%=customer.getCcNo()%></td>
									<td><%=customer.getName()%></td>
									<td><%=customer.getAharNo()%></td>
									<td><%=customer.getMobileNo()%></td>
									<td><%=customer.getDueAmount()%></td>
									<td><%=customer.getTno()%></td>
									<td><%=customer.getDistrict()%></td>
									<%if(customer.getStatus()!=null && customer.getStatus().equals("P")) { %>
									<td><font color=""> PENDING</font></td>
								 <%} else { %>
								 <td><%=customer.getStatus()%></td> 
								 <%} %>
									<td><a href="<%=request.getContextPath() %>/customer?option=3&cid=<%=customer.getCid()%>">Edit</a></td>
									<td><a href="<%=request.getContextPath() %>/customer?option=5&cid=<%=customer.getCid()%>">Delete</a></td>
								</tr> --%>
								<%
									//	}
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