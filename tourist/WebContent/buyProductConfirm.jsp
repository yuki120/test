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
		}

		#top {
			width: 80%;
			margin: 30px auto;
			border: 1px solid #333;
		}

		#main {
			width: 100%;
			height: 100%;
			text-align: center;
			margin-bottom: 20%;
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
				<s:if test="buyProductDTOList.size() == 0">
					<h2>お買い物カートに商品が入っておりません。</h2>
				</s:if>

				<s:iterator value="buyProductDTOList">
					<s:if test="count != 0">
						<h4>【選択商品】</h4>
						<table>
							<tr>
								<td>商品名</td>
								<td><s:property value="productName"/></td>
							</tr>
							<tr>
								<td>金額</td>
								<td>
									<s:property value="totalPrice"/>
									<input type="hidden" name="totalPrice" value='<s:property value="totalPrice"/>'>
									<span>円</span>
								</td>
							</tr>
							<tr>
								<td>お申込人数</td>
								<td>
									<s:property value="count"/>
									<span>名様</span>
								</td>
							</tr>
						</table>
					</s:if>
				</s:iterator><br>
				<s:if test="buyProductDTOList.size() > 1">
					<h3><span>合計金額：</span><s:property value="session.allTotalPrice"/><span>円</span></h3>
					<input type="hidden" name="allTotalPrice" value='<s:property value="session.allTotalPrice"/>'>
				</s:if><br>

				<s:if test="buyProductDTOList.size() > 0">
					<h4>【お支払方法選択】</h4>
					<input type="radio" name="pay" value="1" checked="checked">銀行振込
					<input type="radio" name="pay" value="2">クレジットカード
				</s:if><br>

				<tr>
					<td><br><br></td>
				</tr>
				<tr>
					<td><input type="button" value="戻る" onclick="submitAction('HomeAction')" /></td>
					<td><input type="button" value="ご購入手続き" onclick="submitAction('BuyProductUserInfoConfirmAction')" /></td>
				</tr>
			</s:form>

		</div>
	</div>

	<s:include value="footer.jsp" />

</body>
</html>