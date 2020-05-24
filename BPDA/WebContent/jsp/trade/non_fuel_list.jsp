<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.tnbpda.vo.NonTrade"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.tnbpda.vo.User"%>
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
<%
	User user = (User) session.getAttribute(TNBPDAConstants.AUTH_USER);
	HashMap<String, List<NonTrade>> mapTrade = (HashMap<String, List<NonTrade>>) request
			.getAttribute(TNBPDAConstants.NON_TRADE_MAP);
	Iterator<Map.Entry<String, List<NonTrade>>> itt = mapTrade
			.entrySet().iterator();
%>
<body>
	<div id="main_container">
		<div id="main_content" style="height: 95%;">
			<jsp:include page="../menu/header.jsp" />
			<div id="main_content">
				<table border="1" width="100%">

					<tr>
						<jsp:include page="../menu/leftnav.jsp" />

						<td><table cellpadding="5" cellspacing="5" align="center"
								width="100%" bgcolor="#CECECE" id="myTable">
								<thead>
									<tr>
										<th>CCNo</th>
										<th>Type</th>
										<th>District</th>
										<th>Category</th>
										<th>Name</th>
										<th>Contact Person</th>
										<th>Mobile</th>
										<th>Address</th>
										<th>Comments</th>
										 
										<th>Delete</th>
										 
									</tr>
								</thead>
								<%
									while (itt.hasNext()) {
										Map.Entry<String, List<NonTrade>> me = itt.next();
										String ccNo = me.getKey();
										if(!ccNo.equals("count"))
										for (NonTrade nt : me.getValue()) {
								%>
								<tr align="center">
									<td><b><%=ccNo%></b></td>
									<td><%=nt.getbType() %></td>
									<td><%=nt.getDistrict()%></td>
									<td><b><%=nt.getBusinessCategory()%></b></td>
									<td><%=nt.getBname()%></td>
									<td><b><%=nt.getContact()%></b></td>
									<td><%=nt.getMobile()%></td>
									<td><b><%=nt.getAddress()%></b></td>
									<td><%=nt.getComments()%></td>
									  <% if(user.getUserName().equals(ccNo)) { %>
									<td><a href="<%=request.getContextPath()%>/trade?option=4&ntid=<%= nt.getNtid()%>">Delete</a></td>
									<%} else { %>
									<td>-</td>
									<%} %>  
								</tr>
							
						<%
							}
							}
						%>
						</table></td>
					</tr>
				</table>
			</div>
		</div>



		<div style="clear: both;"></div>

		<jsp:include page="../menu/footer.jsp" />
	</div>
	<!--end of main container-->
</body>
</html>