<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="campaignNodeList" title="节点活动规则" actionUrl="campaignNodeController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="true"></t:dgCol>
   <t:dgCol title="所属活动" field="campaignId"   width="120"></t:dgCol>
   <t:dgCol title="所属节点" field="nodeId"   width="120"></t:dgCol>
   <t:dgCol title="表达式配置" field="expression"   width="120"></t:dgCol>
   <t:dgCol title="表达式解析变量集合，多个 逗号分隔" field="args"   width="120"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="campaignNodeController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="campaignNodeController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="campaignNodeController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="campaignNodeController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>