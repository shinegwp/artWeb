<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta name="renderer" content="webkit|ie-comp|ie-stand">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta charset='utf-8'>
		<meta http-equiv="Cache-Control" content="no-siteapp" />
		<title>个人中心</title>
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
		<script src="js/laydate/laydate.js"></script>
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
							<a href="shopping.html" class="box-s">
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
var data;
//页面初始化
$(function()
		{
	
	
	$.reShow();
	
	
	
		});
		
//保存修改
$.saveUpdate=function()
{   	var skill="";
$("input[name='check']:checkbox:checked").each(function(index)
		{
	if(index==$("input[name='check']:checkbox:checked").length-1)
		{
		skill+=$(this).val();
		}
	else{
		skill+=$(this).val()+"、";
	}
	
		})
		
	 $.ajax({
		  url: "restproupdate",
		  type:"post",
		  async:true,
		  data:{
			  "pid":$.cookie("pid"),
			  "pname":$("#uname").attr("value"),
			  "birthday":$("#birthday").attr("value"),
			  "sex":$('input:radio[name=sex]:checked').val(),
	          "tel":$("#tel").attr("value"),  
	          "email":$("#email").attr("value"),
	          "university":$("#university").attr("value"),
	          "broLocation":$("#broLocation").attr("value"),
	          "nowLocation":$("#nowLocation").attr("value"),
	          "experience":$("#experience").attr("value"),
	          "skill":skill
		  },success:function(data)
		  {alert("s")
			  $.reShow();
		  },
		  error:function()
		  {
			  alert("error");
		  }
		  
		});
	  
	}
//回显
  $.reShow=function()
  {
  $.ajax({
		  url: "getprofessorByPid",
		  async:false,
		  data:{
			  pid:$.cookie("pid")
		  },
		  success: function(data)
		  {   
		  //回显
		  var jsondata = eval('('+data+')');//把Object对象转换城TaoTaoResult
		 // alert(JSON.stringify(jsondata.data.qq));
		  $("#uname").attr("value",jsondata.data.pname);
		  $("#birthday").attr("value",jsondata.msg);
		   $("#uname").attr("value",jsondata.data.pname);
		   $("#tel").attr("value",jsondata.data.tel);
		   $("#email").attr("value",jsondata.data.email);
		   $("#university").attr("value",jsondata.data.university);
		   $("#broLocation").attr("value",jsondata.data.broLocation);
		   $("#nowLocation").attr("value",jsondata.data.nowLocation);
		   $("#experience").attr("value",jsondata.data.experience);
		   
		   var s = jsondata.data.skill.split("、");
			 
			 for(var i=0;i<s.length;i++)
				 {
				 $("input[name='check']").each(function(index)
							{if($(this).val()==s[i])
								{
								$(this).attr("checked",true);
								}
			
						
							})
				 }
			 $("#thumburlShow").attr("src",jsondata.data.img);
		  },
		  error:function()
		  {
			  alert("getSessionError");
		  }
		  
		});

	 
  }
  function setImg(obj){//用于进行图片上传，返回地址
		
      var f=$(obj).val();
      if(f == null || f ==undefined || f == ''){
          return false;
      }
      if(!/\.(?:png|jpg|bmp|gif|PNG|JPG|BMP|GIF)$/.test(f))
      {
          alertLayel("类型必须是图片(.png|jpg|bmp|gif|PNG|JPG|BMP|GIF)");
          $(obj).val('');
          return false;
      }
      var data = new FormData();
      $.each($(obj)[0].files,function(i,file){
          data.append('file', file);
      });
      $.ajax({
          type: "POST",
          url: "uploadImg",
          data: data,
          cache: false,
          contentType: false,    //不可缺
          processData: false,    //不可缺
          dataType:"json",
          async:false,
          success: function(suc) {
          	//var s = eval('('+suc+')');
          	imgsrc =suc.msg;
              if(suc.status==0){
              	    
              	  
                      $("#thumbUrl").val(suc.msg);//将地址存储好
                      $("#thumburlShow").attr("src",suc.msg);//显示图片                                                              
                  }else{
                  alertLayel("上传失败");
                  $("#url").val("");
                  $(obj).val('');
              }
          },
          error: function(XMLHttpRequest, textStatus, errorThrown) {
              alertLayel("上传失败，请检查网络后重试");
              $("#url").val("");
              $(obj).val('');
          }
      });
     
  }
</script>

		<!--Main-wrap-->
		<div class="main-wrap graybg clearfix">
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
					<div class="dark-tit line-bot clearfix">
						<h3 class="fl fs26">个人信息</h3>
					</div>
					<div class="user-info mt50 clearfix">
						<form action="">
							<div class="fl base-info">
								<ul>
									<li>
										<label class="fl l-option" >姓名：</label><input id="uname" type="text" class="fl ml10" placeholder="" value="">
									</li>
									
									<li>
										<label class="fl l-option" >生日：</label><input id="birthday" type="text"  onClick="laydate()" class="fl ml10" placeholder="" >
									</li>
									
									<li>
										<label class="fl l-option">电话：</label><input id="tel" type="text" class="fl ml10" placeholder="">
									</li>
								
									<li>
										<label class="fl l-option">邮箱：</label><input id="email" type="text" class="fl ml10" placeholder="">
									</li>
									<li class="kuan">
										<p class="bt fl">毕业院校：</p>
										<input required="required" type="text" class="fl" name="" id="university" value="">
									</li>
									<li class="kuan">
										<p class="bt fl">出生地：</p>
										<input required="required" type="text" class="fl" name="" id="broLocation" value="">
									</li>
									<li class="kuan">
										<p class="bt fl">现居地：</p>
										<input required="required" type="text" class="fl" name="" id="nowLocation" value="">
									</li>
									<li class="kuan" id="skill">
										<p class="bt fl">类型：</p>
										
										<div class="fl clearfix xuanze">
											<input type="checkbox" name="check" id="check" value="玉雕" class="fl"/>
											<span class="fl">玉雕 </span>
										</div>
										<div class="fl clearfix xuanze">
											<input type="checkbox" name="check" id="check" value="书画西画" class="fl"/>
											<span class="fl">书画西画</span>
										</div>
										<div class="fl clearfix xuanze">
											<input type="checkbox" name="check" id="check" value="珠宝" class="fl"/>
											<span class="fl">珠宝</span>
										</div>
										<div class="fl clearfix xuanze">
											<input type="checkbox" name="check" id="check" value="国石奇石" class="fl"/>
											<span class="fl">国石奇石</span>
										</div>
										<div class="fl clearfix xuanze">
											<input type="checkbox" name="check" id="check" value="瓷器紫砂" class="fl"/>
											<span class="fl">瓷器紫砂</span>
										</div>
										<div class="fl clearfix xuanze">
											<input type="checkbox" name="check" id="check" value="木艺" class="fl"/>
											<span class="fl"> 木艺</span>
										</div>
										<div class="fl clearfix xuanze">
											<input type="checkbox" name="check" id="check" value="文玩收藏" class="fl"/>
											<span class="fl">文玩收藏</span>
										</div>
										<div class="fl clearfix xuanze">
											<input type="checkbox" name="check" id="check" value="金银铜器" class="fl"/>
											<span class="fl">金银铜器</span>
										</div>
										<div class="fl clearfix xuanze">
											<input type="checkbox" name="check" id="check" value="邮币" class="fl"/>
											<span class="fl">邮币</span>
										</div>
										<div class="fl clearfix xuanze">
											<input type="checkbox" name="check" id="check" value="传统手工艺" class="fl"/>
											<span class="fl">传统手工艺</span>
										</div>
										<div class="fl clearfix xuanze">
											<input type="checkbox" name="check" id="check" value="其他" class="fl"/>
											<span class="fl">其他</span>
										</div>
									</li>
									<li class="but-li pl10"><input type="button" class="green-but radius3 fs16 ml50" value="保存修改" onclick="$.saveUpdate();"></li>
								</ul>
							</div>
							<div class="fr user-photo pr50 mr10">
								   <li class="kuan" id="img">
										<p class="bt fl">更换头像：</p>
										
											<div class="row">
											<span><img id="thumburlShow" src="img/tu.png" width="120" height="120"/></span>
                                              
                                                   <input type="hidden" name="img"  id="thumbUrl"/>
                                                 <input required="required" type="file" name="logoFile" id="logoFile" onchange="setImg(this);">
                                             
                                          </div>
								
										
									</li>
									<li></li>
									<li></li>
									<li></li>
									<li class="kuan">
										<p class="bt fl">个人简介：</p>
										<textarea name="" rows="10" cols="" class="box-s" id="experience"></textarea>
									</li>
							</div>
						</form>

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