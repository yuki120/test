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
			background: #fff;
		}

		table {
			text-align: center;
			margin: 0 auto;
			border-spacing: 15px;
		}

		#top {
			width: 780px;
			margin: 30px auto;
			border: 1px solid #333;
		}

		#main {
			width: 100%;
			padding-bottom: 150px;
			text-align: center;
		}

		.btn {
			text-align: center;
		}

		.btn input {
			margin: 15px;
		}

		#box img {
			width: 250px;
			height: 200px;
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
			<p>MasterReviewDeleteConfirm</p>
		</div>
		<div>
			<h3>削除するレビューは以下でよろしいですか？</h3>
			<table>
				<s:form action="MasterReviewDeleteCompleteAction">
					<s:iterator value="reviewDeleteList">
						<tr>
							<td><s:property value="productName"/></td>
						</tr>
					</s:iterator>
				</s:form>
			</table>

			<div class="btn">
				<input type="button" value="戻る" onclick="submitAction('MasterProductDeleteAction')" />
				<input type="button" value="削除" onclick="submitAction('MasterProductDeleteCompleteAction')" />
			</div>
		</div>
	</div>

	<s:include value="footer.jsp" />

</body>
</html>