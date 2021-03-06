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
	<title>Master画面</title>

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

		#color {
			color: red;
		}

	</style>
</head>
<body>

	<s:include value="header.jsp" />

	<div id="main">
		<div id="top">
			<p>Master</p>　
		</div>
		<div>
			<h2>《管理者ページ》</h2>

			<div>
				<p>更新する内容を選択してください。</p>
				<p>☆<a href='<s:url action="MasterProductUpdateAction"/>'>商品情報更新</a>☆</p>
				<p>☆<a href='<s:url action="MasterNewProductAction"/>'>新商品追加</a>☆</p>
				<p>☆<a href='<s:url action="MasterProductDeleteAction"/>'>商品削除</a>☆</p>
				<p>☆<a href='<s:url action="MasterReviewDeleteAction"/>'>レビュー削除</a>☆</p><br>
				<p>ログアウトする場合は<a href='<s:url action="LogoutAction" />'>こちら</a></p>
				<p id="color">※作業終了後は必ずログアウトしてください。</p>
			</div>
		</div>
	</div>

	<s:include value="footer.jsp" />

</body>
</html>