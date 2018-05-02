<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><head>
   <meta http-equiv="pragma" content="no-cache">
   <meta http-equiv="cache-control" content="no-cache">
   <meta http-equiv="expires" content="0"> 
   <meta name="format-detection" content="telephone=no">  
   <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"> 
   <meta name="format-detection" content="telephone=no">
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <link rel="stylesheet" href="css/baset.css">
   <link href="css/purchase.2012.css?v=201410141639" rel="stylesheet" type="text/css">
   <meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta charset='utf-8'>
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<title>购物车</title>
		<meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta http-equiv="Cache-Control" content="no-siteapp">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="mobile-web-app-capable" content="yes">
		<meta name="format-detection" content="telephone=no">
		<meta name="keywords" content="">
		<meta name="description" content="">
		<link rel="stylesheet" type="text/css" href="css/base.css" />
		<link rel="stylesheet" type="text/css" href="css/common.css" />
		<script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="js/jquery.SuperSlide.2.1.js"></script>
   <script>
<<<<<<< HEAD
   	var pageConfig  = {};
=======
  
>>>>>>> a8c3cef13f5641b18ef29e2cd8782c7fd35ceec3
   </script>
<body>
		<!--header star-->
		<div class="header clearfix">
			<div class="top clearfix">
				<div class="topctent clearfix">
					<div class="left clearfix fl">
<<<<<<< HEAD
						公告：您好，欢迎访问酱油文化艺术品商城
=======
						公告：您好，欢迎登录北京椿龄文化发展有限公司
>>>>>>> a8c3cef13f5641b18ef29e2cd8782c7fd35ceec3
					</div>
					<div class="right clearfix fr">
						<div class="zuo clearfix fl">
							<ul class="clearfix fl">
								<li>
									<span class="fl">欢迎</span>
<<<<<<< HEAD
									<a href="grxx.html" class="fl">Rg</a>
=======
									<a href="grxx.html" class="fl">瑾晨0212</a>
>>>>>>> a8c3cef13f5641b18ef29e2cd8782c7fd35ceec3
									<span class="fl">进入商城</span>
								</li>
								<li>
									<a href="register.html">
<<<<<<< HEAD
										
=======
										免费注册
>>>>>>> a8c3cef13f5641b18ef29e2cd8782c7fd35ceec3
									</a>
								</li>
							
							</ul>
						</div>
						<div class="shopcar-btn clearfix fl">
							<a href="#" class="box-s">
<<<<<<< HEAD
								购物车
=======
								购物车（0）
>>>>>>> a8c3cef13f5641b18ef29e2cd8782c7fd35ceec3
							</a>
						</div>
						<div class="fenxiang clearfix fl">
							<span class="fl">分享到：</span>
							<ul class="clearfix fl">
								<li>
									<a href="#"><img src="img/sina.png" /></a>
								</li>
								<li>
									<a href="#"><img src="img/qq.png" /></a>
								</li>
								<li>
									<a href="#"><img src="img/wechat.png" /></a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="bottom clearfix">
				<div class="logo clearfix">
					<a href="index.html"></a>
				</div>
				<div class="search clearfix fr ra5">
					<input type="text" class="fl" name="" id="" value="" placeholder="请输入您要搜索的内容" />
					<input type="button" name="" id="" value="搜索" class="fl box-s" />
				</div>
			</div>
		</div>
		<!--header end-->

		<!--navbar star-->
		<div class="navbar clearfix">
			<div class="content clearfix">
				<ul>
					<li class="cur">
						<a href="index.html">首页</a>
					</li>
					<li>
						<a href="special.html">专场</a>
					</li>
					<li>
						<a href="mall.html">商城</a>
					</li>
					
				</ul>
			</div>
		</div>
		<!--navbar end-->

<div class="cart-inner">
    <div class="cart-thead clearfix">
        <div class="column t-checkbox form"></div>
        <div class="column t-goods">商品</div>
        <div class="column t-price">淘淘价</div>
<<<<<<< HEAD
        <div class="column t-promotion">优惠</div>
=======
>>>>>>> a8c3cef13f5641b18ef29e2cd8782c7fd35ceec3
        <div class="column t-inventory">库存</div>
        <div class="column t-quantity">数量</div>
        <div class="column t-action">操作</div>
    </div>
    <div id="product-list" class="cart-tbody">
        <!-- ************************商品开始********************* -->
        <c:set var="totalPrice" value="0"></c:set>
        <c:forEach items="${cartList}" var="cart">
        	<c:set var="totalPrice"  value="${ totalPrice + (cart.price * cart.num)}"/>
	        <div id="product_11345721" data-bind="rowid:1" class="item item_selected ">
		        <div class="item_form clearfix">
		            <div class="cell p-checkbox"></div>
		            <div class="cell p-goods">
		                <div class="p-img">
		                	<a href="/item/${cart.id }.html" target="_blank">
		                		<img clstag="clickcart|keycount|xincart|p-imglistcart" src="${cart.image}" alt="${cart.title}" width="52" height="52">
		                	</a>
		                </div>    
		                <div class="p-name">
		                	<a href="/item/${cart.id }.html" clstag="clickcart|keycount|xincart|productnamelink" target="_blank">${cart.title}</a>
		                	<span class="promise411 promise411_11345721" id="promise411_11345721"></span>
		                </div>    
		            </div>
		            <div class="cell p-price"><span class="price">¥<fmt:formatNumber groupingUsed="false" value="${cart.price}" maxFractionDigits="2" minFractionDigits="2"/> </span></div>
		            <div class="cell p-promotion">
		            </div>
		            <div class="cell p-inventory stock-11345721">有货</div>
		            <div class="cell p-quantity" for-stock="for-stock-11345721">
		                <div class="quantity-form" data-bind="">
		                    <a href="javascript:void(0);" class="decrement" clstag="clickcart|keycount|xincart|diminish1" id="decrement">-</a>
		                    <input type="text" class="quantity-text" itemPrice="${cart.price}" itemId="${cart.id}" value="${cart.num }" id="changeQuantity-11345721-1-1-0">
		                    <a href="javascript:void(0);"   class="increment" clstag="clickcart|keycount|xincart|add1" id="increment">+</a>
		                </div>
		            </div>
		            <div class="cell p-remove"><a id="remove-11345721-1" data-more="removed-87.20-1" clstag="clickcart|keycount|xincart|btndel318558" class="cart-remove" href="deleteItemInCart?itemId=${cart.id}">删除</a>
		            </div>
		        </div>
	        </div> 
        </c:forEach>
        
    </div><!-- product-list结束 -->
<<<<<<< HEAD
          <div class="cart-toolbar clearfix">
            <div class="total fr">
                <p><span class="totalSkuPrice">¥<fmt:formatNumber value="${totalPrice}" maxFractionDigits="2" minFractionDigits="2" groupingUsed="true"/></span>总计：</p>
                <p><span id="totalRePrice">- ¥0.00</span>优惠：</p>
            </div>
            <div class="amout fr"><span id="selectedCount">1</span> 件商品</div>
=======
    <!--Main-wrap-->
		<div class="main-wrap graybg pt40 pb40">
			<div class="js-box wrapper white-box">
				<!--收货人信息-->
				<div class="consignee-info">
					<div class="title line-bot"><span class="fs18 pl20 ml40 darkgray">收货人地址</span></div>
					<div class="consignee-box clearfix">
						<div class="consignee-block check-box check_on  radius5" id="div0">
							<em></em>
							<p class="fs14 lh40 clearfix">
								<span class="fl darkgray" id="sname0"><i class="iconfont fs24">&#xe60e;</i>飞天猪</span>
								<input id="hsname0" type="hidden" value="">
								<a id = "bj0" href="javascript:" class="fr green edit alertbox" onclick="$.xiugai($(this));" val=""><i class="iconfont fs24 green ">&#xe60f;</i>编辑</a>
							</p>
							<input type="hidden" id="hte0" value="qqq">
							<input type="hidden" id="hidco0" value="hid">
							<p class="fs14 darkgray lh40" id="stel0"><i class="iconfont fs24">&#xe60c;</i>18056000000
								</>
							
							
								<p class="fs14 darkgray lh30 clearfix">
									<i class="fl iconfont fs24">&#xe610;</i><span class="fl address" id="addressDetail0">合肥市蜀山区长江西路100号拓基城市广场  金座A2002</span>
								</p>
						</div>
						<div class="consignee-block check-box radius5" id="div1">
							<em></em>
							<p class="fs14 lh40 clearfix">
								<span class="fl darkgray" id="sname1"> <i class="iconfont fs24">&#xe60e;</i>飞天猪</span>
								<input id="hsname1" type="hidden" value="">
								<a id = "bj1" href="javascript:" class="fr green edit alertbox" onclick="$.xiugai($(this));" val=""><i class="iconfont fs24 green">&#xe60f;</i>编辑</a>
							</p>
							<input type="hidden" id="hte1" value="qqq">
							<input type="hidden" id="hidco1" value="hid">
							<p class="fs14 darkgray lh40" id="stel1"><i class="iconfont fs24">&#xe60c;</i>18056000000
								</>
								
								
								<p class="fs14 darkgray lh30 clearfix">
									<i class="fl iconfont fs24">&#xe610;</i><span class="fl address" id="addressDetail1">合肥市蜀山区长江西路100号拓基城市广场  金座A2002</span>
								</p>
						</div>
						<div class="consignee-block check-box radius5" id="div2">
							<em></em>
							<p class="fs14 lh40 clearfix">
								<span class="fl darkgray" id="sname2"> <i class="iconfont fs24">&#xe60e;</i>飞天猪</span>
								<input id="hsname2" type="hidden" value="">
								<a id = "bj2" href="javascript:" class="fr green edit alertbox" onclick="$.xiugai($(this));" val=""><i class="iconfont fs24 green">&#xe60f;</i>编辑</a>
							</p>
							<input type="hidden" id="hte2" value="qqq">
							<input type="hidden" id="hidco2" value="hid">
							<p class="fs14 darkgray lh40" id="stel2"><i class="iconfont fs24">&#xe60c;</i>18056000000
								</>
								
								
								<p class="fs14 darkgray lh30 clearfix">
									<i class="fl iconfont fs24">&#xe610;</i><span class="fl address" id="addressDetail2">合肥市蜀山区长江西路100号拓基城市广场  金座A2002</span>
								</p>
						</div>
						
					</div>
				</div>
				<!--/end-->
          <div class="cart-toolbar clearfix">
            <div class="total fr">
                <p><span class="totalSkuPrice">¥<fmt:formatNumber value="${totalPrice}" maxFractionDigits="2" minFractionDigits="2" groupingUsed="true"/></span>总计：</p>
                
            </div>
>>>>>>> a8c3cef13f5641b18ef29e2cd8782c7fd35ceec3
        </div>
        <div class="ui-ceilinglamp-1" style="width: 988px; height: 49px;"><div class="cart-dibu ui-ceilinglamp-current" style="width: 988px; height: 49px;">
          <div class="control fdibu fdibucurrent">
         
              <span class="delete">
                  <b>
                  </b>
            
              </span>
              <span class="shopping">
                  <b>
                  </b>
                  <a href="/" target="_blank" clstag="clickcart|keycount|xincart|coudanlink" id="continue">继续购物</a>
              </span>
          </div>
<<<<<<< HEAD
          <div class="cart-total-2014">
              <div class="cart-button">
                  <span class="check-comm-btns" id="checkout-jd">
                      <a class="checkout fr orange-but fs20 radius3" href="jiesuan.html" clstag="clickcart|keycount|xincart|gotoOrderInfo" id="toSettlement">去结算<b></b></a>
=======
          
          
          <div class="cart-total-2014">
              <div class="cart-button">
                  <span class="check-comm-btns" id="checkout-jd">
                      <a class="checkout fr orange-but fs20 radius3" href="jiesuan" id="toSettlement">去结算<b></b></a>
>>>>>>> a8c3cef13f5641b18ef29e2cd8782c7fd35ceec3
                  </span>
               
              </div> 
              <div class="total fr">
                                   总计（不含运费）：
                  <span class="totalSkuPrice">¥<fmt:formatNumber value="${totalPrice}" maxFractionDigits="2" minFractionDigits="2" groupingUsed="true"/></span>
              </div>
          </div>
      </div></div>
</div><!-- cart-inner结束 -->
<<<<<<< HEAD
=======

>>>>>>> a8c3cef13f5641b18ef29e2cd8782c7fd35ceec3
</div>
</div>
<!--推荐位html修改处-->


<script type="text/javascript" src="/js/base-v1.js"></script>

<!-- 购物车相关业务 -->
<script type="text/javascript" src="js/cart.js"></script>
<script type="text/javascript" src="js/jquery.price_format.2.0.min.js"></script>

</html>