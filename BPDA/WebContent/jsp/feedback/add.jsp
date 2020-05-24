<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.tnbpda.vo.Dealer"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.tnbpda.util.TNBPDAConstants"%>
<%@page import="com.tnbpda.vo.User"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TNBPDA</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style.css" media="screen" />
<script type="text/javascript">
	function submitForm() {

		try {

		} catch (err) {
			alert(err.description);
			return false;
		}
	}
</script>
</head>

<%
	Dealer user = (Dealer) session
			.getAttribute(TNBPDAConstants.AUTH_USER);
%>

<body>
	<div id="main_container">

		<div id="main_content" style="height: 95%;">
			<jsp:include page="../menu/header.jsp" />


			<div id="main_content">
				<table border="1" width="100%">

					<tr>
						<jsp:include page="../menu/leftnav.jsp" />

						<td width="100%">

							<center>
								<h4>Add Feedback</h4>
							</center>
							<b>We would like hear from you about this site and further improvement. please provide your valuable feedback
							</b><form action="<%=request.getContextPath()%>/feedback?option=1"
								onsubmit="return submitForm()" method="post" id="fforms"
								name="fforms">
								<div id="err" />
								<table cellpadding="5" cellspacing="5">
									<tr>
										<td>Web Site Rating:</td>
										<td><select name="rating" style="font: 10px verdana, arial, helvetica"><option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option> 		
										</select></td>
									</tr>
										<tr>
										<td>Module most interest:</td>
										<td><select name="moduleinterest" style="font: 10px verdana, arial, helvetica">
										 
												<option value="home">Home</option>
												<option value="trade">About Trade</option>
												<option value="dealers">Dealers</option>
													<option value="Video">Videos</option>
												<!-- <option value="customer">Due Customers</option> 	
												<option value="forum">Forum</option> -->
												<option value="SO Report">So Report Demo</option>
													
										</select></td>
									</tr>
									<tr>
										<td>Feedback/Suggestion<br/> :</td>
										<td><textarea name="feedback" cols="50" rows="5"
												style="font: 10px verdana, arial, helvetica"></textarea></td>
									</tr>

									<tr>
										<td></td>
										<td><input
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
		</div>
		<!--end of left content-->
		<!--end of right content-->


		<div style="clear: both;"></div>

		<jsp:include page="../menu/footer.jsp" />
	</div>
	<!--end of main container-->
</body>
</html>