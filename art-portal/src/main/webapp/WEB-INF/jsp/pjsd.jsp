<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta charset='utf-8'>
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<title>评价</title>
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
	</head>
    <script type="text/javascript">
	$(function() {
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
</script>
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
							<a href="shopping" class="box-s">
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
					<a href="index"></a>
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
						<a href="index">首页</a>
					</li>
					<li>
						<a href="special">专场</a>
					</li>
					<li>
						<a href="mall">商城</a>
					</li>
					<li>
						<a href="artist">艺术家</a>
					</li>
				</ul>
			</div>
		</div>
		<!--navbar end-->

		<!--Main-wrap-->
		<div class="main-wrap graybg">
			<div class="wrapper pt40 pb40 clearfix">
				<div class="fl slide-nav white-box">
					<ul>
						<li>
							<a href="grxx" class="db fs16">个人信息</a>
						</li>
						<li>
							<a href="wddd" class="db fs16">我的订单</a>
						</li>
						<li class="on">
							<a href="pjsd" class="db fs16">评价晒单</a>
						</li>
						<li>
							<a href="shdz" class="db fs16">收货地址</a>
						</li>
						<li>
							<a href="wdsc" class="db fs16">我的收藏</a>
						</li>
						<li>
							<a href="wdgz" class="db fs16">我的关注</a>
						</li>
						<li>
							<a href="xgmm" class="db fs16">修改密码</a>
						</li>
						<li>
							<a href="zhye" class="db fs16">账户余额</a>
						</li>
						<li>
							<a href="zxcz" class="db fs16">在线充值</a>
						</li>
						<li>
							<a href="lljl" class="db fs16">退货记录</a>
						</li>
						<li>
							<a href="zixun" class="db fs16">我的咨询</a>
						</li>
						<li>
							<a href="znx" class="db fs16">站内信</a>
						</li>
					</ul>
				</div>
				<div class="fr slide-show white-box">
					<div class="dark-tit line-bot clearfix">
						<h3 class="fl fs26">评价晒单</h3>
						<p class="fr slide-t-nav">
							<a href="#" class="on fs14 radius3">待评价商品</a>
							<a href="#" class="fs14 radius3">已评价商品</a>
						</p>
					</div>
					<div class="fav-list evaluate-list mt10">
						<ul class="clearfix">
							<li>
								<a href="#" class="pro "><span><img src="upload/2.jpg" alt=""/></span></a>
								<a href="#" class="tit fs14 full-db darkgray over">北京椿龄文化墙角一枝梅</a>
								<span class="fs14 full-db"><em class="orange">29.90</em> 元</span>
								<span class="fs12 full-db">95127人评价</span>
								<a href="pjsd_pj.html" class="orange-but mt5 fs14">评价商品</a>
							</li>
							<li>
								<a href="#" class="pro "><span><img src="upload/2.jpg" alt=""/></span></a>
								<a href="#" class="tit fs14 full-db darkgray over">北京椿龄文化墙角一枝梅</a>
								<span class="fs14 full-db"><em class="orange">29.90</em> 元</span>
								<span class="fs12 full-db">95127人评价</span>
								<a href="pjsd_pj.html" class="orange-but mt5 fs14">评价商品</a>
							</li>
							<li>
								<a href="#" class="pro "><span><img src="upload/2.jpg" alt=""/></span></a>
								<a href="#" class="tit fs14 full-db darkgray over">北京椿龄文化墙角一枝梅</a>
								<span class="fs14 full-db"><em class="orange">29.90</em> 元</span>
								<span class="fs12 full-db">95127人评价</span>
								<a href="pjsd_pj.html" class="orange-but mt5 fs14">评价商品</a>
							</li>
							<li>
								<a href="#" class="pro "><span><img src="upload/2.jpg" alt=""/></span></a>
								<a href="#" class="tit fs14 full-db darkgray over">北京椿龄文化墙角一枝梅</a>
								<span class="fs14 full-db"><em class="orange">29.90</em> 元</span>
								<span class="fs12 full-db">95127人评价</span>
								<a href="pjsd_pj.html" class="orange-but mt5 fs14">评价商品</a>
							</li>
							<li>
								<a href="#" class="pro "><span><img src="upload/2.jpg" alt=""/></span></a>
								<a href="#" class="tit fs14 full-db darkgray over">北京椿龄文化墙角一枝梅</a>
								<span class="fs14 full-db"><em class="orange">29.90</em> 元</span>
								<span class="fs12 full-db">95127人评价</span>
								<a href="pjsd_pj.html" class="orange-but mt5 fs14">评价商品</a>
							</li>
							<li>
								<a href="#" class="pro "><span><img src="upload/2.jpg" alt=""/></span></a>
								<a href="#" class="tit fs14 full-db darkgray over">北京椿龄文化墙角一枝梅北京椿龄文化墙角一枝梅</a>
								<span class="fs14 full-db"><em class="orange">29.90</em> 元</span>
								<span class="fs12 full-db">95127人评价</span>
								<a href="pjsd_pj.html" class="orange-but mt5 fs14">评价商品</a>
							</li>
						</ul>
					</div>
					<div class="tab-pages mt10">
						<a href="#" class="tab-prev tab-btn">上一页</a>
						<a href="#" class="page-btn current">1</a>
						<a href="#" class="page-btn">2</a>
						<a href="#" class="page-btn">3</a>
						<a href="#" class="tab-next tab-btn">下一页</a>
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

</html>