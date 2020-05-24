<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Password Changed</title>
<%String str="Upload Failed";
if (session.getAttribute("str") != null) {
		str = (String)session.getAttribute("str");
		
	} request.setAttribute("UD", true);%>
</head>
<style>
.button1:link, .button:visited {
	border-radius: 10px;
    width: 100px;
    border: none;
    color: white;
    padding: 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 17px;
    margin: 4px 2px;
}
.button {
	border-radius: 10px;
    width: 100px;
    border: none;
    color: white;
    padding: 12px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 17px;
    margin: 4px 2px;
}
.button1 {background-color: #4CAF50;  cursor: pointer;/* Green */}
</style>
<body>
<div id="main_container">
<div id="header" style="background-image: url(../images/bp11.jpg)">
			<jsp:include page="../menu/header.jsp" />
		</div>
<table width="100%">
	<tr>
		<td width=25%></td>
		<td width=50%>
		<center>
			<b><%=str%></b>
		</center>
		</td>
		<td width=25%></td>
	</tr>
	<tr>
		<td width=25%></td>
		<td width=50%>
		<table width=100%>
			<tr>
				<td width=50% align="center"><a class="button1 button" href="<%=request.getContextPath()%>/home?mod=home"><b>Home</b></a></td>
				<%-- <td width=50% align="right"><a class="button1 button" href="<%=request.getContextPath()%>/login?option=5">Home</a></td> --%>
			</tr>
		</table>
		</td>
		<td width=25%></td>
	</tr>
</table>
<br>

<jsp:include page="../menu/footer.jsp" />
</div>
</body>
</html>