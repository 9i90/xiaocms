<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>提现管理</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="formWithdrawController.do?save">
			<input id="id" name="id" type="hidden" value="${formWithdrawPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							申请用户ID:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="userId" name="userId" 
							   value="${formWithdrawPage.userId}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							提现方式（1：支付宝；2：微信）:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="type" name="type" 
							   value="${formWithdrawPage.type}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							提现金额:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="amount" name="amount" 
							   value="${formWithdrawPage.amount}" datatype="d">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							状态（-2：申请不通过；-1：撤回；0：申请中；1：提现成功）:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="status" name="status" 
							   value="${formWithdrawPage.status}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							申请时间:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="addtime" name="addtime" 
							     value="<fmt:formatDate value='${formWithdrawPage.addtime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							申请IP:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="addip" name="addip" ignore="ignore"
							   value="${formWithdrawPage.addip}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							备注:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="remark" name="remark" ignore="ignore"
							   value="${formWithdrawPage.remark}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							提现凭据号（银行流水号）:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="withdrawTicket" name="withdrawTicket" ignore="ignore"
							   value="${formWithdrawPage.withdrawTicket}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							实际到账时间:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="notifyTime" name="notifyTime" ignore="ignore"
							     value="<fmt:formatDate value='${formWithdrawPage.notifyTime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							实际到账金额:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="yesAmount" name="yesAmount" ignore="ignore"
							   value="${formWithdrawPage.yesAmount}" datatype="d">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							提现手续费:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="fee" name="fee" ignore="ignore"
							   value="${formWithdrawPage.fee}" datatype="d">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>