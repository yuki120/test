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
	<title>MasterNewProduct画面</title>

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
			text-align: center;
		}

		table .botton {
			margin-top: 20px;
			margin-right: 40%;
		}

		.error-color {
			color: red;
		}

	</style>
</head>
<body>

	<s:include value="header.jsp" />

	<div id="main">
		<div id="top">
			<p>MasterNewProductInsert</p>
		</div>
		<div>
			<h3>追加する商品情報を入力してください。</h3>
				<s:form action="MasterNewProductConfirmAction">
					<div class="error-color">
						<s:if test="errorMessage != ''">
							<s:property value="errorMessage" escape="false"/>
						</s:if>
					</div>

					<tr>
						<td>
							<label>商品カテゴリ：</label>
						</td>
						<td>
							<input type="text" size="30" name="productCategory" value=""/>
						</td>
					</tr>

					<tr>
						<td>
							<label>商品名：</label>
						</td>
						<td>
							<input type="text" size="30" name="productName" value=""/>
						</td>
					</tr>

					<tr>
						<td>
							<label>値段：</label>
						</td>
						<td>
							<input type="text" size="30" name="productPrice" value=""/>
						</td>
					</tr>

					<tr>
						<td>
							<label>在庫：</label>
						</td>
						<td>
							<input type="text" size="30" name="productStock" value="" />
						</td>
					</tr>

					<tr>
						<td>
							<label>商品説明：</label>
						</td>
						<td>
							<input type="text" size="30" name="productDescription" value=""/>
						</td>
					</tr>

					<tr>
						<td>
							<label>商品画像：</label>
						</td>
						<td>
							<input type="text" size="30" name="imageFilePath" value=""/>
						</td>
					</tr>

					<s:submit class="botton" value="登録"></s:submit>
				</s:form>

			<div>
				<a href='<s:url action="HomeAction"/>'>管理画面へ戻る</a>
			</div>
		</div>
	</div>

	<s:include value="footer.jsp" />

</body>
</html>