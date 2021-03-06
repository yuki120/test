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
	<title>BuyProductConfirm画面</title>

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
			height: 500px;
			padding-bottom: 150px;
			text-align: center;
		}

		h3 {
			color: red;
		}

		h4 {
			color: blue;
		}

	</style>
	<script type="text/javascript">
		function submitAction(url) {
			$('form').attr('action', url);
			$('form').submit();
		}
	</script>
</head>
<body>

	<s:include value="header.jsp" />

	<div id="main">
		<div id="top">
			<p>BuyProductConfirm</p>
		</div>
		<div>
			<s:form>
				<tr>
					<td>決済金額</td>
					<td>
						<s:if test="allTotalPrice == null">
							<s:property value="totalPrice"/><span>円</span>
						</s:if>
						<s:if test="allTotalPrice != null">
							<s:property value="allTotalPrice"/><span>円</span>
						</s:if>

					</td>
				</tr>
				<tr>
					<td>お支払い方法</td>
					<td><s:property value="session.pay" /></td>
				</tr>
				<tr>
					<td>お届け先</td>
					<td><s:property value="session.address1"/><span>　</span><s:property value="session.address2"/></td>
				</tr>
				<tr>
					<td>宛名</td>
					<td><s:property value="session.name"/>様</td>
				</tr>
				<tr>
					<td>ご連絡先</td>
					<td><s:property value="session.telNum"/></td>
				</tr>
				<tr>
					<td>確認メール送信先</td>
					<td><s:property value="session.email"/></td>
				</tr>

				<tr>
					<td><br><br></td>
				</tr>
				<tr>
					<td><input type="button" value="商品選択へ戻る" onclick="submitAction('HomeAction')" /></td>
					<td><input type="button" value="注文を確定する" onclick="submitAction('BuyProductConfirmAction')" /></td>
				</tr>
			</s:form>

		</div>
	</div>

	<s:include value="footer.jsp" />

</body>
</html>