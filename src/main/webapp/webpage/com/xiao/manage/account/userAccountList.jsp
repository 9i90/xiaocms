<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="userAccountList" title="用户账户" actionUrl="userAccountController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="true"></t:dgCol>
   <t:dgCol title="userId" field="userId"   width="120"></t:dgCol>
   <t:dgCol title="总金额" field="total"   width="120"></t:dgCol>
   <t:dgCol title="可用金额" field="useMoney"   width="120"></t:dgCol>
   <t:dgCol title="推广收益" field="extensionProfit"   width="120"></t:dgCol>
   <t:dgCol title="推广收益" field="inviteProfit"   width="120"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="userAccountController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="userAccountController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="userAccountController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="userAccountController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>