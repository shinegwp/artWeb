<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta charset='utf-8'>
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<title>付款</title>
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
	</head>

	<body>
		<!--header star-->
		<div class="header clearfix">
			<div class="top clearfix">
				<div class="topctent clearfix">
					<div class="left clearfix fl">
						公告：您好，欢迎登录北京椿龄文化发展有限公司
					</div>
					<div class="right clearfix fr">
						<div class="zuo clearfix fl">
							<ul class="clearfix fl" id="displayName">
								
								<li >
									<a href="http://sso.jiangyou-art.com/page/register">
										注册/登陆
									</a>
								</li>
								
								<li>
									<a href="#" onclick="$.grxx()">
										个人中心
									</a>
								</li>
								
							</ul>
						</div>
						<div class="shopcar-btn clearfix fl">
							<a href="shopping.html" class="box-s">
								购物车（0）
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
					<li>
						<a href="artist.html">专家</a>
					</li>
					<li><a href="#" onclick="$.hasLogin()">我要寄卖</a></li>
				</ul>
			</div>
		</div>
		<!--navbar end-->
		<script type="text/javascript">
		var items;
		var sum;
		 var a = $.cookie("user");
		 var user=eval('('+a+')');
		$(function()
				{
			var carjson = $.cookie("car");
			var car = eval("("+carjson+")");
			 items = car.items;
			 $.displayUserName();
			 sum=0;
			var money;
			$.getSumMoney();
			
			$.getMoney();
			
			$.displayUserName();
				});
		
		$.displayUserName = function()//如果登陆了展示退出和欢迎
		{
			var _ticket = $.cookie("TT_TOKEN");
			if (!_ticket) {
				$("#displayName")
						.html(
								"<li ><span class='f1'>您好，请</span><a href='http://sso.jiangyou-art.com/page/login' class='f1'>登陆</a></li><li><a href='http://sso.jiangyou-art.com/page/register' >免费注册</a></li>")
			}
			$
					.ajax({
						url : "http://sso.jiangyou-art.com/userLogin/token/"
								+ _ticket,

						dataType : "jsonp",
						type : "GET",
						success : function(data) {
							if (data.status == 200) {
								var uname = data.data.uname;
								var html = "<li ><span class='f1'>欢迎</span><a href='grxx' class='f1'>"
										+ uname
										+ "</a>进入商场</li><li><a href='#' onclick='$.grxx()'>个人中心</a></li><li><a href='#' onclick='$.outLogin()'>退出</a></li>"
								$("#displayName").html(html);
							}
						}
					});
		}

		$.outLogin = function() {
			$
					.ajax({
						url : "http://sso.jiangyou-art.com/userLogin/outLogin",
						type : "post",
						success : function(data) {
							if (data.msg == "OK") {
								alert("成功退出！");
								$("#displayName")
										.html(
												"<li ><a href='sso.jiangyou-art.com/page/register'>注册/登陆</a></li><li><a href='#' onclick='$.grxx()'>个人中心</a></li><li>")
							} else {
								alert("操作有误");
							}
						},
						error : function() {
							alert("error");
						}

					});
		}
		$.grxx = function()//当点击个人中心时判断是否已登录
		{
			if ($.cookie("TT_TOKEN") == null) {
				alert("请先登录！");
			} else {
				window.location.href = "grxx";
			}
		}
		
		$.displayUserName=function()//展示用户登陆姓名
		{
		if(user!=null)

		 {
			
			$("#displayName").html("<li ><span class='f1'>欢迎</span><a href='grxx' class='f1'>"+user.uname+
					"</a>进入商场</li><li><a href='register' >免费注册</a></li><li><a href='#' onclick='$.grxx()'>个人中心</a></li><li><a href=''#' onclick=''>退出</a></li>")
		 
			}
		}
		$.getSumMoney=function()
		{
			for(var i=0;i<items.length;i++)
				{
				  sum = sum+items[i].price+0;
				}
		
			$("#paymoney").html(sum);
			
		}
		$.getMoney=function()
		{
			$.ajax({
				url:"getUserById",
				data:{
					
				    uid:user.uid
				},
				type:"post",
				dataType:"json",
				success:function(data)
				{$("#money").html("余额："+data.data.money);
				
				},error:function()
				{ alert("error");
				}
			});
		}
		$.pay=function()
		{

			$.ajax({
				url:"pay",
				data:{
					uid:user.uid,
				    money:sum
				},
				type:"post",
				dataType:"json",
				success:function(data)
				{$("#money").html("余额："+data.msg);
					
					if(data.status==1)
					{
					  alert("支付成功！");
					}
				
					
				
				},error:function()
				{ alert("error");
				}
			});
		}
		</script>
		<!--Main-wrap-->
		<div class="main-wrap graybg">
			<div class="wrapper pt40 pb40">
				<div class="order-detail-box white-box clearfix">
					<p class="fl icon"> <i class="iconfont">&#xe613;</i></p>
					<div class="fr order-info">
						<div class="line-bot pt20 pb20 clearfix">
							<p class="fl l-suc-info">
								<span class="full-db fs26 darkgray">订单提交成功，应付金额 <em class="orange" id="paymoney">144.00</em> 元</span>
								<span class="full-db fs14 lh30">请您尽快完成支付，支付成功后7天内发货，否则订单会被自动取消</span>
							</p>
							
						</div>
						<div class="order-show pt10">
							<span class="full-db fs14 lh30 darkgray">收货地址     安徽省合肥市蜀山区拓基城市广场 230031（邮编） 孙瑾晨（收） 18056050000</span>
							<span class="full-db fs14 lh30 darkgray">商品信息     墙角数枝梅，凌寒独自开  X 1</span>
						</div>
					</div>
				</div>
				<div class="pay-order-style white-box mt20">
					<div class="title line-bot">
						<span class="fs18 darkgray ml40 pl10">选择以下支付方式付款</span>
					</div>
					<div class="pay-cont">
						<form action="">
							<div class="re_charge line-bot pb30 pt30 clearfix">
								<label class="fl fs16 darkgray pt20">账户余额支付</label>
								<a href="javascript:" class="fl check-inline ml10"><span class="fs16 orange" id="money">余额：2000.00元</span><em></em></a>
							</div>
							
							<div class="next go-pay pt30 clearfix">
								<input type="button" onclick="$.pay()" class="radius3 orange-but fs20" value="立即支付">
							</div>
						</form>
					</div>

				</div>

			</div>
		</div>
		<!--/end-->

		<!--footer star-->
		<div class="footer clearfix">
			<div class="content clearfix">
				<div class="top clearfix">
					<div class="list clearfix fl box-s">
						<div class="part icon1 box-s">
							<h3>专业</h3>
							<p>拥有资深艺术顾问和先进交易平台，安全物流，快捷支付。</p>
						</div>
					</div>
					<div class="list clearfix fl box-s">
						<div class="part icon2 box-s">
							<h3>保真</h3>
							<p>阵容强大的艺术评鉴团，确保平台上的藏品货真价实。</p>
						</div>
					</div>
					<div class="list clearfix fl box-s">
						<div class="part icon3 box-s">
							<h3>保值</h3>
							<p>为您精选具备艺术价值的作品，助您的资产保值、增值。</p>
						</div>
					</div>
				</div>
				<div class="bottom clearfix">
					<div class="left clearfix fl">
						<div class="list clearfix">
							<div class="shang clearfix">
								<p>新手指南</p>
								<span></span>
							</div>							
							<div class="xia clearfix">
								<ul>
									<li><a href="scgmlc.html">商城购买流程</a></li>
									<li><a href="cjwt.html">常见问题</a></li>
								</ul>
							</div>
						</div>
						<div class="list clearfix">
							<div class="shang clearfix">
								<p>账户管理</p>
								<span></span>
							</div>							
							<div class="xia clearfix">
								<ul>
									<li><a href="zhcz.html">账户充值</a></li>
									<li><a href="zhtx.html">账户提现</a></li>
									<li><a href="zffs.html">支付方式</a></li>
								</ul>
							</div>
						</div>						
						<div class="list clearfix">
							<div class="shang clearfix">
								<p>服务合作</p>
								<span></span>
							</div>							
							<div class="xia clearfix">
								<ul>
									<li><a href="friend-link.html">友情链接</a></li>
									<li><a href="ysjrz.html">艺术家入驻</a></li>
								</ul>
							</div>
						</div>
						<div class="list clearfix">
							<div class="shang clearfix">
								<p>关于我们</p>
								<span></span>
							</div>							
							<div class="xia clearfix">
								<ul>
									<li><a href="gsjj.html">公司简介</a></li>
									<li><a href="contact.html">联系我们</a></li>
									<li><a href="jrwm.html">加入我们</a></li>
								</ul>
							</div>
						</div>
						<div class="list clearfix">
							<div class="shang clearfix">
								<p>售后服务</p>
								<span></span>
							</div>							
							<div class="xia clearfix">
								<ul>
									<li><a href="wlsm.html">物流说明</a></li>
									<li><a href="mzsm.html">免责声明</a></li>
								</ul>
							</div>
						</div>
					</div>
					<div class="middle clearfix fl">
						<ul>
							<li><img src="upload/ewm.jpg"/></li>
							<li><img src="upload/ewm.jpg"/></li>
						</ul>
					</div>
					<div class="right clearfix fr">
						<p class="bt">免费咨询热线：</p>
						<p class="tel">400-000-0000</p>
						<p class="fu-bt">(周一到周五8:00-22:00)</p>
					</div>
				</div>
			</div>
			<div class="banquan clearfix ta-center">
				Copyright © 2003-2015 椿龄文化(chunlingwenhua). All Rights Reserved. 
			</div>
		</div>
		<!--footer end-->
	</body>
	<script src="js/other.js" type="text/javascript" ></script>
</html>