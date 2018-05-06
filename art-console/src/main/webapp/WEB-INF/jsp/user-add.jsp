<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
	<form id="userAddForm" class="itemForm" method="post">
	    <table cellpadding="4">
	        <tr>
	            <td>用户姓名:</td>
	            <td><input class="easyui-textbox" type="text" name="uname" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	         <tr>
	            <td>用户身份证号:</td>
	            <td><input class="easyui-textbox" type="text" name="uidentification" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	         <tr>
	            <td>用户密码:</td>
	            <td><input class="easyui-textbox" type="text" name="upassword" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>用户电话:</td>
	            <td><input class="easyui-numberbox" type="text" name="tel"  data-options="required:true" style="width: 280px;" /></td>
	        </tr>

	    </table>
	    <input type="hidden" name="itemParams"/>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
	</div>
</div>
<script type="text/javascript">
	function submitForm(){
		//有效性验证
		if(!$('#userAddForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		$.post("usersaveback",$("#userAddForm").serialize(), function(data){
			if(data == 1){
				$.messager.alert('提示','新增用户成功!');
				$("#userList").datagrid("reload");
			}
		});
	}
	
	function clearForm(){
		$('#itemAddForm').form('reset');
		itemAddEditor.html('');
	}
</script>
