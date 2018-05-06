<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta charset='utf-8'>
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<title>我的收藏</title>
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
<script type="text/javascript">
var uid;
$(function()
		{	
	$.displayUserName();
	
		});
$.displayUserName = function()//如果登陆了展示退出和欢迎
{
	
	var _ticket = $.cookie("TT_TOKEN");
	$
			.ajax({
				url : "http://sso.jiangyou-art.com/userLogin/token/"
						+ _ticket,

				dataType : "jsonp",
				type : "GET",
				success : function(data) {
					if (data.status == 200) {
						var uname = data.data.uname;
						uid = data.data.uid;
						$.getCollectionListByPage();
						var html = "<li ><span class='f1'>欢迎</span><a href='grxx' class='f1'>"
								+ uname
								+ "</a>进入商场</li><li><a href='#' onclick='$.outLogin()'>退出</a></li>"
						$("#displayName").html(html);
					}else {
						alert("登陆已过期，请重新登录");
						window.location.href = "http://sso.jiangyou-art.com/page/login?redirect=http://www.jiangyou-art.com/wdsc";
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
$.getCollectionListByPage=function(e)
{   var page=1;
    
      if(typeof(e)=="object")
	   {
	  page=e.val();
	   }
	   if(!$("#jid").attr("value")=="")
		   {
		   page=$("#jid").attr("value");
		   }
	$.ajax(
		{url:"getCollectionListByPage",
		 Type:"post",  
		// async:false,
		 data:{
			 "page":page,
			 "rows":6,
			 "uid":uid
		 },
		 dataType:"json",
		 success:function(data)
		 { 
		 $("#firstPage").attr("value",data.pageinfo.firstPage);
		 $("#nexPage").attr("value",data.pageinfo.nextPage);
		 $("#lastPage").attr("value",data.pageinfo.lastPage);
		 $("#prePage").attr("value",data.pageinfo.prePage);
		 
		 for(var j=0;j<=5;j++)
		 {
		 $("#gz"+j).hide();
		 }
	 for(var i=0;i<data.pageinfo.list.length;i++)
		 {var item = eval('('+$.getItemByIid(data.pageinfo.list[i].iid)+')');
		 $("#img"+i).attr("src",item.imgAddress);
		 $("#title"+i).html(item.title);
		 $("#price"+i).html(item.price);
		 $("#gz"+i).attr("value",item.id);
		 $("#gz"+i).show();
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
						<li class="on">
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
						
					</ul>
				</div>
				<div class="fr slide-show white-box">
					<div class="dark-tit line-bot">
						<h3 class="fs26">我的收藏</h3></div>
					<div class="fav-list mt10">
						<ul class="clearfix">
							<li id="gz0" onclick="$.gotoprodetail($(this))" value="" >
								<a href="#" class="pro "><span><img src="upload/2.jpg" id="img0" alt=""/></span></a>
								<a href="#" class="tit fs14 full-db  darkgray over" id="title0">北京椿龄文化墙角一枝梅</a>
								<span class="fs14 full-db "><em class="orange" id="price0">29.90</em> 元</span>
								<span class="fs12 full-db ">95127人评价</span>
								<a href="javascript:" class="a-option i-del"><i class="iconfont fs20">&#xe60b;</i></a>
								<a href="javascript:" class="a-option i-shopping"><i class="iconfont fs20">&#xe60a;</i></a>
							</li>
							<li id="gz1" onclick="$.gotoprodetail($(this))" value="">
								<a href="#" class="pro "><span><img src="upload/2.jpg" id="img1" alt=""/></span></a>
								<a href="#" class="tit fs14 full-db  darkgray over" id="title1">北京椿龄文化墙角一枝梅</a>
								<span class="fs14 full-db "><em class="orange" id="price1">29.90</em> 元</span>
								<span class="fs12 full-db ">95127人评价</span>
								<a href="javascript:" class="a-option i-del"><i class="iconfont fs20">&#xe60b;</i></a>
								<a href="javascript:" class="a-option i-shopping"><i class="iconfont fs20">&#xe60a;</i></a>
							</li>
							<li id="gz2" onclick="$.gotoprodetail($(this))" value="">
								<a href="#" class="pro "><span><img src="upload/2.jpg" id="img2" alt=""/></span></a>
								<a href="#" class="tit fs14 full-db  darkgray over" id="title2">北京椿龄文化墙角一枝梅</a>
								<span class="fs14 full-db "><em class="orange" id="price2">29.90</em> 元</span>
								<span class="fs12 full-db ">95127人评价</span>
								<a href="javascript:" class="a-option i-del"><i class="iconfont fs20">&#xe60b;</i></a>
								<a href="javascript:" class="a-option i-shopping"><i class="iconfont fs20">&#xe60a;</i></a>
							</li>
							<li id="gz3" onclick="$.gotoprodetail($(this))" value="">
								<a href="#" class="pro "><span><img src="upload/2.jpg" id="img3" alt=""/></span></a>
								<a href="#" class="tit fs14 full-db  darkgray over" id="title3">北京椿龄文化墙角一枝梅</a>
								<span class="fs14 full-db "><em class="orange" id="price3">29.90</em> 元</span>
								<span class="fs12 full-db ">95127人评价</span>
								<a href="javascript:" class="a-option i-del"><i class="iconfont fs20">&#xe60b;</i></a>
								<a href="javascript:" class="a-option i-shopping"><i class="iconfont fs20">&#xe60a;</i></a>
							</li>
							<li id="gz4" onclick="$.gotoprodetail($(this))" value="">
								<a href="#" class="pro "><span><img src="upload/2.jpg" id="img4" alt=""/></span></a>
								<a href="#" class="tit fs14 full-db  darkgray over" id="title4">北京椿龄文化墙角一枝梅</a>
								<span class="fs14 full-db "><em class="orange" id="price4">29.90</em> 元</span>
								<span class="fs12 full-db ">95127人评价</span>
								<a href="javascript:" class="a-option i-del"><i class="iconfont fs20">&#xe60b;</i></a>
								<a href="javascript:" class="a-option i-shopping"><i class="iconfont fs20">&#xe60a;</i></a>
							</li>
							<li id="gz5" onclick="$.gotoprodetail($(this))" value="">
								<a href="#" class="pro "><span><img src="upload/2.jpg" id="img5" alt=""/></span></a>
								<a href="#" class="tit fs14 full-db  darkgray over" id="title5">北京椿龄文化墙角一枝梅</a>
								<span class="fs14 full-db "><em class="orange" id="price5">29.90</em> 元</span>
								<span class="fs12 full-db ">95127人评价</span>
								<a href="javascript:" class="a-option i-del"><i class="iconfont fs20">&#xe60b;</i></a>
								<a href="javascript:" class="a-option i-shopping"><i class="iconfont fs20">&#xe60a;</i></a>
							</li>
						</ul>
					</div>
					<div class="tab-pages mt10">
		               <p id="pid"></p>
						<a id="prePage" href="#" value="" class="tab-prev tab-btn" onclick="$.getCollectionListByPage($(this));">上一页</a>
						<a id="firstPage" href="#" value="" class="page-btn " onclick="$.getCollectionListByPage($(this));">第一页</a>
						<a id="lastPage" href="#" value="" class="page-btn" onclick="$.getCollectionListByPage($(this));">最后一页</a>
						<a id="nexPage" href="#" value="" class="tab-next tab-btn" onclick="$.getCollectionListByPage($(this));">下一页</a>
						<span class="ml10">到第</span>
						<input type="text" name="" id="jid" value=""  size="1"/>
						<span>页</span>
						<input type="submit" name="" id="" value="确定" onclick="$.getCollectionListByPage($(this));"/>
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