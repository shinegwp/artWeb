<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta charset='utf-8'>
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<title>商城</title>
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
	<!-- ------------------------------------------script--------------------------------------------- -->
	                    <!-- alert("页："+page);
								   $("#fy").append("<a href='#' onclick='$.getfirstShowList("+1+");' >上一页</a>");
								   for(var i=1;i<=data;i++)
									   {
									   $("#fy").append("<a href='#' onclick='$.getfirstShowList("+i+");'>"+i+"</a>"); 
									   }
								     $("#fy").append("<a href='#' class='pre box-s' >下一页</a>");
								   -->
	                     <script type="text/javascript">
	                     $(function()
								 {
							 $.getItemListByPage();
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
	                 							var html = "<li ><span class='f1'>欢迎</span><a href='grxx' class='f1'>"
	                 									+ uname
	                 									+ "</a>进入商场</li><li><a href='#' onclick='$.grxx()'>个人中心</a></li><li><a href='#' onclick='$.outLogin()'>退出</a></li>"
	                 							$("#displayName").html(html);
	                 						}
	                 					}
	                 				});
	                 	}

	                 	$.outLogin = function() {
	                 		$
	                 				.ajax({
	                 					url : "http://sso.jiangyou-art.com/userLogin/outLogin",
	                 					type : "post",
	                 					success : function(data) {
	                 						if (data.msg == "OK") {
	                 							alert("成功退出！");
	                 							$("#displayName")
	                 									.html(
	                 											"<li ><a href='sso.jiangyou-art.com/page/register'>注册/登陆</a></li><li><a href='#' onclick='$.grxx()'>个人中心</a></li><li>")
	                 						} else {
	                 							alert("操作有误");
	                 						}
	                 					},
	                 					error : function() {
	                 						alert("error");
	                 					}

	                 				});
	                 	}
	                 	$.grxx = function()//当点击个人中心时判断是否已登录
	                 	{
	                 		if ($.cookie("TT_TOKEN") == null) {
	                 			alert("请先登录！");
	                 		} else {
	                 			window.location.href = "grxx";
	                 		}
	                 	}
	                     
	                     
	                     $.getItemListByPage=function(e)
	                     { 
	                    
	                     	
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
	                     		{url:"getItemBySaleCountOrder",
	                     		 Type:"post",  
	                     		 data:{
	                     			 "page":page,
	                     			 "rows":9,
	                     			
	                     			
	                     		 },
	                     		 success:function(data)
	                     		 { 
	                     			 
	                     				 var jsondata = eval('('+data+')');
	                     	
	                     				 $("#firstPage").attr("value",jsondata.pageinfo.firstPage);
	                     				 $("#nexPage").attr("value",jsondata.pageinfo.nextPage);
	                     				 $("#lastPage").attr("value",jsondata.pageinfo.lastPage);
	                     				 $("#prePage").attr("value",jsondata.pageinfo.prePage);
	                     				
	                     				 for(var j=1;j<=12;j++){
	                     					 $("#divA"+j).hide();
	                     					 
	                     				 }
	                     				 
	                     				 for(var i=0;i<jsondata.pageinfo.list.length;i++)
	                     					 {
	                     					    $("#imgAddress"+(i+1+0)).attr("src",jsondata.pageinfo.list[i].imgAddress)
	                     						 $("#p"+(i+1+0)).html(jsondata.pageinfo.list[i].title);
	                     					    $("#price"+(i+1+0)).html(jsondata.pageinfo.list[i].price);
	                     					   $("#id"+(i+1+0)).attr("value",jsondata.pageinfo.list[i].id);
	                     					    $("#divA"+(i+1+0)).show();
	                     						

	                     				
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
	                     
	                     $.enterSpecial=function(e)
	                     {
	                    	 window.location.href ="gotoSpecialDet?pid="+e.val();
	                     }
	                   //按销量页面  
	                 	$.getSale=function()
						{
	                 		 window.location.href ="sale_mall";
						}
	                   //按上市时间时间页面
	                 	$.getNew=function()
						{
	                 		 window.location.href ="new_mall";
						}
	                   //跳到综合页面
	                 	$.zonghe=function()
						{
	                 		 window.location.href ="mall";
						}
						 </script>

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
									<a href="http://sso.jiangyou-art.com/page/register">
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
					<li><a href="special">专场</a></li>
					<li class="cur"><a href="mall">商城</a></li>
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
						您的位置：商城
					</div>
					<div class="listed clearfix box-s">
						<div class="list clearfix fl">
							<p class="bt fl">
								分类：
							</p>
						
							<div class="right clearfix fl" id="catId">
								<ul id="UL">
									<li class="cur">不限</li>
									<li class="" id = "yd"   onclick="$.enterSpecial($(this));" value="1">玉雕</li>
									<li class="" id = "sh"  onclick="$.enterSpecial($(this));" value="2">书画西画</li>
									<li class="" id = "zb"  onclick="$.enterSpecial($(this))" value="3">珠宝</li>
									<li class="" id = "st"  onclick="$.enterSpecial($(this))" value="4">国石奇石</li>
									<li class="" id = "tc"  onclick="$.enterSpecial($(this))" value="5">瓷器紫砂</li>
									<li class="" id = "my"  onclick="$.enterSpecial($(this))" value="6">木艺</li>
									<li class="" id = "ww"  onclick="$.enterSpecial($(this))" value="7">文玩收藏</li>
									<li class="" id = "jy"  onclick="$.enterSpecial($(this))" value="8">金银铜器</li>
									<li class="" id = "yb"  onclick="$.enterSpecial($(this))" value="9">邮币</li>
									<li class="" id = "sg"  onclick="$.enterSpecial($(this))" value="10">传统手工艺</li>
								</ul>
							</div>
					
								
					</div>
				</div>
			</div>
			<!--sorts end-->
			
			<!--sales star-->
			<div class="sales clearfix">
				<div class="content clearfix">
					<div class="top clearfix">
						<div class="left clearfix fl">
							<!--以下li中添加cur的时候是选中的时候-->
							<ul>
								<li onclick="$.zonghe()">综合排序</li>
								<li onclick="$.getSale();" class="xliang cur">销量</li>
								<li onclick="$.getNew();" class="xpin">新品</li>
							</ul>
						</div>
					</div>
				
					<div class="bottom clearfix" id="bodyBox">
<!-- ------------------第一个画框---------------------------------------------------- -->
						<div class="list clearfix transition" id="divA1">
							<div class="tu clearfix">
								<img src="upload/2.jpg" id="imgAddress1"/>
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
							<div class="xia clearfix box-s" id="divB1">
								<p class="bt over" id="p1">
									尹藤收藏
								</p>
								<div class="price clearfix">
									<span class="fl" id="price1">￥1000.00<samp>原价￥2000.00</samp></span>
									<a href="#" id="id1" onclick="$.gotoprodetail($(this))" class="goumai fr ra3 transition">立即购买</a>
								</div>
							</div>
						</div>
	<!-- ------------------第二个画框---------------------------------------------------- -->
						<div class="list clearfix transition" id="divA2">
							<div class="tu clearfix">
								<img src="upload/2.jpg" id="imgAddress2"/>
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
							<div class="xia clearfix box-s" id="divB2">
								<p class="bt over" id="p2">
									尹藤收藏
								</p>
								<div class="price clearfix">
									<span class="fl" id="price2">￥1000.00<samp>原价￥2000.00</samp></span>
									<a href="#" id="id2" onclick="$.gotoprodetail($(this))" class="goumai fr ra3 transition">立即购买</a>
								</div>
							</div>
						</div>
<!-- ------------------第三个画框---------------------------------------------------- -->
						<div class="list clearfix transition" id="divA3">
							<div class="tu clearfix">
								<img src="upload/2.jpg" id="imgAddress3"/>
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
							<div class="xia clearfix box-s" id="divB3">
								<p class="bt over" id="p3">
									尹藤收藏
								</p>
								<div class="price clearfix">
									<span class="fl" id="price3">￥1000.00<samp>原价￥2000.00</samp></span>
									<a href="#" id="id3" onclick="$.gotoprodetail($(this))" class="goumai fr ra3 transition">立即购买</a>
								</div>
							</div>
						</div>	
<!-- ------------------第四个画框---------------------------------------------------- -->
						<div class="list clearfix transition" id="divA4">
							<div class="tu clearfix">
								<img src="upload/2.jpg" id="imgAddress4"/>
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
							<div class="xia clearfix box-s" id="divB4">
								<p class="bt over" id="p4">
									尹藤收藏
								</p>
								<div class="price clearfix">
									<span class="fl" id="price4">￥1000.00<samp>原价￥2000.00</samp></span>
									<a href="#" id="id4" onclick="$.gotoprodetail($(this))" class="goumai fr ra3 transition">立即购买</a>
								</div>
							</div>
						</div>						
<!-- ------------------第五个画框---------------------------------------------------- -->
						<div class="list clearfix transition" id="divA5">
							<div class="tu clearfix">
								<img src="upload/2.jpg" id="imgAddress5"/>
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
							<div class="xia clearfix box-s" id="divB5">
								<p class="bt over" id="p5">
									尹藤收藏
								</p>
								<div class="price clearfix">
									<span class="fl" id="price5">￥1000.00<samp>原价￥2000.00</samp></span>
									<a href="#" id="id5" onclick="$.gotoprodetail($(this))" class="goumai fr ra3 transition">立即购买</a>
								</div>
							</div>
						</div>						
	<!-- ------------------第六个画框---------------------------------------------------- -->
						<div class="list clearfix transition" id="divA6">
							<div class="tu clearfix">
								<img src="upload/2.jpg" id="imgAddress6"/>
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
							<div class="xia clearfix box-s" id="divB6">
								<p class="bt over" id="p6">
									尹藤收藏
								</p>
								<div class="price clearfix">
									<span class="fl" id="price6">￥1000.00<samp>原价￥2000.00</samp></span>
									<a href="#" id="id6" onclick="$.gotoprodetail($(this))" class="goumai fr ra3 transition">立即购买</a>
								</div>
							</div>
						</div>
	<!-- ------------------第七个画框---------------------------------------------------- -->
						<div class="list clearfix transition" id="divA7">
							<div class="tu clearfix">
								<img src="upload/2.jpg" id="imgAddress7"/>
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
							<div class="xia clearfix box-s" id="divB7">
								<p class="bt over" id="p7">
									尹藤收藏
								</p>
								<div class="price clearfix">
									<span class="fl" id="price7">￥1000.00<samp>原价￥2000.00</samp></span>
									<a href="#" id="id7" onclick="$.gotoprodetail($(this))" class="goumai fr ra3 transition">立即购买</a>
								</div>
							</div>
						</div>					
		<!-- ------------------第八个画框---------------------------------------------------- -->
						<div class="list clearfix transition" id="divA8">
							<div class="tu clearfix">
								<img src="upload/2.jpg" id="imgAddress8"/>
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
							<div class="xia clearfix box-s" id="divB8">
								<p class="bt over" id="p8">
									尹藤收藏
								</p>
								<div class="price clearfix">
									<span class="fl" id="price8">￥1000.00<samp>原价￥2000.00</samp></span>
									<a href="#" id="id8" onclick="$.gotoprodetail($(this))" class="goumai fr ra3 transition">立即购买</a>
								</div>
							</div>
						</div>
<!-- ------------------第九个画框---------------------------------------------------- -->
						<div class="list clearfix transition" id="divA9">
							<div class="tu clearfix">
								<img src="upload/2.jpg" id="imgAddress9"/>
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
							<div class="xia clearfix box-s" id="divB9">
								<p class="bt over" id="p9">
									尹藤收藏
								</p>
								<div class="price clearfix">
									<span class="fl" id="price9">￥1000.00<samp>原价￥2000.00</samp></span>
									<a href="#" id="id9" onclick="$.gotoprodetail($(this))" class="goumai fr ra3 transition">立即购买</a>
								</div>
							</div>
						</div>															
				
					
				
				</div>
				<!-- ----------------------------------------------------分页-------------------------------------- -->
				 
					<div class="tab-pages">
		               <p id="pid"></p>
						<a id="prePage" href="#" value="" class="tab-prev tab-btn" onclick="$.getItemListByPage($(this));">上一页</a>
						<a id="firstPage" href="#" value="" class="page-btn " onclick="$.getItemListByPage($(this));">第一页</a>
						<a id="lastPage" href="#" value="" class="page-btn" onclick="$.getItemListByPage($(this));">最后一页</a>
						<a id="nexPage" href="#" value="" class="tab-next tab-btn" onclick="$.getItemListByPage($(this));">下一页</a>
						<span class="ml10">到第</span>
						<input type="text" name="" id="jid" value=""  size="1"/>
						<span>页</span>
						<input type="submit" name="" id="" value="确定" onclick="$.getItemListByPage($(this));"/>
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
	<script type="text/javascript">
		$('.listed .list ul li').each(function() {
			$(this).click(function() {
				$(this).siblings("li").removeClass("cur");
				$(this).addClass("cur");
			});
		});
	</script>
	<script src="js/other.js" type="text/javascript" ></script>
</html>