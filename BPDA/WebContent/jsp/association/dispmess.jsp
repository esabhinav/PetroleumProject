	<%@page import="com.tnbpda.vo.Dealer"%>
<%@page import="com.tnbpda.util.TNBPDAConstants"%>
<%@page import="java.util.List"%>
<%@page import="com.tnbpda.vo.Message"%>
<% String cc = request.getParameter("cc"); %>
<%
	Dealer user = (Dealer) session
.getAttribute(TNBPDAConstants.AUTH_USER);
%>
<style>
.button1:link, .button:visited {
	border-radius: 10px;
 	width: 100px;
    border: none;
    color: white;
    padding: 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
    margin: 6px 6px;
}
.button2:link, .button2:visited{
	border-radius: 10px;
 	width: 40px;
    border: none;
    color: white;
    padding: 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 12px;
    margin: 6px 6px;
}
.button1 {background-color: lightgreen;  cursor: pointer;/* Green */}
.button2 {background-color: red;  cursor: pointer;}

.message_table{
    border-collapse: collapse;
}

.message_table{
    border: 1px solid black;
}
</style>
<!--  <style>
 .message_table: thead{
 position:fixed;
 }
 .message_table{
    overflow:scroll;
    height:200px;
}


 </style> -->
<tr>
								<td>
									<%
										if (user.getAccessLevel().equals("Admin")
																		|| user.getAccessLevel().equals("SuperAdmin")) {
									%>
									<tr>
										<td><a class="button1 button" href="<%=request.getContextPath()%>/jsp/admin/message.jsp">Add
												New Message</a>
											</td>
									</tr> <%
 	}
 %>
									<table cellpadding="5" cellspacing="5" id="myTable" class="message_table"
										width="100%" border="0">
                                     <thead><tr><th class="message_table">Created By</th><th class="message_table">Date</th><th class="message_table"> Subject</th><th class="message_table">Messages</th><th class="message_table">Delete</th></tr></thead>
										<%
											List<Message> listMsg = (List<Message>) request
																			.getAttribute(TNBPDAConstants.MSG_LIST); 
										System.out.println("insdie msg"+listMsg.size());
																	for (Message msg : listMsg) { 
																		 System.out.println("alll "+msg.isAll());
																			if(msg != null)
																		if (msg.isAll() ||
																						(user.getTerriority() != null
																						&& Byte.parseByte(user.getTerriority()) == msg
																								.getTerriority()) || (user
																						.getSupplyLocation() != null
																						&& Byte.parseByte(user.getSupplyLocation()) == msg
																								.getSupplyLocation())) {
										%>
										<tr class="message_table">
											<td class="message_table"><%if(msg.getCreatedBy().equals("119073")){%>Secretary<%}else if(msg.getCreatedBy().equals("111085")){%>Treasurer<%}else if(msg.getCreatedBy().equals("113908")){%>President<%}else{%>IT Team<%} %></td>
											<td width="10%" class="message_table"><%=msg.getDate()%></td>
											<td width="10%" class="message_table"><%=msg.getSubject()%></td>
											<td colspan="1" width="80%" class="message_table"><%=msg.getMessage()%></td>
									 
											<%
										if (user.getAccessLevel().equals("Admin")
																		|| user.getAccessLevel().equals("SuperAdmin")) {
									%>
											<td class="message_table"><a class="button2 button" href="<%=request.getContextPath()%>/admin?option=2&mid=<%=msg.getMid()%>" onclick="return confirm('Are you sure want to delete?')">Delete</a></td>
											<%
												}}}
											%>
										</tr>
									 
									</table>