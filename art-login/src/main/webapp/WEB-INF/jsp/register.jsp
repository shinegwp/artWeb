<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta charset='utf-8'>
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>注册</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
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
<script
	src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script
	src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script
	src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
<script src="../js/additional-methods.min.js"></script>
<script src="../js/additional-methods.js"></script>

<style>
.error {
	color: red;
}
</style>
</head>

<body class="sign-bg">
	<div class="sign clearfix">
		<div class="top clearfix">
			<a href="http://www.jiangyou-art.com" class="fl fanhui">返回首页</a>
			<p class="fr">
				已有商城账号？ <a href="login" class="zhuce ra3"> 登录 </a>
			</p>
		</div>
		<div class="bottom clearfix box-s ra10">
			<div class="sign-logo clearfix">
				<img src="../img/yuanlogo.png" />
			</div>
			<div class="content clearfix">

				<ul>

					<form id="regist" action="" method="post">
						<ul>
							<li><input type="text" name="uname" id="uname" value=""
								placeholder="用户名（只能包括中英文、数字和下划线）" class="fl shuru" required />
							</li>

							<li><input type="tel" name="tel" id="tel" value=""
								placeholder="手机号" class="fl shuru" required /></li>

							<li><input type="text" name="email" id="email" value=""
								placeholder="邮箱" class="fl shuru" required /></li>
							<li><input type="password" name="upassword" id="upassword"
								value="" placeholder="密码（只能包括中英文、数字和下划线）" class="fl shuru"
								required /></li>
							<li><input type="password" name="password2" id="password2"
								value="" placeholder="请再次输入密码" class="fl shuru" required /></li>

						</ul>

						<input class="sign-btn zhuce-btn ra5" value="立即注册"
							onclick="REGISTER.reg();" type="button" />
					</form>
			</div>
			<script type="text/javascript">
				//验证
				$()
						.ready(
								function() {
									//$("#itemAddForm").validate();
									$.validator
											.addMethod(
													"isPhoneNumber",
													function(value, element,
															params) {
														var length = value.length;
														var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
														return this
																.optional(element)
																|| (length == 11 && mobile
																		.test(value));
													}, "请输入正确的手机号");
									//字符验证 
									jQuery.validator
											.addMethod(
													"stringCheck",
													function(value, element) {
														return this
																.optional(element)
																|| /^[\u0391-\uFFE5\w]+$/
																		.test(value);
													}, "只能包括中文字、英文字母、数字和下划线");
									// 中文字两个字节 
									jQuery.validator
											.addMethod(
													"byteRangeLength",
													function(value, element,
															param) {
														var length = value.length;
														for (var i = 0; i < value.length; i++) {
															if (value
																	.charCodeAt(i) > 127) {
																length++;
															}
														}
														return this
																.optional(element)
																|| (length >= param[0] && length <= param[1]);
													},
													"请确保输入的值在3-15个字节之间(一个中文字算2个字节)");

									//身份证号码验证 
									jQuery.validator
											.addMethod(
													"isIdCardNo",
													function(value, element) {
														return this
																.optional(element)
																|| idCardNoUtil
																		.checkIdCardNo(value);
													}, "请正确输入您的身份证号码");

									//密码必须是数字
									jQuery.validator.addMethod("isPassword",
											function(value, element) {
												var userblank = /^\d+$/;
												return this.optional(element)
														|| (userblank
																.test(value));
											}, "密码必须为纯数字");
									//邮政编码验证 
									jQuery.validator
											.addMethod(
													"isZipCode",
													function(value, element) {
														//var tel = /^[0-9]{6}$/; 
														var length = value.length;
														// var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
														var email = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
														// return this.optional(element) || (email.test(value) || mobile.test(value));
														return this
																.optional(element)
																|| (email
																		.test(value));
													}, "请正确填写邮箱");
									// 日期验证
									jQuery.validator
											.addMethod(
													"isDate",
													function(value, element) {
														var ereg = /^(\d{1,4})(-|\/)(\d{1,2})(-|\/)(\d{1,2})$/;
														var r = value
																.match(ereg);
														if (r == null) {
															return false;
														}
														var d = new Date(r[1],
																r[3] - 1, r[5]);
														var result = (d
																.getFullYear() == r[1]
																&& (d
																		.getMonth() + 1) == r[3] && d
																.getDate() == r[5]);
														return this
																.optional(element)
																|| (result);
													}, "请输入正确的日期");
									$("#regist").validate({
										rules : {
											uname : {
												//af:["a","f"],
												//isPhoneNumber:true,
												minlength : "2",
												stringCheck : true

											},
											tel : {

												//minlength : 11,
												isPhoneNumber : true
											// 自定义方法：校验手机号在数据库中是否存在
											// checkPhoneExist : true,

											},
											email : {

												isZipCode : true
											},

											upassword : {
												stringCheck : true,
												minlength : "2",

											},

											password2 : {
												isPassword : true,
												maxlength : "5",
												minlength : "5",
												equalTo : "#upassword"

											},

										},
										messages : {
											tel : {
												//minlength : "确认手机不能小于11个字符",
												isPhoneNumber : "号码错误"
											},
											uname : {
												minlength : "不能小于两个"
											},
											email : {
												isZipCode : "邮箱格式错误"
											},

											upassword : {
												isPassword : "格式错误"

											},
											password2 : {
												isPassword : "密码不一致"

											},

										},

									});

								});
				//注册
				var REGISTER = {
					param : {
						//单点登录系统的url
						surl : ""
					},
					inputcheck : function() {
						//不能为空检查
						if ($("#uname").val() == "") {
							alert("用户名不能为空");
							$("#uname").focus();
							return false;
						}
						if ($("#tel").val() == "") {
							alert("手机号不能为空");
							$("#tel").focus();
							return false;
						}

						if ($("#email").val() == "") {
							alert("邮箱不能为空");
							$("#email").focus();
							return false;
						}

						if ($("#upassword").val() == "") {
							alert("密码不能为空");
							$("#upassword").focus();
							return false;
						}
						//密码检查
						if ($("#upassword").val() != $("#password2").val()) {
							alert("密码不一致");
							$("#password2").select();
							$("#password2").focus();
							return false;
						}
						alert("http://sso.jiangyou-art.com/userLogin/check/");
						return true;
					},
					beforeSubmit : function() {
						//检查用户是否已经被占用
						$
								.ajax({
									
									url : "http://sso.jiangyou-art.com/userLogin/check/"
											+ $("#uname").val()
											+ "/1?r=" + Math.random(),
									success : function(data) {
										if (data.data) {
											//检查手机号是否存在
											$
													.ajax({
														url : "http://sso.jiangyou-art.com/userLogin/check/"
																+ $("#tel")
																		.val()
																+ "/2?r="
																+ Math.random(),
														success : function(data) {
															if (data.data) {
																//检查邮箱是否已经存在
																$
																		.ajax({
																			url : "http://sso.jiangyou-art.com/userLogin/check/"
																					+ $(
																							"#email")
																							.val()
																					+ "/3?r="
																					+ Math
																							.random(),
																			success : function(
																					data) {
																				if (data.data) {
																					REGISTER
																							.doSubmit();
																				} else {
																					alert("此邮箱已经被注册！");
																					$(
																							"#email")
																							.select();
																				}
																			}
																		});
															} else {
																alert("此手机号已经被注册！");
																$("#tel")
																		.select();
															}
														}
													});
										} else {
											alert("此用户名已经被占用，请选择其他用户名");
											$("#uname").select();
										}
									}
								});
					},
					doSubmit : function() {
						$.post("/userLogin/register", $("#regist").serialize(),
								function(data) {
									if (data.status == 200) {
										alert('用户注册成功，请登录！');
										REGISTER.login();
									} else {
										alert("注册失败！");
									}
								});
					},
					login : function() {
						location.href = "/page/login";
						return false;
					},
					reg : function() {
						if (this.inputcheck()) {
							this.beforeSubmit();
						}
					}
				};
			</script>
		</div>
		<div class="xia clearfix">
			<p>Copyright © 2003-2015 椿龄文化(chunlingwenhua). All Rights
				Reserved.</p>
		</div>
	</div>
</body>
</html>
