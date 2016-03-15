<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="formWithdrawList" title="提现管理" actionUrl="formWithdrawController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="true"></t:dgCol>
   <t:dgCol title="申请用户ID" field="userId"   width="120"></t:dgCol>
   <t:dgCol title="提现方式（1：支付宝；2：微信）" field="type"   width="120"></t:dgCol>
   <t:dgCol title="提现金额" field="amount"   width="120"></t:dgCol>
   <t:dgCol title="状态（-2：申请不通过；-1：撤回；0：申请中；1：提现成功）" field="status"   width="120"></t:dgCol>
   <t:dgCol title="申请时间" field="addtime" formatter="yyyy-MM-dd hh:mm:ss"  width="120"></t:dgCol>
   <t:dgCol title="申请IP" field="addip"   width="120"></t:dgCol>
   <t:dgCol title="备注" field="remark"   width="120"></t:dgCol>
   <t:dgCol title="提现凭据号（银行流水号）" field="withdrawTicket"   width="120"></t:dgCol>
   <t:dgCol title="实际到账时间" field="notifyTime" formatter="yyyy-MM-dd hh:mm:ss"  width="120"></t:dgCol>
   <t:dgCol title="实际到账金额" field="yesAmount"   width="120"></t:dgCol>
   <t:dgCol title="提现手续费" field="fee"   width="120"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="formWithdrawController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="formWithdrawController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="formWithdrawController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="formWithdrawController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>