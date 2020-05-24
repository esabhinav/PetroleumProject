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
<title>Integration and Messaging</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style.css" media="screen" />

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/tcal.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
<link rel="stylesheet" href="/resources/demos/style.css" />
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
$( function() {
  $( "#fDate" ).datepicker({
    changeMonth: true,
    changeYear: true,
    yearRange: '-99:+10',
	showOn: "button",
    buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif",
    buttonImageOnly: true,
    dateFormat: 'dd-mm-yy'
  });
} );
</script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/tcal.js"></script>

<script type="text/javascript">
	function checkNu(va) {
		//alert("s"+va.value);
		if (isNaN(va.value)) {
			document.getElementById('ezip').innerHTML = "<font color='red'>Not a Number</font>";

			document.getElementById('zip').value = "";
		} else {
			document.getElementById('ezip').innerHTML = "";
		}

	}
	function submitForm() {
		//alert("inside submit forum..");
		var errMsg = "";
		try {
			if (document.getElementById("fName").value == '') {
				errMsg = "please enter First Name";
			}
			if (document.getElementById("lName").value == '') {
				errMsg = "please enter Last Name";
			}

			if (document.getElementById("mob").value == '') {
				errMsg = "please enter Mobile Name";
			}
			if (document.getElementById("land").value == '') {
				errMsg = "please enter land line number";
			}

			if (document.getElementById("email").value == '') {
				errMsg = "please enter Email";
			}
			if (document.getElementById("addr1").value == '') {
				errMsg = "please enter addr1 ";
			}
			if (document.getElementById("addr2").value == '') {
				errMsg = "please enter addr2";
			}

			if (document.getElementById("post").value == '') {
				errMsg = "please enter post";
			}
			if (document.getElementById("zip").value == '') {
				errMsg = "please enter zip";
			}
			if (document.getElementById("dr").value == '') {
				errMsg = "please select District";
			}

			if (document.getElementById("sl").value == '') {
				errMsg = "please select Supply Location ";
			}
			if (document.getElementById("tr").value == '') {
				errMsg = "please select Terriority ";
			}
			document.getElementById("err").innerHTML = "<font color='red'> "
					+ errMsg + "<font>";
			if (errMsg != "") {
				return false;
			} else {
				return true;
			}
		} catch (err) {
			alert(err.description);
			return false;
		}
	}
</script>
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
	Dealer nallaya = (Dealer) session
			.getAttribute(TNBPDAConstants.AUTH_USER);
	boolean str = false;
	if (request.getAttribute("UD") != null) {
		str = (boolean) request.getAttribute("UD");
	}
	System.out.println(str);
%>

<body>
	<div id="main_container">
		<%
			if (!str || str) {
		%>
		<jsp:include page="../menu/header.jsp" />
		<%
			}
		%>
		<div id="main_content" style="height: 95%;">
			<table cellpadding="5" cellspacing="5" border="1" width="100%">
				<tr>

					<td width="70%">Please kindly update your profile information.
						<form action="<%=request.getContextPath()%>/dealer?option=2"
							onsubmit="return submitForm()" method="post" id="fforms"
							name="fforms">
							<table cellpadding="5" cellspacing="5" border="0">
								<tr>
									<td colspan="2"><b><i><font color="red">*</font>
												All are Mandatory fields</i></b></td>
									<td>
										<div id="err" />
									</td>
								</tr>
								<tr>
									<td>CCNo</td>
									<td><%=nallaya.getCcNo()%><input type="hidden" name="ccNo"
										value="<%=nallaya.getCcNo()%>" required/></td>
								</tr>

								<tr>
									<td>RO Name</td>
									<td><%=nallaya.getRoName()%></td>
								</tr>
								<tr>
									<td>First Name</td>
									<td><input type="text" name="fName" id="fName"
										value="<%=nallaya.getFirstName()%>" required/></td>
								</tr>
								<tr>
									<td>Last Name</td>
									<%
										String lName = "";
										if (nallaya.getLastName() != null) {
											lName = nallaya.getLastName();
										}
									%>
									<td><input type="text" name="lName" id="lName"
										value="<%=lName%>" required/></td>
								</tr>
								<tr>
									<td>DOB</td>
									<td><input type="text" name="dob" id="fDate"
										value="<%=nallaya.getDateOfBirth()%>" required/>[Format : dd-mm-yyyy]</td>
								</tr>
								<tr>
									<td>MobileNo</td>
									<td><input type="text" name="mob" id="mob"
										value="<%=nallaya.getMobileNo()%>" required/></td>
								</tr>
								<tr>
									<td>Land Line</td>
									<td><input type="text" name="land" id="land"
										value="<%=nallaya.getLandLine()%>" required/></td>
								</tr>
								<tr>
									<td>EMail (personal)</td>
									<td><input type="text" name="email" id="email"
										value="<%=nallaya.getEmailID()%>" required/></td>
								</tr>
								<tr>
									<td>EMail (Official)</td>
									<td><input type="text" name="emailOff" id="emailOff"
										value="<%=nallaya.getOfficialEmailId()%>" required/></td>
								</tr>
								<tr>
									<td>Address1</td>
									<td><input type="text" name="addr1" id="addr1"
										value="<%=nallaya.getAddress1()%>" required/></td>
								</tr>
								<tr>
									<td>Address2:</td>
									<td><input type="text" name="addr2" id="addr2"
										value="<%=nallaya.getAddress2()%>" required/></td>
								</tr>

								<tr>
									<td>Post</td>
									<td><input type="text" name="post" id="post"
										value="<%=nallaya.getPost()%>" required/></td>
								</tr>
								<%
									int zip = nallaya.getZipCode();
									String strZ = "";
									if (zip != 0) {
										strZ = String.valueOf(zip);
									}
								%>
								<tr>
									<td>ZIP code</td>
									<td><input type="text" name="zip" id="zip" size="6"
										maxlength="6" onkeyup="checkNu(this)" value="<%=strZ%>" required/>
										<div id="ezip" /></td>
								</tr>
								<tr>
									<td>District</td>
									<td><select name="dr" id="dr">
											<option value="">--select--</option>
											<%
												while (itd.hasNext()) {
													Map.Entry<String, String> me = itd.next();
													String select = "";
													if (nallaya.getDistrict() != null
															&& nallaya.getDistrict().equals(me.getValue())) {
														select = "selected";
													}
											%>
											<option value="<%=me.getValue()%>" required<%=select%>><%=me.getKey()%></option>
											<%
												}
											%>
									</select></td>
								</tr>

								<tr>
									<td>Supply location</td>
									<td><select name="sl" id="sl">
											<option value="">--select--</option>
											<%
												while (its.hasNext()) {
													Map.Entry<String, String> me = its.next();
													String select = "";
													if (nallaya.getSupplyLocation() != null
															&& nallaya.getSupplyLocation().equals(me.getKey())) {
														select = "selected";
													}
											%>
											<option value="<%=me.getKey()%>" required<%=select%>><%=me.getValue()%></option>
											<%
												}
											%>

									</select></td>
								</tr>
								<tr>
									<td>Terriority</td>
									<td><select name="tr" id="tr">
											<option value="">--select--</option>
											<%
												while (itt.hasNext()) {
													Map.Entry<String, String> me = itt.next();
													String select = "";
													if (nallaya.getTerriority() != null
															&& nallaya.getTerriority().equals(me.getKey())) {
														select = "selected";
													}
											%>
											<option value="<%=me.getKey()%>" required<%=select%>><%=me.getValue()%></option>
											<%
												}
											%>

									</select></td>
								</tr>
								<tr>
									<td>Are you member of</td>
									<td><select name="clubMember"><option value="">--select---</option><option value="Lions">Lions</option>
											<option value="Rotary">Rotary</option>
											<option value="RoundTable">Round Table</option>
											<option value="JCIS">JCIS</option>
											<option value="AnyOtherTr">AnyOtherTrust</option>
											<option value="AnyOtherClub">AnyOther Club</option></select> (Optional)</td>
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
					<%-- <jsp:include page="../menu/rightnav.jsp" /> --%>
				</tr>
			</table>
		</div>
		<!--end of left content-->




		<jsp:include page="../menu/footer.jsp" />
	</div>
	<!--end of main container-->
</body>
</html>
