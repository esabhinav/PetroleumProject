<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.tnbpda.vo.User"%>
<%@page import="com.tnbpda.util.TNBPDAConstants"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TNBPDA</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style.css" media="screen" />
</head>
<%
	User user = (User) session.getAttribute(TNBPDAConstants.AUTH_USER);
%>
<body>
	<div id="main_container">

		<div id="main_content" style="height: 95%;">
			<jsp:include page="../menu/header.jsp" />



			<div id="main_content">
				<table border="1">

					<tr>

						<td bgcolor="#E5D545"><iframe width="280" height="160"
								src="https://www.youtube.com/embed/JZdvsQzOKuk" frameborder="0"
								allowfullscreen></iframe></td>
						<td bgcolor="#F5D565"><iframe width="280" height="160"
								src="https://www.youtube.com/embed/bqzupgP6upU" frameborder="0"
								allowfullscreen></iframe></td>
						<td bgcolor="#F5D565"><iframe width="280" height="160"
								src="https://www.youtube.com/embed/SWP4ur1bIoY" frameborder="0"
								gesture="media" allow="encrypted-media" allowfullscreen></iframe></td>
						<td bgcolor="#F5D565"><iframe width="280" height="160"
								src="https://www.youtube.com/embed/mP4Jf0VPp1M" frameborder="0"
								allow="autoplay; encrypted-media" allowfullscreen></iframe></td>
					</tr>
					<tr>

						<td bgcolor="#C78777"><iframe width="280" height="160"
								src="https://www.youtube.com/embed/qy3GLjY6QgE" frameborder="0"
								allowfullscreen></iframe></td>
						<td bgcolor="#D3D343"><iframe width="280" height="160"
								src="https://www.youtube.com/embed/rlK7JIAz9WY" frameborder="0"
								allowfullscreen></iframe></td>
						<td bgcolor="#E5D545"><iframe width="280" height="160"
								src="https://www.youtube.com/embed/BL-kp5AS2bw" frameborder="0"
								gesture="media" allow="encrypted-media" allowfullscreen></iframe></td>
						<td bgcolor="#F5D565"><iframe width="280" height="160"
								src="https://www.youtube.com/embed/w4jHpHoYZhk" frameborder="0"
								allow="autoplay; encrypted-media" allowfullscreen></iframe></td>
					</tr>
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