<%@page import="com.liheng.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>易买网</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<script src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	function checkUser(){
		var user = $("#user").val();
		if(user == null || user == ""){
			alert("请登录！！！");
			window.location.href="user_toLogin.action";
			return false;
		}else{
			
			var aVal = $("#aID").attr("href");
			var select = $("#select").val();
			$("#aID").attr("href",aVal+'&select='+select);
			
		}
	}
</script>

</head>
<body>
<div id="header" class="wrap">
	<jsp:include page="/WEB-INF/view/common/top.jsp"/>
</div>

<div id="position" class="wrap">
		${navCode }
</div>
	
<div id="main" class="wrap">

	<div class="lefter">
		<jsp:include page="/WEB-INF/view/common/left.jsp"/>
	</div>
	
	<div id="product"  class="main">
		<!-- 隐藏域封装用户信息 -->
		<input  type="hidden" id = "user" value="${currentUser }"/>
	
		<h1>${product.name}</h1>
		<div class="infos">
			<div class="thumb">
				<img class="img" src="${product.proPic }" />
			</div>
			<div class="buy">
				<br/>
				<p>
					商城价：<span class="price">￥${product.price }</span>
				</p>
				<p>库 存：${product.stock }</p>
				
				<select id="select" >
					<option value="1">----数量----</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
				</select>
				
				<br/>
				<div class="button">
					<input type="button" name="button" value="" onclick="" /><br/>
					<a id="aID" href="toCart.action?product.ID=${product.ID }&user.ID=${currentUser.ID }" onclick="return checkUser()">放入购物车</a>
				</div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="introduce">
			<h2>
				<strong>商品详情</strong>
			</h2>
			<div class="text">
				${product.description }
			</div>
		</div>
	</div>

	<div class="clear"></div>
	
</div>

<div id="footer">
	<jsp:include page="/WEB-INF/view/common/footer.jsp"/>
</div>

</body>
</html>