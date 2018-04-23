<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
	<form id="userEditForm" class="itemForm" method="post">
		<input type="hidden" name="id"/>
	    <table cellpadding="5">
	          <tr>
	            <td>用户ID:</td>
	            <td><input class="easyui-textbox" type="text" name="uid" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>用户姓名:</td>
	            <td><input class="easyui-textbox" type="text" name="uname" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>身份证号:</td>
	            <td><input class="easyui-textbox" name="uidentification" data-options="required:true" style="width: 280px;" ></input></td>
	        </tr>
	        <tr>
	            <td>密码:</td>
	            <td><input class="easyui-numberbox" type="text" name="upassword" data-options="required:true" style="width: 280px;" />
	            
	            </td>
	        </tr>
	        <tr>
	            <td>电话:</td>
	            <td><input class="easyui-numberbox" type="text" name="tel" data-options="min:1,max:99999999,precision:0,required:true" /></td>
	        </tr>
	 
	    </table>
	    <input type="hidden" name="itemParams"/>
	    <input type="hidden" name="itemParamId"/>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
	</div>
</div>
<script type="text/javascript">
	var itemEditEditor ;
	$(function(){
		//实例化编辑器
		itemEditEditor = TAOTAO.createEditor("#userEditForm [name=desc]");
		
	});
	
	function submitForm(){
		if(!$('#userEditForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		//userEditEditor.sync();
		$.post("restuserupdate",$("#userEditForm").serialize(), function(data){
			if(data == 1){
				$.messager.alert('提示','修改商品成功!','info',function(){
					$("#itemEditWindow").window('close');
					$("#userList").datagrid("reload");
				});
			}
		});
	}
</script>
