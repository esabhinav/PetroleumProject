<%@page import="com.tnbpda.util.TNBPDAConstants"%>
<%@page import="com.tnbpda.vo.Dealer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Notifications</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style.css" media="screen" />
</head>
<% 
		request.setAttribute("UD",true);
	%>
	<%
	
		Dealer user = (Dealer) session
			.getAttribute(TNBPDAConstants.AUTH_USER);

			//TNBPDAUtil.dateToString(me.getValue().getExpDate())
	%>
<body>
<div>
	<div id="main_container">

		<div id="main_content" style="height: 95%;">
		<jsp:include page="../menu/header.jsp" />
		<div>
			<%-- <jsp:include page="../menu/headeragm.jsp" />
 --%>
			<div class="container">

					<div id="President">
						<table width="100%">

							<jsp:include page="../association/dispmess.jsp" ><jsp:param name="cc" value="113908"/></jsp:include>
							<tr>
								<td colspan="2"></td>
							</tr>
						</table>
					</div>
				</div>
				</div>
			</div>
			<!-- 	<div class="tab" style="width: 100%">
				<button class="tablinks" onclick="openCity(event, 'President')">President</button>
				<button class="tablinks" onclick="openCity(event, 'Secretary')">Secretary</button>
				<button class="tablinks" onclick="openCity(event, 'Treasure')">Treasure</button>
			</div>

			<div id="President" class="tabcontent">
				<h3>President</h3>
				<table>
					<tr>
						<td>Intro</td>
						<td>photo</td>
					</tr>
						<tr>
						<td>Messages</td>
						<td></td>
					</tr>
				</table>
				<p>Some content in president.</p>
			</div>
			<div id="Secretary" class="tabcontent">
				<h3>Secretary</h3>
				<p>Some content in Secretary.</p>
			</div>
			<div id="Treasure" class="tabcontent">
				<h3>Treasure</h3>
				<p>Some content in Treasure.</p>
			</div> -->

		</div>

		<div style="clear: both;"></div>
		<script>
			function openCity(evt, cityName) {
				var i, tabcontent, tablinks;
				tabcontent = document.getElementsByClassName("tabcontent");
				for (i = 0; i < tabcontent.length; i++) {
					tabcontent[i].style.display = "none";
				}
				tablinks = document.getElementsByClassName("tablinks");
				for (i = 0; i < tablinks.length; i++) {
					tablinks[i].className = tablinks[i].className.replace(
							" active", "");
				}
				document.getElementById(cityName).style.display = "block";
				evt.currentTarget.className += " active";
			}

			// Get the element with id="defaultOpen" and click on it
			document.getElementById("defaultOpen").click();
		</script>
		</div>
		<jsp:include page="../menu/footer.jsp" />
	<!--end of main container-->
</body>
</html>