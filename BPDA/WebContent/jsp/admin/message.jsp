<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
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
<script type="text/javascript">
	function chooseGrp(opt) {
	 	try {
			if (opt == 's') {
		 		document.getElementById('sl').disabled = false;
				document.getElementById('te').disabled = true;
			} else if (opt == 't') {
				document.getElementById('sl').disabled = true;
				document.getElementById('te').disabled = false;
			} else {
				document.getElementById('sl').disabled = true;
				document.getElementById('te').disabled = true;
			}
		} catch (err) {
			alert(err.description);
		}

	}
</script>
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
		User user = (User) session.getAttribute(TNBPDAConstants.AUTH_USER);
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

		if (user != null) {
	%>
	<div id="main_container">
		<div id="header" style="background-image: url(../images/bp11.jpg)">
			<jsp:include page="../menu/header.jsp" />
		</div>

		<div id="main_content" style="height: 95%;">
			<table border="1">
				<tr valign="top">

					<td width="30%">
						<form action="<%=request.getContextPath()%>/admin?option=1"
							onsubmit="return submitNewForm()" method="post" id="msgforms"
							name="msgforms">
							<table cellpadding="5" cellspacing="5" width="100%">
								<tr bgcolor="#0AC059">
									<td align="center" colspan="2">Message</td>
								</tr>
								<tr>
									<td>Message Category</td>
									<td><select name="category"
										style="font: 10px verdana, arial, helvetica"><option
												value="1">Internal</option>
											<option value="2">Company</option>
											<option value="3">Other</option>
									</select></td>
								</tr>
								<tr>
									<td>Priority</td>
									<td><select name="priority"
										style="font: 10px verdana, arial, helvetica"><option
												value="1">Low</option>
											<option value="2">Medium</option>
											<option value="3">High</option><
									</select></td>
								</tr>
								<tr>
									<td>Choose group</td>
									<td><input type="radio" name="grp" value="sup"
										onclick="chooseGrp('s')" /> Supply location &nbsp; <input
										type="radio" name="grp" value="ter" onclick="chooseGrp('t')" />
										Terriority&nbsp; <input type="radio" name="grp" value="all"
										onclick="chooseGrp('a')" /> ALL</td>


								</tr>
								<tr>
									<td>Supply location</td>
									<td><select name="supply" id="sl"
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
									<td>Territory</td>
									<td><select name="terriority" id="te"
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
									<td>Subject</td>
									<td><input type="text" name="subject" /></textarea></td>
								</tr>
								
								<tr>
									<td>Message</td>
									<td><textarea rows="5" cols="50" name="message"></textarea></td>
								</tr>
								<tr>

									<!-- <td colspan="2"><input type="submit" value="Submit" /></td> -->
									<td colspan="2"><input
										src="<%=request.getContextPath()%>/images/sub.jpg"
										id="searchsubmit" name="searchsubmit" type="image" value=""
										tabindex="2" /></td>
								</tr>

							</table>
						</form>
					</td>
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
