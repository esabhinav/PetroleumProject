<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.tnbpda.vo.SubscriptionPayment"%>
<%@page import="com.tnbpda.vo.Subscription"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="com.tnbpda.util.TNBPDAConstants"%>
<%@page import="com.tnbpda.vo.User"%>
<%@page import="com.tnbpda.vo.Dealer"%>
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
			$('#myTable').DataTable();
		});
	</script>
</head>
<!-- {
				"dom" : '<"top"fi>rt<"bottom"lp><"clear">'
			} -->
<%
	List<Subscription> listSub  = (List<Subscription>)request.getAttribute(TNBPDAConstants.SUB_LIST);
	 
	User user = (User) session.getAttribute(TNBPDAConstants.AUTH_USER);
	if (user != null) {
%>
<body>
	<div id="main_container">

		<div id="main_content" style="height: 95%;">
			<jsp:include page="../menu/header.jsp" />
			<%
				List<Dealer> dealersList = (List<Dealer>) request
									.getAttribute(TNBPDAConstants.DEALERS_LIST);
			%>

			<div id="main_content">

				<table cellpadding="5" cellspacing="5" id="myTable"
								class="display">
								<thead>
					<tr>
						<th>CCNo</th>
						<th>Life MemberShip</th>
						<th>Annual - 2017</th>
					</tr>
					</thead>
					<%
					 int lifeCount=0;int annualSub=0;
						for(Subscription sub:listSub) {
					%>
					<tr>
						<td><%=sub.getCcNo()%></td>
						<td><% if(sub.isLifeLongSubscription()) { lifeCount++;%>10000<%} else { %> -<% }%></td>
						<td><% List<SubscriptionPayment> list = sub.getAnnualPayment();
						if(list!=null&& list.size()>0) {
							annualSub++;
						%>
						<%= 1000 %>
						<%} else %> -
						</td>
					</tr>
					<%
						}
					%>
					
					
				</table>
				<table>
<tr><td colspan="3">Total Life Membership :<b> <%= lifeCount %></b></td></tr>
						<tr><td colspan="3">Total Annual Membership : <b><%= annualSub %></b></td></tr>
</table>


				<div style="clear: both;"></div>
			</div>

		</div>


		<jsp:include page="../menu/footer.jsp" />
	</div>
	<!--end of main container-->
</body>
<%
	} else {
%>
<jsp:forward page="../login.jsp" />
<%
	}
%>

</html>