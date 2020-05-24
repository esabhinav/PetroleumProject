<%@page import="com.tnbpda.vo.Dealer"%>
<%@page import="com.tnbpda.vo.User"%>
<%@page import="java.util.TreeMap"%>
<%@page import="com.tnbpda.util.TNBPDAConstants"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TNBPDA</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style.css" media="screen" />
</head>
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
Dealer user = (Dealer) session.getAttribute(TNBPDAConstants.AUTH_USER); 
System.out.println("USR :"+user);
%>
<body>
	<div id="main_container">
		<jsp:include page="../menu/header.jsp" />

		<div id="main_content" style="height: 95%;">
			<table cellpadding="5" cellspacing="5" border="1">
				<tr>
					<jsp:include page="../menu/leftnav.jsp" />

					<td width="70%">
					
						<center>Add/Update Dealer</center>
						<table cellpadding="5" cellspacing="5">
							<tr>
								<td>CCNo</td>
								<td><%=user.getCcNo() %></td>
							</tr>
							<tr>
								<td>Name</td>
								<td></td>
							</tr> 
							
							<tr>
								<td>MobileNo</td>
								<td><input type="text" name="mob"/></td>
							</tr>
							<tr>
								<td>Land Line</td>
								<td><input type="text" name="land"/></td>
							</tr><tr>
								<td>EMail</td>
								<td><input type="text" name="email"/></td>
							</tr>
							<tr>
								<td>Address1</td>
								<td><input type="text" name="addr1"/></td>
							</tr>
							<tr>
								<td>Address2:</td>
								<td><input type="text" name="addr2"/></td>
							</tr>
							
							<tr>
								<td>Post</td>
								<td><input type="text" name="post"/></td>
							</tr>
								<tr>
								<td>ZIP code</td>
								<td></td>
							</tr>
							<tr>
			<td>District</td>
			<td><select name="dr" id="dr"
				style="font: 10px verdana, arial, helvetica">
					<%
						while (itd.hasNext()) {
							Map.Entry<String, String> me = itd.next();
					%>
					<option value="<%=me.getValue()%>"><%=me.getKey()%></option>
					<%
						}
					%>
			</select></td>
		</tr>
						
						<tr>
			<td>Supply location</td>
			<td><select name="sl" id="sl"
				style="font: 10px verdana, arial, helvetica">
					<%
						while (its.hasNext()) {
							Map.Entry<String, String> me = its.next();
					%>
					<option value="<%=me.getKey()%>"><%=me.getValue()%></option>
					<%
						}
					%>

			</select></td>
		</tr>
		<tr>
			<td>Terriority</td>
			<td><select name="tr" id="tr"
				style="font: 10px verdana, arial, helvetica">
					<%
						while (itt.hasNext()) {
							Map.Entry<String, String> me = itt.next();
					%>
					<option value="<%=me.getKey()%>"><%=me.getValue()%></option>
					<%
						}
					%>

			</select></td>
		</tr>
							<tr>
												<td></td>
												<td><input
													src="<%=request.getContextPath()%>/images/sub.jpg"
													id="searchsubmit" name="searchsubmit" type="image" value=""
													tabindex="2" /></td>
											</tr>
											
								 
						</table>
					</td>
					<jsp:include page="../menu/rightnav.jsp" />
				</tr>
			</table>
		</div>
		<!--end of left content-->




		<jsp:include page="../menu/footer.jsp" />
	</div>
	<!--end of main container-->
</body>
</html>
