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
	<title>UserCreateConfirm画面</title>

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

		.btn {
			text-align: center;
		}

		.btn input {
			margin: 15px;
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
			<p>UserCreateConfirm</p>
		</div>
		<div>
			<h3>登録する内容は以下でよろしいですか？</h3>
			<table>
				<s:form action="UserCreateCompleteAction">
					<tr id="box">
						<td>
							<label>ユーザーID:</label>
						</td>
						<td>
							<s:property value="userId" escape="false"/>
							<input type="hidden" name="userId" value='<s:property value="userId"/>'>
						</td>
					</tr>

					<tr id="box">
						<td>
							<label>ユーザーPASS:</label>
						</td>
						<td>
							<s:property value="userPassword" escape="false"/>
							<input type="hidden" name="userPassword" value='<s:property value="userPassword"/>'>
						</td>
					</tr>

					<tr id="box">
						<td>
							<label>お名前:</label>
						</td>
						<td>
							<s:property value="name" escape="false"/>
							<input type="hidden" name="name" value='<s:property value="name"/>'>
						</td>
					</tr>

					<tr id="box">
						<td>
							<label>おなまえ(ふりがな):</label>
						</td>
						<td>
							<s:property value="nameKana" escape="false"/>
							<input type="hidden" name="nameKana" value='<s:property value="nameKana"/>'>
						</td>
					</tr>

					<tr id="box">
						<td>
							<label>性別：</label>
						</td>
						<td>
							<s:if test="sex == 'man'">男</s:if>
							<s:if test="sex == 'woman'">女</s:if>
							<input type="hidden" name="sex" value='<s:property value="sex"/>'>
						</td>
					</tr>

					<tr id="box">
						<td>
							<label>メールアドレス：</label>
						</td>
						<td>
							<s:property value="email" escape="false"/>
							<input type="hidden" name="email" value='<s:property value="email"/>'>
						</td>
					</tr>

					<tr id="box">
						<td>
							<label>電話番号：</label>
						</td>
						<td>
							<s:property value="telNum" escape="false"/>
							<input type="hidden" name="telNum" value='<s:property value="telNum"/>'>
						</td>
					</tr>

					<tr id="box">
						<td>
							<label>郵便番号：</label>
						</td>
						<td>
							<s:property value="postalCode" escape="false"/>
							<input type="hidden" name="postalCode" value='<s:property value="postalCode"/>'>
						</td>
					</tr>

					<tr id="box">
						<td>
							<label>住所：</label>
						</td>
						<td>
							<s:property value="address1" escape="false"/>
							<input type="hidden" name="address1" value='<s:property value="address1"/>'>
						</td>
					</tr>

					<tr id="box">
						<td>
							<label>アパート・マンション名：</label>
						</td>
						<td>
							<s:property value="address2" escape="false"/>
							<input type="hidden" name="address2" value='<s:property value="address2"/>'>
						</td>
					</tr>
				</s:form>
			</table>

			<div class="btn">
				<input type="button" value="訂正" onclick="submitAction('UserCreateBackAction')" />
				<input type="button" value="登録" onclick="submitAction('UserCreateCompleteAction')" />
			</div>
		</div>
	</div>

	<s:include value="footer.jsp" />

</body>
</html>