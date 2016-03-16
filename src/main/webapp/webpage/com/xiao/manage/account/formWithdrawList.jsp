<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="formWithdrawList" title="提现管理" actionUrl="formWithdrawController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="true"></t:dgCol>
   <t:dgCol title="申请用户" field="userId" dictionary="user_info,user_id,nickname"  width="120"></t:dgCol>
   <t:dgCol title="提现方式" field="type" replace="1_支付宝,2_微信"  width="120"></t:dgCol>
   <t:dgCol title="提现金额" field="amount"   width="120"></t:dgCol>
   <t:dgCol title="状态（-2：申请不通过；-1：撤回；0：申请中；1：提现成功）" field="status" dictionary="s_withdraw"   width="120"></t:dgCol>
   <t:dgCol title="申请时间" field="addtime" formatter="yyyy-MM-dd hh:mm:ss"  width="120"></t:dgCol>
   <t:dgCol title="申请IP" field="addip"   width="120"></t:dgCol>
   <t:dgCol title="备注" field="remark"   width="120"></t:dgCol>
   <t:dgCol title="提现凭据号（银行流水号）" field="withdrawTicket"   width="120"></t:dgCol>
   <t:dgCol title="实际到账时间" field="notifyTime" formatter="yyyy-MM-dd hh:mm:ss"  width="120"></t:dgCol>
   <t:dgCol title="实际到账金额" field="yesAmount"   width="120"></t:dgCol>
   <t:dgCol title="提现手续费" field="fee"   width="120"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgFunOpt funname="audit(id)" title="审核" exp="status#eq#0"></t:dgFunOpt>
   <t:dgToolBar title="查看" icon="icon-search" url="formWithdrawController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
 
 <script type="text/javascript">
 function audit(id){
	 createwindow('用户提现审核','formWithdrawController.do?toaudit&id='+id,700,400);
 }
 </script>