Date.prototype.format = function(format){ 
    var o =  { 
    "M+" : this.getMonth()+1, //month 
    "d+" : this.getDate(), //day 
    "h+" : this.getHours(), //hour 
    "m+" : this.getMinutes(), //minute 
    "s+" : this.getSeconds(), //second 
    "q+" : Math.floor((this.getMonth()+3)/3), //quarter 
    "S" : this.getMilliseconds() //millisecond 
    };
    if(/(y+)/.test(format)){ 
    	format = format.replace(RegExp.$1, (this.getFullYear()+"").substr(4 - RegExp.$1.length)); 
    }
    for(var k in o)  { 
	    if(new RegExp("("+ k +")").test(format)){ 
	    	format = format.replace(RegExp.$1, RegExp.$1.length==1 ? o[k] : ("00"+ o[k]).substr((""+ o[k]).length)); 
	    } 
    } 
    return format; 
};

var TT = TAOTAO = {
	// 编辑器参数
	kingEditorParams : {
		//指定上传文件参数名称
		filePostName  : "uploadFile",
		//指定上传文件请求的url。
		uploadJson : 'picupload',
		//上传类型，分别为image、flash、media、file
		dir : "image"
	},
	// 格式化时间
	formatDateTime : function(val,row){
		var now = new Date(val);
    	return now.format("yyyy-MM-dd hh:mm:ss");
	},
	// 格式化连接
	formatUrl : function(val,row){
		if(val){
			return "<a href='"+val+"' target='_blank'>查看</a>";			
		}
		return "";
	},
	// 格式化价格
	formatPrice : function(val,row){
		return (val/1000).toFixed(2);
	},
	// 格式化商品的状态
	formatItemStatus : function formatStatus(val,row){
        if (val == 1){
            return '正常';
        } else if(val == 0){
        	return '<span style="color:red;">下架</span>';
        } else {
        	return '未知';
        }
    },
    
    init : function(data){
 
    	// 初始化图片上传组件
    	
    	this.initPicUpload(data);
    	// 初始化选择类目组件
    	this.initItemCat(data);
    },
    // 初始化图片上传组件
    initPicUpload : function(data){
    	$(".picFileUpload").each(function(i,e){		
    		var _ele = $(e);
    		_ele.siblings("div.pics").remove();
    		_ele.after('\
    			<div class="pics">\
        			<ul></ul>\
        		</div>');
    
    		// 回显图片
        	if(data && data.pics){
               
        		var imgs = data.pics.split(",");
        		for(var i in imgs){
        			
        			if($.trim(imgs[i]).length > 0){
        				
        				_ele.siblings(".pics").find("ul").append("<li><a href='"+imgs[i]+"' target='_blank'><img src='"+imgs[i]+"' width='80' height='50' /></a></li>");
        			}
        		}
        	}
        	//给“上传图片按钮”绑定click事件
        	$(e).click(function(){

        		var form = $(this).parentsUntil("form").parent("form");
        		//打开图片上传窗口
        		KindEditor.editor(TT.kingEditorParams).loadPlugin('multiimage',function(){
        			
        			var editor = this;
        			editor.plugin.multiImageDialog({
						clickFn : function(urlList) {
							
							var imgArray = [];
							KindEditor.each(urlList, function(i, data) {
							
								imgArray.push(data.url);
								form.find(".pics ul").append("<li><a href='"+data.url+"' target='_blank'><img src='"+data.url+"' width='80' height='50' /></a></li>");
							});
							
							form.find("[name=image]").val(imgArray.join(","));
							editor.hideDialog();
						}
					});
        		});
        	});
    	});
    },
    
    // 初始化选择类目组件
    initItemCat : function(data){
         
    	$(".selectItemCat").each(function(i,e){
    		var _ele = $(e);
    		if(data && data.cid){
    			_ele.after("<span style='margin-left:10px;'>"+data.cid+"</span>");
    		}else{
    			_ele.after("<span style='margin-left:10px;'></span>");
    		}
    		_ele.unbind('click').click(function(){
    			$("<div>").css({padding:"5px"}).html("<ul>")
    			.window({
    				width:'500',
    			    height:"450",
    			    modal:true,
    			    closed:true,
    			    iconCls:'icon-save',
    			    title:'选择类目',
    			    onOpen : function(){
    			    	var _win = this;
    			    	$("ul",_win).tree({
    			    		url:'itemcatlist',
    			    		animate:true,
    			    		onClick : function(node){
    			    			if($(this).tree("isLeaf",node.target)){
    			    				// 填写到cid中
    			    				_ele.parent().find("[name=cid]").val(node.id);
    			    				_ele.next().text(node.text).attr("cid",node.id);
    			    				$(_win).window('close');
    			    				if(data && data.fun){
    			    					data.fun.call(this,node);
    			    				}
    			    			}
    			    		}
    			    	});
    			    },
    			    onClose : function(){
    			    	$(this).window("destroy");
    			    }
    			}).window('open');
    		});
    	});
    },
    
    createEditor : function(select){
    	return KindEditor.create(select, TT.kingEditorParams);
    },
    
    /**
     * 创建一个窗口，关闭窗口后销毁该窗口对象。<br/>
     * 
     * 默认：<br/>
     * width : 80% <br/>
     * height : 80% <br/>
     * title : (空字符串) <br/>
     * 
     * 参数：<br/>
     * width : <br/>
     * height : <br/>
     * title : <br/>
     * url : 必填参数 <br/>
     * onLoad : function 加载完窗口内容后执行<br/>
     * 
     * 
     */
    createWindow : function(params){
    	$("<div>").css({padding:"5px"}).window({
    		width : params.width?params.width:"80%",
    		height : params.height?params.height:"80%",
    		modal:true,
    		title : params.title?params.title:" ",
    		href : params.url,
		    onClose : function(){
		    	$(this).window("destroy");
		    },
		    onLoad : function(){
		    	if(params.onLoad){
		    		params.onLoad.call(this);
		    	}
		    }
    	}).window("open");
    },
    
    closeCurrentWindow : function(){
    	$(".panel-tool-close").click();
    },
    
    changeItemParam : function(node,formId){
   
    	$.getJSON("itemparamqueryitemcatid" ,function(data){
			  if(data == 200 ){
				 $("#"+formId+" .params").show();
				 var paramData = JSON.parse(data.data.paramData);
				 var html = "<ul>";
				 for(var i in paramData){
					 var pd = paramData[i];
					 html+="<li><table>";
					 html+="<tr><td colspan=\"2\" class=\"group\">"+pd.group+"</td></tr>";
					 
					 for(var j in pd.params){
						 var ps = pd.params[j];
						 html+="<tr><td class=\"param\"><span>"+ps+"</span>: </td><td><input autocomplete=\"off\" type=\"text\"/></td></tr>";
					 }
					 
					 html+="</li></table>";
				 }
				 html+= "</ul>";
				 $("#"+formId+" .params td").eq(1).html(html);
			  }else{
				 $("#"+formId+" .params").hide();
				 $("#"+formId+" .params td").eq(1).empty();
			  }
		  });
    },
    getSelectionsIds : function (select){
    	var list = $(select);
    	var sels = list.datagrid("getSelections");
    	var ids = [];
    	for(var i in sels){
    		ids.push(sels[i].id);
    	}
    	ids = ids.join(",");
    	return ids;
    },
    
    /**
     * 初始化单图片上传组件 <br/>
     * 选择器为：.onePicUpload <br/>
     * 上传完成后会设置input内容以及在input后面追加<img> 
     */
    initOnePicUpload : function(){
    	$(".onePicUpload").click(function(){
			var _self = $(this);
			KindEditor.editor(TT.kingEditorParams).loadPlugin('image', function() {
				this.plugin.imageDialog({
					showRemote : false,
					clickFn : function(url, title, width, height, border, align) {
						
						var input = _self.siblings("input");
						input.parent().find("img").remove();
						input.val(url);
						input.after("<a href='"+url+"' target='_blank'><img src='"+url+"' width='80' height='50'/></a>");
						this.hideDialog();
					}
				});
			});
		});
    }
};
/*
商城用商品展示放大镜效果
*/
jQuery.ljsGlasses = {
  pcGlasses:function(_obj){
		var _box = $("#"+_obj.boxid);
		var _sum = $("#"+_obj.sumid);
		var _last,_next;
		var _imgarr = _box.find("img");
		var _length = _imgarr.length;
		var _index = 0;
		var _arr = new Array();
		_sum.append("<p style='position:absolute;left:0;top:0; z-index:999'></p>");
		var _sumbox = _sum.find("p");
		
		for(var i=0;i<_length;i++){
			_arr[i] = new Array();
			_arr[i][0] = _imgarr.eq(i).attr("src");
			_arr[i][1] = _imgarr.eq(i).attr("width");
			_arr[i][2] = _imgarr.eq(i).attr("height");
			var _scale = _arr[i][1]/_arr[i][2];
			if(_scale == 1){
				_arr[i][3] = _obj.boxw;//width
				_arr[i][4] = _obj.boxh;//height
				_arr[i][5] = 0;//top
				_arr[i][6] = 0;//left
				_arr[i][7] = _obj.boxw/2;
				_arr[i][8] = _obj.boxw*2;//width
				_arr[i][9] = _obj.boxh*2;//height
				_sumbox.append("<span><img src='"+_imgarr.eq(i).attr("src")+"' width='"+_obj.sumw+"' height='"+_obj.sumh+"' /></span>");
				}
			if(_scale > 1){
				_arr[i][3] = _obj.boxw;//width
				_arr[i][4] = _obj.boxw/_scale;
				_arr[i][5] = (_obj.boxh-_arr[i][4])/2;
				_arr[i][6] = 0;//left
				_arr[i][7] = _arr[i][4]/2;
				_arr[i][8] = _obj.boxh*2*_scale;//width
				_arr[i][9] = _obj.boxh*2;//height
				var _place = _obj.sumh - (_obj.sumw/_scale);
				_place = _place/2;
				_sumbox.append("<span><img src='"+_imgarr.eq(i).attr("src")+"' width='"+_obj.sumw+"' style='top:"+_place+"px;' /></span>");
				}
			if(_scale < 1){
				_arr[i][3] = _obj.boxh*_scale;//width
				_arr[i][4] = _obj.boxh;//height
				_arr[i][5] = 0;//top
				_arr[i][6] = (_obj.boxw-_arr[i][3])/2;
				_arr[i][7] = _arr[i][3]/2;
				_arr[i][8] = _obj.boxw*2;//width
				_arr[i][9] = _obj.boxw*2/_scale;
				var _place = _obj.sumw - (_obj.sumh*_scale);
				_place = _place/2;
				_sumbox.append("<span><img src='"+_imgarr.eq(i).attr("src")+"' height='"+_obj.sumh+"' style='left:"+_place+"px;' /></span>");
				}
		}
		_imgarr.remove();
		
		_sum.append("<div style='clear:both;width:100%;'></div>");
		var _sumarr = _sum.find("span");
		var _sumimg = _sum.find("img");
		_sumarr.eq(_index).addClass(_obj.sumsel);
		var _border = _obj.sumborder*2 + _obj.sumh;
		var _sumwidth = (_border+_obj.sumi)*_obj.sums;
		var _sumboxwidth = (_border+_obj.sumi)*_length;
		_sum.css({
			"overflow":"hidden",
			"height":_border+"px",
			"width":_sumwidth+"px",
			"position":"relative",
			"z-index":"999"
			});
		_sumbox.css({
			"width":_sumboxwidth+"px"
			});
		_sumarr.css({
			"float":"left",
			"margin-left":_obj.sumi+"px",
			"width":_obj.sumw+"px",
			"height":_obj.sumh+"px",
			"overflow":"hidden",
			"position":"relative",
			"z-index":"999"
			});
		_sumimg.css({
			"max-width":"100%",
			"max-height":"100%",
			"position":"relative",
			"z-index":"999",
			"text-align":"center"
			});
		
		_box.append("<div style='position:relative; z-index:999'><b style='display:block;'><img style='display:block;' src='' /></b><span style='position:absolute;left:0;top:0;display:none;z-index:5;'></span></div><p style='position:absolute;overflow:hidden;top:0;display:none;'><img style='max-width:none;max-height:none;position:relative;left:0;top:0;' src='' /></p>");
		var _glass = _box.find("span");
		var _boximg = _box.find("b img");
		var _imgout = _box.find("div");
		var _showbox = _box.find("p");
		var _showimg = _box.find("p img");

		_box.css({
			"width":_obj.boxw+"px",
			"height":_obj.boxh+"px",
			"position":"relative",
			"z-index":"999"
			});
		var _showboxleft = _obj.boxw + 10;
		_showbox.css({
			"width":_obj.boxw+"px",
			"height":_obj.boxh+"px",
			"left":_showboxleft+"px"
			});
		
		var imgPlaces = function(){
			_showimg.attr("src",_arr[_index][0]);
			_boximg.attr("src",_arr[_index][0]);
			_boximg.css({
			    "width":_arr[_index][3]+"px",
			    "height":_arr[_index][4]+"px"
			});
			_imgout.css({
				"width":_arr[_index][3]+"px",
			    "height":_arr[_index][4]+"px",
			    "top":_arr[_index][5]+"px",
			    "left":_arr[_index][6]+"px",
			    "position":"relative"
			});
			_glass.css({
			    "width":_arr[_index][7]+"px",
			    "height":_arr[_index][7]+"px"
			});
			_showimg.css({
				"width":_arr[_index][8]+"px",
			    "height":_arr[_index][9]+"px"
			});
			
		};
		imgPlaces();
		
		_imgout.mousemove(function(e){
			var _gl_w = _glass.width()/2;
			var _maxX = _imgout.width() - _gl_w;
			var _maxY = _imgout.height() - _gl_w;
			var _moveX = 0,_moveY = 0;
			var _nowX = e.pageX - _imgout.offset().left;
		    var _nowY = e.pageY - _imgout.offset().top;
			var _moveX = _nowX-_gl_w,_moveY = _nowY-_gl_w;
			
			if(_nowX <= _gl_w){ _moveX = 0; }
			if(_nowX >= _maxX){ _moveX = _maxX-_gl_w; }
			if(_nowY <= _gl_w){ _moveY = 0;}
			if(_nowY >= _maxY){ _moveY = _maxY-_gl_w;}
			_glass.css({"left":_moveX+"px","top":_moveY+"px"});

			var _imgX = -_moveX*_showbox.width()/_glass.width();
			var _imgY = -_moveY*_showbox.width()/_glass.width();
			_showimg.css({"left":_imgX+"px","top":_imgY+"px"});
	
		});//mouse END
		
		_imgout.mouseenter(function(){
			_glass.css("display","block");
			_showbox.css("display","block");
			});
		_imgout.mouseleave(function(){
			_glass.css("display","none");
			_showbox.css("display","none");
			});
		
		//列表部分
		var _nextbtn = $("#"+_obj.nextid);
		var _lastbtn = $("#"+_obj.lastid);
		var _moveindex = 0;//索引移动
		
		var _sumListMove = function(){
			var _leftmove = -_moveindex*(_border+_obj.sumi);
			if(_sumbox.is(":animated")){_sumbox.stop(true,true);}
			_sumbox.animate({left:_leftmove+"px"},300);
			_sumarr.eq(_index).addClass(_obj.sumsel).siblings().removeClass(_obj.sumsel);
			imgPlaces();
		};//fun END
		
		if(_length <= _obj.sums){
			var _place = (_obj.sums-_length)*_border/2;
			_sumbox.css("left",_place+"px");
			_nextbtn.click(function(){
				_index++;
				if(_index >= _length){ _index=_length-1;}
				_sumarr.eq(_index).addClass(_obj.sumsel).siblings().removeClass(_obj.sumsel);
			    imgPlaces();
			});
			_lastbtn.click(function(){
				_index--;
				if(_index <= 0){ _index=0;}
				_sumarr.eq(_index).addClass(_obj.sumsel).siblings().removeClass(_obj.sumsel);
			    imgPlaces();
			});
		}else{
			var _maxNum = _length-_obj.sums;
			_nextbtn.click(function(){
			   _moveindex++;
			   if(_moveindex >= _maxNum){ _moveindex=_maxNum; }
			   if(_index <= _moveindex){ _index=_moveindex;}
			   _sumListMove();
		    });
			_lastbtn.click(function(){
				_moveindex--;
				if(_moveindex <= 0){ _moveindex=0;}
				if(_index >= _moveindex+_obj.sums){ _index=_moveindex+_obj.sums-1;}
				_sumListMove();
			});
		}//if END

		_sumarr.hover(function(){
			_index = $(this).index();
			_sumarr.eq(_index).addClass(_obj.sumsel).siblings().removeClass(_obj.sumsel);
			imgPlaces();
		});
	
}//pcGlasses END
}//ljsGlasses END