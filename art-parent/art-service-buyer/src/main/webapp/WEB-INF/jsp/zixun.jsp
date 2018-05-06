<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta charset='utf-8'>
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<title>我的订单</title>
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
<script type="text/javascript">
var pageinfo
var result;
var list;
var uid;
$(function()
		{
      uid=$.getuid();
	 $.getReferListByPage();
	 pageinfo = result.pageinfo;
	 list = result.pageinfo.list;
	 $("#pid").html("一共"+pageinfo.pages+"页");
		});
$.getuid=function()
{
		var dat;
$.ajax({
		  url: "getSessionUser",
		  async:false,
		  success: function(data)
		  { 
		  //回显
		  var jsondata = eval('('+data+')');//把Object对象转换城TaoTaoResult
		  var uid=jsondata.data.uid; 
		  dat=uid;
	
		  },
		  error:function()
		  {
			  alert("getSessionError");
		  }
		  
		});
	  return dat;
}
$.getItemByIid=function(iid)
{ var item;
	$.ajax(
			{url:"getOneItem",
			 Type:"post",  
			 async:false,
			 data:{
				 "id":iid,
				
			 },
			 success:function(data)
			 {   
				item = data;
			
			 },error:function()
				 {
				 alert("error");
				 }
				
			});
	return item;
	}
$.getReferListByPage=function(e)
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
		{url:"getReferListByPage",
		 Type:"post",  
		 async:false,
		 data:{
			 "page":page,
			 "rows":5,
			 "uid":uid
		 },
		 success:function(data)
		 {   var jsondata = eval('('+data+')');
		 $("#firstPage").attr("value",jsondata.pageinfo.firstPage);
		 $("#nexPage").attr("value",jsondata.pageinfo.nextPage);
		 $("#lastPage").attr("value",jsondata.pageinfo.lastPage);
		 $("#prePage").attr("value",jsondata.pageinfo.prePage);
		 for(var j=0;j<=4;j++)
			 {
			 $("#zixun"+j).hide();
			 }
		 for(var i=0;i<jsondata.pageinfo.list.length;i++)
			 {var item = eval('('+$.getItemByIid(jsondata.pageinfo.list[i].iid)+')');

			 $("#title"+i).html(item.title);
			 $("#context"+i).html("咨询内容："+jsondata.pageinfo.list[i].context);
			 $("#zixun"+(i)).show();
			 $("#img"+i).attr("src",item.imgAddress);
			 $("#returnContext"+i).html("回复内容："+jsondata.pageinfo.list[i].returnContext);
			 }
		
		     result=jsondata;
		 },error:function()
			 {
			 alert("error");
			 }
			
		});
	
	}
</script>
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
						<li class="on">
							<a href="grxx" class="db fs16">个人信息</a>
						</li>
						<li>
							<a href="wddd" class="db fs16">我的订单</a>
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
						<li>
							<a href="lljl" class="db fs16">退货记录</a>
						</li>
						<li>
							<a href="zixun" class="db fs16">我的咨询</a>
						</li>
						<li>
							<a href="znx" class="db fs16">站内信</a>
						</li>
					</ul>
				</div>
				<div class="fr slide-show white-box">
					<div class="dark-tit clearfix">
						<h3 class="fl fs26">我的咨询</h3>
					</div>
					<table class="table_1">
						<tr>
							<th width="30%">咨询商品/艺术品</th>
							<th width="70%">咨询/回复</th>
						</tr>
					</table>
					<table class="table_1 mt15" id="zixun0">
						<tr>
							<th align="left" colspan="6">
								<p class="fs12" id="time">咨询时间：2014-10-11 13:26:39</p>
							</th>
						</tr>
						<tr>
							<td width="30%">
								<p class="clearfix o-goods-info">
									<a href="#" class="fl"><span><img src="upload/2.jpg" alt="" id="img0"></span></a>
									<span class="fl tit " id="title0">北京椿龄文化墙角一枝梅北京椿龄文化墙角一枝梅</span>
								</p>
							</td>
							<td width="70%" align="left">
								<p class="pl20" id="context0">咨询内容： 这里是我咨询的内容是打发打发撒的发生大发是的发生</p>
								<p class="pl20" id="returnContext0">回复内容： 你猜猜我是怎么回复你</p>
							</td>
						</tr>
					</table>
					<table class="table_1 mt15" id="zixun1">
						<tr>
							<th align="left" colspan="6">
								<p class="fs12">咨询时间：2014-10-11 13:26:39</p>
							</th>
						</tr>
						<tr>
							<td width="30%">
								<p class="clearfix o-goods-info">
									<a href="#" class="fl"><span><img src="upload/2.jpg" alt="" id="img1"></span></a>
									<span class="fl tit " id="title1">北京椿龄文化墙角一枝梅北京椿龄文化墙角一枝梅</span>
								</p>
							</td>
							<td width="70%" align="left">
								<p class="pl20" id="context1">咨询内容： 这里是我咨询的内容是打发打发撒的发生大发是的发生</p>
								<p class="pl20" id="returnContext1">回复内容： 你猜猜我是怎么回复你</p>
							</td>
						</tr>
					</table>
					<table class="table_1 mt15" id="zixun2">
						<tr>
							<th align="left" colspan="6">
								<p class="fs12">咨询时间：2014-10-11 13:26:39</p>
							</th>
						</tr>
						<tr>
							<td width="30%">
								<p class="clearfix o-goods-info">
									<a href="#" class="fl"><span><img src="upload/2.jpg" alt="" id="img2"></span></a>
									<span class="fl tit " id="title2">北京椿龄文化墙角一枝梅北京椿龄文化墙角一枝梅</span>
								</p>
							</td>
							<td width="70%" align="left">
								<p class="pl20" id="context2">咨询内容： 这里是我咨询的内容是打发打发撒的发生大发是的发生</p>
								<p class="pl20" id="returnContext2">回复内容： 你猜猜我是怎么回复你</p>
							</td>
						</tr>
					</table>
					<table class="table_1 mt15" id="zixun3">
						<tr>
							<th align="left" colspan="6">
								<p class="fs12">咨询时间：2014-10-11 13:26:39</p>
							</th>
						</tr>
						<tr>
							<td width="30%">
								<p class="clearfix o-goods-info">
									<a href="#" class="fl"><span><img src="upload/2.jpg" alt="" id="img3"></span></a>
									<span class="fl tit " id="title3">北京椿龄文化墙角一枝梅北京椿龄文化墙角一枝梅</span>
								</p>
							</td>
							<td width="70%" align="left">
								<p class="pl20" id="context3">咨询内容： 这里是我咨询的内容是打发打发撒的发生大发是的发生</p>
								<p class="pl20" id="returnContext3">回复内容： 你猜猜我是怎么回复你</p>
							</td>
						</tr>
					</table>
					<table class="table_1 mt15" id="zixun4">
						<tr>
							<th align="left" colspan="6">
								<p class="fs12">咨询时间：2014-10-11 13:26:39</p>
							</th>
						</tr>
						<tr>
							<td width="30%">
								<p class="clearfix o-goods-info">
									<a href="#" class="fl"><span><img src="upload/2.jpg" alt="" id="img4"></span></a>
									<span class="fl tit " id="title4">北京椿龄文化墙角一枝梅北京椿龄文化墙角一枝梅</span>
								</p>
							</td>
							<td width="70%" align="left">
								<p class="pl20" id="context4">咨询内容： 这里是我咨询的内容是打发打发撒的发生大发是的发生</p>
								<p class="pl20" id="returnContext4">回复内容： 你猜猜我是怎么回复你</p>
							</td>
						</tr>
					</table>
		
					<div class="tab-pages">
		               <p id="pid"></p>
						<a id="prePage" href="#" value="" class="tab-prev tab-btn" onclick="$.getReferListByPage($(this));">上一页</a>
						<a id="firstPage" href="#" value="" class="page-btn " onclick="$.getReferListByPage($(this));">第一页</a>
						<a id="lastPage" href="#" value="" class="page-btn" onclick="$.getReferListByPage($(this));">最后一页</a>
						<a id="nexPage" href="#" value="" class="tab-next tab-btn" onclick="$.getReferListByPage($(this));">下一页</a>
						<span class="ml10">到第</span>
						<input type="text" name="" id="jid" value=""  size="1"/>
						<span>页</span>
						<input type="submit" name="" id="" value="确定" onclick="$.getReferListByPage($(this));"/>
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