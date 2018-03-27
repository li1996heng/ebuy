<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<title>Insert title here</title>

<script type="text/javascript" src="js/jquery-1.11.1.js" charset="utf-8"></script>
<script type="text/javascript" charset="utf-8" src="lib/amazeui/assets/js/jquery.min.js"></script>
<script type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>

</head>
<body>
	
	<div id="logo">
		<img src="images/logo.gif" />
	</div>
	<div class="help">

		<c:if test="${currentUser ne null}">
			<a href="gotoCart.action?cart.user.ID=${currentUser.ID }" class="shopping">购物车</a>
			<a href="lookOrder.action?order.cart.user.ID=${currentUser.ID }">我的订单</a>
			<a href="#">欢迎您：${currentUser.name}</a>
			<a href="user_logOut.action">注销</a>
			<a href="#">留言</a>
		</c:if>

		<c:if test="${currentUser eq null}">
			<a href="#" class="shopping">购物车</a>
			<a href="user_toLogin">登录</a>
			<a href="user_toRegister">注册</a>
			<a href="#">留言</a>
		</c:if>

		
		<form id="myForm" action="likeSearch.action" method="get">
			<input type="text" id="txtSearch" name="searchName" onkeyup=""
				value="${searchName }" />
				<!-- <a id = "linkToCart" href="随意写  我的值会被js修改">搜索</a>-->
			<input type="hidden" name="currentPage" value="1"> 
			<input id="my_button" type="submit" id="cmdSearch" value="搜索" /><br />
			<div id="suggest" style="width: 200px"></div>
		</form>
	</div>
	<!-- <script type="text/javascript">
    $(document).ready(function(){
       //点击链接的时候调用
      $("#linkToCart").click(function(){
 
          //得到input的值
          var name = $("#txtSearch").val();
 
 
          //设置linkToCart的href的值
          $("#linkToCart").attr("href","likeSearch.action?searchName="+name+"&currentPage=1");
      });
    });
</script>

	<script type="text/javascript">
		var name = $("#txtSearch").val()
		doucument.write(name);
		document.getElementById("my_button").onclick = function() {
			document.getElementById("myForm").action = "likeSearch.action?searchName="
					+ name + "&currentPage=1";
			return false;
		}
	</script> -->

	<div class="navbar">
		<ul class="clearfix">

			<li class="current"><a href="index.jsp">首页</a></li>
			<c:forEach items="${data}" var="bigType">
				<li><a
					href="searchProduct.action?product.bigType.ID=${bigType.ID }&currentPage=1">${bigType.name }</a></li>
			</c:forEach>
			<!-- <li><a href="#">服饰</a></li>
		<li><a href="#">数码</a></li>
		<li><a href="#">美食</a></li>
		<li><a href="#">家电</a></li> -->

		</ul>
	</div>

	<div id="childNav">
		<div class="wrap">
			<ul class="clearfix">

				<li class=""><a href="#" target="_blank">音乐</a> <a href="#"
					target="_blank">少儿</a> <a href="#" target="_blank">影视</a> <a
					href="#" target="_blank">运动鞋</a> <a href="#" target="_blank">美容护肤</a>
				</li>

			</ul>
		</div>
	</div>
</body>

</html>