<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta charset='utf-8'>
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<title>结算</title>
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
			<script type="text/javascript" src="http://www.ijquery.cn/js/cityselect/jquery.cityselect.js"></script> 
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
	<script type="text/javascript">
	 var sa;
	 var item;
	 var sum = 0;
	$(function(){
		
		// item = ${item};
		 //$.itemShow();
		$.getShoppingAddressByUid();
		
		
		$.showItems();
		
		$("#city").citySelect({  
		      
		      nodata: "none"  
		  }); 
	});
	//设置地址信息
	$.setCitySelect=function(address)
	{   $("#city").citySelect({  
	      prov: address.split('/')[0],  
	      city:address.split('/')[1],  
	      dist:address.split('/')[2],  
	      nodata: "none"  
	  });  
		}
	$.getShoppingAddressByUid=function()//根据用户id的到地址
	{
		$.ajax({
			url:"getSAS",
			data:{
				
				uid:$.cookie("uid")
			},async:true,
			type:"post",
			dataType:"json",
			success:function(data)
			{   sa = data;
				$.showAddress(data);
			},error:function()
			{ alert("error");
			}
		});
	}
	$.showAddress=function(data)//显示地址信息
	{for(var i=0;i<3;i++)
		{
		$("#div"+i).hide();
		}
		for(var i=0;i<data.length;i++)
			{
			$("#sname"+i).html('<i class="iconfont fs24">&#xe60e;</i>'+data[i].sname);
			$("#hsname"+i).attr("value",data[i].sname);//给隐藏的姓名赋值
			$("#hte"+i).attr("value",data[i].stel);//给隐藏的tel赋值
			
			$("#stel"+i).html('<i class="iconfont fs24">&#xe60c;</i>'+data[i].stel);
		
			$("#addressDetail"+i).html(data[i].addressDetail);
			$("#bj"+i).attr("val",data[i].id);
			
			$("#hidco"+i).attr("value",data[i].code);
			
			$("#div"+i).show();
			
			}
	}
	$.xiugai=function(e)//在弹出窗口里显示地址信息
	{   var id = e.attr("val");
		for(var i=0;i<sa.length;i++)
		{
		  if(sa[i].id==id)
			  {$("#mid").attr("value",sa[i].id);
			  $("#msname").attr("value",sa[i].sname);
			  $("#mstel").attr("value",sa[i].stel);
			  $("#maddressDetail").attr("value",sa[i].addressDetail);
			  $("#mcode").attr("value",sa[i].code);
			  $.setCitySelect(sa[i].address);
			  }
		}
		
		
		
		
	}
	$.saveUpdate=function()//保存收货地址的修改
	{ 

		$.ajax({
			url:"save",
			data:{
				
				uid:$.cookie("uid"),
				id:$("#mid").attr("value"),
				sname:$("#msname").attr("value"),
				stel:$("#mstel").attr("value"),
			    addressDetail:$("#maddressDetail").attr("value"),
			    code: $("#mcode").attr("value"),
			    address:$("#prov").val()+"/"+$("#cit").val()+"/"+$("#dist").val()
			},
			type:"post",
			dataType:"json",
			success:function(data)
			{
			
				alert("修改成功！");
				window.location.reload();
			
			},error:function()
			{ alert("error");
			}
		});
		
	}
	$.showItems=function()//显示商品信息
	{
		var carjson = $.cookie("car");
		
		var car = eval("("+carjson+")");
		var items = car.items;
		
		for(var i=0;i<10;i++)
			{
			$("#tr"+i).hide();
			}
		for(var i=0;i<items.length;i++)
			{
			$("#img"+i).attr("src",items[i].imgAddress);
			$("#tit"+i).html(items[i].title);
			$("#price"+i).html(items[i].price);
			$("#tr"+i).show();
			sum = sum+items[i].price;
			
			}
		$("#sumPrice").html(sum);
	}
	$.submitOrder=function()
	{var divindex ;
		$(".check-box").each(function(i)
				{if($(this).hasClass("check_on"))
					{
					 divindex = i;
					}
				});
	alert($("#hte"+divindex).attr("value"));
		$.ajax({
			url:"addOrder",
			data:{
				peopleName:$("#hsname"+divindex).attr("value"),
				tel:$("#hte"+divindex).attr("value"),
			    address:$("#addressDetail"+divindex).html(),
			    code: $("#hidco"+divindex).attr("value"),
			    uid:$.cookie("uid")
			},
			type:"post",
			dataType:"json",
			success:function(jsonresult)
			{
			
				
				if(jsonresult.status==1)
					{
					window.location.href="fukuan";
					}
				else
					{
					alert("添加失败");
					}
				
			
			},error:function()
			{ alert("error");
			}
		});
	}
	</script>	<!--header end-->

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
		<div class="main-wrap graybg pt40 pb40">
			<div class="js-box wrapper white-box">
				<!--收货人信息-->
				<div class="consignee-info">
					<div class="title line-bot"><span class="fs18 pl20 ml40 darkgray">收货人地址</span></div>
					<div class="consignee-box clearfix">
						<div class="consignee-block check-box check_on  radius5" id="div0">
							<em></em>
							<p class="fs14 lh40 clearfix">
								<span class="fl darkgray" id="sname0"><i class="iconfont fs24">&#xe60e;</i>飞天猪</span>
								<input id="hsname0" type="hidden" value="">
								<a id = "bj0" href="javascript:" class="fr green edit alertbox" onclick="$.xiugai($(this));" val=""><i class="iconfont fs24 green ">&#xe60f;</i>编辑</a>
							</p>
							<input type="hidden" id="hte0" value="qqq">
							<input type="hidden" id="hidco0" value="hid">
							<p class="fs14 darkgray lh40" id="stel0"><i class="iconfont fs24">&#xe60c;</i>18056000000
								</>
							
							
								<p class="fs14 darkgray lh30 clearfix">
									<i class="fl iconfont fs24">&#xe610;</i><span class="fl address" id="addressDetail0">合肥市蜀山区长江西路100号拓基城市广场  金座A2002</span>
								</p>
						</div>
						<div class="consignee-block check-box radius5" id="div1">
							<em></em>
							<p class="fs14 lh40 clearfix">
								<span class="fl darkgray" id="sname1"> <i class="iconfont fs24">&#xe60e;</i>飞天猪</span>
								<input id="hsname1" type="hidden" value="">
								<a id = "bj1" href="javascript:" class="fr green edit alertbox" onclick="$.xiugai($(this));" val=""><i class="iconfont fs24 green">&#xe60f;</i>编辑</a>
							</p>
							<input type="hidden" id="hte1" value="qqq">
							<input type="hidden" id="hidco1" value="hid">
							<p class="fs14 darkgray lh40" id="stel1"><i class="iconfont fs24">&#xe60c;</i>18056000000
								</>
								
								
								<p class="fs14 darkgray lh30 clearfix">
									<i class="fl iconfont fs24">&#xe610;</i><span class="fl address" id="addressDetail1">合肥市蜀山区长江西路100号拓基城市广场  金座A2002</span>
								</p>
						</div>
						<div class="consignee-block check-box radius5" id="div2">
							<em></em>
							<p class="fs14 lh40 clearfix">
								<span class="fl darkgray" id="sname2"> <i class="iconfont fs24">&#xe60e;</i>飞天猪</span>
								<input id="hsname2" type="hidden" value="">
								<a id = "bj2" href="javascript:" class="fr green edit alertbox" onclick="$.xiugai($(this));" val=""><i class="iconfont fs24 green">&#xe60f;</i>编辑</a>
							</p>
							<input type="hidden" id="hte2" value="qqq">
							<input type="hidden" id="hidco2" value="hid">
							<p class="fs14 darkgray lh40" id="stel2"><i class="iconfont fs24">&#xe60c;</i>18056000000
								</>
								
								
								<p class="fs14 darkgray lh30 clearfix">
									<i class="fl iconfont fs24">&#xe610;</i><span class="fl address" id="addressDetail2">合肥市蜀山区长江西路100号拓基城市广场  金座A2002</span>
								</p>
						</div>
						
					</div>
				</div>
				<!--/end-->

			
				<!--goodssale-->
				<div class="goodssale">
					<div class="title line-bot"><span class="fs18 pl20 ml40 darkgray">商品信息</span></div>
					<table class="table_1 table_goods" border="0" cellpadding="0" cellspacing="0">
						<tr class="line-bot" id="tr0">
							<td width="599">
								<p class="o-goods-info clearfix  ">
									<a href="#" class="fl"><span><img src="upload/2.jpg" alt="" id="img0"></span></a>
									<span class="fl tit mt10" id="tit0">墙角数枝梅，凌寒独自开</span>
								</p>
							</td>
						
							<td width="177"><span class="orange" id="price0">29.90元</span></td>
						</tr>
						<tr class="line-bot" id="tr1">
							<td>
								<p class="o-goods-info clearfix  ">
									<a href="#" class="fl"><span><img src="upload/2.jpg" alt="" id="img1"></span></a>
									<span class="fl tit mt10" id="tit1">墙角数枝梅，凌寒独自开</span>
								</p>
							</td>
							
							<td><span class="orange" id="price1">29.90元</span></td>
						</tr>
						<tr class="line-bot" id="tr2">
							<td width="599">
								<p class="o-goods-info clearfix  ">
									<a href="#" class="fl"><span><img src="upload/2.jpg" alt="" id="img2"></span></a>
									<span class="fl tit mt10" id="tit2">墙角数枝梅，凌寒独自开</span>
								</p>
							</td>
						
							<td width="177"><span class="orange" id="price2">29.90元</span></td>
						</tr>
						<tr class="line-bot" id="tr3">
							<td>
								<p class="o-goods-info clearfix  ">
									<a href="#" class="fl"><span><img src="upload/2.jpg" alt="" id="img3"></span></a>
									<span class="fl tit mt10" id="tit3">墙角数枝梅，凌寒独自开</span>
								</p>
							</td>
							
							<td><span class="orange" id="price3">29.90元</span></td>
						</tr>
						<tr class="line-bot" id="tr4">
							<td width="599">
								<p class="o-goods-info clearfix  ">
									<a href="#" class="fl"><span><img src="upload/2.jpg" alt="" id="img4"></span></a>
									<span class="fl tit mt10" id="tit4">墙角数枝梅，凌寒独自开</span>
								</p>
							</td>
						
							<td width="177"><span class="orange" id="price0">29.90元</span></td>
						</tr>
						<tr class="line-bot" id="tr5">
							<td>
								<p class="o-goods-info clearfix  ">
									<a href="#" class="fl"><span><img src="upload/2.jpg" alt="" id="img5"></span></a>
									<span class="fl tit mt10" id="tit5">墙角数枝梅，凌寒独自开</span>
								</p>
							</td>
							
							<td><span class="orange" id="price5">29.90元</span></td>
						</tr>
						<tr class="line-bot" id="tr6">
							<td width="599">
								<p class="o-goods-info clearfix  ">
									<a href="#" class="fl"><span><img src="upload/2.jpg" alt="" id="img6"></span></a>
									<span class="fl tit mt10" id="tit6">墙角数枝梅，凌寒独自开</span>
								</p>
							</td>
						
							<td width="177"><span class="orange" id="price6">29.90元</span></td>
						</tr>
						<tr class="line-bot" id="tr7">
							<td>
								<p class="o-goods-info clearfix  ">
									<a href="#" class="fl"><span><img src="upload/2.jpg" alt="" id="img7"></span></a>
									<span class="fl tit mt10" id="tit7">墙角数枝梅，凌寒独自开</span>
								</p>
							</td>
							
							<td><span class="orange" id="price7">29.90元</span></td>
						</tr>
						<tr class="line-bot" id="tr8">
							<td width="599">
								<p class="o-goods-info clearfix  ">
									<a href="#" class="fl"><span><img src="upload/2.jpg" alt="" id="img8"></span></a>
									<span class="fl tit mt10" id="tit8">墙角数枝梅，凌寒独自开</span>
								</p>
							</td>
						
							<td width="177"><span class="orange" id="price8">29.90元</span></td>
						</tr>
						<tr class="line-bot" id="tr9">
							<td>
								<p class="o-goods-info clearfix  ">
									<a href="#" class="fl"><span><img src="upload/2.jpg" alt="" id="img9"></span></a>
									<span class="fl tit mt10" id="tit9">墙角数枝梅，凌寒独自开</span>
								</p>
							</td>
							
							<td><span class="orange" id="price9">29.90元</span></td>
						</tr>
					</table>
					<div class="sale-info pt10 pb10 clearfix">
						<div class="fr total-amount mb30">
							<p class="mt20 fr">
								<span class="fs16 darkgray clearfix">商品总价：<em class="fr orange fs24 f-arial" id="sumPrice">¥ 999.00</em></span>
							</p>
							<p class="mt10 fr">
								<a href="#" onclick="$.submitOrder()" class="fr orange-but fs20 radius3">去结算</a>
							</p>
						</div>
					</div>
				</div>
				<!--/end-->

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

		<div id="mask">
			<div class="alert-box radius8">
				<h3 class="fs20">修改收货地址 <span class="close"></span></h3>
				<div class="address-form box-s" id="mid">
					<form action="" id="seriform">
					<p id="mid" type="hidden" value=""></p>
						<p class="mb20 clearfix">
							<label class="fl">收货人：</label>
							<input id="msname" type="text" placeholder="姓名" value="" placeholder="姓名" class="fl ml5">
							<em class="fl red lh40 ml10">*</em>
						</p>
						<p class="mb20 clearfix">
							<label class="fl">手机：</label>
							<input id="mstel" type="text" placeholder="手机" value="" placeholder="手机" class="fl ml5">
							<em class="fl red lh40 ml10">*</em>
						</p>
						<p id="city" class="mb20 clearfix" align="Left">
					        <label class="fl"><em class="red">*</em>地址：</label>			
                            <select class="prov" id="prov"></select>    
                            <select class="city" id="cit" disabled="disabled"></select>   
                            <select class="dist" id="dist" disabled="disabled"></select>   
					   </p>
						<p class="mb20 clearfix">
							<label class="fl"></label>
							<input id="maddressDetail" type="text" value="" placeholder="详细地址" class="fl ml5">
							<em class="fl red lh40 ml10">*</em>
						</p>
						<p class="mb20 clearfix">
							<label class="fl">邮政编码：</label>
							<input id="mcode" type="text" placeholder="邮政编码" value="" class="fl ml5">
						</p>
						<p class="mb20 clearfix">
							<label class="fl"></label>
							<input type="button" value="保存" class="fl orange-but radius3 ml5" onclick="$.saveUpdate()">
							<input type="button" value="取消" class="fl gray-but radius3 ml10">
						</p>
					</form>
				</div>
			</div>
		</div>
	</body>
	<script src="js/other.js" type="text/javascript" ></script>

</html>