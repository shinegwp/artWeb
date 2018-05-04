<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		<script type="text/javascript" src="js/jquery.cookie.js"></script>
	</head>

	<body>
	<!-- ------------------------------------------script--------------------------------------------- -->
	                     <script type="text/javascript">
	                     var SearchResult;
	                     $(function()//页面开始加载的时候初始化
								 { 
	                    	  SearchResult = ${SearchResult};
	                    	 for(var i=0;i<SearchResult.itemList.length;i++)
         					 {
         					     $("#imgAddress"+(i+1+0)).attr("src",SearchResult.itemList[i].imgAddress)
         						 $("#p"+(i+1+0)).html(SearchResult.itemList[i].title);
         					     $("#price"+(i+1+0)).html(SearchResult.itemList[i].price);
         					     $("#id"+(i+1+0)).attr("value",SearchResult.itemList[i].id);
         					     $("#divA"+(i+1+0)).show();
         					     $("#sc"+(i+1+0)).attr("value",SearchResult.itemList[i].id);
         					    $("#gwc"+(i+1+0)).attr("value",SearchResult.itemList[i].id);
         					 }
								 });
	                    
	                 	
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
								
								<li>
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
							<a href="#" class="box-s">
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
					<li ><a href="index">首页</a></li>
					<li><a href="special">专场</a></li>
					<li class="cur"><a  href="mall" >商城</a></li>
					
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
								<li onclick="$.zonghe()" >综合排序</li>
								<li onclick="$.getSale();" class="xliang ">销量</li>
								<li onclick="$.getNew();" class="xpin">新品</li>
							</ul>
						</div>
					</div>
				
					<div class="bottom clearfix" id="bodyBox">
<!-- ------------------第一个画框---------------------------------------------------- -->
                     <c:set  var="currentPage"  value="${SearchResult.curPage}"></c:set>
                      <c:set  var="lastPage"  value="${SearchResult.pageCount}"></c:set>
                     <c:set  var="prePage"  value="${currentPage-1>0?currentPage-1:1}"></c:set>
                     <c:set  var="nextPage"  value="${currentPage+1>lastPage?lastPage:currentPage+1}"></c:set>
                     <c:forEach items="${slist}" var="item">
              
						<div class="list clearfix transition" id="divA1">
							<div class="tu clearfix">
								<img src="${item.imgAddress}"  id="imgAddress1"/>
								<span></span>
								
								<div class="ycang clearfix">
									<samp class="opa8"></samp>
									<div class="nr clearfix">
										<!--注意：当下方li中添加class名为cur的时候为选中的时候样式-->
										<ul>
											<li class="box-s transition" id="sc1" onclick="$.addCollection($(this))" value="">收藏</li>
											<li class="box-s transition" id="gwc1" onclick="$.addItem($(this))" value="">购物车</li>
										</ul>
									</div>								
								</div>
							</div>
							<div class="xia clearfix box-s" id="divB1">
								<p class="bt over" id="p1">
							    ${item.title}
								</p>
								<div class="price clearfix">
									<span class="fl" id="price1">${item.price}</span>
									<a href="getDetail?id=${item.id}" class="goumai fr ra3 transition">立即购买</a>
								</div>
							</div>
						</div>
						</c:forEach>
	
				</div>
				
				<!-- ----------------------------------------------------分页-------------------------------------- -->
				 
					<div class="tab-pages">
		               <p id="pid"></p>                                                              
						<a id="prePage" href="search?q=${SearchResult.queryString}&page=${prePage}"  value="" class="tab-prev tab-btn"  >上一页</a>
						<a id="firstPage" href="search?q=${SearchResult.queryString}&page=1" value="" class="page-btn " >第一页</a>
						<a id="lastPage" href="search?q=${SearchResult.queryString}&page=${lastPage}" value="" class="page-btn" >最后一页</a>
						<a id="nexPage" href="search?q=${SearchResult.queryString}&page=${nextPage}" value="" class="tab-next tab-btn" >下一页</a>
						<span class="ml10">到第</span>
						<input type="text" name="" id="jid" value=""  size="1"/>
						<span>页</span>
						<input type="submit" name="" id="" value="确定" onclick="$.getItemListByPage($(this));"/>
						<br>
						<span class="ml10">共${lastPage}页</span>
						<span class="ml10">第${currentPage}页</span>
						
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
		$.gotoprodetail=function(e)
        {  
        	 window.location.href ="getDetail?id="+e.val();
        }
	</script>
	<script src="js/other.js" type="text/javascript" ></script>
</html>