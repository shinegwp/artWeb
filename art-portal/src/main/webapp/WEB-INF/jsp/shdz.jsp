<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta charset='utf-8'>
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<title>收货地址</title>
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
		<script type="text/javascript" src="http://www.ijquery.cn/js/jquery.js"></script>  
        <script type="text/javascript" src="http://www.ijquery.cn/js/cityselect/jquery.cityselect.js"></script> 
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
								
								
							</ul>
						</div>
						<div class="shopcar-btn clearfix fl">
							<a href="shopping.html" class="box-s">
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
				<div class="search clearfix fr ra5">
					<input type="text" class="fl" name="" id="" value="" placeholder="请输入您要搜索的内容" />
					<input type="button" name="" id="" value="搜索" class="fl box-s" />
				</div>
			</div>
		</div>
		<!--header end-->
<script type="text/javascript">  
var list;
var uid;
var id;
//初始化
$(function()
		{
	$.displayUserName();
		});
$.displayUserName = function()//如果登陆了展示退出和欢迎
{
	var _ticket = $.cookie("TT_TOKEN");
	
	$
			.ajax({
				url : "http://sso.jiangyou-art.com/userLogin/token/"
						+ _ticket,

				dataType : "jsonp",
				type : "GET",
				success : function(data) {
					if (data.status == 200) {
						var uname = data.data.uname;
						uid = data.data.uid;
						list = $.getShippingAddress(uid);
						for(var i = 0; i <=2; i++){ //tr_len是要控制的tr个数 
							 $("#tr"+i).hide(); 
							 }
						for(var j=0;j<list.length;j++)
							{
							$("#tr"+j).show();
							}
						 $("#city").citySelect({  
						        
						      nodata: "none"  
						  }); 
						var html = "<li ><span class='f1'>欢迎</span><a href='grxx' class='f1'>"
								+ uname
								+ "</a>进入商场</li><li><a href='#' onclick='$.outLogin()'>退出</a></li>"
						$("#displayName").html(html);
					} else {
						alert("登陆已过期，请重新登录");
						window.location.href = "http://sso.jiangyou-art.com/page/login?redirect=http://www.jiangyou-art.com/shdz";
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
			  window.location.href = "http://www.jiangyou-art.com";
			  }
		  else
			  {
			  alert("操作有误");
			  }
		  },
		  error:function()
		  {
			  window.location.href = "http://www.jiangyou-art.com";	                  
		  }
		  
		});
}
		
//删除
$.deleteShippAddress=function(e)
{ var sid=e.attr("value");
$.ajax({
	url:"deleteShippAddressById",
	type:"post",
	dataType:"json",
	data:{
		"id":sid
	},
	success:function()
	{
		alert("删除成功");
		location.reload();
	},error:function()
	{
		alert("删除操作有误！");
	}
});
	}
	
//设置地址信息
$.setCitySelect=function(address)
{ 
  $("#city").citySelect({  
      prov: address.split('/')[0],  
      city:address.split('/')[1],  
      dist:address.split('/')[2],  
      nodata: "none"  
  });  
	}
//确认保存
$.saveShippingAddress=function(e)
{var id = e.attr("saveid");
if(list.length>=3)
	{
	alert("个人收货地址最多三个");
	}
else{
$.ajax({
		
		url:"save",
		type:"post",
		dataType:"json",
		data:{
			"id":id,
			"uid":uid,
			"address":$("#prov").val()+"/"+$("#cit").val()+"/"+$("#dist").val(),
			"sname":$("#sname").attr("value"),
			"stel":$("#stel").attr("value"),
			"addressDetail":$("#addressDetail").attr("value"),
			"code":$("#code").attr("value"),
		},
		success:function(i)
		{   //var result =i;
			alert("修改成功！");
			
			
		},error:function()
		{
			alert("保存操作有误！");
		}
	});

		location.reload();

}
	
	}
//$.updata()
$.updata=function(e)
{var id=e.attr("value");
 $.ajax({
		url:"getShippAddressById",
		type:"post",
		data:{
			"id":id,
		},
		dataType:"json",
		success:function(json)
		{ 
			$("#sname").attr("value",json.sname);
			$("#stel").attr("value",json.stel);
			$("#addressDetail").attr("value",json.addressDetail);
			$("#code").attr("value",json.code);
			$.setCitySelect(json.address);
			$("#confirm").attr("saveid",json.id);
		
		
		},error:function(XMLHttpRequest,textStatus,errorThrown)
		{
			alert("操作有误！");
			alert(XMLHttpRequest.status);
			alert(XMLHttpRequest.readyState);
			alert(textStatus);
		},
		complete:function(XMLHttpRequest,textStatus)
		{
			this;
		}
		});

	}


//通过id得到收货地址
$.getShippingAddress=function(uid)
{var salist;
$.ajax({
	  url: "getShippingAddress",
	  data:{
		  "uid":uid
	  },
	  async:false,
	  success: function(ShippingAddress)
	  {
	  //回显
	  var jsondata = eval('('+ShippingAddress+')');//把Object对象转换城TaoTaoResult;
	  for(var i=0;i<jsondata.length;i++)
		  {
		  $("#bj"+i).attr("value",jsondata[i].id);
		  $("#sc"+i).attr("value",jsondata[i].id);
		  $("#tdname"+i).html(jsondata[i].sname);
		  $("#address"+i).html(jsondata[i].addressDetail);
		  $("#stel"+i).html(jsondata[i].stel);
	
		  }
	  salist=jsondata;
	  },
	  error:function()
	  {
		  alert("getShippingAddressError");
	  }
	  
	});

return salist;
	}

$.reset=function()
{
	if(list.length>=3)
	{
	alert("最多三个收货地址！");
	}
	else
		{
		$("#sname").attr("value","");
		$("#stel").attr("value","");
		$("#addressDetail").attr("value","");
		$("#code").attr("value","");
		$.setCitySelect("");
		$("#confirm").attr("saveid","");
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
		<div class="main-wrap graybg">
			<div class="wrapper pt40 pb40 clearfix">
				<div class="fl slide-nav white-box">
					<ul>
						<li >
							<a href="grxx" class="db fs16">个人信息</a>
						</li>
						<li>
							<a href="wddd" class="db fs16">我的订单</a>
						</li>
						
						<li class="on">
							<a href="shdz" class="db fs16">收货地址</a>
						</li>
						<li>
							<a href="wdsc" class="db fs16">我的收藏</a>
						</li>
						
						<li>
							<a href="xgmm" class="db fs16">修改密码</a>
						</li>
						<li>
							<a href="zhye" class="db fs16">账户余额</a>
						</li>
						<li>
							<a href="zxcz" class="db fs16">在线充值</a>
						</li>
						<li>
							<a href="lljl" class="db fs16">退货记录</a>
						</li>
						<li>
							<a href="zixun" class="db fs16">我的咨询</a>
						</li>
						
					</ul>
				</div>
				<div class="fr slide-show white-box">
					<div class="dark-tit line-bot">
						<h3 class="fs26">收货地址</h3></div>
					<div class="add-address fs14 mt20 mb30">
						<form action="" id="shippingaddress">
							<p class="address-tit mb20 clearfix"><i class="fl iconfont tc">&#xe611;</i><a href="#" onclick="$.reset();"><span class="fl fs16 bold orange ml5">新增收货地址</span></a></p>
							<p class="mb20 clearfix">
								<label class="fl"><em class="red">*</em>收件人：</label>
								<input type="text" placeholder="姓名" value="" class="fl" id="sname">
								<label class="fl"><em class="red">*</em>收件人：</label>
								<input type="text" placeholder="手机" value="" class="fl" id="stel">
							</p>
							
							
						<p id="city" class="mb20 clearfix" align="Left">
					        <label class="fl"><em class="red">*</em>地址：</label>			
                            <select class="prov" id="prov"></select>    
                            <select class="city" id="cit" disabled="disabled"></select>   
                            <select class="dist" id="dist" disabled="disabled"></select>   
					   </p>
							<p class="mb20 clearfix">
								 <label class="fl"><em class="red">*</em>详细地址：</label>		
								<textarea name="" cols="30" rows="10" placeholder="请输入您的详细地址" class="fl" id="addressDetail" value=""></textarea>
							</p>
							<p class="mb20 clearfix">
				
				
								<label class="fl">邮政编码：</label>
								<input type="text" placeholder="邮政编码" value="" class="fl" id="code">
							</p>
							<p class="mb20 clearfix">
								<label class="fl">&nbsp;</label>
								<input type="button" value="确认" onclick="$.saveShippingAddress($(this));" id="confirm" saveid="" class="fl orange-but radius3 fs16">
								<input type="button" value="取消" onclick="" class="fl reset-but radius3 fs16 ml10">
							</p>
						</form>
					</div>
					<div class="saved-address">
						<p class="address-tit mb10 clearfix"><i class="fl iconfont tc">&#xe610;</i><span class="fl fs16 bold orange ml5">已保存收货地址</span></p>
						<table class="ye-table address-table" style="border:1px solid #eaeaea">
							<tr>
								<th width="10%">收货人</th>
								<th width="60%">收货地址</th>
								<th width="10%">电话</th>
								<th width="20%">操作</th>
							</tr>
							<tr id="tr0">
								<td id="tdname0">张先生</td>
								<td id="address0">安徽省合肥市蜀山区你猜猜我办公的地点是哪里</td>
								<td id="tel0">18056225225</td>
								<td>
									<a href="#"  class="pl10" id="sc0" onclick="$.deleteShippAddress($(this));"><i class="iconfont" >&#xe60b;</i><em class="orange">删除</em></a>
									<a href="#"  class="pl10" id="bj0" value="" onclick="$.updata($(this));"><i class="iconfont">&#xe60f;</i><em class="orange">编辑</em></a>
								</td>
							</tr>
							<tr id="tr1">
								<td id="tdname1">张先生</td>
								<td id="address1">安徽省合肥市蜀山区你猜猜我办公的地点是哪里</td>
								<td id="tel1">18056225225</td>
								<td>
									<a href="javascript:" class="pl10" id="sc1" onclick="$.deleteShippAddress($(this));"><i class="iconfont">&#xe60b;</i><em class="orange">删除</em></a>
									<a href="javascript:" class="pl10" id="bj1" value="" onclick="$.updata($(this));"><i class="iconfont">&#xe60f;</i><em class="orange">编辑</em></a>
								</td>
							</tr> 
							<tr id="tr2">
								<td id="tdname2">张先生</td>
								<td id="address2">安徽省合肥市蜀山区你猜猜我办公的地点是哪里</td>
								<td id="tel2">18056225225</td>
								<td>
									<a href="javascript:" class="pl10" id="sc2" onclick="$.deleteShippAddress($(this));"><i class="iconfont">&#xe60b;</i><em class="orange">删除</em></a>
									<a href="javascript:" class="pl10" id="bj2" value="" onclick="$.updata($(this));"><i class="iconfont">&#xe60f;</i><em class="orange">编辑</em></a>
								</td>
							</tr> 
						</table>
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

</html>