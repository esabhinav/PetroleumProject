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
			<jsp:include page="../menu/header.jsp" />
			<%
				String strStatus  = (String)request.getAttribute(TNBPDAConstants.STATUS);
			%>

			<div id="main_content">
				<table border="1" width="100%" align="top">
				 
					
				 
					<tr>
						<%-- <jsp:include page="../menu/leftnav.jsp" /> --%>
								<%
							if (strStatus!= null && strStatus.equals("Y")) {
						%>
						<td align="center">
   						 <p><b><i><font color="blue">Successfully updated dealer/RO profile.</font></i></b></p>
						    <script>
						        var timer = setTimeout(function() {
						            window.location.href="<%=request.getContextPath()%>/home?mod=home";
						        }, 4000);
						    </script>
						<h4> </h4>
						 </td>
						<%
							} else {
						%>
						<td>
						<h4>Sorry, failed to update dealer/RO profile.</h4>
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
}
</html>