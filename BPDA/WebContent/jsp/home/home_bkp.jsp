<%@page import="com.tnbpda.vo.Dealer"%>
<%@page import="com.tnbpda.vo.Message"%>
<%@page import="com.tnbpda.util.TNBPDAConstants"%>
<%@page import="com.tnbpda.vo.User"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TNBPDA</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style.css" media="screen" />

<style>
.hide {
	display: none;
	padding: 2px;
	margin: 0px;
	border: 5px gray;
	z-index: 1;
	position: 'relative';
	left: 0em;
	top: -1em;
	background-color: #fff;
}

.anchor {
	position: relative;
}
</style>
<script type="">
function showbox(x){
document.getElementById(x).style.display = 'block';
}
function hidebox(x)
{
document.getElementById(x).style.display = 'none';
}
</script>
</head>
<body>
	<%
		Dealer user = (Dealer) session
				.getAttribute(TNBPDAConstants.AUTH_USER);
		if (user != null) {
	%>
	<div id="main_container">
		<div id="header" style="background-image: url(../images/bp11.jpg)">
			<jsp:include page="../menu/header.jsp" />
		</div>

		<div id="main_content" style="height: 100	%;">
			<table cellpadding="5" cellspacing="5" width="100%" border="0">
				<tr bgcolor="#FC0">
					<td align="center" colspan="4">Messages</td>
				</tr>
				<%
					if (user.getAccessLevel().equals("Admin")
								|| user.getAccessLevel().equals("SuperAdmin")) {
				%>
				<tr>
					<td colspan="4"><a
						href="<%=request.getContextPath()%>/jsp/admin/message.jsp">Add
							New Message</a></td>
				</tr>
				<%
					}
						List<Message> listMsg = (List<Message>) request
								.getAttribute(TNBPDAConstants.MSG_LIST);
						for (Message msg : listMsg) {
							System.out.println("TR :" + msg.getTerriority());
							System.out.println("UR " + user.getTerriority());
							if (user.getCcNo() == 173813
									|| (msg != null
											&& user.getTerriority() != null
											&& Byte.parseByte(user.getTerriority()) == msg
													.getTerriority() || user
											.getSupplyLocation() != null
											&& Byte.parseByte(user.getSupplyLocation()) == msg
													.getSupplyLocation())) {
				%>

				<tr>
					<td><%=msg.getMid()%></td>
					<td><%=msg.getDate()%></td>
					<td colspan="1"><%=msg.getMessage()%></td>
					<%
						if (user.getAccessLevel().equals("Admin")
											|| user.getAccessLevel().equals("SuperAdmin")) {
					%>
					<td><a
						href="<%=request.getContextPath()%>/admin?option=2&mid=<%=msg.getMid()%>">Delete</a></td>
					<%
						}
					%>
				</tr>
				<%
					}
						}
				%>


			</table>
			<table border="0">
				<tr valign="top">

					<td width="30%">


						<hr></hr>
						<table cellpadding="5" cellspacing="5" width="100%">
							<tr bgcolor="#FC0">
								<td align="center">TNBPDA MOM</td>
							</tr>
							<tr>
								<td><a
									href="<%=request.getContextPath()%>/docs//Cutrallam.rtf"
									target="_blank">Cutrallam_25_08_2017</a></td>
							</tr>

						</table>
									<table cellpadding="5" cellspacing="5" width="100%" border="0">
							<tr bgcolor="#FC0">
								<td align="center">Price Trend</td>
							</tr>
							<tr>
								<td> <!-- Widget -->
      <div class="box-widget column50 clear">
        <div class="column50_1 align-centre">
          <!-- Left -->

          <div id="brent_preview"><script type="text/javascript" src="https://oilprice.com/widgets/brent/brentchart.js"></script><noscript><!--Please Enable Javascript for this <a href="https://oilprice.com">Oil Price</a> widget to work--></noscript></div>

          <!-- /Left -->

        </div>
</td>
							</tr>

						</table>
					</td>
					<td width="30%" height="100%">
						<%
							if (true) {
						%>

						<table cellpadding="5" cellspacing="5" width="100%" border="0">
							<tr bgcolor="#FC0">
								<td align="center">Company Useful links</td>
							</tr>
							<tr>
								<td><table>
										<tr>
											<td><a href="">Email</a></td>
										</tr>
										<tr>
											<td><a href="">mobi connect link</a></td>
										</tr>
										<tr>
											<td><a href="">SOA</a></td>
										</tr>
										<tr>
											<td><a href="">BPCL website</a></td>
										</tr>
									</table></td>
							</tr>

						</table> <%
 	}
 %>
						<table cellpadding="5" cellspacing="5" width="100%">
							<tr bgcolor="#FC0">
								<td align="center"><b>To Do List</b></td>
							</tr>
							<tr>
								<td><a
									href="<%=request.getContextPath()%>/jsp/calibration/add.jsp">Add
										Details </a></td>
							</tr>
							<tr>
								<td><table cellpadding="5" cellspacing="5">
										<tr>
											<th>ITEM</th>
											<th>Date</th>
											<th>No</th>
										</tr>
										<tr>
											<td>Pump calibration</td>
											<td>12/11/2017</td>
											<td>VCSSDFDDF</td>
										</tr>
										<tr>
											<td>HYDRO Meter</td>
											<td>12/12/2017</td>
											<td>802343</td>
										</tr>
									</table></td>
							</tr>

						</table>
						<hr></hr>
			


					</td>


				</tr>
				<tr>
					<td colspan="3" align="center"><b>Quote : </b> <i>"Without
							your involvement you cannot succeed, with your involvement you
							can't fail" </i></td>
				</tr>
			</table>
		</div>
		<!--end of left content-->




		<jsp:include page="../menu/footer.jsp" />
	</div>
	<%
		} else {
	%>

	<%
		}
	%>
	<!--end of main container-->
</body>
</html>
