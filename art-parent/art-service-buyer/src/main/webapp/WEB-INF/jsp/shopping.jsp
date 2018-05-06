<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta charset='utf-8'>
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<title>购物车</title>
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
							<a href="#" class="box-s">
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
<script type="text/javascript">
var carjson;
var currentPage = 1 ;
$(function()
		{

	 carjson = $.cookie("car");
		$.showItem();
	
		})
$.showItem=function()
{
	//隐藏tr
	  for(var i=0;i<10;i++)
	  {
	  $("#tr"+i).hide();
	  }
		var car = eval("("+carjson+")");
		var sum=0;
	    for(var i=0;i<car.items.length;i++)
	    	{
	    	$("#img"+i).attr("src",car.items[i].imgAddress);
	    	$("#tit"+i).html(car.items[i].title);
	    	$("#price"+i).html(car.items[i].price);
	    	$("#delet"+i).attr("v",car.items[i].id);
	    	sum = sum+car.items[i].price;
	    	
	    	$("#tr"+i).show();
	    	
	    	}
	    $("#sumPrice").html(sum);
	  

	}
$.deleteItem=function(e)
{
	var id= e.attr("v");
	$.ajax(
			{
				url:"deleteCarItem",
				data:{
					id:id
				},
				dataType:"json",
				type:"post",
				success:function(jsonresult)
				{  if(jsonresult.status==1)//当返回值为1的时候添加成功
				  {
					  alert("删除成功！")
					  window.location.href ="shopping";
					  }
				
				},error:function(data)
				{
					alert("error");
				}
			});
	}
</script>		

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
			<div class="wrapper">
				<div class="shopping-list pt40 pb40">
					<table class="table_1 table_shopping white-box">
						<tr id="trappend">
							<th width="40%">商品</th>
							<th width="18%">单价(元)</th>
							<th width="14%">操作</th>
						</tr>
						<tr id="tr0">
							<td>

								<p class="o-goods-info ml20 clearfix pt10 pb10">
									<a href="#" class="fl"><span><img id="img0" src="upload/2.jpg" alt=""></span></a>
									<span class="fl tit mt5 ml10" id="tit0">互点农场五常大米 长粒香 御品国珍五常香米 5KG</span>
								</p>
							</td>
							<td id="price0">29.90</td>
							
							
							<td>
								<a href="#" onclick="$.deleteItem($(this))" value="" id="delet0"><i class="iconfont fs26">&#xe60b;</i></a>
							</td>
						</tr>
						<tr id="tr1">
							<td>

								<p class="o-goods-info ml20 clearfix pt10 pb10">
									<a href="#" class="fl"><span><img id="img1" src="upload/2.jpg" alt=""></span></a>
									<span class="fl tit mt5 ml10" id="tit1">互点农场五常大米 长粒香 御品国珍五常香米 5KG</span>
								</p>
							</td>
							<td id="price1">29.90</td>
							
							
							<td>
								<a href="#" onclick="$.deleteItem($(this))" value="" id="delet1"><i class="iconfont fs26">&#xe60b;</i></a>
							</td>
						</tr>
						<tr id="tr2">
							<td>

								<p class="o-goods-info ml20 clearfix pt10 pb10">
									<a href="#" class="fl"><span><img id="img2" src="upload/2.jpg" alt=""></span></a>
									<span class="fl tit mt5 ml10" id="tit2">互点农场五常大米 长粒香 御品国珍五常香米 5KG</span>
								</p>
							</td>
							<td id="price2">29.90</td>
							
							
							<td>
								<a href="#" onclick="$.deleteItem($(this))" value="" id="delet2"><i class="iconfont fs26">&#xe60b;</i></a>
							</td>
						</tr>
						<tr id="tr3">
							<td>

								<p class="o-goods-info ml20 clearfix pt10 pb10">
									<a href="#" class="fl"><span><img  id="img3" src="upload/2.jpg" alt=""></span></a>
									<span class="fl tit mt5 ml10" id="tit3">互点农场五常大米 长粒香 御品国珍五常香米 5KG</span>
								</p>
							</td>
							<td id="price3">29.90</td>
							
							
							<td>
								<a href="#" onclick="$.deleteItem($(this))" itemid="" id="delet3"><i class="iconfont fs26">&#xe60b;</i></a>
							</td>
						</tr>
						<tr id="tr4">
							<td>

								<p class="o-goods-info ml20 clearfix pt10 pb10">
									<a href="#" class="fl"><span><img id="img4" src="upload/2.jpg" alt=""></span></a>
									<span class="fl tit mt5 ml10" id="tit4">互点农场五常大米 长粒香 御品国珍五常香米 5KG</span>
								</p>
							</td>
							<td id="price4">29.90</td>
							
							
							<td>
								<a href="#" onclick="$.deleteItem($(this))" itemid="" id="delet4"><i class="iconfont fs26">&#xe60b;</i></a>
							</td>
						</tr>
						<tr id="tr5">
							<td>

								<p class="o-goods-info ml20 clearfix pt10 pb10">
									<a href="#" class="fl"><span><img id="img0" src="upload/2.jpg" alt=""></span></a>
									<span class="fl tit mt5 ml10" id="tit5">互点农场五常大米 长粒香 御品国珍五常香米 5KG</span>
								</p>
							</td>
							<td id="price5">29.90</td>
							
							
							<td>
								<a href="#" onclick="$.deleteItem($(this))" itemid="" id="delet5"><i class="iconfont fs26">&#xe60b;</i></a>
							</td>
						</tr>
						<tr id="tr6">
							<td>

								<p class="o-goods-info ml20 clearfix pt10 pb10">
									<a href="#" class="fl"><span><img id="img6" src="upload/2.jpg" alt=""></span></a>
									<span class="fl tit mt5 ml10" id="tit6">互点农场五常大米 长粒香 御品国珍五常香米 5KG</span>
								</p>
							</td>
							<td id="price6">29.90</td>
							
							
							<td>
								<a href="#" onclick="$.deleteItem($(this))" itemid="" id="delet6"><i class="iconfont fs26">&#xe60b;</i></a>
							</td>
						</tr>
						<tr id="tr7">
							<td>

								<p class="o-goods-info ml20 clearfix pt10 pb10">
									<a href="#" class="fl"><span><img id="img7" src="upload/2.jpg" alt=""></span></a>
									<span class="fl tit mt5 ml10" id="tit7">互点农场五常大米 长粒香 御品国珍五常香米 5KG</span>
								</p>
							</td>
							<td id="price7">29.90</td>
							
							
							<td>
								<a href="#" onclick="$.deleteItem($(this))" itemid="" id="delet7"><i class="iconfont fs26">&#xe60b;</i></a>
							</td>
						</tr>
						<tr id="tr8">
							<td>

								<p class="o-goods-info ml20 clearfix pt10 pb10">
									<a href="#" class="fl"><span><img  id="img8" src="upload/2.jpg" alt=""></span></a>
									<span class="fl tit mt5 ml10" id="tit8">互点农场五常大米 长粒香 御品国珍五常香米 5KG</span>
								</p>
							</td>
							<td id="price8">29.90</td>
							
							
							<td>
								<a href="#" onclick="$.deleteItem($(this))" itemid="" id="delet8"><i class="iconfont fs26">&#xe60b;</i></a>
							</td>
						</tr>
						<tr id="tr9">
							<td>

								<p class="o-goods-info ml20 clearfix pt10 pb10">
									<a href="#" class="fl"><span><img id="img9" src="upload/2.jpg" alt=""></span></a>
									<span class="fl tit mt5 ml10" id="tit9">互点农场五常大米 长粒香 御品国珍五常香米 5KG</span>
								</p>
							</td>
							<td id="price9">29.90</td>
							
							
							<td>
								<a href="#" onclick="$.deleteItem($(this))" itemid="" id="delet9"><i class="iconfont fs26">&#xe60b;</i></a>
							</td>
						</tr>
					</table>
					<div class="shopping-result white-box mt20 clearfix">
						<a href="mall" class="fl fs16 pl10">继续购物>></a>
						<p class="fr">
							<a href="jiesuan" class="fr orange-but fs20">去结算</a>
							<span class="fr pr20 fs14">总计：<em class="orange fs24" id="sumPrice">¥29.90</em></span>
						</p>
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