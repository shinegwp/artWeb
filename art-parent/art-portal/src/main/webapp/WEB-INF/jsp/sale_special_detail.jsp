<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta charset='utf-8'>
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<title>专场详情</title>
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
									<span class="fl">您好，请</span>
									<a href="sign.html" class="fl">登录</a>
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
					<li><a href="index">首页</a></li>
					<li class="cur"><a href="special">专场</a></li>
					<li><a href="mall">商城</a></li>
					<li><a href="artist">艺术家</a></li>
				</ul>
			</div>
		</div>
		<!--navbar end-->
		
		<!--mall star-->
		<div class="mall clearfix">
			<!--sorts star-->
			<div class="sorts clearfix">
				<div class="content clearfix">
					<div class="top clearfix box-s">
						您的位置：<a href="special">专场</a>&nbsp;&gt;&nbsp;文艺复兴专场
					</div>
					<div class="spdetail clearfix mt25">
						<div class="hd">
							<ul>
								<li></li>
								<li></li>
								<li></li>
							</ul>
						</div>
						<div class="bd">
							<ul>
								<li><a href="#"><img src="upload/6.jpg" /></a></li>
								<li><a href="#"><img src="upload/6.jpg" /></a></li>
								<li><a href="#"><img src="upload/6.jpg" /></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!--sorts end-->
<!-- script -->
<!-- 页面初始化 -->
<script type="text/javascript">
var pid;
$(function()
		{
	  
	
	pid = ${pid};
	$.getspecialListByPage();
	
		});
$.getSale=function()
{
	window.location.href ="gotoSaleSpecialDet?pid="+pid;	
	//window.location.href ="sale_special_detail？pid="+pid;
}
	$.getNew=function()
{
		 window.location.href ="gotoTimeSpecialDet?pid="+pid;
}
	$.zonghe=function()
{
		 window.location.href ="gotoSpecialDet?pid="+pid;
}
</script>	

<script type="text/javascript">
$.getspecialListByPage=function(e)
{ 
	alert(pid);
	
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
		{url:"getSpecialDetailListOrderBySale",
		 Type:"post",  
		 data:{
			 "page":page,
			 "rows":12,
			 "pid":pid
			
		 },
		 success:function(data)
		 { 
			 alert(data);
				 var jsondata = eval('('+data+')');
				
				 $("#firstPage").attr("value",jsondata.pageinfo.firstPage);
				 $("#nexPage").attr("value",jsondata.pageinfo.nextPage);
				 $("#lastPage").attr("value",jsondata.pageinfo.lastPage);
				 $("#prePage").attr("value",jsondata.pageinfo.prePage);
				
				 for(var j=1;j<=12;j++){
					 $("#div"+j).hide();
					 
				 }
				 
				 for(var i=0;i<jsondata.pageinfo.list.length;i++)
					 {
					    $("#img"+(i+1+0)).attr("src",jsondata.pageinfo.list[i].imgAddress)
						 $("#p"+(i+1+0)).html(jsondata.pageinfo.list[i].title);
					    $("#span"+(i+1+0)).html(jsondata.pageinfo.list[i].price);
					    $("#a"+(i+1+0)).attr("value",jsondata.pageinfo.list[i].id);
					    $("#div"+(i+1+0)).show();
						

				
					 }
		 },error:function()
		 {
			 alert("error");
		 }
			
		});
	}
	
$.gotoprodetail=function(e)
{  
	
	
	 window.location.href ="getDetail?id="+e.val();
	}

</script>	
			<!--sales star-->
			<div class="sales clearfix">
				<div class="content clearfix">
					<div class="top clearfix">
						<div class="left clearfix fl">
							<!--以下li中添加cur的时候是选中的时候-->
							<ul>
								<li onclick="$.zonghe()" >综合排序</li>
								<li onclick="$.getSale();" class="xliang cur">销量</li>
								<li onclick="$.getNew();" class="xpin">新品</li>
							</ul>
						</div>
					</div>
					<div class="bottom clearfix">
<!-- 1-------------------------------------------------------------------- -->						
						<div class="list clearfix transition" id="div1">
							<div class="tu clearfix">
								<img src="upload/2.jpg" id="img1"/ >
								<span></span>
								
								<div class="ycang clearfix">
									<samp class="opa8"></samp>
									<div class="nr clearfix">
										<!--注意：当下方li中添加class名为cur的时候为选中的时候样式-->
										<ul>
											<li class="box-s transition">关注</li>
											<li class="box-s transition">购物车</li>
										</ul>
									</div>								
								</div>
							</div>
							<div class="xia clearfix box-s">
								<p class="bt over" id="p1">
									尹毅画作
								</p>
								<div class="price clearfix">
									<span class="fl" id="span1">￥1000.00<samp>原价￥2000.00</samp> </span>
									<a href="#" onclick="$.gotoprodetail($(this))"  class="goumai fr ra3 transition" id="a1" >立即购买</a>
								</div>
							</div>
						</div>
<!-- 2-------------------------------------------------------------------- -->						
						<div class="list clearfix transition" id="div2">
							<div class="tu clearfix">
								<img src="upload/2.jpg" id="img2" />
								<span></span>
								
								<div class="ycang clearfix">
									<samp class="opa8"></samp>
									<div class="nr clearfix">
										<!--注意：当下方li中添加class名为cur的时候为选中的时候样式-->
										<ul>
											<li class="box-s transition">关注</li>
											<li class="box-s transition">购物车</li>
										</ul>
									</div>								
								</div>
							</div>
							<div class="xia clearfix box-s">
								<p class="bt over" id="p2">
									尹毅画作
								</p>
								<div class="price clearfix">
									<span class="fl" id="span2">￥1000.00<samp>原价￥2000.00</samp></span>
									<a href="#" onclick="$.gotoprodetail($(this))" class="goumai fr ra3 transition" id="a2">立即购买</a>
								</div>
							</div>
						</div>
<!-- 3-------------------------------------------------------------------- -->							
						<div class="list clearfix transition" id="div3">
							<div class="tu clearfix">
								<img src="upload/2.jpg" id="img3"/>
								<span></span>
								
								<div class="ycang clearfix">
									<samp class="opa8"></samp>
									<div class="nr clearfix">
										<!--注意：当下方li中添加class名为cur的时候为选中的时候样式-->
										<ul>
											<li class="box-s transition">关注</li>
											<li class="box-s transition">购物车</li>
										</ul>
									</div>								
								</div>
							</div>
							<div class="xia clearfix box-s">
								<p class="bt over" id="p3">
									尹毅画作
								</p>
								<div class="price clearfix">
									<span class="fl" id="span3">￥1000.00<samp>原价￥2000.00</samp></span>
									<a href="#" onclick="$.gotoprodetail($(this))" class="goumai fr ra3 transition" id="a3">立即购买</a>
								</div>
							</div>
						</div>
<!-- 4-------------------------------------------------------------------- -->							
						<div class="list clearfix transition" id="div4">
							<div class="tu clearfix">
								<img src="upload/2.jpg" id="img4"/>
								<span></span>
								
								<div class="ycang clearfix">
									<samp class="opa8"></samp>
									<div class="nr clearfix">
										<!--注意：当下方li中添加class名为cur的时候为选中的时候样式-->
										<ul>
											<li class="box-s transition">关注</li>
											<li class="box-s transition">购物车</li>
										</ul>
									</div>								
								</div>
							</div>
							<div class="xia clearfix box-s">
								<p class="bt over" id="p4">
									尹毅画作
								</p>
								<div class="price clearfix" >
									<span class="fl" id="span4">￥1000.00<samp>原价￥2000.00</samp></span>
									<a href="#" onclick="$.gotoprodetail($(this))" class="goumai fr ra3 transition" id="a4">立即购买</a>
								</div>
							</div>
						</div>
<!-- 5-------------------------------------------------------------------- -->							
						<div class="list clearfix transition" id="div5">
							<div class="tu clearfix">
								<img src="upload/2.jpg" id="img5"/>
								<span></span>
								
								<div class="ycang clearfix">
									<samp class="opa8"></samp>
									<div class="nr clearfix">
										<!--注意：当下方li中添加class名为cur的时候为选中的时候样式-->
										<ul>
											<li class="box-s transition">关注</li>
											<li class="box-s transition">购物车</li>
										</ul>
									</div>								
								</div>
							</div>
							<div class="xia clearfix box-s">
								<p class="bt over" id="p5">
									尹毅画作
								</p>
								<div class="price clearfix">
									<span class="fl" id="span5">￥1000.00<samp>原价￥2000.00</samp></span>
									<a href="#" onclick="$.gotoprodetail($(this))" class="goumai fr ra3 transition" id="a5">立即购买</a>
								</div>
							</div>
						</div>
<!-- 6-------------------------------------------------------------------- -->							
						<div class="list clearfix transition" id="div6">
							<div class="tu clearfix">
								<img src="upload/2.jpg" id="img6"/>
								<span></span>
								
								<div class="ycang clearfix">
									<samp class="opa8"></samp>
									<div class="nr clearfix">
										<!--注意：当下方li中添加class名为cur的时候为选中的时候样式-->
										<ul>
											<li class="box-s transition">关注</li>
											<li class="box-s transition">购物车</li>
										</ul>
									</div>								
								</div>
							</div>
							<div class="xia clearfix box-s">
								<p class="bt over" id="p6">
									尹毅画作
								</p>
								<div class="price clearfix">
									<span class="fl" id="span6">￥1000.00<samp>原价￥2000.00</samp></span>
									<a href="#" onclick="$.gotoprodetail($(this))" class="goumai fr ra3 transition" id="a6">立即购买</a>
								</div>
							</div>
						</div>
<!-- 7-------------------------------------------------------------------- -->							
						<div class="list clearfix transition" id="div7">
							<div class="tu clearfix">
								<img src="upload/2.jpg" id="img7"/>
								<span></span>
								
								<div class="ycang clearfix">
									<samp class="opa8"></samp>
									<div class="nr clearfix">
										<!--注意：当下方li中添加class名为cur的时候为选中的时候样式-->
										<ul>
											<li class="box-s transition">关注</li>
											<li class="box-s transition">购物车</li>
										</ul>
									</div>								
								</div>
							</div>
							<div class="xia clearfix box-s" >
								<p class="bt over" id="p7">
									尹毅画作
								</p>
								<div class="price clearfix">
									<span class="fl" id="span7">￥1000.00<samp>原价￥2000.00</samp></span>
									<a href="#" onclick="$.gotoprodetail($(this))" class="goumai fr ra3 transition" id="a7">立即购买</a>
								</div>
							</div>
						</div>
<!-- 8-------------------------------------------------------------------- -->							
						<div class="list clearfix transition" id="div8">
							<div class="tu clearfix">
								<img src="upload/2.jpg" id="img8"/>
								<span></span>
								
								<div class="ycang clearfix">
									<samp class="opa8"></samp>
									<div class="nr clearfix">
										<!--注意：当下方li中添加class名为cur的时候为选中的时候样式-->
										<ul>
											<li class="box-s transition">关注</li>
											<li class="box-s transition">购物车</li>
										</ul>
									</div>								
								</div>
							</div>
							<div class="xia clearfix box-s">
								<p class="bt over" id="p8">
									尹毅画作
								</p>
								<div class="price clearfix">
									<span class="fl" id="span8">￥1000.00<samp>原价￥2000.00</samp></span>
									<a href="#" onclick="$.gotoprodetail($(this))" class="goumai fr ra3 transition" id="a8">立即购买</a>
								</div>
							</div>
						</div>
<!-- 9-------------------------------------------------------------------- -->							
						<div class="list clearfix transition" id="div9">
							<div class="tu clearfix">
								<img src="upload/2.jpg" id="img9"/>
								<span></span>
								
								<div class="ycang clearfix">
									<samp class="opa8"></samp>
									<div class="nr clearfix">
										<!--注意：当下方li中添加class名为cur的时候为选中的时候样式-->
										<ul>
											<li class="box-s transition">关注</li>
											<li class="box-s transition">购物车</li>
										</ul>
									</div>								
								</div>
							</div>
							<div class="xia clearfix box-s">
								<p class="bt over" id="p9">
									尹毅画作
								</p>
								<div class="price clearfix">
									<span class="fl" id="span9">￥1000.00<samp>原价￥2000.00</samp></span>
									<a href="#" onclick="$.gotoprodetail($(this))" class="goumai fr ra3 transition" id="a9">立即购买</a>
								</div>
							</div>
						</div>
<!-- 10-------------------------------------------------------------------- -->							
						<div class="list clearfix transition" id="div10">
							<div class="tu clearfix">
								<img src="upload/2.jpg" id="img10"/>
								<span></span>
								
								<div class="ycang clearfix">
									<samp class="opa8"></samp>
									<div class="nr clearfix">
										<!--注意：当下方li中添加class名为cur的时候为选中的时候样式-->
										<ul>
											<li class="box-s transition">关注</li>
											<li class="box-s transition">购物车</li>
										</ul>
									</div>								
								</div>
							</div>
							<div class="xia clearfix box-s">
								<p class="bt over" id="p10">
									尹毅画作
								</p>
								<div class="price clearfix">
									<span class="fl" id="span10">￥1000.00<samp>原价￥2000.00</samp></span>
									<a href="#" onclick="$.gotoprodetail($(this))" class="goumai fr ra3 transition" id="a10">立即购买</a>
								</div>
							</div>
						</div>
<!-- 11-------------------------------------------------------------------- -->							
						<div class="list clearfix transition" id="div11">
							<div class="tu clearfix">
								<img src="upload/2.jpg" id="img11"/>
								<span></span>
								
								<div class="ycang clearfix">
									<samp class="opa8"></samp>
									<div class="nr clearfix">
										<!--注意：当下方li中添加class名为cur的时候为选中的时候样式-->
										<ul>
											<li class="box-s transition">关注</li>
											<li class="box-s transition">购物车</li>
										</ul>
									</div>								
								</div>
							</div>
							<div class="xia clearfix box-s">
								<p class="bt over" id="p11">
									尹毅画作
								</p>
								<div class="price clearfix">
									<span class="fl" id="span11">￥1000.00<samp>原价￥2000.00</samp></span>
									<a href="#" onclick="$.gotoprodetail($(this))" class="goumai fr ra3 transition" id="a11">立即购买</a>
								</div>
							</div>
						</div>
<!-- 12-------------------------------------------------------------------- -->							
						<div class="list clearfix transition" id="div12">
							<div class="tu clearfix">
								<img src="upload/2.jpg" id="img12"/>
								<span></span>
								
								<div class="ycang clearfix">
									<samp class="opa8"></samp>
									<div class="nr clearfix">
										<!--注意：当下方li中添加class名为cur的时候为选中的时候样式-->
										<ul>
											<li class="box-s transition">关注</li>
											<li class="box-s transition">购物车</li>
										</ul>
									</div>								
								</div>
							</div>
							<div class="xia clearfix box-s">
								<p class="bt over" id="p12">
									尹毅画作
								</p>
								<div class="price clearfix">
									<span class="fl" id="span12">￥1000.00<samp>原价￥2000.00</samp></span>
									<a href="#" onclick="$.gotoprodetail($(this))" class="goumai fr ra3 transition" id="a12">立即购买</a>
								</div>
							</div>
						</div>
					</div>
					<div class="tab-pages">
		               <p id="pid"></p>
						<a id="prePage" href="#" value="" class="tab-prev tab-btn" onclick="$.getspecialListByPage($(this));">上一页</a>
						<a id="firstPage" href="#" value="" class="page-btn " onclick="$.getspecialListByPage($(this));">第一页</a>
						<a id="lastPage" href="#" value="" class="page-btn" onclick="$.getspecialListByPage($(this));">最后一页</a>
						<a id="nexPage" href="#" value="" class="tab-next tab-btn" onclick="$.getspecialListByPage($(this));">下一页</a>
						<span class="ml10">到第</span>
						<input type="text" name="" id="jid" value=""  size="1"/>
						<span>页</span>
						<input type="submit" name="" id="" value="确定" onclick="$.getspecialListByPage($(this));"/>
					</div>
				</div>
			</div>
			<!--sales end-->
		</div>
		<!--mall end-->
		
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