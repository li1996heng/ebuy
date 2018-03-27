<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>易买网 - 首页</title>
</head>
<body>

<div id="header" class="wrap">
	<jsp:include page="common/top.jsp"/>
</div>

<div id="main" class="wrap">
	<div class="lefter">
		<jsp:include page="common/left.jsp"/>
	</div>
	<div class="main">
			<div class="price-off ">
				<h2>今日特价</h2>
				<ul class="product clearfix">
					
					
					<c:forEach items="${specialProductList }" var="specialProduct">
						<li>
							<dl>
								<dt><a href="getProductDetail.action?id=${specialProduct.ID }" target="_blank"><img src="${specialProduct.proPic }" /></a></dt>
								<dd class="title"><a href="getProductDetail.action?id=${specialProduct.ID }" target="_blank">${specialProduct.name }</a></dd>
								<dd class="price">${specialProduct.price }</dd>
							</dl>
						</li>
					</c:forEach>
					
					
				</ul>
			</div>
			<div class="side">

				<div class="news-list">
					<h4>最新公告</h4>
					<ul>
						
						<li><a href="#" target="_blank">2222</a></li>
						<li><a href="#" target="_blank">111111</a></li>
						<li><a href="#" target="_blank">33333</a></li>
						<li><a href="#" target="_blank">44444</a></li>
					
					</ul>
				</div>
				<div class="spacer"></div>
				<div class="news-list">
					<h4>新闻动态</h4>
					<ul>
						<li><a href="" target="_blank">aaaaaaaa</a></li>
						<li><a href="" target="_blank">bbbbbbb</a></li>
						<li><a href="" target="_blank">ccccccc</a></li>
						<li><a href="" target="_blank">dddddddd</a></li>
					</ul>
				</div>
			</div>
			<div class="spacer clear"></div>
			
			<div class="hot">
				<h2>热卖推荐</h2>
				<ul class="product clearfix">
					
					<c:forEach items="${hotProductList }" var="hotProduct">
						<li>
							<dl>
								<dt><a href="getProductDetail.action?id=${hotProduct.ID }" target="_blank"><img src="${hotProduct.proPic }" /></a></dt>
								<dd class="title"><a href="getProductDetail.action?id=${hotProduct.ID }" target="_blank">${hotProduct.name }</a></dd>
								<dd class="price">${hotProduct.price }</dd>
							</dl>
						</li>
					</c:forEach>
					
				</ul>
			</div>
			
		</div>
		<div class="clear"></div>
</div>

&nbsp;
<div id="footer">
	<jsp:include page="common/footer.jsp"/>
</div>
</body>
</html>