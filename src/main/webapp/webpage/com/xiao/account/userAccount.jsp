<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>用户账户信息</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="userAccountController.do?save">
			<input id="id" name="id" type="hidden" value="${userAccountPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							userId:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="userId" name="userId" 
							   value="${userAccountPage.userId}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							总金额:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="total" name="total" 
							   value="${userAccountPage.total}" datatype="d">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							可用金额:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="useMoney" name="useMoney" 
							   value="${userAccountPage.useMoney}" datatype="d">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							推广收益:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="extensionProfit" name="extensionProfit" 
							   value="${userAccountPage.extensionProfit}" datatype="d">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							推广收益:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="inviteProfit" name="inviteProfit" 
							   value="${userAccountPage.inviteProfit}" datatype="d">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>