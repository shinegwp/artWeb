<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta charset='utf-8'>
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<title>添加成功</title>
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
					
				</div>
				<div class="search clearfix fr ra5">
					<input type="text" class="fl" name="q" placeholder="请输入您要搜索的内容" id="query"/>
					<input type="button" value="搜索" class="fl box-s" onclick="$.search()"/>
				</div>
			</div>
		</div>
		<!--header end-->
		<script type="text/javascript">
		$.search=function()
		{
			var querystr=$("#query").attr("value");
			 window.location.href="search?q="+querystr;
		}
		</script>
		<!--navbar star-->
		<div class="navbar clearfix">
			<div class="content clearfix">
				<ul>
					<li class="cur"><a href="index">首页</a></li>
					<li><a href="special">专场</a></li>
					<li><a  href="mall" >商城</a></li>
				
				</ul>
			</div>
		</div>

		<!--navbar end-->
	<!--script -->	
	<!-- 初始化页面 -->
	<script type="text/javascript">
	
	 $(function()
			 {
		 $.displayUserName();
		 $.getNewItem();
		 $.JXshow();
			 });
	</script>
	<!-- 今日推荐 -->
	<script type="text/javascript">
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
	 $.addItem=function(e)
  	{var itemid = e.attr("value");
  		$.ajax({
  			url:"addItemtoCar",
  			data:{
  				id:itemid,
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
	</script>
		<!--settled star-->
		<div class="homepage clearfix">
			<div class="content clearfix">
				<div class="media-right clearfix box-s">
					
					<div class="success-bottom clearfix box-s">
						<div class="success clearfix ta-c">
							<img src="img/success.png">
							<p class="tit ta-c">
								添加商品成功！
							</p>
							<p class="fu-tit ta-c">
								<a href="mall">继续购物</a>
								<a href="cartShow" class="box-s">
								去购物车结算
							</a>
								
							</p>
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
