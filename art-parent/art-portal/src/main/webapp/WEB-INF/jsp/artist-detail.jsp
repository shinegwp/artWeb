<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta charset='utf-8'>
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<title>艺术家详情</title>
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
									<span class="fl">您好，请</span>
									<a href="sign" class="fl">登录</a>
								</li>
								<li>
									<span class="fl">您好，请</span>
									
								</li>
								<li>
									<a href="register">
										免费注册
									</a>
								</li>
								<li>
									<a href="settled">
										专家入驻
									</a>
								</li>
							</ul>
						</div>						
						<div class="shopcar-btn clearfix fl">
							<a href="shopping" class="box-s">
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
		<script type="text/javascript">
		var email;
		$(function()
				{	

//接收href的参数
			var searchstr = location.search;
			var pid  = searchstr.split("=")[1];
			$.getProfessorById(pid);
				});

//得到Professor		
		
		$.getProfessorById=function(id)
		{
			
			$.ajax({
				url:"getProfessorById",
				
				data:{
					"pid":id,
				
				},dataType:"json",
				success:function(data)
				{  alert(JSON.stringify(data.birthday));
				$("#position").html(data.pname);
				$("#pimg").attr("src",data.img);
				$("#unvir").html(data.university);
				$("#skill").html(data.skill);
				$("#broloc").html(data.broLocation);
				$("#nowloc").html(data.nowLocation);
			   $("#rujj").html(data.experience)
				$("#sname").html(data.pname);
			   $("#xx").attr("value",data.email);
			
				},
				error:function()
				{
					alert("error");
				}
			}
					);
		}
		 $.gotoxiexin=function(e)
         {  alert(e.val());
         	
         	
         	 window.location.href ="xiexin?email="+e.val();
         	}
		
		</script>
		<!--navbar star-->
		<div class="navbar clearfix">
			<div class="content clearfix">
				<ul>
					<li><a href="index">首页</a></li>
					<li><a href="special">专场</a></li>
					<li><a href="mall">商城</a></li>
					<li class="cur"><a href="artist">专家</a></li>
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
						您的位置：<a href="artist" >专家</a>&nbsp;&gt;&nbsp;<a id="position" >孙瑾晨</a>
					</div>					
				</div>
			</div>
			<!--sorts end-->
			
			<!--artist-detail star-->
			<div class="adetail clearfix">
				<div class="adetails clearfix box-s">
					<div class="top clearfix">
						<div class="left clearfix fl box-s">
							<div class="tu clearfix">
								<img src="upload/8.jpg" id="pimg"/>
								<span></span>
							</div>
							<div class="xia clearfix">
								<!--  <ul>
									<li class="box-s">
										<p>600</p>
										<span>访问量</span>
									</li>
									<li class="box-s">
										<p>100</p>
										<span>作品</span>
									</li>
									<li class="last box-s">
										<p>600</p>
										<span>粉丝</span>
									</li>
									
								</ul>
								-->
							</div>
						</div>
						<div class="right clearfix fr">
							<div class="shang clearfix">
								<span class="fl" id="sname">孙瑾晨</span>
								<a href="#" class="fr ra3 transition" onclick="$.gotoxiexin($(this))" id="xx">写信</a>
								<!--下面注释内容为已关注状态样式-->
								<!--<a href="#" class="fr ra3 transition cur">取消关注</a>-->
							</div>
							<div class="ctentheight clearfix" id="main2">	
								<!--  <span class="more-button">展开</span>-->
								<div class="zhong clearfix">
									<p>基本信息：</p>
									<ul>
										<li id="broloc">1962年出生于上海</li>
									
										<li id="unvir">南京师范大学美术系</li>
										<li id="skill">擅长文玩，瓷器鉴赏</li>
										<li id="nowloc">现生活、工作于上海及北京</li>
										<li id="bir"></li>
										
									</ul>
								</div>
								<div class="zhong clearfix">
									<p>人物简介：</p>
									 
								
									<ul id="rujj">
									    <li> 何志红，北京大学宝石鉴定中心资深鉴定师</li>
									   <li>北京大学宝石鉴定中心潘家园分部站长</li>
									   <li>国家注册珠宝玉石质量检验师CGC</li>
									   <li>国家注册珠宝玉石评估师CPVG</li>
									   <li>中国珠宝玉石首饰行业协会鉴定师GAC </li>
									    <li>国检珠宝培训中心鉴定师NGTC</li>
									   
										<!--  <li>2012金锋个展：“点石斋”丨天仁合艺艺术中心丨杭州</li>
										<li>2011“上海艺术博览会国际当代艺术展”丨上海展览中心展厅丨艺术通道丨上海</li>
										<li>2011“修辞”丨艺术通道丨北京</li>
										<li>2008“问题现场-金锋个案”丨上海证大现代艺术馆</li>
										<li>2007“金锋个展-骂艺术”丨比翼艺术中心丨上海</li>
										<li>2006“金锋个展”丨2577创艺大院丨上海</li>
										<li>2003“金锋作品展”丨汉雅轩丨香港</li>
										<li>2002“金锋个人作品展”丨莫斯科艺术中心丨莫斯科</li>
										-->
									</ul>
								</div>
								<div class="zhong clearfix zhonglast">
									<!--<p>群体展览：</p>
									<ul>
										<li>2012金锋个展：“点石斋”丨天仁合艺艺术中心丨杭州</li>
										<li>2011“上海艺术博览会国际当代艺术展”丨上海展览中心展厅丨艺术通道丨上海</li>
										<li>2011“修辞”丨艺术通道丨北京</li>
										<li>2008“问题现场-金锋个案”丨上海证大现代艺术馆</li>
										<li>2007“金锋个展-骂艺术”丨比翼艺术中心丨上海</li>
										<li>2006“金锋个展”丨2577创艺大院丨上海</li>
										<li>2003“金锋作品展”丨汉雅轩丨香港</li>
										<li>2002“金锋个人作品展”丨莫斯科艺术中心丨莫斯科</li>
										<li>2012金锋个展：“点石斋”丨天仁合艺艺术中心丨杭州</li>
										<li>2011“上海艺术博览会国际当代艺术展”丨上海展览中心展厅丨艺术通道丨上海</li>
										<li>2011“修辞”丨艺术通道丨北京</li>
										<li>2008“问题现场-金锋个案”丨上海证大现代艺术馆</li>
										<li>2007“金锋个展-骂艺术”丨比翼艺术中心丨上海</li>
										<li>2006“金锋个展”丨2577创艺大院丨上海</li>
										<li>2003“金锋作品展”丨汉雅轩丨香港</li>
										<li>2002“金锋个人作品展”丨莫斯科艺术中心丨莫斯科</li>
										<li>2012金锋个展：“点石斋”丨天仁合艺艺术中心丨杭州</li>
										<li>2011“上海艺术博览会国际当代艺术展”丨上海展览中心展厅丨艺术通道丨上海</li>
										<li>2011“修辞”丨艺术通道丨北京</li>
										<li>2008“问题现场-金锋个案”丨上海证大现代艺术馆</li>
										<li>2007“金锋个展-骂艺术”丨比翼艺术中心丨上海</li>
										<li>2006“金锋个展”丨2577创艺大院丨上海</li>
										<li>2003“金锋作品展”丨汉雅轩丨香港</li>
										<li>2002“金锋个人作品展”丨莫斯科艺术中心丨莫斯科</li>
									</ul>-->
								</div>
							</div>							
						</div>
					</div>
					<!--  <div class="bottom clearfix box-s">
						<div class="shang clearfix box-s">
							<span>相关作品</span>
						</div>
						<div class="xia clearfix">
							<div class="list clearfix box-s fl">
								<a href="pro_detail.html">
									<div class="main_img">
										<em></em>
										<img src="upload/9.jpg">
										<div class="show" title="梅花三弄梅花三弄">
											<span class="imgArea">
												<samp title="梅花三弄梅花三弄" class="over">梅花三弄梅花三弄</samp>
											</span>
										</div>
									</div>
								</a>
							</div>
							<div class="list clearfix box-s fl">
								<a href="pro_detail.html">
									<div class="main_img">
										<em></em>
										<img src="upload/9.jpg">
										<div class="show" title="梅花三弄梅花三弄">
											<span class="imgArea">
												<samp title="梅花三弄梅花三弄" class="over">梅花三弄梅花三弄</samp>
											</span>
										</div>
									</div>
								</a>
							</div>
							<div class="list clearfix box-s fl">
								<a href="pro_detail.html">
									<div class="main_img">
										<em></em>
										<img src="upload/9.jpg">
										<div class="show" title="梅花三弄梅花三弄">
											<span class="imgArea">
												<samp title="梅花三弄梅花三弄" class="over">梅花三弄梅花三弄梅花三弄梅花三弄</samp>
											</span>
										</div>
									</div>
								</a>
							</div>
							<div class="list clearfix box-s fl">
								<a href="pro_detail.html">
									<div class="main_img">
										<em></em>
										<img src="upload/9.jpg">
										<div class="show" title="梅花三弄梅花三弄">
											<span class="imgArea">
												<samp title="梅花三弄梅花三弄" class="over">梅花三弄梅花三弄</samp>
											</span>
										</div>
									</div>
								</a>
							</div>
							<div class="list clearfix box-s fl">
								<a href="pro_detail.html">
									<div class="main_img">
										<em></em>
										<img src="upload/9.jpg">
										<div class="show" title="梅花三弄梅花三弄">
											<span class="imgArea">
												<samp title="梅花三弄梅花三弄" class="over">梅花三弄梅花三弄</samp>
											</span>
										</div>
									</div>
								</a>
							</div>
							<div class="list clearfix box-s fl">
								<a href="pro_detail.html">
									<div class="main_img">
										<em></em>
										<img src="upload/9.jpg">
										<div class="show" title="梅花三弄梅花三弄">
											<span class="imgArea">
												<samp title="梅花三弄梅花三弄" class="over">梅花三弄梅花三弄</samp>
											</span>
										</div>
									</div>
								</a>
							</div>
							<div class="list clearfix box-s fl">
								<a href="pro_detail.html">
									<div class="main_img">
										<em></em>
										<img src="upload/9.jpg">
										<div class="show" title="梅花三弄梅花三弄">
											<span class="imgArea">
												<samp title="梅花三弄梅花三弄" class="over">梅花三弄梅花三弄</samp>
											</span>
										</div>
									</div>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>-->
			<!--artist-detail end-->
			
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
		$('.listed .list ul li,.listed .ywlist ul li').each(function() {
			$(this).click(function() {
				$(this).siblings("li").removeClass("cur");
				$(this).addClass("cur");
			});
		});	
	</script>
	<script type="text/javascript">
		$(document).ready(function(){
			var data = '0';
			$('.more-button').click(function(){
				
				if(data == 0){
					$('.ctentheight').height('auto');
					$('.more-button').html('折叠');
					data = 1;
					return false;
				}
				if(data == 1){
					$('.ctentheight').height('490px');
					$('.more-button').html('展开');
					data = 0;
					return false;
				}
				
		
			})
		})
		$('.more-button').click(function(){
			$(this).toggleClass('more-buttontwo')
		});
	</script>
	<script src="js/other.js" type="text/javascript" ></script>
</html>