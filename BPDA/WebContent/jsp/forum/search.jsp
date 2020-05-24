
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.tnbpda.util.TNBPDAConstants"%>
<%@page import="com.tnbpda.vo.User"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<script type="text/javascript">
	function submitForm() {

		try {
			 
			return true;
		} catch (err) {
			alert(err.description);
			return false;
		}
	}
</script>

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
%>

<form action="<%=request.getContextPath()%>/forum?option=2"
	onsubmit="return submitForm()" method="post" id="forms" name="forms">
	<table cellpadding="5" cellspacing="5" width="100%">
		<tr>
			<td colspan="2"><b>Welcome to forum </b></td>
		</tr>
		<!-- <tr>
									<td>Dealer Name</td>
									<td><input type="text" name="dname" size="20" /></td>
								</tr> -->
		<tr>
			<td colspan="2">Search Criteria</td>
			 
		</tr>
		 
		 <tr>
										<td>Category:</td>
										<td><select name="cat" style="font: 10px verdana, arial, helvetica">
												<option value="gst">GST</option>
												<option value="ro">RO</option>
												<option value="com">Company</option>
												<option value="oth">Others</option>
												<option value="all">All</option>
										</select></td>
									</tr>
		<tr>
			<td colspan="2"><input
				src="<%=request.getContextPath()%>/images/sub.jpg" id="searchsubmit"
				name="searchsubmit" type="image" value="" tabindex="2" /></td>

		</tr>
	</table>
</form>
