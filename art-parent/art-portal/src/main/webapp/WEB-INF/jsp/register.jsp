<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta charset='utf-8'>
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<title>注册</title>
		<meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta http-equiv="Cache-Control" content="no-siteapp">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="mobile-web-app-capable" content="yes">
		<meta name="format-detection" content="telephone=no">
		<meta name="keywords" content="">
		<meta name="description" content="">
		<link rel="stylesheet" type="text/css" href="css/page.css" />
		<link rel="stylesheet" type="text/css" href="css/base.css" />
		<script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="js/jquery.SuperSlide.2.1.js"></script>
	</head>
	
	<body class="sign-bg">
		<div class="sign clearfix">
			<div class="top clearfix">
				<a href="index.html" class="fl fanhui">返回首页</a>
				<p class="fr">
					已有商城账号？
					<a href="sign" class="zhuce ra3">
						登录
					</a>
				</p>
			</div>
			<div class="bottom clearfix box-s ra10">
				<div class="sign-logo clearfix">
					<img src="img/yuanlogo.png"/>
				</div>
				<div class="content clearfix">
					<ul>
						<li>
							<span class="fl"></span>
							<input type="text" name="" id="username" value="" placeholder="用户名" class="fl shuru" />
						</li>
						<li>
							<span class="fl"></span>
							<input type="text" name="" id="tel" value="" placeholder="手机号" class="fl shuru" />
						</li>
						<li>
							<span class="fl"></span>
							<input type="text" name="" id="ident" value="" placeholder="身份证号" class="fl shuru" />
						</li>
						<!-- <li class="yanzhengma">
							<span class="fl hudun"></span>
							<input type="text" name="" id="" value="" placeholder="请输入验证码" class="fl shuru yzma" />
							<samp class="fr"><img src="upload/yanzhengma.jpg"/></samp>
						</li>
					     	<li class="yanzhengma">
							<span class="fl hudun"></span>
							<input type="text" name="" id="" value="" placeholder="请输入验证码" class="fl shuru yzma" />
							<samp class="fr">获取验证码</samp>
						</li>
						-->
						<li>
							<span class="fl mima"></span>
							<input type="password" name="" id="password1" value="" placeholder="密码" class="fl shuru" />
						</li>
						<li>
							<span class="fl mima"></span>
							<input type="password" name="" id="password2" value="" placeholder="请再次输入密码" class="fl shuru" />
						</li>
						<li class="jizhu">
							<div class="radiothree fl"> 
							    <label>
							        <input type="checkbox" name="" value="">
							        <div id="result" align="center"></div>
							        <div class="option"></div>
							        <p class="opt-text fl ml20">我已阅读并同意<a href="zcxy.html">《椿龄艺术用户注册协议》</a></p>
							    </label>
							</div>
						</li>
					</ul>
					<a href="#" class="sign-btn zhuce-btn ra5" id="reg">立即注册</a>
				</div>
				<script type="text/javascript">
				    $("#reg").click(function(){
				    	$.post("regis",{username:$("#username").val(),
				    		               tel:$("#tel").val(),
				    		               password1:$("#password1").val(),
				    		               password2:$("#password2").val(),
				    		               ident:$("#ident").val()
				    	},function(data)
				    	{  alert(data);
				    		if(data=="false")
				    		{
				    		 $("#result").html("请重新输入");
				    		}
				    	  else
				    		{window.location.href="index";
				    		}

				    	}
				    			);
				    	
				    }
				    		
				    );
				</script>				
			</div>
			<div class="xia clearfix">
				<p>Copyright © 2003-2015 椿龄文化(chunlingwenhua). All Rights Reserved.</p>
			</div>
		</div>
	</body>
</html>
