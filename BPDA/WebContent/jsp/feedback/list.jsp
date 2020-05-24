<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.tnbpda.vo.Feedback"%>
<%@page import="com.tnbpda.vo.Answer"%>

<%@page import="java.util.List"%>
<%@page import="com.tnbpda.vo.Question"%>
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
	List<Feedback> feedbackList = (List<Feedback>) request
			.getAttribute(TNBPDAConstants.FEEDBACK_LIST);
%>
<body>
	<div id="main_container">

		<div id="main_content" style="height: 95%;">
			<jsp:include page="../menu/header.jsp" />
			<div id="main_content">
				<table border="1" width="100%">

					<tr>
						<%-- 		<jsp:include page="../menu/leftnav.jsp" /> --%>

						<td><table cellpadding="5" cellspacing="5" align="center"
								width="100%" bgcolor="#CECECE">
								<thead>
									<tr>
									<th>Id</th>
										<th>Name</th>
										<th>Rating</th>
										<th>Interest Module</th>
										<th>Feedback</th>
										<th>Delete</th>
									</tr>
									<%
									System.out.println("feedbackList : "+feedbackList);
									if(feedbackList!=null)	
									for (Feedback fb : feedbackList) {
											System.out.println(fb.getStatus());
											if(fb.getStatus()==null){
									%>
									<tr align="center">
									<td><%= fb.getFid() %></td>
										<td><%=fb.getCcNo()%></td>
										<td><%=fb.getRating()%></td>
										<td><%=fb.getInterestModule()%></td>
										<td><%=fb.getFeedback()%></td>
										<td><a href="<%=request.getContextPath()%>/feedback?option=5&fid=<%= fb.getFid()%>">Delete</a></td>
									</tr>
									<%}
										}
									%>
								</thead>

							</table></td>
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