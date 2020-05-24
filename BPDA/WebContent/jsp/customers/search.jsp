
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
%>

<form action="<%=request.getContextPath()%>/customer?option=4"
	onsubmit="return submitForm()" method="post" id="forms" name="forms">
	<table cellpadding="5" cellspacing="5" width="100%">
		<tr>
			<td colspan="2"><b>Welcome to 'Due' Customer Search</b></td>
		</tr>
		<!-- <tr>
									<td>Dealer Name</td>
									<td><input type="text" name="dname" size="20" /></td>
								</tr> -->
		<tr>
			<td>Search Criteria</td>
			<td>
			<table>
					<tr>
						<td><input type="radio" name="cs" value="adhar"></input> Adhar No</td>
					</tr>
					
					<tr>
						<td><input type="radio" name="cs" value="tin"></input>TIN No</td>
					</tr>
					<tr>
						<td><input type="radio" name="cs" value="dr"></input>District</td>
					</tr>
					 
					 
				</table></td>
		</tr>
		<tr>
			<td> Adhar No</td>
			<td><input type="text" name="adhar" value="" style="font: 10px verdana, arial, helvetica"/></td>
	   </tr>
	   	<tr>
			<td>TIN No</td>
			<td><input type="text" name="tin" value="" style="font: 10px verdana, arial, helvetica"/></td>
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
			<td colspan="2"><input
				src="<%=request.getContextPath()%>/images/sub.jpg" id="searchsubmit"
				name="searchsubmit" type="image" value="" tabindex="2" /></td>

		</tr>
	</table>
</form>
