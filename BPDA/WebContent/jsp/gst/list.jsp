<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
<script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.16/css/jquery.dataTables.css">
  
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.16/js/jquery.dataTables.js"></script>

 
	<script  type="text/javascript">


	$(document).ready(function(){
		//alert("indide");
	    $('#myTable').DataTable({
	        "dom": '<"top"fi>rt<"bottom"lp><"clear">'
	    });
	});

	</script>
</head>
<%
	User user = (User) session.getAttribute(TNBPDAConstants.AUTH_USER); 
	if (user != null) {
%>
<body>
	<div id="main_container">

		<div id="main_content" style="height: 95%;">
			<jsp:include page="../menu/header.jsp" />
			<%
				List<Dealer> dealersList = (List<Dealer>) request.getAttribute(TNBPDAConstants.DEALERS_LIST);
						System.out.println("in JSP "+dealersList);
			%>

			<div id="main_content">
				<table border="1" width="100%">
					<tr>
						<td colspan="3" align="center">
							<h2>Dealers</h2>
						</td>
					</tr>
					
				 
					<tr>
						 <jsp:include page="../menu/leftnav.jsp" />
						 		<%
						 			if (dealersList != null && dealersList.size()>=0) {
						 		%>
						<td width="90%" valign="top" colspan="2">
						 <center>This page will display all dealers information based on search creteria. </center>
						 
							<table cellpadding="5" cellspacing="5" width="100%" id="myTable" class="display">
								<thead>
									<tr align="left">
										<th width="10%">CCNo</th>
										<th width="25%">ROName</th>
										<th width="3%">Password</th>
										<th width="15%">FirstName</th>
										<th width="15%">Mobile</th>
									<!-- 	<th width="5%">District</th>

										<th width="10%">SupplyLocation</th>
										<th width="10%">Terrority</th>-->
										<th width="10%">First time User</th>
									</tr>
								</thead>
								<%
									for (Dealer dealer : dealersList) {
								%>
								<tr>

									<td><%=dealer.getCcNo()%></td>
									<td><%=dealer.getRoName()%></td>
									<td><%=dealer.getPassword()%></td>
									<td><%=dealer.getFirstName()%></td>
									<td><%=dealer.getMobileNo()%></td>
									<%-- <td><%=dealer.getDistrict()%></td>
									<td><%=dealer.getSupplyLocation()%></td>
									<td><%=dealer.getTerriority()%></td> --%>
									<td><%=dealer.isFirstTime()%></td>
								</tr>
								<%
									}
								%>
							 
							</table>
 <hr/>
 Total dealers : <%= dealersList.size() %>
						</td>
						<%
							} else {
						%>
						<td width="70%">
							<table cellpadding="5" cellspacing="5" width="100%">
								<tr>
									<td colspan="2"></td>
								</tr>
								<!-- <tr>
									<td>Dealer Name</td>
									<td><input type="text" name="dname" size="20" /></td>
								</tr> -->
								<tr>
									<td>Choose your search Criteria</td>
									<td><table><tr><td><input type="radio" name="ds" value="sl"></input> Supply Location</td></tr>
									<tr><td><input type="radio" name="ds" value="tr"></input> Terriority</td></tr>
									<tr><td><input type="radio" name="ds" value="dr"></input>District</td></tr> </table></td>
								</tr>
								<tr>
									<td>Supply location</td>
									<td><select><option>Karur</option>
											<option>Irukur</option>
											<option>Thiruchy</option></select></td>
								</tr>
								<tr>
									<td>Terriority</td>
									<td><select><option>Karur</option>
											<option>Irukur</option>
											<option>Thiruchy</option></select></td>
								</tr>
								<tr>
									<td>District</td>
									<td><select name="district">
											<option>Namakkal</option>
											<option>Salem</option>
											<option>Chennai</option>
											<option>Madurai</option> 
									</select></td>
								</tr>
								<tr>
									<td colspan="2"><input type="submit" value="Search"></input></td>
									 
								</tr> 
							</table>
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