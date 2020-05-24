
<%@page import="com.tnbpda.vo.Dealer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.tnbpda.util.TNBPDAConstants"%>
<%@page import="com.tnbpda.vo.User"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%
	String module = (String) request.getAttribute("module");
	System.out.println("MoD : " + module);
	Dealer user = (Dealer) session
			.getAttribute(TNBPDAConstants.AUTH_USER);
	
	List<String> userList = (List<String>)session
	.getAttribute(TNBPDAConstants.USER_ACCESS);
%>



<td width="10%" valign="top">
	<table cellpadding="5" cellspacing="5" border="0">
		<%
			if (module.equals("commitee")) {
		%>

		<%
			} else if (module.equals("calibration")) {
		%>
		<tr>
			<td>calibration</td>
		</tr>

		<%
			} else if (module.equals("compilance")) {
		%>
		<tr>
			<td>Compilance</td>
		</tr>
		<%
			} else if (module.equals("trade")) {
		%>
		<tr>
			<td><a
				href="<%=request.getContextPath()%>/trade?mod=trade&option=3">Do's
					& Dont's </a> <br /> <br />
			<%-- <a href="<%=request.getContextPath()%>/trade?mod=trade&option=3">Template</a><br />
				<br /> <br />
			<a href="<%=request.getContextPath()%>/trade?mod=trade&option=3">Template</a><br />
				<br /> --%>
			<br /></td>
		</tr>
		<%
			} else if (module.equals("nttrade")) {
		%>
		<tr>
			<td><a
				href="<%=request.getContextPath()%>/trade?mod=nttrade&option=1">Add
					New Business</a> <br /> <br /> <a
				href="<%=request.getContextPath()%>/trade?mod=nttrade&option=5">
					Business List</a><br /> <br /> <%-- <br /> <br /> <a
				href="<%=request.getContextPath()%>/trade?mod=nttrade&option=5">
					Business(wanted)</a><br /> <br /> --%></td>
		</tr>
		<%
			} else if (module.equals("customer")) {
		%>
		<tr>
			<td><a
				href="<%=request.getContextPath()%>/customer?mod=customer&option=0">Add
					Customer</a> <br /> <br /> <a
				href="<%=request.getContextPath()%>/customer?mod=customer&option=4">Search
					Customer</a><br /> <br />
				<%	if (userList.contains(user.getCcNo()+"")) { %>
					<a
				href="<%=request.getContextPath()%>/customer?mod=customer&option=6">Customer Review Pending(Admin)
					</a><br /> <br />
					<%} %>
					</td>
		</tr>

		<%-- <tr>
			<td><jsp:include page="../customers/search.jsp" /></td>
		</tr> --%>
		<%
			} else if (module.equals("forum")) {
		%>

		<tr>
			<td><a
				href="<%=request.getContextPath()%>/forum?mod=forum&option=6">Add
					Query</a><br/><br/>
					<a
				href="<%=request.getContextPath()%>/forum?mod=forum&option=0">Query List</a><br/><br/>
					</td>
		</tr>

		<%-- <tr>
			<td><jsp:include page="../forum/search.jsp" /></td>
		</tr> --%>

		<%
			} else if (module.equals("dealer")) {
		%>

		<tr>
			<td><jsp:include page="../dealer/search.jsp" /></td>
		</tr>
		<%
			} else if (module.equals("feedback")) {
		%>
		<tr>
			<td><a
				href="<%=request.getContextPath()%>/feedback?mod=feedback&option=0">Add
					Feedback</a></td>
		</tr>
		<tr>
			<td><a
				href="<%=request.getContextPath()%>/feedback?mod=feedback&option=4">
					View Feedback</a></td>
		</tr>
		<%
			} else if(module.equals("lorry")) {
		%>
		<tr>
			<td><a
				href="<%=request.getContextPath()%>/lorry?mod=lorry&option=3">Add
					Lorry</a></td>
		</tr>
		<tr>
			<td><a
				href="<%=request.getContextPath()%>/lorryRenewal?mod=lorryRenewal&option=3&ccid=<%=user.getCcNo()%>">Update Lorry Renewal</a></td>
		</tr>
		<%
			}
		%>
	</table>
</td>