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
<script type="text/javascript">
	function submitForm() {
		alert("inside form");
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
				<table border="1">

					<tr>
						<jsp:include page="../menu/leftnav.jsp" />

						<td width="70%">
<% if(true) { %>
							<center>
								<h4>Add Post</h4>
							</center>
							<form action="<%=request.getContextPath()%>/forum?option=1"
								onsubmit="return submitForm()" method="post" id="fforms"
								name="fforms">
								<div id="err" />
								<table>
									<tr>
										<td>Category:</td>
										<td><select name="cat" style="font: 10px verdana, arial, helvetica">
												<option value="gst">GST</option>
												<option value="ro">RO</option>
												<option value="com">Company</option>
												<option value="oth">Others</option>
										</select></td>
									</tr>
									<tr>
										<td>Queries: </td>
										<td><textarea name="question" cols="50" rows="5" style="font: 10px verdana, arial, helvetica"></textarea></td>
									</tr>
									<tr>
										<td></td>
										<td><input
											src="<%=request.getContextPath()%>/images/sub.jpg"
											id="searchsubmit" name="searchsubmit" type="image" value=""
											tabindex="2" /></td>
									</tr>
								</table>
							</form>
							<%} else{ %>
							
							<%} %>
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