<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="nodeList" title="活动节点管理" actionUrl="nodeController.do?datagrid"
   idField="id" sortName="id" sortOrder="desc">
   <t:dgCol title="编号" field="id" hidden="true"></t:dgCol>
   <t:dgCol title="节点" field="node"   width="120"></t:dgCol>
   <t:dgCol title="节点名称" field="name"   width="120"></t:dgCol>
   <t:dgCol title="有效标志" field="aviFlag" dictionary="c_aviflag"  width="120"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgFunOpt funname="delNode(id)" title="common.delete"></t:dgFunOpt>
   <t:dgFunOpt funname="setAttrbyNode(id,name)" title="属性设置"></t:dgFunOpt>
   <t:dgToolBar title="录入" icon="icon-add" url="nodeController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="nodeController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="nodeController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
 
 <div region="east" style="width: 600px;" split="true">
<div tools="#tt" class="easyui-panel" title="属性设置" style="padding: 10px;" fit="true" border="false" id="function-panel"></div>
</div>
<div id="tt"></div>
</div>

<script type="text/javascript">
function setAttrbyNode(id,nodeName) {
	$("#function-panel").panel({
		title:'属性设置:' + nodeName,
		href:'nodeAttrController.do?nodeAttr&nodeId=' + id
	});
	$('#function-panel').panel("refresh" );
	
}
//删除节点
function delNode(id){
	var tabName= 'nodeList';
	var url= 'nodeController.do?del&id='+id;
	$.dialog.confirm('确定要删除此节点吗', function(){
		doSubmit(url,tabName);
		rowid = '';
		$("#function-panel").html("");//删除节点后，清空对应的属性
	}, function(){
	});
}
</script>
