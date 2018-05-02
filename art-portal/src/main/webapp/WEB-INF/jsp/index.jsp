<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta charset='utf-8'>
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<title>首页</title>
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
						公告：您好，欢迎登录北京椿龄文化发展有限公司
					</div>
					<div class="right clearfix fr">
						<div class="zuo clearfix fl">
							<ul class="clearfix fl" id="displayName">
								
								<li >
									<a href="register">
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
					<li class="cur"><a href="index">首页</a></li>
					<li><a href="special">专场</a></li>
					<li><a  href="mall" >商城</a></li>
				
				</ul>
			</div>
		</div>

		<!--navbar end-->
		
		<!--banner star-->
		<div class="banner">		
			<div class="bd">
				<ul>
					<li style="background:url(upload/banner.jpg) #194982 center 0 no-repeat;"><a href="#"></a></li>
					<li style="background:url(upload/banner.jpg) #15181e center 0 no-repeat;"><a href="#"></a></li>
					<li style="background:url(upload/banner.jpg) #0b0b0b center 0 no-repeat;"><a href="#"></a></li>
					<li style="background:url(upload/banner.jpg) #000000 center 0 no-repeat;"><a href="#"></a></li>
					<li style="background:url(upload/banner.jpg) #04304b center 0 no-repeat;"><a href="#"></a></li>
				</ul>
			</div>
			<div class="hd"><ul></ul></div>
		</div>
		<!--banner end-->
	<!--script -->	
	<!-- 初始化页面 -->
	<script type="text/javascript">
	 $(function()
			 {
		 $.getNewItem();
		 $.JXshow();
		 //$.displayUserName();
			 });
	</script>
	<!-- 今日推荐 -->
	<script type="text/javascript">
	$.displayUserName=function()//如果登陆了展示退出和欢迎
	{
		
		var _ticket = $.cookie("TT_TOKEN");
		if(!_ticket){
			$("#displayName").html("<li ><span class='f1'>您好，请</span><a href='sign' class='f1'>登陆</a></li><li><a href='register' >免费注册</a></li>")
		}
		$.ajax({
			url : "http://sso.taotao.com/user/token/" + _ticket,
			dataType : "jsonp",
			type : "GET",
			success : function(data){
				if(data.status == 200){
					var uname = data.data.uname;
					var html = "<li ><span class='f1'>欢迎</span><a href='grxx' class='f1'>"+uname+
					"</a>进入商场</li><li><a href='#' onclick='$.grxx()'>个人中心</a></li><li><a href='#' onclick='$.tuichu()'>退出</a></li>"
					$("#displayName").html(html);
				}
			}
		});
	}

	 $.tuichu=function()
	 {
		 $.ajax({
			  url: "tuichu",
			  type:"post",
			  success: function(data)
			  { if(data=="successful")
				  {
				  alert("成功退出！");
				  $("#displayName").html("<li ><a href='register'>注册/登陆</a></li><li><a href='#' onclick='$.grxx()'>个人中心</a></li><li>")
				  }
			  else
				  {
				  alert("操作有误");
				  }
			  },
			  error:function()
			  {
				  alert("error");
			  }
			  
			});
	 }
	 $.grxx=function()//当点击个人中心时判断是否已登录
	 {  
		 if($.cookie("user")==null)
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
	<!-- 商城精选显示 -->
	<script type="text/javascript">
	var d;
	$.JXshow=function()
	{ $.ajax({
		  url: "getContent",
		  type: "post",
		  data:{
			  categoryId:89  
		  },
		  success: function(data)
		  {  
			  var content=eval('('+data+')');  
			  for(var i=0;i<9;i++)
			  { 
				$("#jxsrc"+i).attr("src",content[i].pic);
			    $("#jxp"+i).html(content[i].title);
			    $("#price"+i).html(content[i].price);
			  }	
		  },
		  error:function()
		  {
			  alert("error");
		  }
		  
		});
	}

	$.enterSpecial=function(e)
	{    
	     window.location.href ="artist-detail?pid="+e.val();
	         
		}
	</script>
		<!--recom star-->
		<div class="recom clearfix">
			<div class="content clearfix">
				<div class="recom-tit clearfix">
					<p class="engtit ta-center">
						RECOMMENDS
					</p>
					<div class="middle clearfix">
						<span class="line"></span>
						<span class="wenzi">今日推荐</span>
						<span class="line"></span>
					</div>
					<p class="fu-tit">
						好作品无需多说 你会由心的看清它的诉说
					</p>
				</div>
	<!-- 推荐 -->			
				<div class="bottom clearfix box-s">
					<div class="left clearfix fl">
<!-- 第一张图---------------------------------------------------------------- -->
						<div class="listone clearfix fl">
							<a href="#" >
								<!--备注：第一张图 宽度：418像素，高度：710像素-->
								<div class="tu clearfix">
									<img src="" id="src0"/>
									<span></span>
								</div>
								<div class="listxia clearfix ta-center">
									<h2>
										<p id="p0">
											孙瑾晨				
											
										</p>
										<p id="span0">
										
										</p>
									</h2>
								</div>
							</a>
						</div>
<!-- 第二张图---------------------------------------------------------------- -->						
						<div class="listone listtwo clearfix fl">
							<a href="#">
								<!--备注：第二张图 宽度：438像素，高度：376像素-->
								<div class="tu clearfix">
									<img src="upload/1-3.png" id="src1"/>
									<span></span>
								</div>
								<div class="listxia clearfix ta-center">
									<h2>
										<p id="p1">
											孙瑾晨
											
										</p>
										<p id="span1">
										
										</p>
									</h2>
								</div>
							</a>
						</div>
					</div>
					<div class="right clearfix fr">
<!-- 第三张图---------------------------------------------------------------- -->					
						<div class="listone listthree clearfix fl">
							<a href="#">
								<!--备注：第三张图 宽度：530像素，高度：638像素-->
								<div class="tu clearfix">
									<img src="upload/1-2.png" id="src2"/>
									<span></span>
								</div>
								<div class="listxia clearfix ta-center">
									<h2>
										<p id="p2">
											孙瑾晨
											
										</p>
										<p id="span2">
										
										</p>
									</h2>
								</div>
							</a>
						</div>
<!-- 第四张图---------------------------------------------------------------- -->						
						<div class="listone listfour clearfix fr">
							<a href="#">
								<!--备注：第四张图 宽度：438像素，高度：480像素-->
								<div class="tu clearfix">
									<img src="upload/1-4.png" id="src3"/>
									<span></span>
								</div>
								<div class="listxia clearfix ta-center">
									<h2>
										<p id="p3">
											孙瑾晨
											
										</p>
										<p id="span3">
										
										</p>
									</h2>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--recom end-->
		
		<!--choice star-->
		<div class="choice clearfix">
			<div class="bgdian"></div>
			<div class="recom-tit clearfix">
				<p class="engtit ta-center">
					SHOPPING MALL
				</p>
				<div class="middle clearfix">
					<span class="line"></span>
					<span class="wenzi">商城精选</span>
					<span class="line"></span>
				</div>
				<p class="fu-tit">
					画品丰富多类 抽象 印象 自然 城市皆有
				</p>
			</div>
			<div class="content clearfix box-s">
				<a href="#" class="choice-more">MORE+</a>
<!--商城精选 ---------------------------------------------------- -->
<!--第一张图 -------------------------------------------------------->
				<div class="list clearfix transition">
					<div class="tu clearfix">
						<img src="upload/1.jpg" id="jxsrc0"/>
						<span></span>
						
						<div class="ycang clearfix">
							<samp class="opa8"></samp>
							<div class="nr clearfix">
								<!--注意：当下方li中添加class名为cur的时候为选中的时候样式-->
								<ul>
									<li class="box-s transition">收藏</li>
									<li class="box-s transition">购物车</li>
								</ul>
							</div>								
						</div>
					</div>
					<div class="xia clearfix box-s">
						<p class="bt over" id="jxp0">
							尹毅画作
						</p>
						<div class="price clearfix">
							<span class="fl" id="price0">￥00.00</span>
							<a href="pro_detail.html" class="goumai fr ra3 transition">立即购买</a>
						</div>
					</div>
				</div>
<!--第二张图 -------------------------------------------------------->				
				<div class="list clearfix transition">
					<div class="tu clearfix">
						<img src="upload/1.jpg" id="jxsrc1"/>
						<span></span>
						
						<div class="ycang clearfix">
							<samp class="opa8"></samp>
							<div class="nr clearfix">
								<!--注意：当下方li中添加class名为cur的时候为选中的时候样式-->
								<ul>
									<li class="box-s transition">收藏</li>
									<li class="box-s transition">购物车</li>
								</ul>
							</div>								
						</div>
					</div>
					<div class="xia clearfix box-s">
						<p class="bt over" id="jxp1">
							尹毅画作
						</p>
						<div class="price clearfix">
							<span class="fl" id="price1">￥00.00</span>
							<a href="pro_detail.html" class="goumai fr ra3 transition">立即购买</a>
						</div>
					</div>
				</div>
<!--第三张图 -------------------------------------------------------->				
				<div class="list clearfix transition">
					<div class="tu clearfix">
						<img src="upload/1.jpg" id="jxsrc2"/>
						<span></span>
						
						<div class="ycang clearfix">
							<samp class="opa8"></samp>
							<div class="nr clearfix">
								<!--注意：当下方li中添加class名为cur的时候为选中的时候样式-->
								<ul>
									<li class="box-s transition">收藏</li>
									<li class="box-s transition">购物车</li>
								</ul>
							</div>								
						</div>
					</div>
					<div class="xia clearfix box-s">
						<p class="bt over" id="jxp2">
							尹毅画作
						</p>
						<div class="price clearfix">
							<span class="fl" id="price2">￥00.00</span>
							<a href="pro_detail.html" class="goumai fr ra3 transition">立即购买</a>
						</div>
					</div>
				</div>
<!--第四张图 -------------------------------------------------------->				
				<div class="list clearfix transition">
					<div class="tu clearfix">
						<img src="upload/1.jpg" id="jxsrc3"/>
						<span></span>
						
						<div class="ycang clearfix">
							<samp class="opa8"></samp>
							<div class="nr clearfix">
								<!--注意：当下方li中添加class名为cur的时候为选中的时候样式-->
								<ul>
									<li class="box-s transition">收藏</li>
									<li class="box-s transition">购物车</li>
								</ul>
							</div>								
						</div>
					</div>
					<div class="xia clearfix box-s">
						<p class="bt over" id="jxp3">
							尹毅画作
						</p>
						<div class="price clearfix">
							<span class="fl" id="price3">￥00.00</span>
							<a href="pro_detail.html" class="goumai fr ra3 transition">立即购买</a>
						</div>
					</div>
				</div>
<!--第五张图 -------------------------------------------------------->				
				<div class="list clearfix transition">
					<div class="tu clearfix">
						<img src="upload/1.jpg" id="jxsrc4"/>
						<span></span>
						
						<div class="ycang clearfix">
							<samp class="opa8"></samp>
							<div class="nr clearfix">
								<!--注意：当下方li中添加class名为cur的时候为选中的时候样式-->
								<ul>
									<li class="box-s transition">收藏</li>
									<li class="box-s transition">购物车</li>
								</ul>
							</div>								
						</div>
					</div>
					<div class="xia clearfix box-s">
						<p class="bt over" id="jxp4">
							尹毅画作
						</p>
						<div class="price clearfix">
							<span class="fl" id="price4">￥00.00</span>
							<a href="pro_detail.html" class="goumai fr ra3 transition">立即购买</a>
						</div>
					</div>
				</div>
<!--第六张图 -------------------------------------------------------->		
				<div class="list clearfix transition">
					<div class="tu clearfix">
						<img src="upload/1.jpg" id="jxsrc5"/>
						<span></span>
						
						<div class="ycang clearfix">
							<samp class="opa8"></samp>
							<div class="nr clearfix">
								<!--注意：当下方li中添加class名为cur的时候为选中的时候样式-->
								<ul>
									<li class="box-s transition">收藏</li>
									<li class="box-s transition">购物车</li>
								</ul>
							</div>								
						</div>
					</div>
					<div class="xia clearfix box-s">
						<p class="bt over" id="jxp5">
							尹毅画作
						</p>
						<div class="price clearfix">
							<span class="fl" id="price5">￥00.00</span>
							<a href="pro_detail.html" class="goumai fr ra3 transition">立即购买</a>
						</div>
					</div>
				</div>
<!--第七张图 -------------------------------------------------------->	
				<div class="list clearfix transition">
					<div class="tu clearfix">
						<img src="upload/1.jpg" id="jxsrc6"/>
						<span></span>
						
						<div class="ycang clearfix">
							<samp class="opa8"></samp>
							<div class="nr clearfix">
								<!--注意：当下方li中添加class名为cur的时候为选中的时候样式-->
								<ul>
									<li class="box-s transition">收藏</li>
									<li class="box-s transition">购物车</li>
								</ul>
							</div>								
						</div>
					</div>
					<div class="xia clearfix box-s">
						<p class="bt over" id="jxp6">
							尹毅画作
						</p>
						<div class="price clearfix">
							<span class="fl" id="price6">￥00.00</span>
							<a href="pro_detail.html" class="goumai fr ra3 transition">立即购买</a>
						</div>
					</div>
				</div>
<!--第八张图 -------------------------------------------------------->		
				<div class="list clearfix transition">
					<div class="tu clearfix">
						<img src="upload/1.jpg" id="jxsrc7"/>
						<span></span>
						
						<div class="ycang clearfix">
							<samp class="opa8"></samp>
							<div class="nr clearfix">
								<!--注意：当下方li中添加class名为cur的时候为选中的时候样式-->
								<ul>
									<li class="box-s transition">收藏</li>
									<li class="box-s transition">购物车</li>
								</ul>
							</div>								
						</div>
					</div>
					<div class="xia clearfix box-s">
						<p class="bt over" id="jxp7">
							尹毅画作
						</p>
						<div class="price clearfix">
							<span class="fl" id="price7">￥00.00</span>
							<a href="pro_detail.html" class="goumai fr ra3 transition">立即购买</a>
						</div>
					</div>
				</div>
<!--第九张图 -------------------------------------------------------->		
				<div class="list clearfix transition">
					<div class="tu clearfix">
						<img src="upload/1.jpg" id="jxsrc8"/>
						<span></span>
						
						<div class="ycang clearfix">
							<samp class="opa8"></samp>
							<div class="nr clearfix">
								<!--注意：当下方li中添加class名为cur的时候为选中的时候样式-->
								<ul>
									<li class="box-s transition">收藏</li>
									<li class="box-s transition">购物车</li>
								</ul>
							</div>								
						</div>
					</div>
					<div class="xia clearfix box-s">
						<p class="bt over" id="jxp8">
							尹毅画作
						</p>
						<div class="price clearfix">
							<span class="fl" id="price8">￥00.00</span>
							<a href="pro_detail.html" class="goumai fr ra3 transition">立即购买</a>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--choice end-->
 		
	
		
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
