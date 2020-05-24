<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.util.Date"%>
<%@page import="com.tnbpda.util.TNBPDAUtil"%>
<%@page import="com.tnbpda.vo.Calibration"%>
<%@page import="com.tnbpda.vo.User"%>
<%@page import="com.tnbpda.util.TNBPDAConstants"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TNBPDA</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style.css" media="screen" />

<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style.css" media="screen" />
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/tcal.css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/tcal.js"></script>
</head>
<%
	User user = (User) session.getAttribute(TNBPDAConstants.AUTH_USER);
	Calibration cali = (Calibration) request
			.getAttribute(TNBPDAConstants.CALIB);
%>
<body>
	<div id="main_container">

		<div id="main_content" style="height: 95%;">
			<jsp:include page="../menu/header.jsp" />



			<div id="main_content">
				<form action="<%=request.getContextPath()%>/calibration?option=1"
					onsubmit="return submitForm()" method="post" id="forms"
					name="forms">
					<input type="hidden" name="cc" value="<%=user.getUserName()%>" />
					<table border="1" width="100%">
						<tr>

							<td bgcolor="#EAF38C"><fieldset>
									<legend>RO Renewals</legend>
									<table cellpadding="5" cellspacing="5" border="0" width="100%">
								 
										<tr>
											<td colspan="3"><b>Desnsity Meters</b></td>
										</tr>

										<%
											Date date = cali.getHrdroMeterHSDDate();
											String strDate = "";
											if (date != null) {
												strDate = TNBPDAUtil.dateToString(date);
											}
										%>
										<tr>
											<td>Hydro Meter (MS)</td>
											<td>Ser.No <input type="text" name="hms"
												<%if(cali.getHrdroMeterMSNo()==null){%>value=""<%}else{%>value="<%=cali.getHrdroMeterMSNo()%>"<%}%>
												style="font: 10px verdana, arial, helvetica" /></td>
											<td>Exp.Date <input type="text" name="msdate"
												id="msdate" class="tcal" value="<%=strDate%>"
												style="font: 10px verdana, arial, helvetica"
												readonly="readonly" />
											</td>
										</tr>
											<tr>
											<td>Hydro Meter 2(MS)</td>
											<td>Ser.No <input type="text" name="hms"
												<%if(cali.getHrdroMeterMSNo()==null){%>value=""<%}else{%>value="<%=cali.getHrdroMeterMSNo()%>"<%}%>
												style="font: 10px verdana, arial, helvetica" /></td>
											<td>Exp.Date <input type="text" name="msdate"
												id="msdate" class="tcal" <%if(strDate==null){%>value=""<%}else{%>value="<%=strDate%>"<%}%>
												style="font: 10px verdana, arial, helvetica"
												readonly="readonly" />
											</td>
										</tr>
										<tr>
											<td>Hydro Meter (HSD)</td>
											<td>Ser.No <input type="text" name="hhsd"
												<%if(cali.getHrdroMeterHSDNo()==null){%>value=""<%}else{%>value="<%=cali.getHrdroMeterHSDNo()%>"<%}%>
												style="font: 10px verdana, arial, helvetica" /></td>
											<td>Exp.Date <input type="text" name="hsdDate"
												id="hsdDate" class="tcal"
												<%if(TNBPDAUtil.dateToString(cali.getHrdroMeterMSDate())==null){%>value=""<%}else{%>value="<%=TNBPDAUtil.dateToString(cali.getHrdroMeterMSDate())%>"<%}%>
												style="font: 10px verdana, arial, helvetica"
												readonly="readonly" />
											</td>
										</tr>
										<tr>
											<td>Hydro Meter 2 (HSD)</td>
											<td>Ser.No <input type="text" name="hhsd"
												<%if(cali.getHrdroMeterHSDNo()==null){%>value=""<%}else{%>value="<%=cali.getHrdroMeterHSDNo()%>"<%}%>
												style="font: 10px verdana, arial, helvetica" /></td>
											<td>Exp.Date <input type="text" name="hsdDate"
												id="hsdDate" class="tcal"
												<%if(TNBPDAUtil.dateToString(cali.getHrdroMeterMSDate())==null){%>value=""<%}else{%>value="<%=TNBPDAUtil.dateToString(cali.getHrdroMeterMSDate())%>"<%}%>
												style="font: 10px verdana, arial, helvetica"
												readonly="readonly" />
											</td>
										</tr>
										<tr>
											<td>Thermo Meter</td>
											<td>Ser.No <input type="text" name="therometer"
												<%if(cali.getTheromMeterNo()==null){%>value=""<%}else{%>value="<%=cali.getTheromMeterNo()%>"<%}%>
												style="font: 10px verdana, arial, helvetica" /></td>
											<td>Exp.Date <input type="text" name="tdate" id="tdate"
												class="tcal"
												<%if(TNBPDAUtil.dateToString(cali.getTheromMeterDate())==null){%>value=""<%}else{%>value="<%=TNBPDAUtil.dateToString(cali.getTheromMeterDate())%>"<%}%>
												style="font: 10px verdana, arial, helvetica"
												readonly="readonly" />
											</td>
										</tr>
										<tr>
											<td>Thermo Meter 2</td>
											<td>Ser.No <input type="text" name="therometer"
												<%if(cali.getTheromMeterNo()==null){%>value=""<%}else{%>value="<%=cali.getTheromMeterNo()%>"<%}%>
												style="font: 10px verdana, arial, helvetica" /></td>
											<td>Exp.Date <input type="text" name="tdate" id="tdate"
												class="tcal"
												<%if(TNBPDAUtil.dateToString(cali.getTheromMeterDate())==null){%>value=""<%}else{%>value="<%=TNBPDAUtil.dateToString(cali.getTheromMeterDate())%>"<%}%>			
												style="font: 10px verdana, arial, helvetica"
												readonly="readonly" />
											</td>
										</tr>
										<tr>
											<td colspan="3"><hr /></td>
										</tr>

										<tr>
											<td colspan="3"><b>Pumb calibration </b></td>
										</tr>
										<tr>

											<td colspan="3">Exp.Date <input type="text" name="pdate"
												id="pdate" class="tcal"
												<%if(TNBPDAUtil.dateToString(cali.getPumpCalibrateDate())==null){%>value=""<%}else{%>value="<%=TNBPDAUtil.dateToString(cali.getPumpCalibrateDate())%>"<%}%>
												readonly="readonly" />
											</td>
										</tr>
										<tr>
											<td colspan="3"><hr /></td>
										</tr>
										<tr>
											<td colspan="3"><b>Fire Extinguser calibration</b></td>
										</tr>
										<tr>

											<td colspan="3">Exp.Date <input type="text" name="edate"
												id="edate" class="tcal"
												<%if(TNBPDAUtil.dateToString(cali.getFireExtingDate())==null){%>value=""<%}else{%>value="<%=TNBPDAUtil.dateToString(cali.getFireExtingDate())%>"<%}%>
												style="font: 10px verdana, arial, helvetica"
												readonly="readonly" /></td>
										</tr>
										<tr>
											<td colspan="3"><hr /></td>
										</tr>
										<tr>
											<td colspan="3"><b> 5 Ltrs Can calibration</b></td>
										</tr>
										<tr>

											<td colspan="3">Exp.Date <input type="text" name="fdate"
												id="fdate" class="tcal"
												<%if(TNBPDAUtil.dateToString(cali.getFiveLitrDate())==null){%>value=""<%}else{%>value="<%=TNBPDAUtil.dateToString(cali.getFiveLitrDate())%>"<%}%>
												style="font: 10px verdana, arial, helvetica"
												readonly="readonly" />
											</td>
										</tr>
										<tr>
											<td colspan="2"><input
												src="<%=request.getContextPath()%>/images/sub.jpg"
												id="searchsubmit" name="searchsubmit" type="image" value=""
												tabindex="2" /></td>

										</tr>
									</table>
								</fieldset></td>

		<jsp:include page="../menu/footer.jsp" />
	</div>
	<!--end of main container-->
</body>
</html>