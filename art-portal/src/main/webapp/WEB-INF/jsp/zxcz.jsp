<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta charset='utf-8'>
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<title>在线充值</title>
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

    <script type="text/javascript">
    var user;
	$(function() {
		$.displayUserName();
	});
	$.displayUserName = function()//如果登陆了展示退出和欢迎
	{
		var _ticket = $.cookie("TT_TOKEN");
		
		$
				.ajax({
					url : "http://sso.jiangyou-art.com/userLogin/token/"
							+ _ticket,

					dataType : "jsonp",
					type : "GET",
					success : function(data) {
						if (data.status == 200) {
							var uname = data.data.uname;
							user = data.data;
							var html = "<li ><span class='f1'>欢迎</span><a href='grxx' class='f1'>"
									+ uname
									+ "</a>进入商场</li><li><a href='#' onclick='$.outLogin()'>退出</a></li>"
							$("#displayName").html(html);
						} else {
							alert("登陆已过期，请重新登录");
							window.location.href = "http://sso.jiangyou-art.com/page/login?redirect=http://www.jiangyou-art.com/zxcz";
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
				  window.location.href = "http://www.jiangyou-art.com";
				  }
			  else
				  {
				  alert("操作有误");
				  }
			  },
			  error:function()
			  {
				  window.location.href = "http://www.jiangyou-art.com";	                  
			  }
			  
			});
	}	
	
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
								
								
							</ul>
						</div>
						<div class="shopcar-btn clearfix fl">
							<a href="shopping" class="box-s">
								购物车
							</a>
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
				</ul>
			</div>
		</div>
		<!--navbar end-->

		<!--Main-wrap-->
		<div class="main-wrap graybg">
			<div class="wrapper pt40 pb40 clearfix">
				<div class="fl slide-nav white-box">
					<ul>
						<li >
							<a href="grxx" class="db fs16">个人信息</a>
						</li>
						
						<li>
							<a href="shdz" class="db fs16">收货地址</a>
						</li>
						<li>
							<a href="wdsc" class="db fs16">我的收藏</a>
						</li>
						
						<li>
							<a href="xgmm" class="db fs16">修改密码</a>
						</li>
						<li>
							<a href="zhye" class="db fs16">账户余额</a>
						</li>
						<li class="on">
							<a href="zxcz" class="db fs16">在线充值</a>
						</li>
						<li>
							<a href="lljl" class="db fs16">退货记录</a>
						</li>
						<li>
							<a href="zixun" class="db fs16">我的咨询</a>
						</li>
						
					</ul>
				</div>
				<script type="text/javascript">
				var money;
				$.zxcz=function()
				{  
					 money = $("#je").attr("value");
					//alert(parseInt($.cookie("money"))+parseInt(money));
					$.ajax(
							{
								url:"restuserupdate",
								data:{
									"uid":user.uid,
									"money":user.money,
								},Type:"post",
								dataType:"json",
								success:function()
								{
									
									$.creatTradeLog();
								},
								error:function()
								{
									alert("error");
								}
								
							});
					
				}
				$.creatTradeLog=function()
				{
				  $.ajax({
					  url:"creatTradeLog",
					  data:{
						  "tradeMoney":"+"+money,
						  "tradeType":"在线充值",
						  "balance":user.money,
						  "uid":user.uid,
						  
					  },Type:"post",
					  dataType:"json",
					  success:function(data)
					  {
						  alert("充值成功,请重新登录");
							window.location.href = "http://sso.jiangyou-art.com/page/login?redirect=http://www.jiangyou-art.com/zxcz";
					  },error:function()
					  {
						  alert("error");
					  }
				  });	
				}
				</script>
				<div class="fr slide-show white-box">
					<div class="dark-tit line-bot">
						<h3 class="fs26">在线充值</h3></div>
					<form action="">
						<div class="re_charge line-bot pb30 pt30 "><label class="fs16 darkgray">输入充值金额</label><input type="text" class="ml10 mr10 fs16" placeholder="" id="je" value=""><label class="fs16 darkgray">元</label></div>
						<div class="pay-style line-bot pb30 pt30 clearfix">
							<label class="fl fs16 darkgray">支付平台支付</label>
							<a href="javascript:" class="check-inline check_on ml10"><span><img src="img/cft.jpg"/></span><em></em></a>
							<a href="javascript:" class="check-inline ml10"><span><img src="img/zfb.jpg" /></span><em></em></a>
						</div>
						<div class="bank-check line-bot pt30 pb30 clearfix">
							<label class="fl fs16 darkgray">网银在线支付</label>
							<div class="fl bank-list clearfix">
								<a href="javascript:" class="check-inline ml10 mb10"><span><img src="img/bank/zh.jpg"></span><em></em></a>
								<a href="javascript:" class="check-inline ml10 mb10"><span><img src="img/bank/gh.jpg"></span><em></em></a>
								<a href="javascript:" class="check-inline ml10 mb10"><span><img src="img/bank/jh.jpg"></span><em></em></a>
								<a href="javascript:" class="check-inline ml10 mb10"><span><img src="img/bank/chinaback.jpg"></span><em></em></a>
								<a href="javascript:" class="check-inline ml10 mb10"><span><img src="img/bank/yz.jpg"></span><em></em></a>
								<a href="javascript:" class="check-inline ml10 mb10"><span><img src="img/bank/gf.jpg"></span><em></em></a>
								<a href="javascript:" class="check-inline ml10 mb10"><span><img src="img/bank/pf.jpg"></span><em></em></a>
								<a href="javascript:" class="check-inline ml10 mb10"><span><img src="img/bank/ms.jpg"></span><em></em></a>
								<a href="javascript:" class="check-inline ml10 mb10"><span><img src="img/bank/bh.jpg"></span><em></em></a>
								<a href="javascript:" class="check-inline ml10 mb10"><span><img src="img/bank/zx.jpg"></span><em></em></a>
							</div>
						</div>
						<div class="next pt30 ">
							<input type="button" class="radius3 orange-but fs20" value="下一步" onclick="$.zxcz();">
						</div>
					</form>

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
				
			<div class="banquan clearfix ta-center">
				Copyright 酱油文化. All Rights Reserved. 
			</div>
		</div>
		<!--footer end-->
	</body>

</html>