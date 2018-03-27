<%@page import="java.io.PrintWriter"%>
<%@page import="com.liheng.entity.Cart"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的购物车</title>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/cart.css" />
<!--[if IE 6]> 
<link href="style/main.ie6.css" rel="stylesheet" type="text/css" />
<![endif]-->
<!--[if IE 7]> 
<link href="style/main.ie7.css" rel="stylesheet" type="text/css" />
<![endif]-->
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript" src="js/jquery-imgslideshow.js"></script>
<script type="text/javascript" src="js/ks-switch.js"></script>
<script type="text/javascript" src="js/lib.js"></script>
<script type="text/javascript">
	var timeout = 500;
	var closetimer = 0;
	var ddmenuitem = 0;

	$(document).ready(function() {
		$('.cat_item').mousemove(function() {
			$(this).addClass('cat_item_on');
		});
		$('.cat_item').mouseleave(function() {
			$(this).removeClass('cat_item_on');
		});
		$('#slideshow').imgSlideShow({
			itemclass : 'i'
		})
		$("#slide-qg").switchTab({
			titCell : "dt a",
			trigger : "mouseover",
			delayTime : 0
		});
		$("#s_cart_nums1").hover(function() {
			mcancelclosetime();
			if (ddmenuitem)
				ddmenuitem.hide();
			ddmenuitem = $(document).find("#s_cartbox");
			ddmenuitem.fadeIn();
		}, function() {
			mclosetime();
		});
		$("#s_cart_nums2").hover(function() {
			mcancelclosetime();
			if (ddmenuitem)
				ddmenuitem.hide();
			ddmenuitem = $(document).find("#s_cartbox");
			ddmenuitem.fadeIn();
		}, function() {
			mclosetime();
		});
		$("#s_cartbox").hover(function() {
			mcancelclosetime();
		}, function() {
			mclosetime();
		});
		var $cur = 1;
		var $i = 4;
		var $len = $('.hot_list>ul>li').length;
		var $pages = Math.ceil($len / $i);
		var $w = $('.hotp').width() - 66;

		var $showbox = $('.hot_list');

		var $pre = $('div.left_icon');
		var $next = $('div.rgt_icon');

		$pre.click(function() {
			if (!$showbox.is(':animated')) {
				if ($cur == 1) {
					$showbox.animate({
						left : '-=' + $w * ($pages - 1)
					}, 500);
					$cur = $pages;
				} else {
					$showbox.animate({
						left : '+=' + $w
					}, 500);
					$cur--;
				}

			}
		});

		$next.click(function() {
			if (!$showbox.is(':animated')) {
				if ($cur == $pages) {
					$showbox.animate({
						left : 0
					}, 500);
					$cur = 1;
				} else {
					$showbox.animate({
						left : '-=' + $w
					}, 500);
					$cur++;
				}

			}
		});

	});
	function mclose() {
		if (ddmenuitem)
			ddmenuitem.hide();
	}
	function mclosetime() {
		closetimer = window.setTimeout(mclose, timeout);
	}
	function mcancelclosetime() {
		if (closetimer) {
			window.clearTimeout(closetimer);
			closetimer = null;
		}
	}
</script>
</head>
<body>
	<div id="doc">

		<!--头部-->

		<div id="s_hdw">
			<!--头部div-->

			<!--顶端菜单-----------------------------------------------顶端菜单-------------------------------------------------------->
			<div id="s_tbar">
				<!--上层导航-->
				<div class="s_hd">
					<!--上层导航容器div-->
					<div class="tbar_lft">
						您好，欢迎来到易买网 <a href="#" class="user">${currentUser.name } </a>
					</div>
					<div class="tbar_rgt">
						<ul>
							<li class="first"><a href="lookOrder.action?order.cart.user.ID=${currentUser.ID }">我的订单</a></li>
							<li><a href="index.jsp">我的商城</a></li>
							<li><a href="#">帮助中心</a></li>
							<li><a href="#">联系客服</a></li>
							<li><a href="#">加入收藏</a></li>
							<li class="s_tel_str">服务热线：</li>
							<li class="s_tel">135-0998-3322</li>
						</ul>
					</div>
				</div>
			</div>


			<!--头部logo选项卡-----------------------------------------------头部选项卡-------------------------------------------------------->


			<div class="s_hd nav">
				<div id="s_logo">
					<a href="#"></a>
				</div>
			</div>
			<!--s_hd end-->




			<!--主导航菜单-----------------------------------------------主导航菜单-------------------------------------------------------->

			<div class="menu">
				<!--原主导航容器div，现两侧菜单div-->
				<div class="s_hd">

					<div class="M_hd_nav">
						<ul>
							<a href="index.jsp"><li><span>首</span><span>页</span></li></a>
							<a href="#" target="view_window"><li><span>积</span><span>分</span><span>兑</span><span>换</span></li></a>
							<a href="#"><li><span>抢</span><span>购</span></li></a>
							<a href="#"><li><span>礼</span><span>品</span></li></a>
						</ul>
					</div>

				</div>
				<!--s_hd end-->
			</div>
			<!--mmenu end-->
		</div>
		<!--s_hdw end-->

		<!--------------------------导航菜单结束------------------------------------>

		<div class="M_bdw">
			<!---------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
			<div class="M_bg"></div>
			<div class="M_cart">
				<!--  编辑区域         编辑区域         编辑区域         编辑区域         编辑区域         编辑区域         编辑区域         编辑区域         编辑区域         编辑区域         编辑区域   -->



				<div class="cartinfo_title">
					<ul style="padding-right: 100px">
						<li class="first">我的购物车</li>
						<li>商品名称</li>
						<li>数量</li>
						<li>单价</li>
						<li>创建时间</li>
						<li>总计</li>
						<li></li>
					</ul>
				</div>

				<table>
						<c:forEach items="${cartList }" var="cart">
								<tr class="cartinfo_sgoods">
									<td class="cartinfo_pic first"><img
										src="${cart.product.proPic }" /></td>
									<td class="sgoods_name txt"><span>${cart.product.name }</span></td>
									<td class="amount txt "><span>${cart.orderNum }</span></td>
									<td class="value txt"><span>${cart.product.price }<em>¥</em></span></td>
									<td class="final_value txt "><span>${cart.createTime }</span></td>
									<td class="total_value txt"><span>${cart.price }<em>.00¥</em></span></td>
									<td class="txt"><span><a href="#">收藏</a><br /> <a
											href="#">换一件</a></span></td>
								</tr>
						</c:forEach>
				</table>
				<div class="all_value">
					<div class="all_valuebox">
						<span>总计</span><span id="spanId"><em> 
						
						<!-- 此处有bug  当购物车信息为null时不能阻止程序继续运行 -->
						
						<s:if test="#request.cartList != null">
									<%
										//这个算法是为了得到购物车里不同商品的总价
										List<Cart> list = null;
											if (request.getAttribute("cartList") != null) {
												list = (List<Cart>) request.getAttribute("cartList");
												if(list != null && list.size() > 0){
													
													float[] priceArray = new float[list.size()];
													for (int i = 0; i < list.size(); i++) {
														priceArray[i] = list.get(i).getPrice();
													}
													float sum = 0F;
													for (int i = 0; i < priceArray.length; i++) {
														sum = sum + priceArray[i];
													}
													out.print(sum);
												}
											}
									%></s:if>
									 .00
						</em><em>¥</em></span>
					</div>
				</div>
				<ol class="ftxt">
					<li><span>寄送至：</span><span>${currentUser.address }</span></li>
					<li><span>收货人：</span><span>${currentUser.name }</span></li>

				</ol>

				<div class="pay">

					<!-- 
						此种结算购物车的方式只能结算第一条订单   
						如果想结算多条记录  猜测是这么写
						<a href="createOrder.action?cart=${cart }">结算</a>
						也就是传一个购物车集合给后台   但是可能会对系统的性能产生很大影响
						毕竟A标签不是传大量数据的首选
					-->
					<s:if test="#request.cartList != null">
						<a href="createOrder.action?cart.id=${cartList[0].id }">结算</a>
					</s:if>
				</div>

				<!--  编辑区域         编辑区域         编辑区域         编辑区域         编辑区域         编辑区域         编辑区域         编辑区域         编辑区域         编辑区域         编辑区域    -->
			</div>
			<!---------------------------------------------------------------------------------------------------------------------------------------------------------------------------->

		</div>


		<!--底部-------->
		<div id="s_ftw">

			<!--底部导航-------->
			<div class="ft_quicklinks">
				<div class="ftql cf">
					<ul>
						<li class="ftql_s">
							<h3>购物指南</h3>
							<ul>
								<li><a href="">怎样购物</a></li>
								<li><a href="">会员制</a></li>
								<li><a href="">积分制度</a></li>
								<li><a href="">优惠券介绍</a></li>
								<li><a href="">订单状态说明</a></li>
							</ul>
						</li>
						<li class="ftql_s">
							<h3>服务条款</h3>
							<ul>
								<li><a href="">售后条款</a></li>
								<li><a href="">退换货说明</a></li>
								<li><a href="">联系客服</a></li>
							</ul>
						</li>
						<li class="ftql_s">
							<h3>配送方式</h3>
							<ul>
								<li><a href="">上门自提</a></li>
								<li><a href="">快递运输</a></li>
								<li><a href="">特快专递（EMS）</a></li>
								<li><a href="">如何送礼</a></li>
							</ul>
						</li>
						<li class="ftql_s">
							<h3>支付帮助</h3>
							<ul>
								<li><a href="">货到付款</a></li>
								<li><a href="">在线支付</a></li>
								<li><a href="">邮政汇款</a></li>
								<li><a href="">银行转账</a></li>
								<li><a href="">发票说明</a></li>
							</ul>
						</li>
						<li class="ftql_s">
							<h3>关于致佳商城</h3>
							<ul>
								<li><a href="">致佳商城介绍</a></li>
								<li><a href="">团队</a></li>
								<li><a href="">媒体报道</a></li>
								<li><a href="">招纳贤士</a></li>
								<li><a href="">公告</a></li>
							</ul>
						</li>
						<li class="ftql_s">
							<div class="ftql_d">
								<div class="str">客服中心信箱：</div>
								<div class="val">
									<a href="mailto:21654132@163.com">21654132@163.com</a>
								</div>
							</div>
							<div class="ftql_d">
								<div class="str">客服中心热线：</div>
								<div class="val stel">135-0998-3322</div>
							</div>
						</li>
					</ul>
				</div>
			</div>

			<!--承诺及版权--------->
			<div id="s_ft">
				<div class="ft_suggest pt100">
					请帮助我们提高！<a href="#">商城首页意见反馈</a>
				</div>
				<div class="ft_banners1 tac pbt10">
					<ul>
						<li><a href="#"><img src="img/ft_1.gif" /></a></li>
						<li><a href="#"><img src="img/ft_2.gif" /></a></li>
						<li><a href="#"><img src="img/ft_3.gif" /></a></li>
					</ul>
				</div>
				<div class="copyright tac pbt10">版权所有 Copyright&copy; 致佳商城 All
					Rights Reserved 版权所有</div>
				<div class="ft_banners2 tac">
					<ul>
						<li><a href="#"><img src="img/u255.png" /></a></li>
						<li><a href="#"><img src="img/u257.png" /></a></li>
						<li><a href="#"><img src="img/u259.png" /></a></li>
						<li><a href="#"><img src="img/u261.png" /></a></li>
					</ul>
				</div>
			</div>

		</div>
		<!--s_ftw end-->

	</div>
</body>
</html>
