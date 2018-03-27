<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />


<script type="text/javascript">
	//前端验证 用户名和密码不能为空
	function checkForm(){
		
		var account = $("#account").val();
		if(account == ""){
			$("#error").html("账号不能为空");
			return false;
		}
		var password = $("#password").val();
		if(password == ""){
			$("#error").html("密码不能为空");
			return false;
		}		

		return true;
	}
</script>

</head>
<body>
<div id="header" class="wrap">
	<jsp:include page="/WEB-INF/view/common/top.jsp"/>
</div>
<div id="register" class="wrap">
	<div class="shadow">
		<em class="corner lb"></em> <em class="corner rt"></em>
		<div class="box">
			<h1>欢迎回到易买网</h1>
			<form id="loginForm" method="post" action="user_login"
				onsubmit="return checkForm()">
			<table>
				<tr>
					<td class="field">用户名：</td>
					<td><input class="text" type="text" id="account"
						name="user.account"  value="${user.account}" />
					</td>
				</tr>
				<tr>
					<td class="field">登录密码：</td>
					<td><input class="text" type="password" id="password"
						name="user.password"  value="${user.password }"   />
					</td>
				</tr>
				<tr>
					<td class="field">验证码：</td>
					<td><input  class="text" style="width: 60px;margin-right: 10px;"
								type=text value="" name="imageCode" id="imageCode">
								<img onclick="javascript:loadimage();" title="换一张试试" name="randImage"
								id="randImage" src="tool/image.jsp" width="60" height="20" border="1"
								align="absmiddle">					
					</td>
				</tr>
	
				<tr>
					<td><input type="hidden" name="user.status" value="1"/></td>
					<td><label class="ui-green"><input type="submit"
							name="submit" value="立即登录" /> </label>&nbsp;&nbsp;&nbsp;&nbsp;
							<font id="error"  color="red">${errorMsg}</font>
					</td>
				</tr>
			</table>
		</form>
	</div>
	</div>
</div>
<div id="footer">
	<jsp:include page="/WEB-INF/view/common/footer.jsp"/>
</div>

</body>
</html>