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
	<title>ReviewTop画面</title>

	<style type="text/css">
		body {
			margin: 0;
			padding: 0;
			line-height: 1.6;
			letter-spacing: 1px;
			font-family: Verdana, Helvetica, sans-serif;
			font-size: 12px;
			color: #333;
			background: url(./images/watermark.jpg) center center / cover no-repeat fixed;
		}

		table {
			text-align: center;
			margin: 0 auto;
		}

		#top {
			width: 80%;
			height: 42px;
			margin: 30px auto;
			border: 1px solid #333;
		}

		#main {
			width: 100%;
			height: 500px;
			text-align: center;
		}

	</style>
</head>
<body>

	<s:include value="header.jsp" />

	<div id="main">
		<div id="top">
			<p>ReviewTop</p>　
		</div>
		<div>
			<h2>《レビューページ》</h2>
			<p>皆さまのご感想を閲覧、投稿することができるページとなっております♪</p><br>

			<p>☆<a href='<s:url action="ReviewShowAction"/>'>レビューを見る</a>☆</p>
			<p>☆<a href='<s:url action="ReviewAction"/>'>レビューを投稿する</a>☆</p><br>

			<p>Homeへ戻る場合は<a href='<s:url action="GoHomeAction" />'>こちら</a></p>

		</div>
	</div>

	<s:include value="footer.jsp" />

</body>
</html>