<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta charset='utf-8'>
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<title>详情</title>
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
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
		<script src="js/common.js"></script>
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
								
								<li ><span class='f1'>您好，请</span><a href='http://sso.jiangyou-art.com/page/login' class='f1'>登陆</a></li><li><a href='http://sso.jiangyou-art.com/page/register' >免费注册</a></li>
								
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
					<a href="index"></a>
				</div>
			
			</div>
		</div>
		<!--header end-->
<script type="text/javascript">
var det;
var id;
var img;
var title;
var price;
var a = $.cookie("user");
var user=eval('('+a+')');
$(function()
		{
	 $.displayUserName();
	  det=${detail};
	  id = det.item.id;
	  img = det.item.imgAddress;
	  title = det.item.title;
	  price = det.item.price;
	for(var i=0;i<det.img1.length;i++)
	{
		
	$("#img"+(i+1+0)).attr("src",det.img1[i].img1);
	}
	if(det.img1.length<7)
		{
		var k=0;
		for(var j=det.img1.length;j<=7;j++)
		{
			
		$("#img"+(j+1+0)).attr("src",det.img1[k++].img1);
		}	
		}
   //展示姓名

   $("#name").html(det.item.title);
   $("#descript").html(det.item.description);
   $("#price").html(det.item.price);
   $("#sid").attr("iteid",det.item.id);//给购物车赋值商品ID
   $("#bid").attr("iteid",det.item.id);//给购买赋值商品ID
 

   var xqappend="";
   for(var k=0;k<det.img2.length;k++)
	   {xqappend = xqappend+"<p><img src='"+det.img2[k].img2+" ' style='width:600px;height:400px'/></p>";//"<p><img src='upload/yd/hty/2/d1/1.jpg'/></p>";
	   
	   }
   $("#xq").html(xqappend);
   //大家都喜欢
   $.alllike();
});

$.wdzx=function()
{ var text = $("#zx").val();
	$.ajax(
			{
				url:"saveRefer",
				data:{
					   "context":text,
					   "uid":user.uid,
					   "iid":det.item.id 
				   },
				dataType:"json",
				type:"post",
				success:function(data)
				{
				   if(data.msg=="1")
					{alert("咨询成功！");}else
						{
						alert("操作有误！");
						}
				},error:function(data)
				{
					alert("error");
				}
			});
	}

$.displayUserName=function()//如果登陆了展示退出和欢迎
{
	var _ticket = $.cookie("TT_TOKEN");
	if(!_ticket){
		$("#displayName").html("<li ><span class='f1'>您好，请</span><a href='http://sso.jiangyou-art.com/page/login' class='f1'>登陆</a></li><li><a href='http://sso.jiangyou-art.com/page/register' >免费注册</a></li>")
	}
	$.ajax({
		url : "http://sso.jiangyou-art.com/userLogin/token/" + _ticket,
		
		dataType : "jsonp",
		type : "GET",
		success : function(data){
		
			if(data.status == 200){
				var uname = data.data.uname;
				var html = "<li ><span class='f1'>欢迎</span><a href='grxx' class='f1'>"+uname+
				"</a>进入商场</li><li><a href='#' onclick='$.grxx()'>个人中心</a></li><li><a href='#' onclick='$.outLogin()'>退出</a></li>"
				$("#displayName").html(html);
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
			  $("#displayName").html("<li ><span class='f1'>您好，请</span><a href='http://sso.jiangyou-art.com/page/login' class='f1'>登陆</a></li><li><a href='http://sso.jiangyou-art.com/page/register' >免费注册</a></li>")
			  }
		  else
			  {
			  alert("操作有误");
			  }
		  },
		  error:function()
		  {
			  $("#displayName").html("<li ><span class='f1'>您好，请</span><a href='http://sso.jiangyou-art.com/page/login' class='f1'>登陆</a></li><li><a href='http://sso.jiangyou-art.com/page/register' >免费注册</a></li>")
              
		  }
		  
		});
 }
 $.grxx=function()//当点击个人中心时判断是否已登录
 {  
	 if($.cookie("TT_TOKEN")==null)
	 {
	 alert("请先登录！");
	 }
 else
	 {
	 window.location.href="grxx";
	 } 
 }
 $.getNewItem=function()
	{
	 $.ajax({
		  url: "getContent",
		  type: "post",
		  data:{
			  categoryId:90  
		  },
		  success: function(data)
		  {  
			  var content=eval('('+data+')');
			  for(var i=0;i<4;i++)
				{
				$("#src"+i).attr("src",content[i].pic);//显示图片
			 	$("#p"+i).html(content[i].title);
				$("#span"+i).text(content[i].price);
				}
		  },
		  error:function()
		  {
			  alert("error");
		  }
		  
		});
	}
</script>
<script type="text/javascript">
$.alllike=function()
{$.ajax(
		{
			url:"getItemBylikeCountOrder",
			dataType:"json",
			type:"post",
			success:function(data)
			{  a
			for(var i=1;i<=12;i++)
				{
				$("#alllike"+i).attr("src",data[i-1].imgAddress);
				$("#alllikename"+i).html(data[i-1].title);
				$("#lprice"+i).html(data[i-1].price);
				$("#Itemid"+i).attr("value",data[i-1].id);
				}
				
			for(var i=1;i<=5;i++)
				{
				//$("#lb"+i).attr("src",data[(i-1-0)].imgAddress)
				}
			
			},error:function(data)
			{
				alert("error");
			}
		});
	}
	
$.gotoprodetail=function(e)
{  
	
	
	 window.location.href ="getDetail?id="+e.val();
	}
$.addItem=function()
{
	$.ajax({
		url:"addItemtoCar",
		data:{
			id:id,
		},
		type:"post",
		success:function(jsonresult)
		{    if(jsonresult="success")
			{
			window.location.href ="success";
			}
			 
			
		},error:function()
		{ alert("操作有误！");
		}
	});
	}
	
	
$.gotojiesuan=function(e)
{   if(user==null)
	{
	alert("请先登录");
	}
else
	
	{
	 window.location.href ="gotojiesuan?id="+e.attr("iteid");
	
	//$.addItem();
	//windows.location.href="jiesuan?price="+e.attr("iteid");
	}
	
	
	
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
		<div class="main-wrap graybgtwo pt40 pb40">
			<div class="wrapper">
				<!--Main-pro-info-->
				<div class="main-pro-info white-box  clearfix">
					<div class="fangda clearfix fl">
						<div id="showbox">
						  <img src="upload/14.jpg" width="100" height="100" id="img1" />
						  <img src="upload/14.jpg" width="100" height="100" id="img2" />
						  <img src="upload/14.jpg" width="100" height="100" id="img3" />
						  <img src="upload/14.jpg" width="100" height="100" id="img4" />
						  <img src="upload/14.jpg" width="100" height="100" id="img5" />
						 
						</div><!--展示图片盒子-->
						<div id="showsum"></div><!--展示图片里边-->
						<p class="showpage">
						  <a href="javascript:void(0);" id="showlast"> < </a>
						  <a href="javascript:void(0);" id="shownext"> > </a>
						</p>
						
						</div>
					<!--产品信息介绍-->
					<div class="fr pro-intro">
						<div class="pb20 line-bot">
							<h3 class="fs26 darkblack lh50 ellipsis" id="name">墙角数枝梅，凌寒独自开</h3>
							
							<p class="price pt10 clearfix" ><strong class="fl red fs40" id="price">¥1000</strong><em class="fl white ml20 lh20 mt20">已售：2000件</em></p>
						</div>
						<div class="pro-ctent clearfix" id="descript">
							
						</div>
						<div class="pt10">
						</br></br></br></br></br></br></br>
							<div class="but-box mt30">
							
								<input type="button" class="fl orange-but radius3" value="加入购物车" id="sid" iteid="" onclick="$.addItem()">
							</div>
						</div>
					</div>
					<!--/end-->
				</div>
				<!--/end-->
			
				<!--/end-->

				<div class="mt20 clearfix">
					<div class="fl pro-likes white-box">
						<div class="title"><strong class="fs16 white">大家都喜欢</strong></div>
						<ul class="likelist">
							<li id="Itemid1" value="" onclick="$.gotoprodetail($(this))">
								<a href="#" class="db pic"><span><img src="" alt="" id="alllike1"/></span></a>
								<a href="#" class="full-db tit darkblack ellipsis" id="alllikename1">墙角数枝梅</a>
								<strong class="full-db red"><em class="fs12" id="lprice1">¥65.00</em></strong>
							</li>
							<li id="Itemid2" value="" onclick="$.gotoprodetail($(this))">
								<a href="#" class="db pic"><span><img src="" alt="" id="alllike2"/></span></a>
								<a href="#" class="full-db tit darkblack ellipsis" id="alllikename2">墙角数枝梅</a>
								<strong class="full-db red"><em class="fs12" id="lprice2">¥65.00</em></strong>
							</li>
							<li id="Itemid3" value="" onclick="$.gotoprodetail($(this))">
								<a href="#" class="db pic"><span><img src="" alt="" id="alllike3"/></span></a>
								<a href="#" class="full-db tit darkblack ellipsis" id="alllikename3">墙角数枝梅</a>
								<strong class="full-db red"><em class="fs12" id="lprice3">¥65.00</em></strong>
							</li>
							
							
							<li id="Itemid4" value="" onclick="$.gotoprodetail($(this))">
								<a href="#" class="db pic"><span><img src="" alt="" id="alllike4"/></span></a>
								<a href="#" class="full-db tit darkblack ellipsis" id="alllikename4">墙角数枝梅</a>
								<strong class="full-db red"><em class="fs12" id="lprice4">¥65.00</em></strong>
							</li>
							<li id="Itemid5" value="" onclick="$.gotoprodetail($(this))">
								<a href="#" class="db pic"><span><img src="" alt="" id="alllike5"/></span></a>
								<a href="#" class="full-db tit darkblack ellipsis" id="alllikename5">墙角数枝梅</a>
								<strong class="full-db red"><em class="fs12" id="lprice5">¥65.00</em></strong>
							</li>
							<li id="Itemid6" value="" onclick="$.gotoprodetail($(this))">
								<a href="#" class="db pic"><span><img src="" alt="" id="alllike6"/></span></a>
								<a href="#" class="full-db tit darkblack ellipsis" id="alllikename6">墙角数枝梅</a>
								<strong class="full-db red"><em class="fs12" id="lprice6">¥65.00</em></strong>
							</li>
							<li id="Itemid7" value="" onclick="$.gotoprodetail($(this))">
								<a href="#" class="db pic"><span><img src="" alt="" id="alllike7"/></span></a>
								<a href="#" class="full-db tit darkblack ellipsis" id="alllikename7">墙角数枝梅</a>
								<strong class="full-db red"><em class="fs12" id="lprice7">¥65.00</em></strong>
							</li>
							<li id="Itemid8" value="" onclick="$.gotoprodetail($(this))">
								<a href="#" class="db pic"><span><img src="" alt="" id="alllike8"/></span></a>
								<a href="#" class="full-db tit darkblack ellipsis" id="alllikename8">墙角数枝梅</a>
								<strong class="full-db red"><em class="fs12" id="lprice8">¥65.00</em></strong>
							</li>
							<li id="Itemid9" value="" onclick="$.gotoprodetail($(this))">
								<a href="#" class="db pic"><span><img src="" alt="" id="alllike9"/></span></a>
								<a href="#" class="full-db tit darkblack ellipsis" id="alllikename9">墙角数枝梅</a>
								<strong class="full-db red"><em class="fs12" id="lprice9">¥65.00</em></strong>
							</li>
							<li id="Itemid10" value="" onclick="$.gotoprodetail($(this))">
								<a href="#" class="db pic"><span><img src="" alt="" id="alllike10"/></span></a>
								<a href="#" class="full-db tit darkblack ellipsis" id="alllikename10">墙角数枝梅</a>
								<strong class="full-db red"><em class="fs12" id="lprice10">¥65.00</em></strong>
							</li>
							<li id="Itemid11" value="" onclick="$.gotoprodetail($(this))">
								<a href="#" class="db pic"><span><img src="" alt="" id="alllike11"/></span></a>
								<a href="#" class="full-db tit darkblack ellipsis" id="alllikename11">墙角数枝梅</a>
								<strong class="full-db red"><em class="fs12" id="lprice11">¥65.00</em></strong>
							</li>
							<li id="Itemid12" value="" onclick="$.gotoprodetail($(this))">
								<a href="#" class="db pic"><span><img src="" alt="" id="alllike12"/></span></a>
								<a href="#" class="full-db tit darkblack ellipsis" id="alllikename12">墙角数枝梅</a>
								<strong class="full-db red"><em class="fs12" id="lprice12">¥65.00</em></strong>
							</li>

						</ul>
					</div>
					
					<div class="pro-detail fr box-s">
						<div class="tab-hd box-s">
								<ul class="tab-nav clearfix">
								  <li class="fs16 box-s">商品详情</li>
								  <li class="fs16 box-s">商品咨询</li>
								</ul>
						</div>
						<div class="tab-bd">
							<div class="tab-pal" id="xq">
						     
								
							</div>
							<div class="tab-pal">
								<div class="pro-zixun clearfix">
									<p class="bt">我要咨询：</p>
									<textarea name="" rows="5" cols="" placeholder="请输入要咨询内容" id="zx"></textarea>
									<p class="tijiao"><a href="#" class="ra3" onclick="$.wdzx();">提交</a></p>
								</div>
							</div>
						</div>
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
	<script src="js/other.js" type="text/javascript" ></script>
</html>