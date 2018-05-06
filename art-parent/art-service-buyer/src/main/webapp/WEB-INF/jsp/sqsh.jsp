<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta charset='utf-8'>
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<title>申请售后</title>
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
									<a href="grxx.html" class="fl">瑾晨0212</a>
									<span class="fl">进入商城</span>
								</li>
								<li>
									<a href="register.html">
										免费注册
									</a>
								</li>
								<li>
									<a href="settled.html">
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
						<a href="artist.html">艺术家</a>
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
							<a href="grxx.html" class="db fs16">个人信息</a>
						</li>
						<li class="on">
							<a href="wddd.html" class="db fs16">我的订单</a>
						</li>
						<li>
							<a href="pjsd.html" class="db fs16">评价晒单</a>
						</li>
						<li>
							<a href="shdz.html" class="db fs16">收货地址</a>
						</li>
						<li>
							<a href="wdsc.html" class="db fs16">我的收藏</a>
						</li>
						<li>
							<a href="wdgz.html" class="db fs16">我的关注</a>
						</li>
						<li>
							<a href="xgmm.html" class="db fs16">修改密码</a>
						</li>
						<li>
							<a href="zhye.html" class="db fs16">账户余额</a>
						</li>
						<li>
							<a href="zxcz.html" class="db fs16">在线充值</a>
						</li>
						<li>
							<a href="lljl.html" class="db fs16">退货记录</a>
						</li>
						<li>
							<a href="zixun.html" class="db fs16">我的咨询</a>
						</li>
						<li>
							<a href="znx.html" class="db fs16">站内信</a>
						</li>
					</ul>
				</div>
				<div class="fr slide-show white-box">
					<div class="dark-tit clearfix">
						<h3 class="fl fs26">申请售后</h3>
					</div>
					<form action="">
						<div class="sh-info">
							<table class="table_1 table_sh">
								<tr>
									<th colspan="3" align="left"><span class="darkgray fs16 pl10" id="formNum">订单编号：  9911194980</span></th>
								</tr>
								<tr>
									<td width="10%" align="center"><input type="checkbox"></td>
									<td width="52%"><span class="darkgray fs14 pl10 ellipsis" id="itemTitle">北京椿龄文化墙角一枝梅北京椿龄文化墙角一枝梅</span></td>
									<td width="38%"><span class="darkgray fs14 pl10" id="summoney">29.90元 * 1</span></td>
								</tr>
							
							</table>
							<p class="mt20 mb20 clearfix"><label class="fl fs16" >退款金额：</label><input type="text" placeholder="" value="" class="fl" id="sunmoney1"><label class="fl fs16">元</label></p>
							<p class="mb20 clearfix"><label class="fl fs16">问题描述：</label><textarea name="" cols="30" rows="10" id="describe"></textarea></p>
							<p><input type="button" class="orange-but radius3 fs16" value="提交申请" onclick="$.tjsq()"></p>
						</div>
					</form>
				</div>

			</div>
		</div>
		<!--/end-->
<script type="text/javascript">
var id="<%=request.getParameter("idd")%>";
var orderform;
$(function()
{
$.getOrderFormById();
	});
$.getOrderFormById=function()
{
	
	$.ajax(
			{url:"getOrderFormById",
		     Type:"post",  
			
			 data:{
				 "id":id,
				  
			 },
			 dataType:"json",
			 success:function(data)
			 {  orderform = data;
			  
			   $("#formNum").html("订单编号："+data.formNum);
			   $("#itemTitle").html(data.itemTitle);
			   $("#summoney").html(data.money*1);
			   $("#sunmoney1").val(data.money);
			   
			 },error:function()
			 {
				 alert("error");
			 }
				
			});
} 
$.sqsh=function()
{

	$.ajax(
			{url:"setState",
		     Type:"post",  
		     async:false,
			 data:{
				 "id":id,
				  "state":"退货"
			 },
			 dataType:"json",
			 success:function(data)
			 {  
			   window.location.href="sqsh";
			 },error:function()
			 {
				 alert("error");
			 }
				
			});
}
$.tjsq=function()
{alert(orderform.formNum);
	$.ajax(
			{url:"saveSaleAfter",
		     Type:"post",  
		     async:true,
			 data:{
				 
				   "describe":$("#describe").val(),
				   "formNum":orderform.formNum,
				   "itemTitle":orderform.itemTitle,
				  "summoney":orderform.money,
				    "onemoney":orderform.money
			 },
			 dataType:"json",
			 success:function(data)
			 {  
				 $.sqsh();
				 location.href="wddd";
			 }
			});
	}
</script>
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