<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
<<<<<<< HEAD
   <script type="text/javascript">
=======
	</head>
   <script type="text/javascript">
   
>>>>>>> 04dce5e5795b03ff5c7aadb388008ec38488a372
   var uid;
   $(function()
			 {
		 $.displayUserName();
			 });
<<<<<<< HEAD
 
=======
   $.gotojiesuan=function()
   {
	    if(!$.cookie("TT_TOKEN"))
	    	{
	    	alert("请先登陆");
	    	}
	    else
	    	{
	    	alert("开始跳转"+uid)
	    	window.location.href ="gotojiesuan?uid="+uid;
	    	}
	   
   }
>>>>>>> 04dce5e5795b03ff5c7aadb388008ec38488a372
	$.displayUserName=function()//如果登陆了展示退出和欢迎
	{  
		
		var _ticket = $.cookie("TT_TOKEN");
		if(!_ticket){
			$("#displayName").html("<li ><span class='f1'>您好，请</span><a href='http://sso.jiangyou-art.com/page/login' class='f1'>登陆</a></li><li><a href='http://sso.jiangyou-art.com/page/register' >免费注册</a></li>")
		}
		$.ajax({
			url : "http://sso.jiangyou-art.com/userLogin/token/" + _ticket,
			
			dataType : "jsonp",
			type : "GET",
			success : function(data){
			    uid=data.data.uid;
				
				if(data.status == 200){
					var uname = data.data.uname;
			
					var html = "<li ><span class='f1'>欢迎</span><a href='grxx' class='f1'>"+uname+
					"</a>进入商场</li><li><a href='#' onclick='$.grxx()'>个人中心</a></li><li><a href='#' onclick='$.outLogin()'>退出</a></li>"
					$("#displayName").html(html);
				}
			}
		});
	}

	 $.outLogin=function()
	 {
		 $.ajax({
			  url: "http://sso.jiangyou-art.com/userLogin/outLogin",
			  dataType : "jsonp",
			  type:"GET",
			  
			  success: function(data)
			  
			  { if(data.msg=="OK")
				  {
				  alert("成功退出！");
				  $("#displayName").html("<li ><span class='f1'>您好，请</span><a href='http://sso.jiangyou-art.com/page/login' class='f1'>登陆</a></li><li><a href='http://sso.jiangyou-art.com/page/register' >免费注册</a></li>")
				  }
			  else
				  {
				  alert("操作有误");
				  }
			  },
			  error:function()
			  {
				  $("#displayName").html("<li ><span class='f1'>您好，请</span><a href='http://sso.jiangyou-art.com/page/login' class='f1'>登陆</a></li><li><a href='http://sso.jiangyou-art.com/page/register' >免费注册</a></li>")
                  
				  alert("error");
				  alert(data.msg);
			  }
			  
			});
	 }
<<<<<<< HEAD
	  $.gotojiesuan=function()
	   {
		    if(!$.cookie("TT_TOKEN"))
		    	{
		    	alert("请先登陆");
		    	}
		    else
		    	{
		    	var t = $("#totalPrice").attr("value");
		    	alert("total"+t);
		    	window.location.href ="gotojiesuan?uid="+uid+"&totalprice="+t;
		    	}
		   
	   }
=======
>>>>>>> 04dce5e5795b03ff5c7aadb388008ec38488a372
   </script>
<body>
		<!--header star-->
		
		<div class="header clearfix">			
			<div class="top clearfix">
				<div class="topctent clearfix">
					<div class="left clearfix fl">
						公告：您好，欢迎来到酱油文化艺术品商城
					</div>
					<div class="right clearfix fr">
						<div class="zuo clearfix fl">
							<ul class="clearfix fl" id="displayName">
								
								<li ><span class='f1'>您好，请</span><a href='http://sso.jiangyou-art.com/page/login' class='f1'>登陆</a></li><li><a href='http://sso.jiangyou-art.com/page/register' >免费注册</a></li>
								
							</ul>
						</div>						
						<div class="shopcar-btn clearfix fl">
							<a href="cartShow" class="box-s">
								购物车
							</a>
						</div>
						
					
					</div>					
				</div>
			</div>			
			<div class="bottom clearfix">
				<div class="logo clearfix">
					
				</div>
				<div class="search clearfix fr ra5">
					<input type="text" class="fl" name="q" placeholder="请输入您要搜索的内容" id="query"/>
					<input type="button" value="搜索" class="fl box-s" onclick="$.search()"/>
				</div>
			</div>
		</div>
		<!--header end-->
        <script type="text/javascript">
		$.search=function()
		{
			var querystr=$("#query").attr("value");
			 window.location.href="search?q="+querystr;
		}
		</script>
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
        <!-- 初始化页面 -->
	<script type="text/javascript">
	
	 $(function()
			 {
		 $.displayUserName();
		 $.getNewItem();
		 $.JXshow();
			 });
	</script>
	<!-- 今日推荐 -->
	<script type="text/javascript">
	$.displayUserName=function()//如果登陆了展示退出和欢迎
	{
		var _ticket = $.cookie("TT_TOKEN");
		if(!_ticket){
			$("#displayName").html("<li ><span class='f1'>您好，请</span><a href='http://sso.jiangyou-art.com/page/login' class='f1'>登陆</a></li><li><a href='http://sso.jiangyou-art.com/page/register' >免费注册</a></li>")
		}
		$.ajax({
			url : "http://sso.jiangyou-art.com/userLogin/token/" + _ticket,
			
			dataType : "jsonp",
			type : "GET",
			success : function(data){
			
				if(data.status == 200){
					var uname = data.data.uname;
					var html = "<li ><span class='f1'>欢迎</span><a href='grxx' class='f1'>"+uname+
					"</a>进入商场</li><li><a href='#' onclick='$.grxx()'>个人中心</a></li><li><a href='#' onclick='$.outLogin()'>退出</a></li>"
					$("#displayName").html(html);
				}
			}
		});
	}

	 $.outLogin=function()
	 {
		 $.ajax({
			  url: "http://sso.jiangyou-art.com/userLogin/outLogin",
			  dataType : "jsonp",
			  type:"GET",
			  
			  success: function(data)
			  
			  { if(data.msg=="OK")
				  {
				  alert("成功退出！");
				  $("#displayName").html("<li ><span class='f1'>您好，请</span><a href='http://sso.jiangyou-art.com/page/login' class='f1'>登陆</a></li><li><a href='http://sso.jiangyou-art.com/page/register' >免费注册</a></li>")
				  }
			  else
				  {
				  alert("操作有误");
				  }
			  },
			  error:function()
			  {
				  $("#displayName").html("<li ><span class='f1'>您好，请</span><a href='http://sso.jiangyou-art.com/page/login' class='f1'>登陆</a></li><li><a href='http://sso.jiangyou-art.com/page/register' >免费注册</a></li>")
                  
			  }
			  
			});
	 }
	 $.grxx=function()//当点击个人中心时判断是否已登录
	 {  
		 if($.cookie("TT_TOKEN")==null)
		 {
		 alert("请先登录！");
		 }
	 else
		 {
		 window.location.href="grxx";
		 } 
	 }
	 $.getNewItem=function()
		{
		 $.ajax({
			  url: "getContent",
			  type: "post",
			  data:{
				  categoryId:90  
			  },
			  success: function(data)
			  {  
				  var content=eval('('+data+')');
				  for(var i=0;i<4;i++)
					{
					$("#src"+i).attr("src",content[i].pic);//显示图片
				 	$("#p"+i).html(content[i].title);
					$("#span"+i).text(content[i].price);
					}
			  },
			  error:function()
			  {
				  alert("error");
			  }
			  
			});
		}
	 $.addItem=function(e)
  	{var itemid = e.attr("value");
  		$.ajax({
  			url:"addItemtoCar",
  			data:{
  				id:itemid,
  			},
  			type:"post",
  			success:function(jsonresult)
  			{    if(jsonresult="success")
  				{
  				window.location.href ="success";
  				}
  				 
  				
  			},error:function()
  			{ alert("操作有误！");
  			}
  		});
  		}
	</script>
<div class="cart-inner">
    <div class="cart-thead clearfix">
        <div class="column t-checkbox form"></div>
        <div class="column t-goods">商品</div>
        <div class="column t-price">淘淘价</div>
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
    
          <div class="cart-toolbar clearfix">
           
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
          
          
          <div class="cart-total-2014">
              <div class="cart-button">
                  <span class="check-comm-btns" id="checkout-jd">
<<<<<<< HEAD
                      <a class="checkout fr orange-but fs20 radius3" href="#" onclick="$.gotojiesuan()"  id="totalPrice" value="${totalPrice}">去结算<b></b></a>
=======
                      <a class="checkout fr orange-but fs20 radius3" href="#" onclick="$.gotojiesuan()"  id="">去结算<b></b></a>
>>>>>>> 04dce5e5795b03ff5c7aadb388008ec38488a372
                  </span>
               
              </div> 
              <div class="total fr">
                                   总计（不含运费）：
                  <span class="totalSkuPrice">¥<fmt:formatNumber value="${totalPrice}" maxFractionDigits="2" minFractionDigits="2" groupingUsed="true"/></span>
              </div>
          </div>
      </div></div>
</div><!-- cart-inner结束 -->

</div>

</div>
<!--推荐位html修改处-->


<script type="text/javascript" src="/js/base-v1.js"></script>

<!-- 购物车相关业务 -->
<script type="text/javascript" src="js/cart.js"></script>
<script type="text/javascript" src="js/jquery.price_format.2.0.min.js"></script>

</body>
</html>