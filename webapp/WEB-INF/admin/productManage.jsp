<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
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
		$("#bName").combobox({
			onSelect:function(data){
				//url  smallTypeCombobox
				$("#sName").combobox(
					"reload",'smallTypeCombobox.action?bigType.ID='+data.ID
				); 
				$("#sName").combobox("setValue","");
			}
			
		});
	});
	

	function searchProduct(){
		
		$('#dg').datagrid('reload',{
			"product.name":$("#productName").val()
		});
		
	}
	
	var url;
	//弹出新增窗口
	function openProductAddDialog(){
		//弹出窗口
		$('#dlg').dialog('open').dialog('setTitle','新增商品');
		$('#fm').form('clear');
		url = 'saveProduct.action';
	}
	
	//设置热卖
	function setProductHot(){
		var row = $('#dg').datagrid('getSelected');
		//
		var selectRows = $('#dg').datagrid('getSelections');
		if(selectRows.length == 0){
			$.messager.alert('提示信息','请至少选择一条商品','warning');
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
						'setProductHot.action',//请求路径
						{"ID":ids},  //参数
						
						function(data){
							
							var result = data.result;
							if (result){
								$('#dg').datagrid('reload');	// reload the user data
								$.messager.alert('提示信息','设置成功成功！','info');
							} else {
								$.messager.show({	// show error message
									title: 'Error',
									msg: '设置失败'
								});
							}
					   },
					   'json');
				}
			});
		}
	}
	
		
	
	//保存
	function saveProduct(){
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
					$.messager.alert('提示信息','操作成功','info');
				} else {
					$.messager.show({
						title: 'Error',
						msg: '操作失败'
					});
				}
			}
		});
	}

	function formatProPic(val,row){
		
		return "<img width=100 height=100 src='"+row.proPic+"' />";
		
	}
	
	function formatSmallTypeId(val,row){
		console.log(val);
		return row.smallType.ID;
	}
	
	function formatSmallTypeName(val,row){
		return row.smallType.name;
	}
	
	function formatBigTypeId(val,row){
		
		return row.bigType.ID;
	}
	
	function formatBigTypeName(val,row){
		
		return row.bigType.name
		
	}
	function formatHot(val,row){
		if(val == 1){
			return "是";
		}else{
			return "否";
		}
	}
	function formatSpecialPrice(val,row){
		if(val == 1){
			return "是";
		}else{
			return "否";
		}
	}
	
</script>
</head>
<body style="margin: 1px;">
<table id="dg" title="商品管理" class="easyui-datagrid" fitColumns="true" 
    pagination="true" rownumbers="true" url="getProductList.action" fit="true" toolbar="#tb">
    <thead>
    	<tr>
    		<th field="cb" checkbox="true" align="center"></th>
    		<th field="ID" width="50" align="center">编号</th>
    		<th field="proPic" width="150" align="center" formatter="formatProPic">商品图片</th>
    		<th field="name" width="150" align="center" >商品名称</th>
    		<th field="price" width="50" align="center" >价格</th>
    		<th field="stock" width="50" align="center" >库存</th>
    		<th field="smallType.ID" width="100" align="center" formatter="formatSmallTypeId" hidden="true">所属商品小类ID</th>
    		<th field="smallType.name" width="100" align="center" formatter="formatSmallTypeName">所属商品小类</th>
    		<th field="bigType.ID" width="100" align="center" formatter="formatBigTypeId" hidden="true">所属商品大类ID</th>
    		<th field="bigType.name" width="100" align="center" formatter="formatBigTypeName">所属商品大类</th>
    		<th field="hot" width="50" align="center"  formatter="formatHot">是否热卖</th>
    		<th field="hotTime" width="50" align="center"  hidden=true>热卖时间</th>
    		<th field="specialPrice" width="50" align="center"  formatter="formatSpecialPrice">是否特价</th>
    		<th field="specialPriceTime" width="50" align="center"  hidden=true>设置特价时间</th>
    		<th field="description" width="200" align="center" hidden=true>描述</th>
    	</tr>
    </thead>
    
</table>

<div id="tb">
	<div>
		<a href="javascript:openProductAddDialog()" class="easyui-linkbutton" iconCls="icon-add" plain="true">添加</a>
		<a href="javascript:openProductModifyDialog()" class="easyui-linkbutton" iconCls="icon-edit" plain="true">修改</a>
		<a href="javascript:deleteProduct()" class="easyui-linkbutton" iconCls="icon-remove" plain="true">删除</a>
		<a href="javascript:setProductHot()" class="easyui-linkbutton" iconCls="icon-hot" plain="true">设置为热卖</a>
		<a href="javascript:setProductSpecialPrice()" class="easyui-linkbutton" iconCls="icon-special" plain="true">设置为特价</a>
	</div>
	<div>
		&nbsp;商品名称：&nbsp;<input type="text" name="s_product.name"  id="productName"  size="20" onkeydown="if(event.keyCode==13) searchProduct()"/>
		<a href="javascript:searchProduct()" class="easyui-linkbutton" iconCls="icon-search" plain="true">搜索</a>
	</div>
</div>

<div id="dlg" class="easyui-dialog" style="width: 670px;height: 500px;padding: 10px 20px"
  closed="true" buttons="#dlg-buttons">
  <form id="fm" method="post"  enctype="multipart/form-data">
  	<table cellspacing="8px;">
  		<tr>
  			<td>商品名称：</td>
  			<td colspan="4"><input class="easyui-validatebox" id="name" name="product.name"  required="true" style="width: 300px;"/></td>
  		</tr>
  		<tr>
  			<td>价格：</td>
  			<td colspan="4"><input class="easyui-validatebox" id="price" name="product.price"  required="true"/></td>
  		</tr>
  		<tr>
  			<td>库存：</td>
  			<td colspan="4"><input class="easyui-validatebox" id="stock" name="product.stock"  required="true"/></td>
  		</tr>
  		<tr>
  			<td>商品图片：</td>
  			<td colspan="4"><input id="pP" name="proPic"  type="file"/></td>
  		</tr>
  	    <tr>
  			<td>所属大类：</td>
  			<td colspan="4"><input class="easyui-combobox" id="bName" name="product.bigType.ID"  data-options="panelHeight:'auto',editable:false,valueField:'ID',textField:'name',url:'bigTypeCombobox.action'"/></td>
  		</tr>
  		<tr>
  			<td>所属小类：</td>
  			<td colspan="4"><input class="easyui-combobox"  id="sName" name="product.smallType.ID" data-options="panelHeight:'auto',editable:false,valueField:'ID',textField:'name',url:''" /></td>
  		</tr>
  		<tr>
  			<td valign="top">备注：</td>
  			<td colspan="4">
  				<textarea rows="7" cols="50" name="product.description" id="description"></textarea>
  				<input type="hidden"  id="proPic" name="product.proPic" />
  				<input type="hidden"  id="hot"  name="product.hot"/>
  				<input type="hidden"  id="specialPrice" name="product.specialPrice" />
  				<input type="hidden"  id="hotTime" name="product.hotTime" />
  				<input type="hidden"  id="specialPriceTime" name="product.specialPriceTime" />
  			</td>
  		</tr>
  	</table>
  </form>
</div>

<div id="dlg-buttons">
	<a href="javascript:saveProduct()" class="easyui-linkbutton" iconCls="icon-ok" >保存</a>
	<a href="javascript:closeProductDialog()" class="easyui-linkbutton" iconCls="icon-cancel" >关闭</a>
</div>

</body>
</html>