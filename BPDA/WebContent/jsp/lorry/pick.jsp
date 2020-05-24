<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.tnbpda.vo.Dealer"%>
<%@page import="com.tnbpda.vo.Lorry"%>
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
Dealer user = (Dealer) session
.getAttribute(TNBPDAConstants.AUTH_USER); 
	List<Lorry> lorryList = (List<Lorry>) request
		.getAttribute(TNBPDAConstants.LORRY_LIST);
	System.out.println("inside list ...." + lorryList);
%>
<body>
	<div id="main_container">
  	<div id="main_content" style="height: 95%;">
			<jsp:include page="../menu/header.jsp" />
			<div id="main_content">
						<jsp:include page="../menu/leftnav.jsp" />
							<center>
								<b>Choose the Lorry
								</b>
								<hr />
							
								<form action="/tnbpda/lorryRenewal?option=2&ccid=<%=user.getCcNo()%>"
						onsubmit="return submitForm()" method="post" id="forms"
								name="forms">
								<select name="regno">
								<%if(lorryList == null || lorryList.size()==0) {%>
									<option >No Lorry availables</option>
								<%} 
								else {%>
								<%for(Lorry lor:lorryList){ %>
								<option value="<%=lor.getRegistrationNo()%>"><%=lor.getRegistrationNo()%></option>
								<%} }%>
								</select><br></br>
								<input
												src="/tnbpda/images/sub.jpg"
												id="searchsubmit" name="searchsubmit" type="image" value=""
												tabindex="2" /><br></br>
								</form>
		</center>
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