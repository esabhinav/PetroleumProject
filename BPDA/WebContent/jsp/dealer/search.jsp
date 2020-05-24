
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.tnbpda.util.TNBPDAConstants"%>
<%@page import="com.tnbpda.vo.User"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<script type="text/javascript">
	function choose(opt) {
		try{
	 //	alert(opt);
		if (opt == 's') {
			 
			document.getElementById("sl").disabled = false; 
			document.getElementById("dr").disabled = true; 
			document.getElementById("tr").disabled = true;  
			document.getElementById("cc").disabled = true; 
		} else if (opt == 't') {	
			 
			document.getElementById("tr").disabled = false; 
			document.getElementById("sl").disabled = true; 
			document.getElementById("dr").disabled = true; 

			document.getElementById("cc").disabled = true; 
		} else if (opt == 'd') {
			 
			document.getElementById("dr").disabled = false; 
			document.getElementById("sl").disabled = true; 
			
			document.getElementById("tr").disabled = true; 
			document.getElementById("cc").disabled = true; 
		} else {
		 
			document.getElementById("cc").disabled = false; 
			document.getElementById("sl").disabled = true; 
			document.getElementById("dr").disabled = true;  
			document.getElementById("tr").disabled = true; 
			
		}
		}catch(err){
			alert(err.description);
		}
	}
	function submitForm() {

		try {

			return true;
		} catch (err) {
			alert(err.description);
			return false;
		}
	}
</script>
<style type="text/css">
<!--
.dataTables_filter input {
margin-left :-5em;}
-->
</style>

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

<form action="<%=request.getContextPath()%>/dealer?option=4"
	onsubmit="return submitForm()" method="post" id="forms" name="forms">
	<table cellpadding="5" cellspacing="5" width="50%" border="0">
		<tr>
			<td colspan="2"><b>Welcome to dealer Search</b></td>
		</tr>
		<!-- <tr>
									<td>Dealer Name</td>
									<td><input type="text" name="dname" size="20" /></td>
								</tr> -->
		<tr>
			<td>Search Criteria</td>
			<td><table>
					<tr>
						<td><input type="radio" name="ds" value="sl"
							onclick="choose('s')"></input> Supply Location</td>
					</tr>
					<tr>
						<td><input type="radio" name="ds" value="tr"
							onclick="choose('t')"></input> Terriority</td>
					</tr>
					<tr>
						<td><input type="radio" name="ds" value="dr"
							onclick="choose('d')"></input>District</td>
					</tr>
					<tr>
						<td><input type="radio" name="ds" value="cc"
							onclick="choose('c')"></input>CCNo</td>
					</tr>
				</table></td>
		</tr>
		<tr >
			<td>CC No</td>
			<td><input type="text" name="cc" id="cc" value="173813" disabled="disabled"
				style="font: 10px verdana, arial, helvetica" /></td>
		</tr>
		<tr>
			<td>Supply location</td>
			<td><select name="sl" id="sl" disabled="disabled"
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
			<td>Terriority</td>
			<td><select name="tr" id="tr" disabled="disabled"
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
			<td>District</td>
			<td><select name="dr" id="dr" disabled="disabled"
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
		<tr >
			<td colspan="2"><input
				src="<%=request.getContextPath()%>/images/sub.jpg" id="searchsubmit"
				name="searchsubmit" type="image" value="" tabindex="2" /></td>

		</tr>
	</table>
</form>
