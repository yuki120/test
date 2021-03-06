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
	<title>ReviewInsert画面</title>

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

		h3 {
			color: blue;
		}

	</style>
</head>
<body>

	<s:include value="header.jsp" />

	<div id="main">
		<div id="top">
			<p>ReviewInsert</p>
		</div>
		<div>
			<h3>皆さまのレビュー投稿をお待ちしております！</h3>
				<s:form action="ReviewConfirmAction">
					<div class="error-color">
						<s:if test="errorMessage != ''">
							<s:property value="errorMessage" escape="false"/>
						</s:if>
					</div>

					<tr>
						<td>
							<label>商品選択：</label>
						</td>
						<td>
							<select name="productName" style="width:300px;">
								<s:iterator value="buyProductDTOList">
									<option value="<s:property value='productName'/>"><s:property value="productName"/></option>
								</s:iterator>
							</select>
						</td>
					</tr>

					<tr>
						<td>
							<label>ハンドルネーム：</label>
						</td>
						<td>
							<input type="text" size="38" name="handleName" value='<s:property value="handleName" />'/>
						</td>
					</tr>

					<tr>
						<td>
							<label>タイトル：</label>
						</td>
						<td>
							<input type="text" size="38" name="title" value='<s:property value="title" />'/>
						</td>
					</tr>

					<tr>
						<td>
							<label>コメント：</label>
						</td>
						<td>
							<textarea name="comment" rows="8" cols="40"><s:property value="comment"/></textarea>
						</td>
					</tr>

					<s:submit class="botton" value="送信"></s:submit>
				</s:form>
			<div>
				<span>レビューページに戻る場合は</span>
				<a href='<s:url action="GoReviewAction"/>'>こちら</a>
			</div>
		</div>
	</div>

	<s:include value="footer.jsp" />

</body>
</html>