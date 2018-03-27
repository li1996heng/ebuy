<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>易买网-用户注册</title>
<script type="text/javascript"
	src="js/jquery-min.js"></script>
<script type="text/javascript">

    var accountExist = false;
 	
	function checkForm(){
		//注册前端验证 
		//获取用户名
		var account = $("#account").val();
		if("" == account){
			
			$("#error").html("用户名不能为空");
			return false;
		}
		
		//获取密码的值
		var password = $("#password").val();
		//密码强度正则，最少6位，包括至少1个大写字母，1个小写字母，1个数字，1个特殊字符
		var rPassword = /^.*(?=.{6,})(?=.*\d)(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*? ]).*$/;
		if(!rPassword.test(password)){
			$("#error").html("密码最少6位，包括至少1个大写字母，1个小写字母，1个数字，1个特殊字符");
			return false;
		}
		
		//获取确认密码的值
		var rePassWord = $("#rePassWord").val();
		if(password != rePassWord){
			$("#error").html("密码与确认密码不一致");
			return false;
		}
		
		//获取身份证的值
		var dentityCode = $("#dentityCode").val();
		//身份证号（18位）正则
		var cP = /^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/;
		if(!cP.test(dentityCode)){
			$("#error").html("身份证不合法");
			return false;
		}
		
		
		//判断邮箱地址是否合法的正则表达式
		var rEmail= /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
		var email = $("#email").val();	
		if (!rEmail.test(email)) {
			$("#error").html("邮箱格式错误");
			return false;
		}
		
		//获取手机号的值
		var mobile = $("#mobile").val();
		//手机号正则
		var mPattern = /^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\d{8}$/;
		if(!mPattern.test(mobile)){
			$("#error").html("手机号格式错误");
			return false;
		}
		return true;
		
	}
	
	//验证用户名是否存在
	function checkUserName(account){
		
		if(account == ''){
			$("#userErrorInfo").text("用户名不能为空");
			return;
		}else{
			$("#userErrorInfo").text("");
		}
		
		var accountJson = {
			"account":account
		}
		
		//ajax
		/*
		$.get(
			"url"//
			"canshu",//参数
			function(data){//回调函数
				
			},
			"json"//返回的数据类型
		);
		*/

		$.post(
			"checkUserExist",//请求路径
			accountJson,//参数
			function(data){
				var flag = data.result;
				if(flag){
				
					$("#userErrorInfo").text("该用户名已存在。");
					$("#account").focus();
					accountExist = true;
				}else{
				
					$("#userErrorInfo").text("");
					accountExist = false;
				}
				
			},
			"json"//返回的数据类型
		);
		
		
	}
	
</script>
</head>
<body>
<div id="header" class="wrap">
	<jsp:include page="/WEB-INF/view/common/top.jsp"/>
</div>

<div id="register" class="wrap">
	<div class="shadow">
		<em class="corner lb"></em>
		<em class="corner rt"></em>
		<div class="box">
			<h1>欢迎注册易买网</h1>
			<ul class="steps clearfix">
				<li class="current"><em></em>填写注册信息</li>
				<li class="last"><em></em>注册成功</li>
			</ul>
			<form id="regForm" method="post" action="user_register" onsubmit="return checkForm()">
				<table>				
					
					<tr>
						<td class="field">用户名(*)：</td>
						<td><input class="text" type="text" id="account" name="user.account" onblur="checkUserName(this.value)" />&nbsp;<font id="userErrorInfo" color="red"></font></td>
					</tr>
					<tr>
						<td class="field">昵称(*)：</td>
						<td><input class="text"  type="text" id="name" name="user.name"   /></td>
					</tr>
					<tr>
						<td class="field">登录密码(*)：</td>
						<td><input class="text"  type="password" id="password" name="user.password"   /></td>
					</tr>
					<tr>
						<td class="field">确认密码(*)：</td>
						<td><input class="text" type="password"  id="rePassWord"  name="rePassWord" /></td>
					</tr>
					
					<tr>
						<td class="field">性别(*)：</td>
						<td>
					    <input type="radio"   name="user.sex" value="男" checked="checked"/>男&nbsp;&nbsp;
					    <input type ="radio" name="user.sex" value="女"/>女					    					    
					    </td>						
					</tr>
					<tr>
						<td class="field">出生日期：</td>
						<td>
							<input  type="text"  id="birthday"  name="user.birthday"  class="Wdate" onClick="WdatePicker()"/>	
						</td> 
					</tr>
					<tr>
						<td class="field">身份证号：</td>
						<td><input class="text" type="text" id="dentityCode" name="user.dentityCode"  /></td>
					</tr>
					<tr>
						<td class="field">Email：</td>
						<td><input class="text" type="text" id="email" name="user.email"  /></td>
					</tr>
					<tr>
						<td class="field">手机号码(*)：</td>
						<td><input class="text" type="text" id="mobile" name="user.mobile" /></td>
					</tr>
					<tr>
						<td class="field">收货地址(*)：</td>
						<td><input class="text" type="text" id="address" name="user.address" /></td>
					</tr>
					<tr>
						<td></td>
						<td><label class="ui-green"><input type="submit" name="submit" value="提交注册" /></label></td>
					</tr>
					<tr>
						<td>&nbsp;</td>
						<td><font id="error" color="red"></font> </td>
					</tr>
					
				</table>
					<input type="hidden" name="user.status" value="1"/>
					<input type="hidden" name="user.isDelete" value="1"/>
			</form>
		</div>
	</div>
	<div class="clear"></div>
</div>

<div id="footer">
	<jsp:include page="/WEB-INF/view/common/footer.jsp"/>
</div>
</body>
</html>