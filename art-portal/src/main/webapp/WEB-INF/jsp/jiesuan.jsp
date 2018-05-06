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
		<title>结算</title>
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
		<!-- 引入城市选择插件 -->
		
        <script type="text/javascript" src="js/path/PCASClass.js"></script>
			
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
	<script type="text/javascript">
	var uid;
	var umoney;
	var shoppingAddressid;
	
	$(function(){
		 $.displayUserName();

		new PCAS("province6","city6","area6");
		$(".check-inline,.check-box").click(function() {
			$(this).find("input").each(function(){
				shoppingAddressid=$(this).val();
                   });
			$(this).siblings().removeClass("check_on");
			if($(this).hasClass("check_on")) {
				$(this).removeClass("check_on");
			} else {
				$(this).addClass("check_on");
			}
		})
	});

	$.displayUserName=function()//如果登陆了展示退出和欢迎
	{  
		
		var _ticket = $.cookie("TT_TOKEN");
		$.ajax({
			url : "http://sso.jiangyou-art.com/userLogin/token/" + _ticket,
			
			dataType : "jsonp",
			type : "GET",
			success : function(data){
			    uid=data.data.uid;
				umoney=data.data.money;
				
				if(data.status == 200){
					var uname = data.data.uname;
			
					var html = "<li ><span class='f1'>欢迎</span><a href='grxx' class='f1'>"+uname+
					"</a>进入商场</li><li><a href='#' onclick='$.grxx()'>个人中心</a></li><li><a href='#' onclick='$.outLogin()'>退出</a></li>"
					$("#displayName").html(html);
				} else {
					alert("登陆已过期，请重新登录");
					window.location.href = "http://sso.jiangyou-art.com/page/login?redirect=http://www.jiangyou-art.com/cartShow";
				}
			}
		});
	}
	$.alertBox=function(e)
	{$("#selpro").find("option").eq(0).prop("selected",true);
			$("#mask").stop().show();
		
	}
	$.closeMask=function()
	{
			$("#mask").stop().hide();
		
	}

	$.getShoppingAddressByUid=function()//根据用户id的到地址
	{ 
		$.ajax({
			url:"getSAS",
			data:{
			 uid:user.uid
			},async:true,
			type:"post",
			dataType:"json",
			success:function(data)
			{  
				sa = data;
				$.showAddress(data);
			},error:function()
			{ alert("error");
			}
		});
	}
	$.showAddress=function(data)//显示地址信息
	{for(var i=0;i<3;i++)
		{
		$("#div"+i).hide();
		}
		for(var i=0;i<data.length;i++)
			{
			$("#sname"+i).html('<i class="iconfont fs24">&#xe60e;</i>'+data[i].sname);
			$("#hsname"+i).attr("value",data[i].sname);//给隐藏的姓名赋值
			$("#hte"+i).attr("value",data[i].stel);//给隐藏的tel赋值
			$("#stel"+i).html('<i class="iconfont fs24">&#xe60c;</i>'+data[i].stel);
			$("#addressDetail"+i).html(data[i].addressDetail);
			$("#bj"+i).attr("val",data[i].id);
			$("#hidco"+i).attr("value",data[i].code);
			$("#div"+i).show();
			}
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
				  window.location.href = "http://www.jiangyou-art.com/cartShow";
				  }
			  else
				  {
				  alert("操作有误");
				  }
			  },
			  error:function()
			  {
				  window.location.href = "http://www.jiangyou-art.com/cartShow";	                  
			  }
			  
			});
	 }
	$.saveUpdate=function()//修改收货地址
	{
	    $.ajax({
			url:"saveshoppingaddress",

			type:"post",
			data:{
				
				uid:uid,
				id:$("#mmid").attr("value"),
				sname: $("#msname").attr("value"),
				stel:$("#mstel").attr("value"),
			    addressDetail:$("#maddressDetail").attr("value"),
			    code: $("#mcode").attr("value"),
			    province :$("#selpro option:selected").text(),
			    city : $("#selcity option:selected").text(),
			    area : $("#selarea option:selected").text()
			 
			},
			dataType:"json",
			success:function(data)
			{
			
				alert("修改成功！");
				window.location.reload();
			
			},error:function()
			{ alert("error");
			}
		});
	}

	 $.grxx=function()//当点击个人中心时判断是否已登录
	 {  
		
		 window.location.href="grxx";
		 
	 }
	$.submitOrder=function()//提交订单   提交的是购物车里的
	{ 
	window.location.href ="creatOrderForm?sid="+shoppingAddressid+"&uid="+uid;
			
	}

	</script>	<!--header end-->

		<!--navbar star-->
		<div class="navbar clearfix">
			<div class="content clearfix">
				<ul>
					<li class="cur">
						<a href="index.html">首页</a>
					</li>
					<li>
						<a href="special.html">专场</a>
					</li>
					<li>
						<a href="mall.html">商城</a>
					</li>
				</ul>
			</div>
		</div>
		<!--navbar end-->

		<!--Main-wrap-->
		<div class="main-wrap graybg pt40 pb40">
			<div class="js-box wrapper white-box">
				<!--收货人信息-->
				<div class="consignee-info">
					<div class="title line-bot"><span class="fs18 pl20 ml40 darkgray">选择收货地址</span></div>
					   <div class="consignee-box clearfix" id="list">
					    
					       <c:forEach items="${slist}" var="address" varStatus="status">
					        
					        <div class="consignee-block check-box  radius5" id="textbox " >
					        <em></em>
							<p class="fs14 lh40 clearfix">
								<span class="fl darkgray" id="sname0" value="${address.sname}"><i class="iconfont fs24">&#xe60e;</i>${address.sname }</span>
								<input id="said" type="hidden" value="${address.id}">
								<a id = "alertbox" href="javascript:" class="fr green edit alertbox" onclick="$.alertBox($(this));" value='${address}'><i class="iconfont fs24 green ">&#xe60f;</i>编辑</a>
							</p>
							<input type="hidden" id="hid" value="${address.id}">
							<p class="fs14 darkgray lh40" id="stel0"><i class="iconfont fs24">&#xe60c;</i>${address.stel }
								</>
								<p class="fs14 darkgray lh30 clearfix">
									<i class="fl iconfont fs24">&#xe610;</i><span class="fl address" id="addressDetail0">${address.addressDetail }</span>
								</p>
					      </div>
					    
		<div id="mask">
			<div class="alert-box radius8">
				<h3 class="fs20">修改收货地址 <span class="close" onclick="$.closeMask()"></span></h3>
				<div class="address-form box-s" id="mid">
					<form action="" id="seriform">
					<p id="mmid" type="hidden" value="${address.id}" ></p>
					    <input type="hidden" value=>
						<p class="mb20 clearfix">
							<label class="fl">收货人：</label>
							<input id="msname" type="text" placeholder="姓名" value="${address.sname }" placeholder="姓名" class="fl ml5">
							<em class="fl red lh40 ml10">*</em>
						</p>
						<p class="mb20 clearfix">
							<label class="fl">手机：</label>
							<input id="mstel" type="text" placeholder="手机" value="${address.stel }" placeholder="手机" class="fl ml5">
							<em class="fl red lh40 ml10">*</em>
						</p>
					
						<p id="city" class="mb20 clearfix" align="Left">
					        <label class="fl"><em class="red">*</em>地址：</label>			
                           <select id="selpro"  name="province6" style="width:100px;" ></select>
                           <select  id="selcity" name="city6" style="width:100px;" ></select>
                           <select  id="selarea" name="area6" style="width:100px;" ></select>
		 
					   </p>
						<p class="mb20 clearfix">
							<label class="fl"><em class="red">*</em>详细地址：</label>
							<input id="maddressDetail" type="text" value="${address.addressDetail }" placeholder="详细地址" class="fl ml5">
							<em class="fl red lh40 ml10">*</em>
						</p>
						<p class="mb20 clearfix">
							<label class="fl">邮政编码：</label>
							<input id="mcode" type="text" placeholder="邮政编码" value="" class="fl ml5" value="${address.addressDetail}">
						</p>
						<p class="mb20 clearfix">
							<label class="fl"></label>
							<input type="button" value="保存" class="fl orange-but radius3 ml5" onclick="$.saveUpdate()">
							<input type="button" value="取消" class="fl gray-but radius3 ml10">
						</p>
					</form>
				</div>
			</div>
		</div>
					    </c:forEach>
					</div>
				</div>
				<!--/end-->

		   	          <div class="sale-info pt10 pb10 clearfix">
						<div class="fr total-amount mb30">
							
							<p class="mt10 fr">
								<a href="#" onclick="$.submitOrder()" class="fr orange-but fs20 radius3">支付</a>
							</p>
						</div>

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