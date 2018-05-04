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
		<link rel="stylesheet" type="text/css" href="../css/page.css" />
		<link rel="stylesheet" type="text/css" href="../css/base.css" />
		<script src="../js/jquery-1.8.3.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="../js/jquery.SuperSlide.2.1.js"></script>
		
		<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
 <script src="../js/additional-methods.min.js"></script>
  <script src="../js/additional-methods.js"></script>
  <style>
.error{
	color:red;
}
</style>
	</head>
	
	<body class="sign-bg">
		<div class="sign clearfix">
			<div class="top clearfix">
				<a href="http://www.jiangyou-art.com" class="fl fanhui">返回首页</a>
				<p class="fr">
					还没有商城账号？
					<a href="register.html" class="zhuce ra3">
						注册
					</a>
				</p>
			</div>
			<div class="bottom clearfix box-s ra10">
				<div class="sign-logo clearfix">
					<img src="../img/yuanlogo.png"/>
				</div>
				<div class="content clearfix" id="logdiv">
<form id="formlogin" action="" method="post">
			       <ul>
						

					
						<li>
							<input type="text" name="uname" id="uname" value="" placeholder="用户名" class="fl shuru" required/>
						</li>
						
						<li>
							<input type="password" name="upassword" id="upassword" value="" placeholder="密码（中英文数字下划线组成）" class="fl shuru" required/>
						</li>
						
			           </ul>
                       
			           <input  class="sign-btn zhuce-btn ra5" onclick="LOGIN.login();" value="登录" type="button" />
				</form>
				
</div>
				<script type="text/javascript">
				//验证
				$().ready(function() {
				    //$("#itemAddForm").validate();
				$.validator.addMethod("isPhoneNumber",function(value,element,params){  
					 var length = value.length;  
					    var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;  
					    return this.optional(element) || (length == 11 && mobile.test(value));  
				},"请输入正确的手机号");
				//字符验证 
				jQuery.validator.addMethod("stringCheck", function(value, element) { 
				   return this.optional(element) || /^[\u0391-\uFFE5\w]+$/.test(value); 
				}, "只能包括中文字、英文字母、数字和下划线"); 
				// 中文字两个字节 
				jQuery.validator.addMethod("byteRangeLength", function(value, element, param) { 
				   var length = value.length; 
				  for(var i = 0; i < value.length; i++){ 
				if(value.charCodeAt(i) > 127){ 
				length++; 
				} 
				} 
				return this.optional(element) || ( length >= param[0] && length <= param[1] ); 
				}, "请确保输入的值在3-15个字节之间(一个中文字算2个字节)"); 

			

				   //密码必须是数字
				   jQuery.validator.addMethod("isPassword", function(value, element) {
				       var userblank = /^\d+$/;
				       return this.optional(element) ||(userblank.test(value));
				   }, "密码必须为纯数字");
				    $("#formlogin").validate({
						rules : {
							
							uname : {
								yteRangeLength:true,
								
							},
                         
							password : {
								stringCheck:true,
								
							},
							
						},
						messages : {
							uname : {
								
								stringCheck : "只能包括中英文字母、数字和下划线"
							},
						
							upassword : {
								stringCheck : "只能包括中英文字母、数字和下划线"
								
							},
							
							
						},
						
					});
				    
				});
				var redirectUrl = "${redirect}";
				var LOGIN = {
						checkInput:function() {
							if ($("#uname").val() == "") {
								alert("用户名不能为空");
								$("#uname").focus();
								return false;
							}
							if ($("#upassword").val() == "") {
								alert("密码不能为空");
								$("#upassword").focus();
								return false;
							}
							return true;
						},
						doLogin:function() {
							$.post("/userLogin/login", $("#formlogin").serialize(),function(data){
								if (data.status == 200) {
									alert("登录成功！");
									if (redirectUrl == "") {
										location.href = "http://www.jiangyou-art.com";
									} else {
										location.href = redirectUrl;
									}
								} else {
									alert("登录失败，原因是：" + data.msg);
									$("#uname").select();
								}
							});
						},
						login:function() {
							if (this.checkInput()) {
								this.doLogin();
							}
						}
					
				};
				$(function(){
					$("#loginsubmit").click(function(){
						LOGIN.login();
					});
				});
			
				
				
				</script>
			
			</div>
			<div class="xia clearfix">
				<p>Copyright 酱油文化. All Rights Reserved.</p>
			</div>
		</div>
	</body>
</html>
