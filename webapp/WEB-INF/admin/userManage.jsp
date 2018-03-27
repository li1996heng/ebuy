<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.3.3/themes/icon.css">
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/jquery.easyui.min.js"></script>
<script type="text/javascript" src="jquery-easyui-1.3.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript">
	$(function(){
		
	});
	
	//全局请求路径
	var url;
	
	//弹出新增用户窗口
	function openAddUser(){
		//弹出窗口
		$('#dlg').dialog('open').dialog('setTitle','新增用户');
		$('#fm').form('clear');
		url = 'saveUser.action';
		
	}
	
	//弹出修改用户信息窗口
	function editUser(){

		//获取到修改的用户数据信息
		var row = $('#dg').datagrid('getSelected');
		var selectRows = $('#dg').datagrid('getSelections');
		if(selectRows.length != 1){
			$.messager.alert('提示信息','请选择一条需要修改的记录','warning');
			return;
		}
		if (row){
			$('#dlg').dialog('open').dialog('setTitle','修改用户信息');
			//
			//$('#fm').form('load',row);
			//给表单中对应的信息 设值
			$("#trueName").val(row.name);
			$("#account").val(row.account);
			$("#password").val(row.password);
			$("#sex").combobox("setValue",row.sex);
			$("#birthday").datebox("setValue",row.birthday);
			$("#dentityCode").val(row.dentityCode);
			$("#email").val(row.email);
			$("#mobile").val(row.mobile);
			$("#address").val(row.address);
			
			
			url = 'admin_editUser.action?ID='+row.ID;
		}
	}
	
	//删除
	function removeUser(){
		
		var row = $('#dg').datagrid('getSelected');
		//
		var selectRows = $('#dg').datagrid('getSelections');
		if(selectRows.length == 0){
			$.messager.alert('提示信息','请至少选择一条需要删除的记录','warning');
			return ;
		}
		//批量删除
		var ids = "";
		
		for(var i=0;i<selectRows.length;i++){
			ids += selectRows[i].ID+",";
		}
		
		if (row){
			$.messager.confirm('确认信息','您确定要删除该用户吗？',function(r){
				if (r){
					
					$.post(
						'admin_deleteUser',//请求路径
						{"ID":ids},  //参数
						
						function(data){
							
							var result = data.result;
							if (result){
								$('#dg').datagrid('reload');	// reload the user data
								$.messager.alert('提示信息','删除成功！','info');
							} else {
								$.messager.show({	// show error message
									title: 'Error',
									msg: '删除失败'
								});
							}
					   },
					   'json');
				}
			});
		}
	}
	
	//保存
	function saveUser(){
		$('#fm').form('submit',{
			url: url,//请求路径
			onSubmit: function(){//提交请求 之前验证数据合法性
				return $(this).form('validate');
			},
			
			success: function(data){//回调函数
				//var result = eval('('+result+')');
				var result = $.parseJSON(data);
				var msg = result.msg;
				//{"result":true}
	
				if (result.result){
					//关闭新增窗口
					$('#dlg').dialog('close');		// close the dialog
					//加载数据
					$('#dg').datagrid('reload');	// reload the user data
					$.messager.alert('提示信息',msg,'info');
				} else {
					$.messager.show({
						title: 'Error',
						msg: msg
					});
				}
			}
		});
	}
	
</script>
</head>
<body>
	<!-- 列表 -->
	<table id="dg" title="用户管理" class="easyui-datagrid" fitColumns="true" 
    	pagination="true" rownumbers="true" url="admin_getUserList.action" fit="true" toolbar="#tb">
	    <thead>
	    	<tr>
	    		<th field="cb" checkbox="true" align="center"></th>
	    		<th field="ID" width="50" align="center">ID</th>
	    		<th field="account" width="100" align="center">账号</th>
	    		<th field="name" width="100" align="center" >姓名</th>
	    		<th field="sex" width="50" align="center" >性别</th>
	    		<th field="birthday" width="150" align="center" >出生日期</th>
	    		<th field="dentityCode" width="100" align="center" >身份证</th>
	    		<th field="email" width="100" align="center">邮箱</th>
	    		<th field="mobile" width="100" align="center">手机号</th>
	    		<th field="address" width="200" align="center">地址</th>
	    		<th field="isDelete" width="200" align="center">是否被删除(0:删除 1:未删除)</th>
	    	</tr>
	    </thead>
	</table>
	
	<!-- 功能按钮 如新增用户... -->
	<div id="tb">
		<a href="javascript:openAddUser()" class="easyui-linkbutton" data-options="plain:true, iconCls:'icon-add'">增加</a>
		<span style="float:none;" class="datagrid-btn-separator"></span>
		<a href="#" class="easyui-linkbutton" data-options="plain:true, iconCls:'icon-edit'" onclick="editUser()">编辑</a>
		<span style="float:none;" class="datagrid-btn-separator"></span>
		<a href="#" class="easyui-linkbutton" data-options="plain:true, iconCls:'icon-remove'" onclick="removeUser()">删除</a>
		<span style="float:none;" class="datagrid-btn-separator"></span>
		 
		 &nbsp;&nbsp;用户名：&nbsp;<input class="easyui-textbox" type="text" id="s_userName" size="20" onkeydown="if(event.keyCode == 13) searchUser()" />
		<a href="javascript:searchUser()" id="btn_searchUser" class="easyui-linkbutton" data-options="plain:true, iconCls:'icon-search'">查询</a>
	
	</div>
	<!-- 新增、修改用户表单 -->
	<div id="dlg" class="easyui-dialog" style="width: 570px; height: 300px;" data-options="closed:true, buttons:'#dlg_buttons'">
		<form id="fm" method="post">
			<table cellspacing="8">
				<tr>
					<td>真实姓名：</td>
					<td>
						<input type="text" id="trueName" name="user.name"  style="width: 150px" class="easyui-validatebox" required="required" />
						<!-- <input type="hidden" id="ID" name="user.ID" /> -->
					</td>
					<td>&nbsp;</td>
					<td>用户名：</td>
					<td><input type="text" id="account" name="user.account"  style="width: 150px" class="easyui-validatebox" required="required" /></td>
				</tr>
				<tr>
					<td>密码：</td>
					<td><input type="password" id="password" name="user.password"  style="width: 150px" class="easyui-validatebox" required="required" /></td>
					<td>&nbsp;</td>
					<td>性别：</td>
					<td>
						<select id="sex" class="easyui-combobox" name="user.sex" style="width: 150px" data-options="panelHeight:40,editable:false">   
						    <option value="男">男</option>   
						    <option value="女">女</option>   
						</select>
					</td>
				</tr>
				<tr>
					<td>出生日期：</td>
					<td><input type="text" id="birthday" class="easyui-datebox" name="user.birthday"  style="width: 150px" editable="false" required="required" /></td>
					<td>&nbsp;</td>
					<td>身份证：</td>
					<td><input type="text" id="dentityCode" name="user.dentityCode"  style="width: 150px" class="easyui-validatebox" required="required" /></td>
				</tr>
				<tr>
					<td>邮件：</td>
					<td><input type="text" id="email" name="user.email"  style="width: 150px" class="easyui-validatebox" validType="email" required="required" /></td>
					<td>&nbsp;</td>
					<td>联系电话：</td>
					<td><input type="text" id="mobile" name="user.mobile"  style="width: 150px" class="easyui-validatebox" required="required" /></td>
				</tr>
				<tr>
					<td>收货地址：</td>
					<td colspan="4"><input type="text" id="address" name="user.address"  style="width: 396px" class="easyui-validatebox" required="required" /></td>
				</tr>
			</table>
		</form>
	</div>
	<!-- 保存 取消按钮 -->
	<div id="dlg_buttons">
		<a href="#" class="easyui-linkbutton" data-options="iconCls:'icon-ok'" onClick="saveUser()">保存</a>
		<a href="javascript:cancel()" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">关闭</a>
	</div>
</body>
</html>