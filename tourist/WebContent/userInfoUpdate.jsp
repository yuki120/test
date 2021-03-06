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
	<title>UserInfoUpdate画面</title>

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
			<p>UserInfoUpdate</p>
		</div>
		<div>
			<table>
				<s:form action="UserInfoUpdateConfirmAction">

					<tr>
						<td>
							<label>ユーザーID:</label>
						</td>
						<td>
							<input type="text" name="loginId" value='<s:property value="session.loginUser.loginId" />'/>
						</td>
					</tr>

					<tr>
						<td>
							<label>ユーザーPASS:</label>
						</td>
						<td>
							<input type="text" name="loginPassword" value='<s:property value="session.loginUser.loginPassword" />'/>
						</td>
					</tr>

					<tr>
						<td>
							<label>お名前:</label>
						</td>
						<td>
							<input type="text" name="name" value='<s:property value="session.loginUser.name"/>' />
						</td>
					</tr>

					<tr>
						<td>
							<label>おなまえ(ふりがな):</label>
						</td>
						<td>
							<input type="text" name="nameKana" value='<s:property value="session.loginUser.nameKana"/>'/>
						</td>
					</tr>

					<tr>
						<td>
							<label>性別：</label>
						</td>
						<td>
							<s:if test="session.loginUser.sex != 'woman'">
								<input type="radio" name="sex" value="男" checked="checked">男
								<input type="radio" name="sex" value="女">女
							</s:if>
							<s:else>
								<input type="radio" name="sex" value="男">男
								<input type="radio" name="sex" value="女" checked="checked">女
							</s:else>
						</td>
					</tr>

					<tr>
						<td>
							<label>メールアドレス:</label>
						</td>
						<td>
							<input type="text" name="email" value='<s:property value="session.loginUser.email"/>'/>
						</td>
					</tr>

					<tr>
						<td>
							<label>電話番号:</label>
						</td>
						<td>
							<input type="text" name="telNum" value='<s:property value="session.loginUser.telNum"/>'/>
						</td>
					</tr>

					<tr>
						<td>
							<label>郵便番号:</label>
						</td>
						<td>
							<input type="text" name="postalCode" value='<s:property value="session.loginUser.postalCode"/>'/>
						</td>
					</tr>

					<tr>
						<td>
							<label>住所:</label>
						</td>
						<td>
							<input type="text" name="address1" value='<s:property value="session.loginUser.address1"/>'/>
						</td>
					</tr>

					<tr>
						<td>
							<label>アパート・マンション名:</label>
						</td>
						<td>
							<input type="text" name="address2" value='<s:property value="session.loginUser.address2"/>'/>
						</td>
					</tr>
					<s:submit class="botton" value="変更"></s:submit>
				</s:form>
			</table>
		</div>
	</div>

	<s:include value="footer.jsp" />

</body>
</html>