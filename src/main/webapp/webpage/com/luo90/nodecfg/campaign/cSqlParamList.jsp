<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="cSqlParamList" title="SQL参数" actionUrl="cSqlParamController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="true"></t:dgCol>
   <t:dgCol title="所属SQL" field="sqlId"   width="120"></t:dgCol>
   <t:dgCol title="类型（1：入参，2：出参）" field="type"   width="120"></t:dgCol>
   <t:dgCol title="编码" field="code"   width="120"></t:dgCol>
   <t:dgCol title="参数名称" field="name"   width="120"></t:dgCol>
   <t:dgCol title="参数类型" field="dataType"   width="120"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="cSqlParamController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="cSqlParamController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="cSqlParamController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="cSqlParamController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>