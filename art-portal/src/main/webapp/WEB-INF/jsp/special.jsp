<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta charset='utf-8'>
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<title>专场</title>
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
		<script src="js/common.js"></script>
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
							<a href="cartShow" class="box-s">
								购物车
							</a>
					
						</div>
					
					</div>	
				</div>
			</div>
			<div class="bottom clearfix">
				<div class="logo clearfix">
					<a href="index.html"></a>
				</div>
				
			</div>
		</div>
		<!--header end-->

		<!--navbar star-->
		<div class="navbar clearfix">
			<div class="content clearfix">
				<ul>
					<li ><a href="index">首页</a></li>
					<li class="cur"><a href="special">专场</a></li>
					<li><a  href="mall" >商城</a></li>
					
				</ul>
			</div>
		</div>
		<!--navbar end-->
		
		<!--banner star-->
		<div class="banner">		
			<div class="bd">
				<ul>
					<li style="background:url(img/banner.jpg) #194982 center 0 no-repeat;"><a target="_blank" href="#"></a></li>
				</ul>
			</div>
		</div>
		<!--banner end-->
		
		<!--specail star-->
		<div class="specail clearfix">
			<div class="top clearfix">
				<div class="recom-tit clearfix">
					<p class="engtit ta-center">
						SPECIAL CENTER
					</p>
					<div class="middle clearfix">
						<span class="line"></span>
						<span class="wenzi">专场中心</span>
						<span class="line"></span>
					</div>
					<p class="fu-tit">
						好作品无需多说 你会由心的看清它的诉说
					</p>
				</div>
			</div>
<!-- script--------------------------------------------------------------------------------------------------- -->
<!-- 页面开始加载--------------------------------------------------------------------------------------------------- -->
<script type="text/javascript">
var a = $.cookie("user");
var user=eval('('+a+')');
$(function()
		{
	$.getParentListByPage();
	$.displayUserName();
		});
		
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
		
		

$.getParentListByPage=function(e)
{ 
	
	
	var page=1;

   if(typeof(e)=="object")
	   {
	  page=e.val();
	   }
	   if(!$("#jid").attr("value")=="")
		   {
		   page=$("#jid").attr("value");
		   }
	$.ajax(
		{url:"getParentList",
		 Type:"post",  
		 data:{
			 "page":page,
			 "rows":5,
			
		 },
		 success:function(data)
		 {    	 var artresult =eval('('+data+')');
				 $("#firstPage").attr("value",artresult.data.firstPage);
				 $("#nexPage").attr("value",artresult.data.nextPage);
				 $("#lastPage").attr("value",artresult.data.lastPage);
				 $("#prePage").attr("value",artresult.data.prePage);
				
				 for(var j=0;j<5;j++){//先隐藏所有的专场div
					 $("#let"+j).hide();
					 
				 }
				 
				 for(var i=0;i<artresult.data.list.length;i++)
					 {
					    
						
						$("#imgsrc"+(i+1+0)).attr("src",artresult.data.list[i].imgaddress);
						$("#name"+(i+1+0)).html(artresult.data.list[i].pname+"系列专场");
						$("#special"+(i+1+0)).val(artresult.data.list[i].id);
						 $("#let"+i).show();//显示专场的div
					 }
		 },error:function()
		 {
			 alert("error");
		 }
			
		});
	}
</script>



<script type="text/javascript">
$.jump=function(data,jumptopageno)
{ 
	$.showCatImag(data,jumptopageno-1);
	}
</script>
<script type="text/javascript">
$.enterSpecial=function(e)
{ 
     window.location.href ="gotoSpecialDet?pid="+e.val();
         
	}
</script>
<!-- 第一个-------------------------------------------------------------------------------------------------- -->
			<div class="content clearfix box-s">
				<div class="list clearfix fl box-s transition" id="let0">
					<div class="tu clearfix fl">
						<img src="upload\z\yd1.jpg"/ id="imgsrc1">
						<span></span>
					</div>
					<div class="right clearfix fr box-s">
						<div class="bt clearfix" id="name1">
							玉雕系列专场
						</div>
						
						<a href="#" onclick="$.enterSpecial($(this));" class="jinru ra3 transition" value="1" id="special1">
							进入专场>
						</a>
					</div>
				</div>
<!-- 第二个------------------------------------------------- -->
				<div class="list clearfix fl box-s transition" id="let1">
					<div class="tu clearfix fl">
						<img src="upload\z\shxh.jpg" id="imgsrc2"/>
						<span></span>
					</div>
					<div class="right clearfix fr box-s">
						<div class="bt clearfix" id="name2">
							方框梅兰竹菊系列专场
						</div>
						
						<a href="#" onclick="$.enterSpecial($(this));" class="jinru ra3 transition" value="2" id="special2">
							进入专场>
						</a>
					</div>
				</div>
<!-- 第三个-------------------------------------------------------------------------------- -->				
				<div class="list clearfix fl box-s transition" id="let2">
					<div class="tu clearfix fl">
						<img src="upload\z\zb.jpg" id="imgsrc3"/>
						<span></span>
					</div>
					<div class="right clearfix fr box-s">
						<div class="bt clearfix" id="name3">
							方框梅兰竹菊系列专场
						</div>
						
						<a href="#" onclick="$.enterSpecial($(this));" class="jinru ra3 transition" value="3" id="special3">
							进入专场>
						</a>
					</div>
				</div>
<!-- 第四个--------------------------------------------------------------------------------------------- -->				
				<div class="list clearfix fl box-s transition" id="let3">
					<div class="tu clearfix fl">
						<img src="upload\z\zb.jpg" id="imgsrc4"/>
						<span></span>
					</div>
					<div class="right clearfix fr box-s">
						<div class="bt clearfix" id="name4">
							方框梅兰竹菊系列专场
						</div>
												<a href="#" onclick="$.enterSpecial($(this));" class="jinru ra3 transition" value="3" id="special3">
							进入专场>
						</a>
					</div>
				</div>
<!-- 第五个--------------------------------------------------------------------------------------------- -->					
				<div class="list clearfix fl box-s transition" id="let4">
					<div class="tu clearfix fl">
						<img src="upload\z\cqzs.jpg" id="imgsrc5"/>
						<span></span>
					</div>
					<div class="right clearfix fr box-s">
						<div class="bt clearfix" id="name5" >
							方框梅兰竹菊系列专场
						</div>
						
						<a hhref="#" onclick="$.enterSpecial($(this));" class="jinru ra3 transition" value="5" id="special5">
							进入专场>
						</a>
					</div>
				</div>				
			</div>
<!-- 开始分页--------------------------------------------------------------------------------------------- -->				
			<div class="pages clearfix" >
				<div class="tab-pages">
		               <p id="pid"></p>
						<a id="prePage" href="#" value="" class="tab-prev tab-btn" onclick="$.getParentListByPage($(this));">上一页</a>
						<a id="firstPage" href="#" value="" class="page-btn " onclick="$.getParentListByPage($(this));">第一页</a>
						<a id="lastPage" href="#" value="" class="page-btn" onclick="$.getParentListByPage($(this));">最后一页</a>
						<a id="nexPage" href="#" value="" class="tab-next tab-btn" onclick="$.getParentListByPage($(this));">下一页</a>
						<span class="ml10">到第</span>
						<input type="text" name="" id="jid" value=""  size="1"/>
						<span>页</span>
						<input type="submit" name="" id="" value="确定" onclick="$.getParentListByPage($(this));"/>
					</div>
			</div>
		</div>
		<!--specail end-->
		
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
	<script src="js/other.js" type="text/javascript" ></script>
</html>