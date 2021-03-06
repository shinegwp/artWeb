<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta charset='utf-8'>
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<title>退货记录</title>
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
	<script type="text/javascript">
	var user;
		$(function(){
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
								user = data.data;
								$.getReturnOrderFormListByPage();
								var html = "<li ><span class='f1'>欢迎</span><a href='grxx' class='f1'>"
										+ uname
										+ "</a>进入商场</li><li><a href='#' onclick='$.outLogin()'>退出</a></li>"
								$("#displayName").html(html);
							} else {
								alert("登陆已过期，请重新登录");
								window.location.href = "http://sso.jiangyou-art.com/page/login?redirect=http://www.jiangyou-art.com/lljl";
							}
						}
					});
		}
		$.outLogin=function()
		 {
			 $.ajax({
				  url: "http://sso.jiangyou-art.com/userLogin/outLogin",
				  dataType : "jsonp",
				  type:"GET",
				  
				  success: function(data)
				  
				  { if(data.msg=="OK")
					  {
					  alert("成功退出！");
					  window.location.href = "http://www.jiangyou-art.com";
					  }
				  else
					  {
					  alert("操作有误");
					  }
				  },
				  error:function()
				  {
					  window.location.href = "http://www.jiangyou-art.com";	                  
				  }
				  
				});
		 }
		
		$.getReturnOrderFormListByPage=function(e)
		{  var page=1;

		   if(typeof(e)=="object")
			   {
			  page=e.val();
			   }
			   if(!$("#jid").attr("value")=="")
				   {
				   page=$("#jid").attr("value");
				   }
			$.ajax(
				{url:"getReturnListByPage",
				 Type:"post",  
				 async:false,
				 data:{
					 "page":page,
					 "rows":4,
					 "uid":user.uid,
					 "state":"退货"
				 },
				 success:function(data)
				 {  
				 var jsondata = eval('('+data+')');
				 $("#firstPage").attr("value",jsondata.pageinfo.firstPage);
				 $("#nexPage").attr("value",jsondata.pageinfo.nextPage);
				 $("#lastPage").attr("value",jsondata.pageinfo.lastPage);
				 $("#prePage").attr("value",jsondata.pageinfo.prePage);
				 for(var j=0;j<=4;j++){
					 {
					 $("#tb"+j).hide();
					 }
					 $("#jid").attr("value","");
				 }
				 for(var i=0;i<jsondata.pageinfo.list.length;i++)
					 {$("#p"+i).html('<span class="fr pr10" id="price0">订单金额：'+jsondata.pageinfo.list[i].money+'</span>订单号：'+jsondata.pageinfo.list[i].formNum+'　　 下单时间：'+jsondata.time[i]);
					 $("#img"+i).attr("src",jsondata.pageinfo.list[i].itemImg);
					 $("#title"+i).html(jsondata.pageinfo.list[i].itemTitle);
					 $("#unitprice"+i).html(jsondata.pageinfo.list[i].unitprice);
					 $("#address"+i).html(jsondata.pageinfo.list[i].address);
					 $("#peoplename"+i).html(jsondata.pageinfo.list[i].peopleName);
					 $("#state"+i).html(jsondata.pageinfo.list[i].state);
					
					  $("#tb"+i).show();
				
					 }
				 },error:function()
				 {
					 alert("error");
				 }
					
				});
			
			}
		</script>
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
								
								
							</ul>
						</div>
						<div class="shopcar-btn clearfix fl">
							<a href="shopping" class="box-s">
								购物车
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="bottom clearfix">
				<div class="logo clearfix">
					<a href="index"></a>
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
						<a href="index">首页</a>
					</li>
					<li>
						<a href="special">专场</a>
					</li>
					<li>
						<a href="mall">商城</a>
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
						<li >
							<a href="grxx" class="db fs16">个人信息</a>
						</li>
						
						<li>
							<a href="shdz" class="db fs16">收货地址</a>
						</li>
						<li>
							<a href="wdsc" class="db fs16">我的收藏</a>
						</li>
						
						<li>
							<a href="xgmm" class="db fs16">修改密码</a>
						</li>
						<li>
							<a href="zhye" class="db fs16">账户余额</a>
						</li>
						<li>
							<a href="zxcz" class="db fs16">在线充值</a>
						</li>
						<li class="on">
							<a href="lljl" class="db fs16">退货记录</a>
						</li>
						<li>
							<a href="zixun" class="db fs16">我的咨询</a>
						</li>
						
					</ul>
				</div>
				<div class="fr slide-show white-box">
					<div class="dark-tit clearfix">
						<h3 class="fl fs26">退货记录</h3>
						<p class="fr slide-t-nav">
							<a href="#" class="on fs14 radius3">全部</a>
							<a href="#" class="fs14 radius3">已审批</a>
							<a href="#" class="fs14 radius3">未审批</a>
							<a href="#" class="fs14 radius3">未通过</a>
						</p>
					</div>
					<table class="table_1">
						<tr>
							<th width="30%">商品信息</th>
							<th width="16%">单价（元）</th>
							<th width="15%">数量</th>
							<th width="15%">收货人</th>
							<th width="24%" rowspan="2">订单状态</th>
						</tr>
					</table>
					<table class="table_1 mt15" id="tb0">
						<tr>
							<th align="left" colspan="6">
								<p class="fs12" id="p0"></p>
							</th>
						</tr>
						<tr>
							<td width="30%">
								<p class="clearfix o-goods-info">
									<a href="#" class="fl"><span><img src="upload/2.jpg" alt="" id="img0"></span></a>
									<span class="fl tit " id="title0">北京椿龄文化墙角一枝梅北京椿龄文化墙角一枝梅</span>
								</p>
							</td>
							<td width="16%" align="center" id="unitprice0">￥1100</td>
							<td width="15%" align="center" id="address0">1</td>
							<td width="15%" rowspan="0" align="center" id="peoplename0">李东海</td>
							<td width="12%" rowspan="0" align="center" id="state0">已收货<br>
								<a href="#" class="orange">订单详情</a>
							</td>
							<td width="12%" rowspan="0" align="center">
								<a href="sqsh.html" class="a-sqsh green radius3">申请售后</a>
							</td>
						</tr>
						
					</table>
					<table class="table_1 mt15" id="tb1">
						<tr>
							<th align="left" colspan="6">
								<p class="fs12" id="p1"><span class="fr pr10" id="price1">订单金额：59.80</span>订单号：201410110000152029　　　下单时间：2014-10-11 13:26:39　</p>
							</th>
						</tr>
						<tr>
							<td width="30%">
								<p class="clearfix o-goods-info">
									<a href="#" class="fl"><span><img src="upload/2.jpg" alt="" id="img1"></span></a>
									<span class="fl tit " id="title1">北京椿龄文化墙角一枝梅北京椿龄文化墙角一枝梅</span>
								</p>
							</td>
							<td width="16%" align="center" id="unitprice1">￥1100</td>
							<td width="15%" align="center" id="address1">1</td>
							<td width="15%" rowspan="0" align="center" id="peoplename1">李东海</td>
							<td width="12%" rowspan="0" align="center" id="state1">已收货<br>
								<a href="#" class="orange">订单详情</a>
							</td>
							<td width="12%" rowspan="0" align="center">
								<a href="sqsh.html" class="a-sqsh green radius3">申请售后</a>
							</td>
						</tr>
						
					</table>
					<table class="table_1 mt15" id="tb2">
						<tr>
							<th align="left" colspan="6">
								<p class="fs12" id="p2"><span class="fr pr10" id="price2">订单金额：59.80</span>订单号：201410110000152029　　　　下单时间：2014-10-11 13:26:39</p>
							</th>
						</tr>
						<tr>
							<td width="30%">
								<p class="clearfix o-goods-info">
									<a href="#" class="fl"><span><img src="upload/2.jpg" alt="" id="img2"></span></a>
									<span class="fl tit " id="title2">北京椿龄文化墙角一枝梅北京椿龄文化墙角一枝梅</span>
								</p>
							</td>
							<td width="16%" align="center" id="unitprice2">￥1100</td>
							<td width="15%" align="center" id="address2">1</td>
							<td width="15%" align="center" id="peoplename2">李东海</td>
							<td width="12%" align="center" id="state2">已收货<br>
								<a href="#" class="orange">订单详情</a>
							</td>
							<td width="12%" align="center">
								<a href="sqsh.html" class="a-sqsh green radius3">申请售后</a>
							</td>
						</tr>
					</table>
					<table class="table_1 mt15" id="tb3">
						<tr>
							<th align="left" colspan="6">
								<p class="fs12" id="p3"><span class="fr pr10" id="price3">订单金额：59.80</span>订单号：201410110000152029　　　　下单时间：2014-10-11 13:26:39</p>
							</th>
						</tr>
						<tr>
							<td width="30%">
								<p class="clearfix o-goods-info">
									<a href="#" class="fl"><span><img src="upload/2.jpg" alt="" id="img3"></span></a>
									<span class="fl tit " id="title3">北京椿龄文化墙角一枝梅北京椿龄文化墙角一枝梅</span>
								</p>
							</td>
							<td width="16%" align="center" id="unitprice3">￥1100</td>
							<td width="15%" align="center" id="address3">1</td>
							<td width="15%" align="center" id="peoplename3">李东海</td>
							<td width="12%" align="center" id="state3">已收货<br>
								<a href="#" class="orange">订单详情</a>
							</td>
							<td width="12%" align="center">
								<a href="sqsh.html" class="a-sqsh green radius3">申请售后</a>
							</td>
						</tr>
					</table>
					<div class="tab-pages">
		               <p id="pid"></p>
						<a id="prePage" href="#" value="" class="tab-prev tab-btn" onclick="$.getReturnOrderFormListByPage($(this));">上一页</a>
						<a id="firstPage" href="#" value="" class="page-btn " onclick="$.getReturnOrderFormListByPage($(this));">第一页</a>
						<a id="lastPage" href="#" value="" class="page-btn" onclick="$.getReturnOrderFormListByPage($(this));">最后一页</a>
						<a id="nexPage" href="#" value="" class="tab-next tab-btn" onclick="$.getReturnOrderFormListByPage($(this));">下一页</a>
						<span class="ml10">到第</span>
						<input type="text" name="" id="jid" value=""  size="1"/>
						<span>页</span>
						<input type="submit" name="" id="" value="确定" onclick="$.getReturnOrderFormListByPage($(this));"/>
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
				
			<div class="banquan clearfix ta-center">
				Copyright 酱油文化. All Rights Reserved. 
			</div>
		</div>
		<!--footer end-->
	</body>

</html>