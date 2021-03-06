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
	<title>UserCreate画面</title>

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
			<p>UserCreate</p>
		</div>
		<div>
			<table>
				<s:form action="UserCreateConfirmAction">

					<tr>
						<td>
							<label>ユーザーID:</label>
						</td>
						<td>
							<input type="text" name="userId" value='<s:property value="userId" />'/>
						</td>
						<td class="error-color">
							<s:if test="errorId != ''">
								<s:property value="errorId" escape="false"/>
							</s:if>
						</td>
					</tr>

					<tr>
						<td>
							<label>ユーザーPASS:</label>
						</td>
						<td>
							<input type="text" name="userPassword" value=""/>
						</td>
						<td class="error-color">
							<s:if test="errorPass != ''">
								<s:property value="errorPass" escape="false"/>
							</s:if>
						</td>
					</tr>

					<tr>
						<td>
							<label>お名前:</label>
						</td>
						<td>
							<input type="text" name="name" value='<s:property value="name"/>' />
						</td>
						<td class="error-color">
							<s:if test="errorName != ''">
								<s:property value="errorName" escape="false"/>
							</s:if>
						</td>
					</tr>

					<tr>
						<td>
							<label>おなまえ(ふりがな):</label>
						</td>
						<td>
							<input type="text" name="nameKana" value='<s:property value="nameKana"/>'/>
						</td>
						<td class="error-color">
							<s:if test="errorNameKana != ''">
								<s:property value="errorNameKana" escape="false"/>
							</s:if>
						</td>
					</tr>

					<s:if test="sex == 'woman'">
						<tr>
							<td>
								<label class="form-text">性別 (選択)：</label>
							</td>
							<td>
								<input type="radio" name="sex" value="man" />男
								<input type="radio" name="sex" value="woman" checked="checked" />女
							</td>
						</tr>
					</s:if>
					<s:else>
						<tr>
							<td>
								<label class="form-text">性別 (選択)：</label>
							</td>
							<td>
								<input type="radio" name="sex" value="man" checked="checked"/>男
								<input type="radio" name="sex" value="woman"/>女
							</td>
						</tr>
					</s:else>

					<tr>
						<td>
							<label>メールアドレス:</label>
						</td>
						<td>
							<input type="text" name="email" value='<s:property value="email"/>'/>
						</td>
						<td class="error-color">
							<s:if test="errorEmail != ''">
								<s:property value="errorEmail" escape="false"/>
							</s:if>
						</td>
					</tr>

					<tr>
						<td>
							<label>電話番号:</label>
						</td>
						<td>
							<input type="text" name="telNum" value='<s:property value="telNum"/>'/>
						</td>
						<td class="error-color">
							<s:if test="errorTelNum != ''">
								<s:property value="errorTelNum" escape="false"/>
							</s:if>
						</td>
					</tr>

					<tr>
						<td>
							<label>郵便番号:</label>
						</td>
						<td>
							<input type="text" name="postalCode" value='<s:property value="postalCode"/>'/>
						</td>
						<td class="error-color">
							<s:if test="errorPostalCode != ''">
								<s:property value="errorPostalCode" escape="false"/>
							</s:if>
						</td>
					</tr>

					<tr>
						<td>
							<label>住所:</label>
						</td>
						<td>
							<input type="text" name="address1" value='<s:property value="address1"/>'/>
						</td>
						<td class="error-color">
							<s:if test="errorAddress != ''">
								<s:property value="errorAddress" escape="false"/>
							</s:if>
						</td>
					</tr>

					<tr>
						<td>
							<label>アパート・マンション名:</label>
						</td>
						<td>
							<input type="text" name="address2" value='<s:property value="address2"/>'/>
						</td>
					</tr>
					<s:submit class="botton" value="登録"></s:submit>
				</s:form>
			</table>
			<div>
				<span>前画面に戻る場合は</span>
				<a href='<s:url action="HomeAction"/>'>こちら</a>
			</div>
		</div>
	</div>

	<s:include value="footer.jsp" />

</body>
</html>