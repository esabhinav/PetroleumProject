<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
	TreeMap<String, String> district = (TreeMap<String, String>) session
			.getAttribute(TNBPDAConstants.DISTRICT);
	Iterator<Map.Entry<String, String>> itd = district.entrySet()
			.iterator();
	HashMap<String, String> supply = (HashMap<String, String>) session
			.getAttribute(TNBPDAConstants.SUPPLY);
	Iterator<Map.Entry<String, String>> its = supply.entrySet()
			.iterator();
	HashMap<String, String> terriority = (HashMap<String, String>) session
			.getAttribute(TNBPDAConstants.TERRIORITY);
	Iterator<Map.Entry<String, String>> itt = terriority.entrySet()
			.iterator();
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
					System.out.println("in JSP " + user.getAccessLevel());
			%>

			<div id="main_content">

				<form action="<%=request.getContextPath()%>/commitee" id="ecform">
					<input type="hidden" name="option" value="" /> <input type="hidden"
						name="mod" value="dealer" />
				</form><%-- 
			<a href="<%=request.getContextPath()%>/jsp/dealer/upload.jsp">Upload Reminder Excel</a> --%>
<%-- 			<br/>
			<br/><a target="_blank"
									href="<%=request.getContextPath()%>/docs/Sample_Reminder.xls">Sample Download</a> --%>
				<table border="1" width="100%">

					<tr>
					<% if(user.getAccessLevel().equals("Admin") || user.getAccessLevel().equals("SuperAdmin") ){ %>  
							<a href="<%=request.getContextPath()%>/dealer?option=10"><img
													align="bottom"
													src="<%=request.getContextPath()%>/images/excel.jpg"
													width="35" height="30"/> Download in Excel</a>
						
													<%} %>
						<%-- <jsp:include page="../menu/leftnav.jsp" /> --%>
						<%
							if (dealersList != null && dealersList.size() > 0) {
						%>
						<td width="90%" valign="top" colspan="2">
							<center>This page will display all dealers information
								based on search creteria.</center>

							<table cellpadding="5" cellspacing="5" width="100%" id="myTable"
								class="display">
								<thead>
									<tr align="left">
										 
										<th width="10%">CCNo</th>
										<th width="5%"> Password </th>
										<th width="20%">ROName</th>
										 <th width="3%">Password</th> 
										<th width="10%">FirstName</th>
										<th width="10%">Town</th>
										<th width="3%">Pincode</th>
										<th width="10%">Email</th>
										<th width="10%">Mobile</th>

										<th width="5%">District</th>

										<th width="10%">SupplyLocation</th>
										<th width="5%">Terrority</th>
										<th width="10%">First time User</th>
											 <% if(user.getUserName().equals("173813")){ %>  
										<th>Delete</th>
										  <%}   %>
									</tr>

								</thead>
								<%
									for (Dealer dealer : dealersList) {
								%>
								<tr>
							<%-- 		<td><input type="radio" name="ec"
										value="<%=dealer.getCcNo()%>"
										onselect="selectECMember('<%=dealer.getCcNo()%>')" /></td> --%>
									<td><%=dealer.getCcNo()%></td>
									<td><%= dealer.getPassword() %></td>
									<td><%=dealer.getRoName()%></td>
									  <td><%=dealer.getPassword()%></td>  
									<%
										if (dealer.getFirstName() != null) {
									%>
									<td><%=dealer.getFirstName()%></td>
									<%
										} else {
									%>
									<td>-</td>
									<%
										}
									%>
									<td><%=dealer.getCity()%></td>
									<% if(dealer.getZipCode()!=0) { %>
									<td><%=dealer.getZipCode()%></td>
								<%} else { %>
								<td>--</td>
								<%} %>
									<%
										if (dealer.getEmailID() != null) {
									%>
									<td><%=dealer.getEmailID()%></td>
									<%
										} else {
									%>
									<td>-</td>
									<%
										}
									%>
									<td><%=dealer.getMobileNo()%></td>

									<td><%=dealer.getDistrict()%></td>

									<td><%=dealer.getSupplyLocation()%></td>


									<td><%=dealer.getTerriority()%></td>

									<td>
										<%
											if (dealer.isFirstTime())
															out.write("Yes");
														else
															out.write("No");
										%>
									</td>
								 	<% if(user.getUserName().equals("173813")){ %>  
									<td><a href="<%=request.getContextPath()%>/dealer?option=9&ccNo=<%= dealer.getCcNo()%>">Delete</a></td>
									  <%} %>  
								</tr>
								<%
									}
								%>

							</table>
							<hr />  &nbsp;
								
													
							
						</td>
						<%
							}  
						%>
						 
					</tr>
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