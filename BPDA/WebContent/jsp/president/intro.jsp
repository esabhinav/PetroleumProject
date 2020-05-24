<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="com.tnbpda.vo.Dealer"%>
<%@page import="com.tnbpda.vo.User"%>
<%@page import="com.tnbpda.util.TNBPDAConstants"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TNBPDA</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/style.css" media="screen" />
<script type="text/javascript">
	function submitForm() {

		try {

			return false;
		} catch (err) {
			alert(err.description);
			return false;
		}
	}
</script>
<style type="text/css">
input#image-button {
	background: #ccc url("<%=request.getContextPath()%>/images/db.jpg")
		no-repeat bottom left;
	padding-left: 16px;
	height: 89px;
}
</style>
<style>
div.container {
    width: 100%;
    border: 1px solid gray;
}

header, footer {
    padding: 1em;
    color: white;
    background-color: rgb(0, 0, 255);
    clear: left;
    text-align: center;
}

nav {
    float: left;
    max-width: 160px;
    margin: 0;
    padding: 1em;
}

nav ul {
    list-style-type: none;
    padding: 0;
}
   
nav ul a {
    text-decoration: none;
}

article {
    margin-left: 170px;
    border-left: 1px solid gray;
    padding: 1em;
    overflow: hidden;
}
</style>
</head>

<body>
	<div class="container">

		<header>
		<h1>Tamil Nadu Bharat Petroluem Dealers Association</h1>
		</header>

		

		<article>
		<h1>London</h1>
		<p>London is the capital city of England. It is the most populous
			city in the United Kingdom, with a metropolitan area of over 13
			million inhabitants.</p>
		<p>Standing on the River Thames, London has been a major
			settlement for two millennia, its history going back to its founding
			by the Romans, who named it Londinium.</p>
		</article>

		<footer>Copyright &copy; W3Schools.com</footer>

	</div>
</body>
</html>