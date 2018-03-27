<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="box">
	<h2>商品分类</h2>
	<dl>	
		<!-- 大类 -->
		
		<c:forEach items="${data }" var="bigType">
			<!-- 大类 -->
			<dt>${bigType.name}</dt>
			
			<c:forEach items="${bigType.smallTypeList}" var="smallType">
				<!-- 小类 -->
				<dd><a href="searchProductBySmallType?product.smallType.ID=${smallType.ID }&currentPage=1">${smallType.name}</a></dd>
			
			</c:forEach>
			
		</c:forEach>
	
		
		<!-- <dt>服饰</dt>
		小类
		<dd><a href="#">连衣裙</a></dd>
		<dd><a href="#">男士西装</a></dd>
		<dd><a href="#">牛仔裤</a></dd>
		
		<dt>数码</dt>
		小类
		<dd><a href="#">相机</a></dd>
		<dd><a href="#">音响</a></dd>
		<dd><a href="#">mp3</a></dd>
		
		<dt>美容</dt>
		小类
		<dd><a href="#">进口食品</a></dd>
		<dd><a href="#">地方特产</a></dd>
		<dd><a href="#">零食</a></dd>
		
		
		<dt>家电</dt>
		小类
		<dd><a href="#">平板电视</a></dd>
		<dd><a href="#">洗衣机</a></dd>
		<dd><a href="#">冰箱</a></dd> -->
			
	</dl>
	
</div>

<div class="spacer"></div>

<div class="last-view">
	<h2>最近浏览</h2>
	<dl class="clearfix">

		<dt><img src="images/product/14.jpg" class="imgs" style="width: 50px; height: 50px;" /></dt>
		<dd><a style="font-size: 12px; height: 46px; overflow: hidden; line-height: 14px" href="">1111</a></dd>		
	
	</dl>
</div>
</body>
</html>