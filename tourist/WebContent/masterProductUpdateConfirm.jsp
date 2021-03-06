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
	<title>masterProductUpdateConfirm画面</title>

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
			height: 500px;
			text-align: center;
			padding-bottom: 500px;
		}

		.btn {
			text-aligan: center;
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
			<p>MasterProductUpdateConfirm</p>
		</div>
		<div>
			<s:form action="MasterProductUpdateCompleteAction">
				<s:iterator value="productUpdateList">
					<tr>
						<td>商品名：</td>
						<td><input type="text" size="30" name="product_name" value="<s:property value='productName'/>"></td>
					</tr>
					<tr>
						<td>値段：</td>
						<td><input type="text" size="30" name="product_price" value="<s:property value='productPrice'/>"></td>
					</tr>
					<tr>
						<td>在庫：</td>
						<td><input type="text" size="30" name="product_stock" value="<s:property value='productStock'/>"></td>
					</tr>
					<tr>
						<td>商品説明：</td>
						<td><input type="text" size="30" name="product_description" value="<s:property value='productDescription'/>"></td>
					</tr>
					<tr>
						<td>商品画像：</td>
						<td><input type="text" size="30" name="image_file_path" value="<s:property value='imageFilePath'/>"></td>
					</tr>
				</s:iterator>
			</s:form>
			<div>
				<p><input type="button" value="戻る" onclick="submitAction('MasterProductUpdateAction')" />　　
				<input type="button" value="更新" onclick="submitAction('MasterProductUpdateCompleteAction')" /></p>
			</div>
		</div>
	</div>

	<s:include value="footer.jsp" />

</body>
</html>