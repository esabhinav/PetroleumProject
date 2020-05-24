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
</head>
<%
	User user = (User) session.getAttribute(TNBPDAConstants.AUTH_USER);
	if (user != null) {
%>
<body>
	<div id="main_container">

		<div id="main_content" style="height: 95%;">
			<%--  --%><jsp:include page="../menu/header.jsp" />
			<%
				String strStatus = (String) request
							.getAttribute(TNBPDAConstants.STATUS);
			%>

			<div id="main_content">
				<table border="0" width="50%">
					<tr>
						<td align="center" colspan="3">
							<h2>Upload Excel</h2>
						</td>
					</tr>
					<tr>
						<td>
							<h3>File Upload:</h3>
						</td>
						<td>Select a file to upload(max 50KB, only .xls): 
							<form action="<%=request.getContextPath()%>/UploadServlet"
								method="post" enctype="multipart/form-data">
								<input type="file" name="file" size="50"  style="font: 10px verdana, arial, helvetica"/>  &nbsp;&nbsp;
								<input style="font: 10px verdana, arial, helvetica"
									type="submit" value="Upload Reminder Details" />
							</form>
						</td>
						<td> </td>
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