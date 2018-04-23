<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta charset='utf-8'>
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<title>专场</title>
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
		<script src="js/common.js"></script>
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
									<a href="register">
										注册/登陆
									</a>
								</li>
								
								<li>
									<a href="grxx">
										个人中心
									</a>
								</li>
								<li>
									<a href="settled">
										专家入驻
									</a>
								</li>
								<li>
									<a href="pro_sign">
										专家登陆
									</a>
								</li>
								<li>
									<a href="pro_grxx">
										专家个人中心
									</a>
								</li>
								
							</ul>
						</div>						
						<div class="shopcar-btn clearfix fl">
							<a href="shopping.html" class="box-s">
								购物车（0）
							</a>
						</div>
					
					</div>	
				</div>
			</div>
			<div class="bottom clearfix">
				<div class="logo clearfix">
					<a href="index.html"></a>
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
					<li><a href="artist">艺术家</a></li>
					<li><a href="wyjm">我要寄卖</a></li>
				</ul>
			</div>
		</div>
		<!--navbar end-->
		
		<!--banner star-->
		<div class="banner">		
			<div class="bd">
				<ul>
					<li style="background:url(img/banner.jpg) #194982 center 0 no-repeat;"><a target="_blank" href="#"></a></li>
				</ul>
			</div>
		</div>
		<!--banner end-->
		
		<!--specail star-->
		<div class="specail clearfix">
			<div class="top clearfix">
				<div class="recom-tit clearfix">
					<p class="engtit ta-center">
						SPECIAL CENTER
					</p>
					<div class="middle clearfix">
						<span class="line"></span>
						<span class="wenzi">专场中心</span>
						<span class="line"></span>
					</div>
					<p class="fu-tit">
						好作品无需多说 你会由心的看清它的诉说
					</p>
				</div>
			</div>
<!-- script--------------------------------------------------------------------------------------------------- -->
<!-- 页面开始加载--------------------------------------------------------------------------------------------------- -->
<script type="text/javascript">
$(function()
		{
	$.getParentListByPage();
		});
$.getParentListByPage=function(e)
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
		{url:"getParentList",
		 Type:"post",  
		 data:{
			 "page":page,
			 "rows":5,
			
		 },
		 success:function(data)
		 { 
			 
				 var jsondata = eval('('+data+')');
				
				 $("#firstPage").attr("value",jsondata.pageinfo.firstPage);
				 $("#nexPage").attr("value",jsondata.pageinfo.nextPage);
				 $("#lastPage").attr("value",jsondata.pageinfo.lastPage);
				 $("#prePage").attr("value",jsondata.pageinfo.prePage);
				
				 for(var j=0;j<=9;j++){
					 $("#let"+j).hide();
					 
				 }
				 
				 for(var i=0;i<jsondata.pageinfo.list.length;i++)
					 {
					    
						
						$("#imgsrc"+(i+1+0)).attr("src",jsondata.pageinfo.list[i].imgaddress);
						$("#name"+(i+1+0)).html(jsondata.pageinfo.list[i].pname+"系列专场");
						$("#special"+(i+1+0)).val(jsondata.pageinfo.list[i].id);

				
					 }
		 },error:function()
		 {
			 alert("error");
		 }
			
		});
	}
</script>



<script type="text/javascript">
$.jump=function(data,jumptopageno)
{ 
	$.showCatImag(data,jumptopageno-1);
	}
</script>
<script type="text/javascript">
$.enterSpecial=function(e)
{ 
     window.location.href ="gotoSpecialDet?pid="+e.val();
         
	}
</script>
<!-- 第一个-------------------------------------------------------------------------------------------------- -->
			<div class="content clearfix box-s">
				<div class="list clearfix fl box-s transition">
					<div class="tu clearfix fl">
						<img src="upload\z\yd1.jpg"/ id="imgsrc1">
						<span></span>
					</div>
					<div class="right clearfix fr box-s">
						<div class="bt clearfix" id="name1">
							玉雕系列专场
						</div>
						
						<a href="#" onclick="$.enterSpecial($(this));" class="jinru ra3 transition" value="1" id="special1">
							进入专场>
						</a>
					</div>
				</div>
<!-- 第二个------------------------------------------------- -->
				<div class="list clearfix fl box-s transition">
					<div class="tu clearfix fl">
						<img src="upload\z\shxh.jpg" id="imgsrc2"/>
						<span></span>
					</div>
					<div class="right clearfix fr box-s">
						<div class="bt clearfix" id="name2">
							方框梅兰竹菊系列专场
						</div>
						
						<a href="#" onclick="$.enterSpecial($(this));" class="jinru ra3 transition" value="2" id="special2">
							进入专场>
						</a>
					</div>
				</div>
<!-- 第三个-------------------------------------------------------------------------------- -->				
				<div class="list clearfix fl box-s transition">
					<div class="tu clearfix fl">
						<img src="upload\z\zb.jpg" id="imgsrc3"/>
						<span></span>
					</div>
					<div class="right clearfix fr box-s">
						<div class="bt clearfix" id="name3">
							方框梅兰竹菊系列专场
						</div>
						
						<a href="#" onclick="$.enterSpecial($(this));" class="jinru ra3 transition" value="3" id="special3">
							进入专场>
						</a>
					</div>
				</div>
<!-- 第四个--------------------------------------------------------------------------------------------- -->				
				<div class="list clearfix fl box-s transition">
					<div class="tu clearfix fl">
						<img src="upload\z\zb.jpg" id="imgsrc4"/>
						<span></span>
					</div>
					<div class="right clearfix fr box-s">
						<div class="bt clearfix" id="name4">
							方框梅兰竹菊系列专场
						</div>
												<a href="#" onclick="$.enterSpecial($(this));" class="jinru ra3 transition" value="3" id="special3">
							进入专场>
						</a>
					</div>
				</div>
<!-- 第五个--------------------------------------------------------------------------------------------- -->					
				<div class="list clearfix fl box-s transition">
					<div class="tu clearfix fl">
						<img src="upload\z\cqzs.jpg" id="imgsrc5"/>
						<span></span>
					</div>
					<div class="right clearfix fr box-s">
						<div class="bt clearfix" id="name5" >
							方框梅兰竹菊系列专场
						</div>
						
						<a hhref="#" onclick="$.enterSpecial($(this));" class="jinru ra3 transition" value="5" id="special5">
							进入专场>
						</a>
					</div>
				</div>				
			</div>
<!-- 开始分页--------------------------------------------------------------------------------------------- -->				
			<div class="pages clearfix" >
				<div class="tab-pages">
		               <p id="pid"></p>
						<a id="prePage" href="#" value="" class="tab-prev tab-btn" onclick="$.getParentListByPage($(this));">上一页</a>
						<a id="firstPage" href="#" value="" class="page-btn " onclick="$.getParentListByPage($(this));">第一页</a>
						<a id="lastPage" href="#" value="" class="page-btn" onclick="$.getParentListByPage($(this));">最后一页</a>
						<a id="nexPage" href="#" value="" class="tab-next tab-btn" onclick="$.getParentListByPage($(this));">下一页</a>
						<span class="ml10">到第</span>
						<input type="text" name="" id="jid" value=""  size="1"/>
						<span>页</span>
						<input type="submit" name="" id="" value="确定" onclick="$.getParentListByPage($(this));"/>
					</div>
			</div>
		</div>
		<!--specail end-->
		
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