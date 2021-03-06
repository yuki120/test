<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="Content-Style-Type" content="text/css"/>
	<meta http-equiv="Content-Script-Type" content="text/javascript"/>
	<meta http-equiv="imagetoolbar" content="no"/>
	<meta name="description" content=""/>
	<meta name="keywords" content=""/>
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script type="text/javascript" src="js/jquery.arctext.js"></script>
	<title>Home画面</title>

	<style type="text/css">
		body {
			margin: 0;
			padding: 0;
			line-height: 1.6;
			letter-spacing: 1px;
			font-family: Verdana, Helvetica, sans-serif;
			font-size: 12px;
			background: url(./images/travel-world.jpg) center center / cover no-repeat fixed;
		}

		table {
			text-align: center;
			margin: 0 auto;
		}

		#top {
			width: 780px;
			margin: 30px auto;
			font-size: 110px;
			font-width: 2000;
			font-family: Comic Sans MS;
			color: white;
			-webkit-text-stroke: 2px #00BFFF;
		}

		#main {
			width: 100%;
			height: 500px;
			text-align: center;
		}

		#text-center {
			display: inline-block;
			text-align: center;
		}

		#text-center p {
			font-size: 20px;
		}

		.btn {
			width: 180px;
			height: 65px;
			color: white;
		    background-color: orange;
		    border: 3px solid orange;
		    border-radius: 10px;
		    box-shadow:2px 2px 2px #555;
		    font-size: 23px;
		}

	</style>
	<script type="text/javascript">
		$(function() {
			$('#top').arctext({radius: 400});
			$('#top').hide().fadeIn('slow');
		});
	</script>
</head>
<body>

	<s:include value="header.jsp" />


	<div id="main">
		<div id="top">
			<p>TOURIST</p>
		</div><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		<div id="text-center">
			<s:if test="#session.id != null || #session.masterId != null">
				<s:form action="HomeAction">
					<s:submit class="btn" value="商品を見る"/>
				</s:form>
				<p>ログアウトする場合は
				<a href='<s:url action="LogoutAction" />'>こちら</a></p>
			</s:if>

			<s:else>
				<s:form action="HomeAction">
					<s:submit class="btn" value="★ログイン★"/>
				</s:form>
			</s:else>

		</div>
	</div>




</body>
</html>