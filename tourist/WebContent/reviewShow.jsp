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
	<title>ReviewShow画面</title>

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

		h2 {
			color: red;
		}

		#top {
			width: 80%;
			margin: 30px auto;
			border: 1px solid #333;
		}

		#main {
			width: 100%;
			padding-bottom: 150px;
			text-align: center;
		}

		.review_search {
			text-align: center;
			margin-bottom: 30px;
		}

		.main_container {
			padding-left: 10%;
		}

		.review-list {
			width: 400px;
			height: 300px;
			display: inline;
			float: left;
			margin-left: 10%;
			margin-bottom: 7%;
			background-repeat: no-repeat;
		}

		.title {
			font-size: 20px;
			color: #FF77FF;
		}

		.productName {
			color: blue;
			font-weight: bold;
		}

		.comment {
			width: 250px;
			margin: 0 auto;
		}

		.bottom {
			clear: left;
		}

	</style>
	<script type="text/javascript">
		function submitAction(url) {
			$('form').attr('action', url);
			$('form').submit();
		}
	</script>

	<script>
		$(function() {
			var array = [
			"./images/hukidashi1.png",
			"./images/hukidashi2.png",
			"./images/hukidashi3.png",
			];

			var l = array.length;
			var r = Math.floor(Math.random()*l);
			var bgimgurl = array[r];
			$("div.review-list").css('background-image',('url("'+bgimgurl+'")'));
		});
	</script>
</head>
<body>

	<s:include value="header.jsp" />

	<div id="main">
		<div id="top">
			<p>ReviewShow</p>
		</div>

		<div class="review_search">
			<s:form action="ReviewSearchAction">
				<s:textfield name="searchWord" value="" placeholder="検索ワードを入力"/>
				<s:submit value="検索"/>
			</s:form>

			<s:if test="message != ''">
				<h2><s:property value="message" escape="false"/></h2>
			</s:if>
		</div>

		<div class="main_container">
			<s:iterator value="reviewDTOList">
				<div class="review-list">
					<p><br></p>
					<h2 class="title"><s:property value="title"/></h2>
					<p class="productName"><s:property value="productName"/></p>
					<p class="comment"><s:property value="comment"/></p>
					<p class="handleName">by <s:property value="handleName"/></p>
				</div>
			</s:iterator>
		</div>

		<p class="bottom">前画面に戻る場合は<a href='<s:url action="GoReviewAction"/>'>こちら</a></p>

	</div>

	<s:include value="footer.jsp" />

</body>
</html>