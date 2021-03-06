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
	<title>ReviewInsertConfirm画面</title>

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
			border-spacing: 15px;
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

		.btn {
			text-align: center;
		}

		.btn input {
			margin: 15px;
		}

		#box img {
			width: 250px;
			height: 200px;
		}

	</style>
</head>

<script type="text/javascript">
	function submitAction(url) {
		$('form').attr('action', url);
		$('form').submit();
	}
</script>

<body>

	<s:include value="header.jsp" />


	<div id="main">
		<div id="top">
			<p>ReviewInsertConfirm</p>
		</div>
		<div>
			<h3>登録する内容は以下でよろしいですか？</h3>
			<table>
				<s:form action="ReviewCompleteAction">

					<tr id="box">
						<td>
							<label>商品名：</label>
						</td>
						<td>
							<s:property value="productName" escape="false"/>
							<input type="hidden" name="productName" value='<s:property value="productName"/>'>
						</td>
					</tr>

					<tr id="box">
						<td>
							<label>ハンドルネーム：</label>
						</td>
						<td>
							<s:property value="handleName" escape="false"/>
							<input type="hidden" name="handleName" value='<s:property value="handleName"/>'>
						</td>
					</tr>

					<tr id="box">
						<td>
							<label>タイトル：</label>
						</td>
						<td>
							<s:property value="title" escape="false"/>
							<input type="hidden" name="title" value='<s:property value="title"/>'>
						</td>
					</tr>

					<tr id="box">
						<td>
							<label>コメント：</label>
						</td>
						<td>
							<s:property value="comment" escape="false"/>
							<input type="hidden" name="comment" value='<s:property value="comment"/>'>
						</td>
					</tr>

				</s:form>
			</table>

			<div class="btn">
				<input type="button" value="戻る" onclick="submitAction('ReviewBackAction')" />
				<input type="button" value="投稿" onclick="submitAction('ReviewCompleteAction')" />
			</div>
		</div>
	</div>

	<s:include value="footer.jsp" />

</body>
</html>