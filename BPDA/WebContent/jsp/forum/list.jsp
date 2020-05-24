<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

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
	<script type="text/javascript" language="javascript"
	src="<%=request.getContextPath() %>/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath() %>/css/jquery.dataTables.css">

	<script type="text/javascript" charset="utf8"
		src="<%=request.getContextPath() %>/js/jquery.dataTables.js"></script>
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
	List<Question> listQuestion = (List<Question>) request
	.getAttribute(TNBPDAConstants.QUESTION_LIST);
	Question que = (Question) session
	.getAttribute(TNBPDAConstants.QUESTION);
	String reply = (String) request.getAttribute("RE");

	System.out.println("inside list ...." + listQuestion);
%>
<body>
	<div id="main_container">
  	<div id="main_content" style="height: 95%;">
			<jsp:include page="../menu/header.jsp" />
			<div id="main_content">
				<table border="1" width="100%">

					<tr>
						<jsp:include page="../menu/leftnav.jsp" />
						<%
							if (que != null) {
						%>
						<td><table cellpadding="5" cellspacing="5" align="center"
								width="100%" bgcolor="#CECECE">
								<tr>
									<td><b>Category</b></td>
									<td><%=que.getCategory()%></td>
								</tr>
								<tr>
									<td><b>Query</b></td>
									<td><%=que.getQuestion()%></td>
								</tr>
								<tr>
									<td>Options</td>
									<td>
										<%
											if (reply == null) {
										%> <a
										href="<%=request.getContextPath()%>/forum?option=3&qid=<%=que.getQid()%>">Reply</a>
										&nbsp;&nbsp; <%
 	} else {
 %>
										<form
											action="<%=request.getContextPath()%>/forum?option=3&qid=<%=que.getQid()%>"
											onsubmit="return submitForm()" method="post">
											<textarea cols="25" rows="3" name="qa"></textarea>
											<input type="submit" value="post" />
										</form> <%
 	}
 %> <%-- <a
										href="<%=request.getContextPath()%>/forum?option=3&qid=<%=que.getQid()%>">Like</a> --%>
									</td>
								</tr>
								<tr>
									<td></td>
									<td><table cellpadding="5" cellspacing="5" width="100%"
											bgcolor="#DEDEDE" id="myTable" class="myTable">
											<thead>
												<tr>
													<th width="10%">User</th>
													<th width="10%">Date</th> 
													<th width="80%">Comments</th>

												</tr>
											</thead>
											<%
												if (que.getAnswerList() != null)
														for (Answer ans : que.getAnswerList()) {
											%>
											<tr align="center">
												<td><%=ans.getPostedBy()%></td>
												<td><%=ans.getPostedDate()%></td>
												<td><%=ans.getAnswer()%></td>


											</tr>
											<%
												}
											%>
										</table></td>
								</tr>
							</table></td>
						<%
							} else {
						%>
						<td>
							<center>
								<b>Total Posts: <%
									if (listQuestion == null || listQuestion.isEmpty()) {
											out.print(0);
										} else {
											out.print(listQuestion.size());
										}
								%>
								</b>
								<hr />
							</center>
							<table width="100%" border="0" cellpadding="5" cellspacing="5" bgcolor="#CFCFFC" id="myTable"
								class="display">

								<thead>
									<tr>
										<th width="10%">Category</th>
										<!-- <th>QID</th> -->
										<th width="65%">Question</th>
										<th width="10%">Post by</th>
										<th width="5%">View</th>
										<th width="5%">Delete</th>
										<th width="5%">Total Reply</th>
									</tr>
								</thead>
								<%
									if (listQuestion != null)
											for (Question quest : listQuestion) {
								%>
								<tr align="center">
									<td><%=quest.getCategory()%></td>
									<%-- <td><%=quest.getQid()%></td> --%>
									<td><%=quest.getQuestion()%></td>
									<td><%=quest.getCreatedBy()%></td>
									 
									<td><a
										href="<%=request.getContextPath()%>/forum?option=4&qid=<%=quest.getQid()%>">View</a></td>

									<td><a
										href="<%=request.getContextPath()%>/forum?option=5&qid=<%=quest.getQid()%>">Delete</a></td>
									<td>
										<%
											if (quest.getAnswerList() == null
																|| quest.getAnswerList().isEmpty()) {
															out.print(0);
														} else {
															out.print(quest.getAnswerList().size());
														}
										%>
									</td>
								</tr>
								<%
									}
								%>
							</table>
						</td>
						<%
							}
						%>
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