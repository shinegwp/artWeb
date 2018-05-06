<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta charset='utf-8'>
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<title>登录</title>
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
				<a href="index" class="fl fanhui">返回首页</a>
				<p class="fr">
					还没有商城账号？
					<a href="settled" class="zhuce ra3">
						注册
					</a>
				</p>
			</div>
			<div class="bottom clearfix box-s ra10">
				<div class="sign-logo clearfix">
					<img src="img/yuanlogo.png"/>
				</div>
				<div class="content clearfix" id="logdiv">
				
					<ul>
						<li>
							<span class="fl"></span>
							<input type="text" name="tel" id="tel" value="" placeholder="用户名/手机号码" class="fl shuru" />
						</li>
						<li>
							<span class="fl mima"></span>
							<input type="password" name="password" id="password" placeholder="密码" class="fl shuru" />
						</li>
						
						<li class="jizhu">
						
					       <div id="result" align="center"></div>
							<div class="radiothree fl"> 
							
							    <label>
							        <input type="checkbox" name="" value="">
							        <div class="option"></div>
							        <p class="opt-text fl ml20">记住密码</p>
							    </label>
							</div>
							<a href="#" class="wjmima fr">
								忘记密码？
							</a>
						</li>
					</ul>
					<a  href="#" onclick="$.login();"  class="sign-btn ra5">立即登录</a>
				</div>
				<script type="text/javascript">
				$.login=function()
				{
					$.post(
							"prologin",{
								username:$("#tel").val(),
								password:$("#password").val()
							},function(data)
							{   
								if(data=="successful")
									{
									window.location.href="index";
									}
								else
									{
									 $("#result").html(data);
									}
								
								
							}
						);
				}
			
				
				
				</script>
			<!--  	<script type="text/javascript">
                  	$("#login").click(function(){

    		var username = $("[name=username]").val();
    		var password = $("[name=password]").val();
    		 alert(username);
    		if(username!="admin" || password!="admin"){
    			$.messager.alert('错误',"用户名密码不正确！");
    			return ;
    		}
    		window.location.href="login";
    	});
    </script>		-->	
			</div>
			<div class="xia clearfix">
				<p>Copyright © 2003-2015 椿龄文化(chunlingwenhua). All Rights Reserved.</p>
			</div>
		</div>
	</body>
</html>
