<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>提现管理</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="formWithdrawController.do?audit">
			<input id="withDrawId" name="withDrawId" type="hidden" value="${formWithdrawPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							申请用户:
						</label>
					</td>
					<td class="value">
						<t:dictLabel field="${formWithdrawPage.userId}" dictTable="user_info" dictField="user_id" dictText="nickname"></t:dictLabel>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							提现方式:
						</label>
					</td>
					<td class="value">
 						<t:dictLabel field="${formWithdrawPage.type}" typeGroupCode="t_withdraw"></t:dictLabel>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							提现金额:
						</label>
					</td>
					<td class="value">
						${formWithdrawPage.amount}
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							申请时间:
						</label>
					</td>
					<td class="value">
						<fmt:formatDate value='${formWithdrawPage.addtime}' type="date" pattern="yyyy-MM-dd HH:mm:ss"/>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							申请IP:
						</label>
					</td>
					<td class="value">
						${formWithdrawPage.addip}
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							审核状态:
						</label>
					</td>
					<td class="value">
						<label><input type="radio" name="status" value="1" checked="checked">提现成功</label>
						<label><input type="radio" name="status" value="-2" >申请不通过</label>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							提现凭据号:
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
							备注 :
						</label>
					</td>
					<td class="value">
						<textarea rows="5" cols="8" style="width: 300px;height:80px;" name="remark">${formWithdrawPage.remark}</textarea>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							<label><input type="checkbox" name="sendMsg" value="1" checked="checked">发送站内信</label>
						</label>
					</td>
					<td class="value">
						<textarea rows="5" cols="8" style="width: 300px;height:80px;" name="msgContent"><t:mutiLang langKey="userMsgModel"/></textarea>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>