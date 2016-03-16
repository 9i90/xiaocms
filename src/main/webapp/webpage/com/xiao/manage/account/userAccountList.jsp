<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="userAccountList" title="用户账户" actionUrl="userAccountController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="true"></t:dgCol>
   <t:dgCol title="用户" field="userId" dictionary="user_info,user_id,nickname"    width="120"></t:dgCol>
   <t:dgCol title="总金额" field="total"   width="120"></t:dgCol>
   <t:dgCol title="可用金额" field="useMoney"   width="120"></t:dgCol>
   <t:dgCol title="推广收益" field="extensionProfit"   width="120"></t:dgCol>
   <t:dgCol title="推广收益" field="inviteProfit"   width="120"></t:dgCol>
  </t:datagrid>
  </div>
 </div>