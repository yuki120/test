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
	<title>PurchaseHistry画面</title>

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
			margin: 20px auto;
		}

		th {
			padding: 8px;
			background: #CCFF99;
			color: #333;
		}

		td {
			padding: 5px;
			background: #FFFFCC;
		}

		#top {
			width: 80%;
			margin: 30px auto;
			border: 1px solid #333;
		}

		#main {
			width: 100%;
			height: 500px;
			text-align: center;
			padding-bottom: 300px;
		}

		#text-right {
			display: inline-block;
			text-align: right;
		}

		.btn {
			color: red;
		}



	</style>
</head>
<body>

	<s:include value="header.jsp" />

	<div id="main">
		<div id="top">
			<p>PurchaseHistory</p>
		</div>
		<div>
			<s:if test="purchaseHistoryDTOList.size() == 0">
				<h2>ご購入情報はありません。</h2>
			</s:if>
			<s:elseif test="message == null">
				<h3>《ご購入履歴》</h3>
				<tr>
					<td>ユーザー名：<s:property value="session.name"/>様</td>
				</tr><br>
				<tr>
					<td>チケット送付先：<s:property value="session.address1"/>　<s:property value="session.address2"/></td>
				</tr>

				<table border="1">
					<tr>
						<th>商品名</th>
						<th>金額</th>
						<th>申込人数</th>
						<th>支払方法</th>
						<th>購入日</th>
					</tr>
					<s:iterator value="purchaseHistoryDTOList">
						<tr>
							<td><s:property value="productName" /></td>
							<td><s:property value="totalPrice" /><span>円</span></td>
							<td><s:property value="totalCount" /><span>名様</span></td>
							<td><s:property value="payment" /></td>
							<td><s:property value="insert_date" /></td>
						</tr>
					</s:iterator>
				</table>
				<s:form action="PurchaseHistoryAction">
					<input type="hidden" name="deleteFlg" value="1">
					<s:submit class="btn" value="削除" method="delete"/>
				</s:form>
			</s:elseif>
			<s:if test="message != null">
				<h3><s:property value="message"/></h3>
			</s:if>
			<div id="text-right">
				<p>MyPageへ戻る場合は<a href='<s:url action="MyPageAction"/>'>こちら</a></p>
				<p>ログアウトする場合は<a href='<s:url action="LogoutAction"/>'>こちら</a></p>
			</div>
		</div>
	</div>

	<s:include value="footer.jsp" />

</body>
</html>