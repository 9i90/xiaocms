<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="campaignNodeAttrList" title="节点活动属性" actionUrl="campaignNodeAttrController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="true"></t:dgCol>
   <t:dgCol title="活动ID" field="nodeInfoId"   width="120"></t:dgCol>
   <t:dgCol title="attrId" field="attrId"   width="120"></t:dgCol>
   <t:dgCol title="value" field="value"   width="120"></t:dgCol>
   <t:dgCol title="属性类型（1:in;2:out）" field="infoType"   width="120"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="campaignNodeAttrController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="campaignNodeAttrController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="campaignNodeAttrController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="campaignNodeAttrController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>