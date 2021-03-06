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
	<title>MasterReviewDelete画面</title>

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

		.btn input {
			margin: 15px;
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
			<p>MasterReviewDelete</p>
		</div>
		<div>
			<s:form action="MasterReviewDeleteConfirmAction">
				<s:iterator value="reviewDTOList">
					<tr>
						<td><input type="checkbox" name="review" value="<s:property value='comment'/>"></td>
						<td><s:property value="handleName"/>さん　の　「<s:property value="title"/>」</td>
					</tr>
					<tr>
						<td><br></td>
					</tr>
				</s:iterator>
			</s:form>
			<div class="btn">
				<input type="button" value="戻る" onclick="submitAction('MasterPageAction')" />
				<input type="button" value="選択" onclick="submitAction('MasterReviewDeleteConfirmAction')" />
			</div>
		</div>
	</div>

	<s:include value="footer.jsp" />

</body>
</html>