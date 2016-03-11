<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="cSqlInfoList" title="查询SQL管理" actionUrl="cSqlInfoController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="true"></t:dgCol>
   <t:dgCol title="SQL名称" field="name"   width="120"></t:dgCol>
   <t:dgCol title="SQL内容" field="content"   width="120"></t:dgCol>
   <t:dgCol title="结果字段，多个逗号分隔" field="field"   width="120"></t:dgCol>
   <t:dgCol title="有效标志（1：有效，0：无效）" field="aviFlag"   width="120"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="cSqlInfoController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="cSqlInfoController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="cSqlInfoController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="cSqlInfoController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>