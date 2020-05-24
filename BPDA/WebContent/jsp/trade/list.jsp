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
				<table border="1" width="100%">

					<tr>
						<jsp:include page="../menu/leftnav.jsp" />
						 <td> 10 Facts About Petroleum
This entry was posted on November 11, 2016 by Charlie.
<br/>
10 Facts About Petroleum
Petroleum is one of the major commodities around the world. Used to fuel vehicles and heat homes, a large quantity of the world's supply spends most of the time inside an oil tank, just waiting to be used. However, when it comes to the fuel itself petroleum is a very versatile and fascinating substance. Want to know more? We've put together our top ten facts to get you up to speed.
<br/>
Crude Oil Tanks
Petroleum is extracted from the earth and, in its original form, is a thick, black liquid. Crude oil is refined down into a number of different products, including petroleum. Popular alternatives to this fossil fuel include vegetable oil which is derived from plants and other natural products.
<br/>
Where does Crude Oil Come From
<br/>
The crude oil itself comes from the fossils of animals and plants. Crude oil is the main component of the petroleum that we use all over the world!
<br/>
Petroleum as Fuel
Petroleum is often used to fuel vehicles and machines, alongside diesel and other fuel sources. It is efficient and prices can be very competitive, meaning it is a viable fuel for planes, cars, trucks and motorcycles amongst many others.
<br/>
It is All Around You and You Don't Even Know
<br/>
Oil is extremely important in your daily life. You can use it as fuel for vehicles and other means of transportation. Even the lipstick you use every morning, the paint you bought for working on the interior walls and even some medicines you take have petroleum in them.
<br/>
While utilised in different forms to the norm, it can be said that petroleum is extremely multipurpose.
<br/>
It Can be Converted
<br/>
Crude oil can be changed into different types of fuels and petroleum itself is a converted product. The other converted forms include diesel, kerosene, gasoline, jet fuel and LPG, to name but a few.
<br/>
Petroleum is Measured Differently
<br/>
While consumers often buy fuel and oil in litres and gallons, this is not the way it is measured at wholesale. The correct measurement for petroleum is barrels or BBL. For instance, 1 BBL of petroleum is equivalent to 42 gallons of oil.
<br/>
Synthetic Petroleum
<br/>
Synthetic petroleum is extremely beneficial for different things. It is mostly used as a lubricant in jet engines.
<br/>
The Biggest Oil Producer in the World
<br/>
The largest producer of oil is the country with the biggest reserves; Saudi Arabia. Many believe that the United States of America are a big producer of oil, too, but they are, in fact, only 11th in the list of the countries which produce the most oil.
<br/>
To compare, around 264 billion barrels of oil are produced in Saudi Arabia while the United States manages to produce just 21 billion barrels.
<br/>
Where it Goes
<br/>
While it is in demand in all areas of the globe, the top three countries that consume petroleum are Japan, China and the USA.
<br/>
In one 24 hour period, China consumes 10.3 million barrels and Japan consumes 4.7 million barrels. The USA uses approximately 20 million barrels of petroleum oil every single day, mostly as fuel.
<br/>
Petroleum Needs Stability
<br/>
As a refined fuel, petroleum needs to be maintained in certain conditions in order to remain stable. While it is not likely to become volatile, external factors such as the weather need to be considered when storing petroleum as it can alter properties of the fuel, changing the way it operates. </td>
						 
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