<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="nodeAttrList" title="节点属性配置" actionUrl="nodeAttrController.do?datagrid&nodeId=${nodeId }" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="true"></t:dgCol>
   <t:dgCol title="节点ID" field="nodeId" hidden="true"></t:dgCol>
   <t:dgCol title="属性编码" field="code"   width="120"></t:dgCol>
   <t:dgCol title="属性名称" field="name"   width="120"></t:dgCol>
   <t:dgCol title="属性类型" field="type"   width="120" dictionary="c_datatype"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="nodeAttrController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="nodeAttrController.do?addorupdate&nodeId=${nodeId}" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="nodeAttrController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="nodeAttrController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>