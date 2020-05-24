<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.tnbpda.vo.Dealer"%>
<%@page import="com.tnbpda.vo.User"%>
<%@page import="com.tnbpda.util.TNBPDAConstants"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TNBPDA</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style.css" media="screen" />
<script type="text/javascript">
 
	function submitForm() {

		try {
			if (document.getElementById("cc").value == '') {
				// document.getElementById("err").innerHTML = "<i> please enter customer code</i>";
				document.getElementById("ccerr").style.color = "red";
			} else if (document.getElementById("pw").value == '') {
				document.getElementById("pwerr").style.color = "red";
				document.getElementById("ccerr").style.color = "black";
			} else {
				return true;
			}

			return false;
		} catch (err) {
			alert(err.description);
			return false;
		}
	}
	function submitNewForm() {

		try {
			if (document.getElementById("npw").value != document.getElementById("cpw").value) {
				alert("if..");
			    document.getElementById("nerr").innerHTML = "<font color='red'><i> Password not matched.</i></font>";
				//document.getElementById("ccerr").style.color = "red";
			}  else {
			//	alert("false..");
				return true;
			} 
			return false;
		} catch (err) {
			alert(err.description);
			return false;
		}
	}
	
</script>
<style>

* {
    box-sizing: border-box;
}

.zoom:link{
	display: none;
/*     padding: 25px;
    background-color: green;
    transition: transform 1s;
    width: .5px;
    height: .5px;
    margin: 0 auto; */
}

.zoom:hover,link {
	display: block;
	padding: 25px;
    background-color: green;
    transition: transform 1s;
    width: .5px;
    height: .5px;
    margin: 0 auto;
 	/* -ms-transform: scale(2.5); */ /* IE 9 */
    /* -webkit-transform: scale(2.5); */ /* Safari 3-8 */
   /*  transform: scale(2.5); */
}
</style>
<style type="text/css">
input#image-button {
	background: #ccc url("<%=request.getContextPath()%>/images/db.jpg")
		no-repeat bottom left;
	padding-left: 16px;
	height: 89px;
}
</style>
</head>

<body>
	<div id="main_container">
		<div id="main_contents" style="height: 100%;">
			<div id="header" style="background-image: url(../images/bp.jpg)">
				<br />
				<table width="100%">
					<tr>
						<td align=left>Please login</td>
						<td align="right"></td>
					</tr>

				</table>
				<div style="align: left">


					<div id="menu" style="text-align: center; font-size: 35px">Welcome
						to TamilNadu Bharat Petroleum Dealers Association</div>
				</div>
			</div>

			<%
				String strErr = (String) request.getAttribute("ERR");
					if (strErr == null) {
						strErr = "";
					}
			%>
			<div id="main_content">
				<div id="left_contentn" style="width: 95%;">

					<table cellpadding="5" cellspacing="5" width="100%">
						<tr valign="top">
							<td><label></label> <img
								src="<%=request.getContextPath()%>/images/bp.jpg" alt="" />
							</td>
							<%
								Dealer lio = (Dealer) session.getAttribute(TNBPDAConstants.AUTH_USER);
																							if (!lio.isFirstTime() && !lio.isStatus()) {
							%>
							<td>
								<fieldset>
									<legend>
										<b>Step1: Login</b>
									</legend>
									<form action="<%=request.getContextPath()%>/login?option=1"
										onsubmit="return submitForm()" method="post" id="fforms"
										name="fforms">
										<table>
											<tr>
												<td colspan="2"><font color="red"><%=strErr%></font>
												<div id="err" /></td>
											</tr>
											<tr>
												<td><label id="ccerr">Customer Code : </label></td>
												<td><input type="text" name="ccode" id="ccode"
													value="CC" readonly disabled size="2"
													style="font: 10px verdana, arial, helvetica"/><input
														type="text" name="cc" id="cc" value="" size="6"
														maxlength="6" style="font: 10px verdana, arial, helvetica" /></td>

											</tr>
											<tr>
												<td><label id="pwerr">Password :</label></td>
												<td><input type="password" name="pw" id="pw" value=""
													size="11" style="font: 10px verdana, arial, helvetica"></input></td>

											</tr>
											<tr>
												<td></td>
												<td><input
													src="<%=request.getContextPath()%>/images/login.jpg"
													id="searchsubmit" name="searchsubmit" type="image" value=""
													tabindex="2" /><!-- </td><td class="zoom">AABB<a href="../images/bp.jpg" /></td> -->
											</tr>
											<tr><td colspan="2">[ <i>login details are shared through SMS. <br/>If not please get in touch with TNBPDA IT team</i>]</td></tr>
										</table>
									</form>
								</fieldset>
							</td>
							<%
								} else if(lio.isFirstTime()){
							%>
							<td>
								<fieldset>
									<legend>
										<b>Step 2. Set New Password </b>
									</legend>
									<p> Thanks for login, you have logged in first time,<br/> so please change your passord.</p>
									<form action="<%=request.getContextPath()%>/login?option=2"
										onsubmit="return submitNewForm()" method="post" id="cforms"
										name="cforms">
										 <input type="hidden"  name="ccode" id="ccode" value="<%= lio.getUserName() %>"/>
										<table>
											<tr>
												<td colspan="2"><font color="red"><%=strErr%></font>
												<div id="nerr" /></td>
											</tr>
											<tr>
												<td><label id="pwerr">User Name :</label></td>
												<td><strong>CC<%=lio.getUserName() %></strong></td>

											</tr>
											<tr><td colspan="2"><hr/></td></tr>
											<tr>
												<td><label id="pwerr">New Password :</label></td>
												<td><input type="password" name="pw" id="npw" value=""
													size="11" style="font: 10px verdana, arial, helvetica"></input></td>

											</tr>
											<tr>
												<td><label id="pwerr">Confirm Password :</label></td>
												<td><input type="password" name="pw" id="cpw" value=""
													size="11" style="font: 10px verdana, arial, helvetica"></input></td>

											</tr>
											<tr>
												<td></td>
												<td><input
													src="<%=request.getContextPath()%>/images/login.jpg"
													id="searchsubmit" name="searchsubmit" type="image" value=""
													tabindex="2" /></td>
											</tr>
										</table>
									</form>
								</fieldset>
							</td>
							<%
								}
							%>
						</tr>
					</table>

				</div>
				<!--end of left content-->
				<!--end of right content-->



				<div style="clear: both;"></div>
			</div>

		</div>

		<jsp:include page="../menu/footer.jsp" />
	</div>
	<!--end of main container-->
</body>
</html>