<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="userOpinionList" title="用户反馈" actionUrl="userOpinionController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="true"></t:dgCol>
   <t:dgCol title="userId" field="userId"   width="120"></t:dgCol>
   <t:dgCol title="反馈标题" field="title"   width="120"></t:dgCol>
   <t:dgCol title="phone" field="phone"   width="120"></t:dgCol>
   <t:dgCol title="反馈内容" field="content"   width="120"></t:dgCol>
   <t:dgCol title="状态（1：反馈发出；2：已处理；）" field="status"   width="120"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="userOpinionController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="userOpinionController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="userOpinionController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="userOpinionController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>