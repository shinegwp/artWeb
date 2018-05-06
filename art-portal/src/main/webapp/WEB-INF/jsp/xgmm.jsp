<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta charset='utf-8'>
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<title>修改密码</title>
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
<script type="text/javascript">
$(function() {
	$.displayUserName();
	var user;
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
					}else {
						alert("登陆已过期，请重新登录");
						window.location.href = "http://sso.jiangyou-art.com/page/login?redirect=http://www.jiangyou-art.com/xgmm";
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
$.updatapassword=function()
{
	var newPassword = $("#newPassword").val();
	var repeatPassword = $("#repeatPassword").val();
	alert(user.uid);
	if(!(newPassword==repeatPassword))
		{
		alert("两次输入密码不相同，请重新输入");
		}
	else{
		
			alert("开始修改");
			$.ajax({
				url:"restuserupdatefront",
				data:{
					"uid":user.uid,
					"upassword":newPassword
				},type:"post",
				dataType:"json",
				success:function(data)
				{  alert("修改成功，请重新登录！");
				window.location.href = "http://sso.jiangyou-art.com/page/login?redirect=http://www.jiangyou-art.com/xgmm"
					
				
				},error:function()
					{
				
				}
				
			});
			
		
	}
	}
</script>
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
						
						<li class="on">
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
						
					</ul>
				</div>
				<div class="fr slide-show white-box">
					<div class="dark-tit line-bot clearfix">
						<h3 class="fl fs26">修改密码</h3>
					</div>
					<div class="passbox">
						<form action="">
							<p class="clearfix mb20"><label class="fl fs14">新密码：</label><input id="newPassword" type="text" class="fl ml10" placeholder="由中英文，数字及下划线组成" value=""></p>
							<p class="clearfix mb20"><label class="fl fs14">重复新密码：</label><input id="repeatPassword" type="text" class="fl ml10" placeholder="" value=""></p>
							<p class="clearfix">
								<label class="fl"></label>
								<input type="button" class="fl ml10 orange-but fs16 radius3" value="确认" onclick="$.updatapassword()">
								<input type="button" class="fl ml10 fs16 radius3 reset-but" value="取消">
							</p>
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
				
			<div class="banquan clearfix ta-center">
				Copyright 酱油文化. All Rights Reserved. 
			</div>
		</div>
		<!--footer end-->
	</body>

</html>