<%@page import="com.liheng.entity.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>易买网</title>
<link type="text/css" rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="lib/amazeui/assets/css/amazeui.css" />

<script src="lib/amazeui/assets/js/jquery.min.js"></script>
<script src="lib/layer/layer.js"></script>
<script src="lib/amazeui/assets/js/amazeui.js"></script>
<script src="lib/amazeui/pagination/amazeui-pagination.js"></script>
</head>
<body>

	<div id="header" class="wrap">
		<jsp:include page="/WEB-INF/view/common/top.jsp" />
	</div>

	<div id="position" class="wrap">${navCode}</div>

	<div id="main" class="wrap">
		<div class="lefter">
			<jsp:include page="/WEB-INF/view/common/left.jsp" />
		</div>

		<%-- <jsp:include page="${mainPage }"/> --%>

		<div class="main">
			<div class="product-list">
				<h2>全部商品</h2>
				<!-- 数据 -->
				<ul class="product clearfix">

					<c:forEach items="${productList.data}" var="product">
						<li>
							<dl>
								<dt>
									<a href="getProductDetail.action?id=${product.ID }" target="_blank"><img src="${product.proPic }" /></a>
								</dt>
								<dd class="title">
									<a href="getProductDetail.action?id=${product.ID }" target="_blank">${product.name }</a>
								</dd>
								<dd class="price">${product.price}</dd>
							</dl>
						</li>
						<!-- 隐藏域封装小类的ID -->
						<input type="hidden" id="smallTypeId" value="${product.smallType.ID }" />

					</c:forEach>


				</ul>

				<div class="clear"></div>

				<!-- 分页位标  区域  -->
				<div class="am-g am-cf">
					<div class="am-container">
						<ul class="am-pagination ">
						</ul>
					</div>
				</div>
				<!-- 分页位标  区域   end-->
			</div>
		</div>

		<div class="clear"></div>
	</div>

	<div id="footer">
		<jsp:include page="/WEB-INF/view/common/footer.jsp" />
	</div>
	<script>
       	
      	
          var pagination = new Pagination({
          	  wrap: $('.am-pagination'), // 存放分页内容的容器
          	  count: ${productList.totalPage}, // 总页数
          	  current: ${productList.currentPage}, // 当前的页数（默认为1）
          	  prevText: '上一页', // prev 按钮的文本内容
          	  nextText: '下一页', // next 按钮的文本内容
          	  callback: function(pageNum) { // 每一个页数按钮的回调事件
          		  //ocation.href=''
          		  //alert(pageNum)
          		  layer.msg(pageNum);
          	  
           		//得到隐藏域中小类的ID 
           		var id = $("#smallTypeId").val();
           		
           		//使用js来发送请求，请求Action，要把页码传给Action
           		window.location.href="searchProductBySmallType.action?product.smallType.ID="+id+"&currentPage="+pageNum;
          	  }
          	});
       </script>
       
       	<%-- 
	       	这种传递参数的方式无效  并且在Script标签中注释起来也会起作用  很奇怪
	        window.location.href="searchProduct.action?product.bigType.ID="+${productList.data.bigType.ID}+"&currentPage="+pageNum;	
        --%>
</body>
</html>