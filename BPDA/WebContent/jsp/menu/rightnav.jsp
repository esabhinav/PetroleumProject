 
<%@page import="com.tnbpda.util.TNBPDAConstants"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<td width="15%" valign="top"><table border="0">

		<tr>
			<td> 
				<%
 					System.out.println("in lefeNAV ..");
 				 							List<String> blist = (List<String>) session.getAttribute(TNBPDAConstants.DEALERS_LIST);
 				 				try{
 				 							if (blist != null) 

 				 								{
 				%>
				<table border="0" width="100%">
					<tr>
						<td><b>Happy Birthday </b></td>
					</tr>
					<%
						for (String name : blist) 
								{
					%>
					<tr>
						<td><b><i><marquee><%=name%></marquee> </i></b></td>
					</tr>
					<%
						} 
					%>
					<tr>
						<td><img width="100" height="100"
							src="<%=request.getContextPath()%>/images/bd.jpg" /></td>
					</tr>
				</table> <%
 	} 
 	}  catch(Exception e) {
 		System.out.println("Eception in leftNav "+e.getMessage());
 	}
 %>
			</td>
		</tr>

		<!-- <tr>
			<td>IBM Certification Preparation</td>
		</tr>

		<tr>
			<td><a target="_blank"
				href="<%=request.getContextPath()%>/images/ibmcert.jpg"><img
					src="<%=request.getContextPath()%>/images/ibmcert.jpg" width="150"
					height="150" /></a></td>
		</tr> -->

		<tr>
			<td><hr></td>
		</tr>
		<tr>
			<td><!-- <b>Nelson Mandela -</b> (18/7/1918 - 5/12/2013)<br />
				Mandela has received more than 250 awards over four decades,
				including the 1993 Nobel Peace Prize. --></td>
		</tr>

		<tr>
			<td><a target="_blank"
				href="<%=request.getContextPath()%>/images/nelson.jpg"><img
					src="<%=request.getContextPath()%>/images/nelson.jpg" width="150"
					height="150" /></a></td>
		</tr>

	</table></td>