<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta http-equiv="Content-Style-Type" content="text/css"/>
<meta http-equiv="imagetoolbar" content="no"/>
<meta name="description" content=""/>
<meta name="keywords" content=""/>

<style type="text/css">
	#header {
		width: 100%;
		height: 70px;
		background-color: #8EF1FF;
	}

	.link_top a {
		float: left;
		display: inline-block;
		text-decoration: none;
	}

	.link_top img {
		width: 100px;
		height: 70px;
		margin-left: 30px;
	}

	#header ul {
		float: right;
		padding-right: 20px;
	}

	#header ul li{
	    float: left;
	    line-height: 5px;
	    list-style: none;
	    font-size: 15px;
	    display: inline-block;
		padding: 20px;
		transition: .3s;
		transform: scale(1);
	}

	#header ul li:hover {
		transform: scale(1.05);
	}

	.link {
		text-decoration: none;
		color: blue;
		font-family: sans-serif;
		font-weight: 700;
		text-shadow:2px 2px 4px white;
	}

</style>

<div id="header">

	<div class="link_top">
		<a href="http://localhost:8080/tourist/"><img src="./images/airplane-01.png">TOP PAGE</a>
	</div>

	<ul>
		<li><a class="link" href='<s:url action="LoginAction" />'>LOGIN</a></li>
		<li><a class="link" href='<s:url action="ProductShowAction" />'>PRODUCTS</a></li>
		<li><a class="link" href='<s:url action="GoReviewAction" />'>REVIEW</a></li>
		<li><a class="link" href='<s:url action="MyPageAction" />'>MY PAGE</a></li>
		<li><a class="link" href='<s:url action="LogoutAction" />'>LOGOUT</a></li>
	</ul>
</div>