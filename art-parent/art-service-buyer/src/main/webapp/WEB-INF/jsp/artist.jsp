<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta charset='utf-8'>
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<title>艺术家</title>
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
					<a href="index"></a>
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
					<li><a href="artist">专家</a></li>
					<li><a href="wyjm">我要寄卖</a></li>
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
						您的位置：专家
					</div>
					
				</div>
			</div>
			<!--sorts end-->
<script type="text/javascript">
$(function()
		{
	$.getProfeListByPage();
		});
$.getProfeListByPage=function(e)
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
		{url:"getProfessorlistByPage",
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
					    
						
						$("#artimg"+i).attr("src",jsondata.pageinfo.list[i].img);
						$("#tit"+i).html("专家:"+jsondata.pageinfo.list[i].pname);
						
						//设置ID值
						$("#art"+i).attr("value",jsondata.pageinfo.list[i].pid);
						 $("#let"+i).show();
				
					 }
		 },error:function()
		 {
			 alert("error");
		 }
			
		});
	}
	
	
	
	


	//查看详情
	$.enterSpecial=function(e)
	{ 
	     window.location.href ="artist-detail?pid="+e.val();
	         
		}

</script>			
			<!--artist star-->
			<div class="artist clearfix">
				<div class="content clearfix">
					<div class="artist-top clearfix">
						<span>全部艺术家</span>
					</div>
					<div class="artist-bottom clearfix">
<!--第一个艺术家-------------------------------------------------------------------------------- -->					
						<div class="list clearfix fl" id="let0">
							<div class="left clearfix fl box-s">
								<div class="tu clearfix">
									<img src="upload/7.jpg" id="artimg0"/>
									<span></span>
								</div>
							</div>
							<div class="right clearfix fl">
								<span class="tit" id="tit0">艺术家：孙瑾晨</span>
								
							</div>
							<a href="#" class="ck-btn ra3 transition" id="art0" onclick="$.enterSpecial($(this));" value="">
								查看详情>>
							</a>
						</div>
<!--第二个艺术家-------------------------------------------------------------------------------- -->							
						<div class="list clearfix fl" id="let1">
							<div class="left clearfix fl box-s">
								<div class="tu clearfix">
									<img src="upload/7.jpg" id="artimg1"/>
									<span></span>
								</div>
							</div>
							<div class="right clearfix fl">
								<span class="tit" id="tit1">艺术家：孙瑾晨</span>
								
							</div>
							<a href="#" class="ck-btn ra3 transition" id="art1" onclick="$.enterSpecial($(this));" value="">>
								查看详情>>
							</a>
						</div>
<!--第三个艺术家-------------------------------------------------------------------------------- -->							
						<div class="list clearfix fl" id="let2">
							<div class="left clearfix fl box-s">
								<div class="tu clearfix">
									<img src="upload/7.jpg" id="artimg2"/>
									<span></span>
								</div>
							</div>
							<div class="right clearfix fl">
								<span class="tit" id="tit2">艺术家：孙瑾晨</span>
								
							</div>
							<a href="#" onclick="$.enterSpecial($(this));" id="art2" class="ck-btn ra3 transition" value="">>
								查看详情>>
							</a>
						</div>
<!--第四个艺术家-------------------------------------------------------------------------------- -->							
						<div class="list clearfix fl" id="let3">
							<div class="left clearfix fl box-s">
								<div class="tu clearfix">
									<img src="upload/7.jpg" id="artimg3"/>
									<span></span>
								</div>
							</div>
							<div class="right clearfix fl">
								<span class="tit" id="tit3">艺术家：孙瑾晨</span>
								
							</div>
							<a href="#" onclick="$.enterSpecial($(this));" id="art3" class="ck-btn ra3 transition" value="">>
								查看详情>>
							</a>
						</div>
<!--第五个艺术家-------------------------------------------------------------------------------- -->							
						<div class="list clearfix fl" id="let4">
							<div class="left clearfix fl box-s">
								<div class="tu clearfix">
									<img src="upload/7.jpg" id="artimg4"/>
									<span></span>
								</div>
							</div>
							<div class="right clearfix fl">
								<span class="tit" id="tit4">艺术家：孙瑾晨</span>
								
							</div>
							<a href="#" onclick="$.enterSpecial($(this));" id="art4" class="ck-btn ra3 transition" value="">
								查看详情>>
							</a>
						</div>
					</div>
<!--分页-------------------------------------------------------------------------------- -->						
					<div class="pages clearfix" >
				<div class="tab-pages">
		               <p id="pid"></p>
						<a id="prePage" href="#" value="" class="tab-prev tab-btn" onclick="$.getProfeListByPage($(this));">上一页</a>
						<a id="firstPage" href="#" value="" class="page-btn " onclick="$.getProfeListByPage($(this));">第一页</a>
						<a id="lastPage" href="#" value="" class="page-btn" onclick="$.getProfeListByPage($(this));">最后一页</a>
						<a id="nexPage" href="#" value="" class="tab-next tab-btn" onclick="$.getProfeListByPage($(this));">下一页</a>
						<span class="ml10">到第</span>
						<input type="text" name="" id="jid" value=""  size="1"/>
						<span>页</span>
						<input type="submit" name="" id="" value="确定" onclick="$.getProfeListByPage($(this));"/>
					</div>
			</div>
				</div>
			</div>
			<!--artist end-->
			
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
			window.onload=
			function(){
			    var oDiv=document.getElementById("float");
			    var H=0;
			    var Y=oDiv;
			    while(Y){H+=Y.offsetTop;Y=Y.offsetParent};
			    window.onscroll=function()
			    {
			        var s=document.body.scrollTop||document.documentElement.scrollTop;
			        if(s>H){oDiv.className="ywlist ywlisttwo";}
			        else{oDiv.className="ywlist";}    
			    };
			}		
		</script>

	<script src="js/other.js" type="text/javascript" ></script>
</html>