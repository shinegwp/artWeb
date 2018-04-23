<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta charset='utf-8'>
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<title>艺术家入驻</title>
		<meta name="viewport" content="width=device-width,initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
		<meta http-equiv="Cache-Control" content="no-siteapp">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="mobile-web-app-capable" content="yes">
		<meta name="format-detection" content="telephone=no">
		<meta name="keywords" content="">
		<meta name="description" content="">
		<link rel="stylesheet" type="text/css" href="css/page.css" />
		<link rel="stylesheet" type="text/css" href="css/base.css" />
		<link rel="stylesheet" type="text/css" href="css/common.css" />
		<script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
		<script type="text/javascript" src="js/jquery.SuperSlide.2.1.js"></script>
		
	
		<script src="js/laydate/laydate.js"></script>
		<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>
	
	<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.1/themes/default/easyui.css" />
<link rel="stylesheet" type="text/css" href="js/jquery-easyui-1.4.1/themes/icon.css" />
<script type="text/javascript" src="js/jquery-easyui-1.4.1/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.4.1/jquery.easyui.min.js"></script>
<script type="text/javascript" src="js/jquery-easyui-1.4.1/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/common.js"></script>

<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/lib/jquery.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/jquery.validate.min.js"></script>
<script src="http://static.runoob.com/assets/jquery-validation-1.14.0/dist/localization/messages_zh.js"></script>
 <script src="js/additional-methods.min.js"></script>
  <script src="js/additional-methods.js"></script>

<style>
.error{
	color:red;
}
</style>
	
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
							<ul class="clearfix fl">
								<li>
									<span class="fl">欢迎</span>
									<a href="grxx" class="fl">瑾晨0212</a>
									<span class="fl">进入商城</span>
								</li>
								<li>
									<a href="register">
										免费注册
									</a>
								</li>
								<li>
									<a href="settled">
										艺术家入驻
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
								<li><a href="#"><img src="img/sina.png"/></a></li>
								<li><a href="#"><img src="img/qq.png"/></a></li>
								<li><a href="#"><img src="img/wechat.png"/></a></li>
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
					<li class="cur"><a href="index">首页</a></li>
					<li><a href="special">专场</a></li>
					<li><a href="mall">商城</a></li>
					<li><a href="artist">艺术家</a></li>
				</ul>
			</div>
		</div>
		<!--navbar end-->
	<script type="text/javascript">
	var itemAddEditor ;

	
	
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

//身份证号码验证 
jQuery.validator.addMethod("isIdCardNo", function(value, element) { 
return this.optional(element) || idCardNoUtil.checkIdCardNo(value);     
}, "请正确输入您的身份证号码"); 

   //密码必须是数字
   jQuery.validator.addMethod("isPassword", function(value, element) {
       var userblank = /^\d+$/;
       return this.optional(element) ||(userblank.test(value));
   }, "密码必须为纯数字");
//邮政编码验证 
jQuery.validator.addMethod("isZipCode", function(value, element) { 
  //var tel = /^[0-9]{6}$/; 
  var length = value.length;
 // var mobile = /^(13[0-9]{9})|(18[0-9]{9})|(14[0-9]{9})|(17[0-9]{9})|(15[0-9]{9})$/;
  var email =/^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
 // return this.optional(element) || (email.test(value) || mobile.test(value));
  return this.optional(element) || (email.test(value)); 
}, "请正确填写您的邮箱"); 
    // 日期验证
    jQuery.validator.addMethod("isDate", function(value, element){
	var ereg = /^(\d{1,4})(-|\/)(\d{1,2})(-|\/)(\d{1,2})$/;
	var r = value.match(ereg);
	if (r == null) {
		return false;
	}
	var d = new Date(r[1], r[3] - 1, r[5]);
	var result = (d.getFullYear() == r[1] && (d.getMonth() + 1) == r[3] && d.getDate() == r[5]);
	return this.optional(element) || (result);
}, "请输入正确的日期");
    $("#itemAddForm").validate({
		rules : {
			tel : {
				
				minlength : 11,
				isPhoneNumber:true
				// 自定义方法：校验手机号在数据库中是否存在
				// checkPhoneExist : true,
				
			},
			pname : {
				 //af:["a","f"],
				 //isPhoneNumber:true,
				minlength:"2",
			
			},
			password : {
				maxlength:"5",
				isPassword:true,

				
				minlength:"5",
				
			},
			birthday : {
				
				isDate:true
			},
			university : {
				minlength:"2",
				
			},
			broLocation : {
				minlength:"2",
				
			},
			nowLocation : {
				minlength:"2",
				
			},
            email : {
            	minlength:"2",
				
				isZipCode:true
			},
			experience : {
				minlength:"2",
				
			}
			
		},
		messages : {
			tel : {
				
				minlength : "确认手机不能小于11个字符",
				isMobile : "请正确填写您的手机号码"
			},
			pname : {
				minlength : "字符不能小于两个",
				
				
			}
           ,
			birthday : {
				
				
			},
			university : {
				
				
			},
			broLocation : {
				
				
			},
			nowLocation : {
				
				
			},
            email : {
				
				
			},
			experience : {
				
				
			}
		},
		
	});
    
});

	//页面初始化完毕后执行此方法
	$(function(){
		TAOTAO.init({fun:function(node){
		}});
	});
	//提交表单
	function submitForm(){
		//ajax的post方式提交表单
		//$("#itemAddForm").serialize()将表单序列号为key-value形式的字符串
		$.setskill();
		$.post("saveProfessor",$("#itemAddForm").serialize(), function(data){
			alert($("#itemAddForm").serialize());
			if(data == 1){
				alert("入驻成功");
				
				
			}
		});
	}
	
	function clearForm(){
		$('#itemAddForm').form('reset');
		itemAddEditor.html('');
	}
	
	
	//****************************************************************************
	$.setskill=function()
	{
		var skil="";
		$("input[name='check']:checkbox:checked").each(function(index)
				{
			if(index==$("input[name='check']:checkbox:checked").length-1)
				{
				skil+=$(this).val();
				}
			else{
				skil+=$(this).val()+"、";
			}
			
				})
				$("#skill").attr("value",skil);
				return skill;
	}
	
	</script>	
		<!--settled star-->
		<div class="homepage clearfix">
			<div class="content clearfix">
				<div class="media-right clearfix box-s">
					<div class="top clearfix">
						<samp class="line db"></samp>
						<samp class="curline db" style="width: 50%;"></samp>
						<ul>
							<li class="fl">
								<div class="shu cur clearfix box-s">
									<span class="cur">
										1
									</span>
								</div>
								<p class="cur">注册账号</p>
							</li>
							<li class="fl">
								<div class="shu cur clearfix box-s">
									<span class="cur">
										2
									</span>
								</div>
								<p class="cur">完善资料</p>
							</li>
							<li class="fl">
								<div class="shu clearfix box-s">
									<span>
										3
									</span>
								</div>
								<p>注册成功</p>
							</li>
						</ul>
					</div>
					<div class="media-bottom clearfix">
						<div class="meida-bd clearfix">							
							<div class="list">
								<ul>
								<li class="kuan" id="skil">
										<p class="bt fl">类型：</p>
										
										<div class="fl clearfix xuanze">
											<input type="checkbox" name="check" id="check" value="玉雕" class="fl"/>
											<span class="fl">玉雕 </span>
										</div>
										<div class="fl clearfix xuanze">
											<input type="checkbox" name="check" id="check" value="书画西画" class="fl"/>
											<span class="fl">书画西画</span>
										</div>
										<div class="fl clearfix xuanze">
											<input type="checkbox" name="check" id="check" value="珠宝" class="fl"/>
											<span class="fl">珠宝</span>
										</div>
										<div class="fl clearfix xuanze">
											<input type="checkbox" name="check" id="check" value="国石奇石" class="fl"/>
											<span class="fl">国石奇石</span>
										</div>
										<div class="fl clearfix xuanze">
											<input type="checkbox" name="check" id="check" value="瓷器紫砂" class="fl"/>
											<span class="fl">瓷器紫砂</span>
										</div>
										<div class="fl clearfix xuanze">
											<input type="checkbox" name="check" id="check" value="木艺" class="fl"/>
											<span class="fl"> 木艺</span>
										</div>
										<div class="fl clearfix xuanze">
											<input type="checkbox" name="check" id="check" value="文玩收藏" class="fl"/>
											<span class="fl">文玩收藏</span>
										</div>
										<div class="fl clearfix xuanze">
											<input type="checkbox" name="check" id="check" value="金银铜器" class="fl"/>
											<span class="fl">金银铜器</span>
										</div>
										<div class="fl clearfix xuanze">
											<input type="checkbox" name="check" id="check" value="邮币" class="fl"/>
											<span class="fl">邮币</span>
										</div>
										<div class="fl clearfix xuanze">
											<input type="checkbox" name="check" id="check" value="传统手工艺" class="fl"/>
											<span class="fl">传统手工艺</span>
										</div>
										<div class="fl clearfix xuanze">
											<input type="checkbox" name="check" id="check" value="其他" class="fl"/>
											<span class="fl">其他</span>
										</div>
									</li>
									
								<li class="kuan" id="img">
										
										
											<div class="row">
											<form id="itemAddForm" class="itemForm" method="post">
											
	                                          
	                                             <table>
	                                             
	                                             <tr>
	                                             <td>真实姓名:</td>
	                                             <td>  
	                                             <input  class="fl" name="pname" id="pname" value="" minlength="2" type="text" required >
	                                              </td>
	                                           </tr>
	                                           <tr>
	                                             <td>手机号:</td>
	                                             <td>  
	                                            <input type="text" class="fl" maxlength="11" name="tel" id="tel" value="" required/>
	                                              </td>
	                                           </tr>
	                                           <tr>
	                                           
	                                             <td>密码:</td>
	                                             <td>  
	                                            <input  type="text" name="password" id="password" required/>
	                                              </td>
	                                           </tr>
	                                            <tr>
	                                          
	                                           </tr>
	                                           <tr>
	                                             <td>生日:</td>
	                                             <td>  
	                                            <input  type="text" class="fl" name="birthday" id="birthday" value="" required>
	                                              </td>
	                                           </tr>
	                                           <tr>
	                                             <td>毕业院校:</td>
	                                             <td>  
	                                           <input  type="text" class="fl" name="university" id="university" value="" required>
	                                              </td>
	                                           </tr>
	                                            <tr>
	                                             <td>出生地:</td>
	                                             <td>  
	                                          <input type="text" class="fl" name="broLocation" id="broLocation" value="" required>
	                                              </td>
	                                           </tr>
	                                           <tr>
	                                             <td>现居地:</td>
	                                             <td>  
	                                         <input  type="text" class="fl" name="nowLocation" id="nowLocation" value="" required>
	                                              </td>
	                                           </tr>
	                                             <td>邮箱:</td>
	                                             <td>  
	                                         <input   name="email"  type="text" class="fl"  id="email" value="" required >
	                                              </td>
	                                           </tr>
	                                         
	                                           <input type="hidden"  name="skill"  type="text"  id="skill" >
	                                            <tr>
	                                         <td>个人简介:</td>
	                                             <td>
	            	                               <textarea name="experience" rows="5" cols="" class="box-s" id="experience" required></textarea>
	                                              
	                                           </td>
	                                           </tr>  
	                                             <tr>
	                                         <td>个人头像:</td>
	                                             <td>
	            	                                <a href="javascript:void(0)" class="easyui-linkbutton picFileUpload">上传头像</a>
	                                              <input type="hidden" name="image" required />
	                                              
	                                           </td>
	                                           </tr>  
	                                             </table>
											    <tr>
	                                         <td></td>
	                                             <td>
	            	                                
	                                              <input class="easyui-linkbutton" value="提交" onclick="submitForm()" type="submit" name="image" required />
	                                           </td>
	                                           <td> <input class="easyui-linkbutton" value="重置" onclick="clearForm()" type="submit" name="image" required /></td>
	                                           </tr> 
											                              
                                             </form>
                                          </div>
								
										
									</li>
								
									
									<li></li>
									<li></li>
									<li></li>
									
									<li class=" ">
										<p class="bt fl"></p>
										
										
									</li>
								</ul>
							</div>			
						</div>
					</div>					
				</div>
			</div>
		</div>
		<!--settled end-->		
		
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
