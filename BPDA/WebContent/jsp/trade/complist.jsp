<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.tnbpda.vo.User"%>
<%@page import="com.tnbpda.util.TNBPDAConstants"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TNBPDA</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style.css" media="screen" />
</head>
<%
	User user = (User) session.getAttribute(TNBPDAConstants.AUTH_USER);
%>
<body>
	<div id="main_container">

		<div id="main_content" style="height: 95%;">
			<jsp:include page="../menu/header.jsp" />


			<div id="main_content">
				<table border="1" width="100%" >

					<tr>
						<jsp:include page="../menu/leftnav.jsp" />
						<td bgcolor=""><table cellpadding="5" cellspacing="5">
								<tr>
									<td><a target="_blank"
										href="https://www.dropbox.com/s/ljaigm8kck6bcl7/MDG-2012.pdf?dl=0">MDG_2012</a></td>
								</tr>
								<tr>
									<td><a target="_blank"
										href="https://www.dropbox.com/sh/ln63ilo31wn3j5g/AAA2m6wjlF1afTPkVIsyDdiHa/Tamilnadu-Shops-and-Estabilishment-Act-1947.pdf?dl=0">Tamilnadu
											Shops and Estabilishment Act 1947</a></td>
								</tr>
								<tr>
									<td><a target="_blank"
										href="https://www.dropbox.com/sh/ln63ilo31wn3j5g/AACs6Uzn5DvCKylYAR26gXJia/petroleumact1934.pdf?dl=0">Petroleum
											ACT1934</a></td>
								</tr>
								<tr>
									<td><a target="_blank"
										href="https://www.dropbox.com/sh/ln63ilo31wn3j5g/AACMnIxo3QrH0FPcMjW3TIz9a/Essential_Commodity_Act_1955%28No_10_of_1955%29.pdf?dl=0">Essential_Commodity_Act_1955</a></td>
								</tr>
								<tr>
									<td><a target="_blank" href=""></a></td>
								</tr>
								<tr>
									<td><a target="_blank"
										href="https://www.dropbox.com/sh/ln63ilo31wn3j5g/AACaMiwiAQvPAuikMpqlz_4Ha?dl=0&preview=ThePaymentofBonusAct1965_0.pdf">The
											Payment of Bonus Act 1965</a></td>
								</tr>

							</table></td>
						<td bgcolor=""><table>
								<tr>
									<td><a target="_blank"
										href="https://www.dropbox.com/sh/ln63ilo31wn3j5g/AABNFk5gIBw9NsEzqxssmawja/ESIAct1948Amendedupto010610.pdf?dl=0">ESI
											Act 1948</a></td>
								</tr>
								<tr>
									<td><a target="_blank"
										href="https://www.dropbox.com/sh/ln63ilo31wn3j5g/AAC1r1F-z7d9iQdLEiuULsQAa/payment-of-gratuity-act-1972.pdf?dl=0">Payment-of-Gratuity-ACT-1972</a></td>
								</tr>
								<tr>
									<td><a target="_blank"
										href="https://www.dropbox.com/sh/ln63ilo31wn3j5g/AABaiKzHY9qFFf1aWqLQ5phMa/EPFAct1952.pdf?dl=0">EPF
											Act 1952</a></td>
								</tr>
								<tr>
									<td><a target="_blank"
										href="https://www.dropbox.com/sh/ln63ilo31wn3j5g/AAASNobN1HpdO9C2Fg3KTrc_a/Code%20on%20Wages%20Bill%202017-As%20introduced%20in%20Lok%20Sabha.pdf?dl=0">Code
											On Wages</a></td>
								</tr>
								<tr>
									<td><a target="_blank" href=""></a></td>
								</tr>

							</table></td>
					</tr>
					<tr>
						<td></td>
						<td bgcolor=""><table>
								<tr>
									<td><a target="_blank"
										href="https://www.dropbox.com/sh/ln63ilo31wn3j5g/AAAPFAIu5UJY7kIBZU0VF25ta/cgst-rules-30Aug2017.pdf?dl=0">CGST
											Rules</a></td>
								</tr>
								<tr>
									<td><a target="_blank"
										href="https://www.dropbox.com/sh/ln63ilo31wn3j5g/AACnyQzRiJZCAjb9ALC2wVOIa/cgst-act.pdf?dl=0">CGST
											ACT</a></td>
								</tr>
								<tr>
									<td><a target="_blank" href=""></a></td>
								</tr>
								<tr>
									<td><a target="_blank" href=""></a></td>
								</tr>

							</table></td>
						<td bgcolor=""><iframe width="560" height="315" src="https://www.youtube.com/embed/S-KUtxnMqEo" frameborder="0" allowfullscreen></iframe></td>
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