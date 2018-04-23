<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta charset='utf-8'>
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<title>站内信</title>
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
						公告：您好，欢迎登录北京椿龄文化发展有限公司
					</div>
					<div class="right clearfix fr">
						<div class="zuo clearfix fl">
							<ul class="clearfix fl">
								<li>
									<span class="fl">欢迎</span>
									<a href="grxx" class="fl">瑾晨0212</a>
									<span class="fl">进入商城</span>
								</li>
								<li>
									<a href="register">
										免费注册
									</a>
								</li>
								<li>
									<a href="settled">
										艺术家入驻
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
					<li>
						<a href="artist">艺术家</a>
					</li>
				</ul>
			</div>
		</div>
		<!--navbar end-->
<script type="text/javascript">
var pemail;

				$(function(){
					$.getPemailByPid();
					
					 $.getReciveLetterListByPage();
					
				})
				$.getPemailByPid=function()
				{
					$.ajax(
							{url:"getProfessorById",
							 Type:"post",
							 async:false,
							 data:{
								 
								 "pid":$.cookie("pid"),
								 
							 },
							 success:function(pro)
							 { 
							 pemail = pro.email;
							
									
							 },error:function()
							 {
								 alert("error");
							 }
								
							});
				
					
				}
				$.getReciveLetterListByPage=function(e)
				{ 
					alert(pemail);
					
					var page=1;
				
				   if(typeof(e)=="object")
					   {
					  page=e.val();
					   }
					   if(!$("#jid").attr("value")=="")
						   {
						   page=$("#jid").attr("value");
						   }
					   alert(page+","+$.cookie("pid"));
					$.ajax(
						{url:"getLetterList",
						 Type:"post",  
						 data:{
							 "page":page,
							 "rows":10,
							 "pid":$.cookie("pid"),
							 "UtoP":1,//查询User给Professor发的
							 "email":pemail,
							 "up":0  // 0 pemail 1 uemail
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
									 $("#title"+i).html(jsondata.pageinfo.list[i].title);
									 alert("id="+jsondata.pageinfo.list[i].id);
									 $("#title"+i).attr("value",jsondata.pageinfo.list[i].id);
									 $("#reciver"+i).html(jsondata.pageinfo.list[i].uemail);
									 $("#time"+i).html(jsondata.time[i]);
									  $("#let"+i).show();
									  
								
									 }
								
						 },error:function()
						 {
							 alert("error");
						 }
							
						});
					}
				$.getSentLetterListByPage=function(e)
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
					   alert(page+","+$.cookie("pid"));
					$.ajax(
						{url:"getLetterList",
						 Type:"post",  
						 data:{
							 "page":page,
							 "rows":10,
							 "UtoP":0,
							 "email":pemail,
							 "up":0
						 },
						 success:function(data)
						 { 
							alert(data);
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
									 $("#title"+i).html(jsondata.pageinfo.list[i].title);
									 alert("pid="+jsondata.pageinfo.list[i].id);
									 $("#title"+i).attr("value",jsondata.pageinfo.list[i].id);
									 $("#reciver"+i).html(jsondata.pageinfo.list[i].uemail);
									 $("#time"+i).html(jsondata.time[i]);
									  $("#let"+i).show();
								
									 }
						 },error:function()
						 {
							 alert("error");
						 }
							
						});
					}
				$.xiexin=function()
				{
					location.href="pro_xiexin?e="+pemail;
				}
				$.znxdetail=function(e)
				{
					var id = e.val();
					alert(e.val);
					location.href="pro_znxdetail?idd="+e.val();
				}
				</script>
		<!--Main-wrap-->
		<div class="main-wrap graybg">
			<div class="wrapper pt40 pb40 clearfix">
				<div class="fl slide-nav white-box">
					<ul>
						<li class="on">
							<a href="grxx" class="db fs16">个人信息</a>
						</li>
						
						
						<li>
							<a href="pro_xgmm" class="db fs16">修改密码</a>
						</li>

						<li>
							<a href="pro_znx" class="db fs16">站内信</a>
						</li>
					</ul>
				</div>
				
				<div class="fr slide-show white-box">
					<div class="dark-tit clearfix">
						<h3 class="fl fs26">站内信</h3>
						<p class="fr slide-t-nav">
						    
							<a href="#" class="on fs14 radius3" onclick="$.getReciveLetterListByPage();">收件</a>
							<a href="#" class="fs14 radius3" onclick="$.xiexin()">写信</a>
							<a href="#" class="fs14 radius3" onclick="$.getSentLetterListByPage();">发件</a>
						</p>
					</div>
					<table class="table_1">
						<tr>
							<th width="10%"><input type="checkbox" name="" id="" value="" /></th>
							<th width="50%">标题</th>
							<th width="15%" id="pe">发/收件人</th>
							<th width="15%">时间</th>
							<th width="10%">操作</th>
						</tr>
						
						<tr id="let0">
							<td align="center"><input type="checkbox" name="" id="" value="" /></td>
							<td>
								<a href="#" class="znxtit" id="title0" value="" onclick="$.znxdetail($(this));">
									这里是标题内容
								</a>
							</td>
							<td align="center" id="reciver0">
								13035059860
							</td>
							<td align="center" id="time0">
								2016-12-23 10:57:08
							</td>
							<td align="center">
								<a href="#" class="znxshanchu">
									<i class="iconfont fs20"></i>
									删除
								</a>
							</td>
						</tr>
						
						<tr id="let1">
							<td align="center"><input type="checkbox" name="" id="" value="" /></td>
							<td>
								<a href="#" class="znxtit" id="title1" value="" onclick="$.znxdetail($(this));">
									这里是标题内容
								</a>
							</td>
							<td align="center" id="reciver1">
								13035059860
							</td>
							<td align="center" id="time1">
								2016-12-23 10:57:08
							</td>
							<td align="center">
								<a href="#" class="znxshanchu">
									<i class="iconfont fs20"></i>
									删除
								</a>
							</td>
						</tr>
						<tr id="let2">
							<td align="center"><input type="checkbox" name="" id="" value="" /></td>
							<td>
								<a href="#" class="znxtit" id="title2" value="" onclick="$.znxdetail($(this));">
									这里是标题内容
								</a>
							</td>
							<td align="center" id="reciver2">
								13035059860
							</td>
							<td align="center" id="time2">
								2016-12-23 10:57:08
							</td>
							<td align="center">
								<a href="#" class="znxshanchu">
									<i class="iconfont fs20"></i>
									删除
								</a>
							</td>
						</tr>
						<tr id="let3"> 
							<td align="center"><input type="checkbox" name="" id="" value="" /></td>
							<td>
								<a href="#" class="znxtit" id="title3" value="" onclick="$.znxdetail($(this));">
									这里是标题内容
								</a>
							</td>
							<td align="center" id="reciver3">
								13035059860
							</td>
							<td align="center" id="time3">
								2016-12-23 10:57:08
							</td>
							<td align="center">
								<a href="#" class="znxshanchu">
									<i class="iconfont fs20"></i>
									删除
								</a>
							</td>
						</tr>
						<tr id="let4">
							<td align="center"><input type="checkbox" name="" id="" value="" /></td>
							<td>
								<a href="#" class="znxtit" id="title4" value="" onclick="$.znxdetail($(this));">
									这里是标题内容
								</a>
							</td>
							<td align="center" id="reciver4">
								13035059860
							</td>
							<td align="center" id="time4">
								2016-12-23 10:57:08
							</td>
							<td align="center">
								<a href="#" class="znxshanchu">
									<i class="iconfont fs20"></i>
									删除
								</a>
							</td>
						</tr>
						<tr id="let5">
							<td align="center"><input type="checkbox" name="" id="" value="" /></td>
							<td>
								<a href="#" class="znxtit" id="title5" value="" onclick="$.znxdetail($(this));">
									这里是标题内容
								</a>
							</td>
							<td align="center" id="reciver5">
								13035059860
							</td>
							<td align="center" id="time5">
								2016-12-23 10:57:08
							</td>
							<td align="center">
								<a href="#" class="znxshanchu">
									<i class="iconfont fs20"></i>
									删除
								</a>
							</td>
						</tr>
						<tr id="let6">
							<td align="center"><input type="checkbox" name="" id="" value="" /></td>
							<td>
								<a href="#" class="znxtit" id="title6" value="" onclick="$.znxdetail($(this));">
									这里是标题内容
								</a>
							</td>
							<td align="center" id="reciver6">
								13035059860
							</td>
							<td align="center" id="time6">
								2016-12-23 10:57:08
							</td>
							<td align="center">
								<a href="#" class="znxshanchu">
									<i class="iconfont fs20"></i>
									删除
								</a>
							</td>
						</tr>
						<tr id="let7">
							<td align="center"><input type="checkbox" name="" id="" value="" /></td>
							<td>
								<a href="#" class="znxtit" id="title7" value="" onclick="$.znxdetail($(this));">
									这里是标题内容
								</a>
							</td>
							<td align="center" id="reciver7">
								13035059860
							</td>
							<td align="center" id="time7">
								2016-12-23 10:57:08
							</td>
							<td align="center">
								<a href="#" class="znxshanchu">
									<i class="iconfont fs20"></i>
									删除
								</a>
							</td>
						</tr>
						<tr id="let8">
							<td align="center"><input type="checkbox" name="" id="" value="" /></td>
							<td>
								<a href="#" class="znxtit" id="title8" value="" onclick="$.znxdetail($(this));">
									这里是标题内容
								</a>
							</td>
							<td align="center" id="reciver8">
								13035059860
							</td>
							<td align="center" id="time8">
								2016-12-23 10:57:08
							</td>
							<td align="center">
								<a href="#" class="znxshanchu">
									<i class="iconfont fs20"></i>
									删除
								</a>
							</td>
						</tr>
						<tr id="let9">
							<td align="center"><input type="checkbox" name="" id="" value="" /></td>
							<td>
								<a href="#" class="znxtit" id="title9" value="" onclick="$.znxdetail($(this));">
									这里是标题内容
								</a>
							</td>
							<td align="center" id="reciver9">
								13035059860
							</td>
							<td align="center" id="time9">
								2016-12-23 10:57:08
							</td>
							<td align="center">
								<a href="#" class="znxshanchu">
									<i class="iconfont fs20"></i>
									删除
								</a>
							</td>
						</tr>
					</table>
					
					<div class="tab-pages">
		               <p id="pid"></p>
						<a id="prePage" href="#" value="" class="tab-prev tab-btn" onclick="$.getReciveLetterListByPage($(this));">上一页</a>
						<a id="firstPage" href="#" value="" class="page-btn " onclick="$.getReciveLetterListByPage($(this));">第一页</a>
						<a id="lastPage" href="#" value="" class="page-btn" onclick="$.getReciveLetterListByPage($(this));">最后一页</a>
						<a id="nexPage" href="#" value="" class="tab-next tab-btn" onclick="$.getReciveLetterListByPage($(this));">下一页</a>
						<span class="ml10">到第</span>
						<input type="text" name="" id="jid" value=""  size="1"/>
						<span>页</span>
						<input type="submit" name="" id="" value="确定" onclick="$.getReciveLetterListByPage($(this));"/>
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