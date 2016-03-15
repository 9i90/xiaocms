<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>用户信息</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="userInfoController.do?save">
			<input id="id" name="id" type="hidden" value="${userInfoPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							userId:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="userId" name="userId" 
							   value="${userInfoPage.userId}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							openid:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="openid" name="openid" ignore="ignore"
							   value="${userInfoPage.openid}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							微信号:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="wxname" name="wxname" ignore="ignore"
							   value="${userInfoPage.wxname}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							头像url地址:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="headUrl" name="headUrl" ignore="ignore"
							   value="${userInfoPage.headUrl}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							用户名（预留，后期好像要做注册）:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="username" name="username" ignore="ignore"
							   value="${userInfoPage.username}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							password:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="password" name="password" ignore="ignore"
							   value="${userInfoPage.password}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							昵称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="nickname" name="nickname" ignore="ignore"
							   value="${userInfoPage.nickname}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							邀请人:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="inviteUser" name="inviteUser" ignore="ignore"
							   value="${userInfoPage.inviteUser}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							注册时间:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="addtime" name="addtime" 
							     value="<fmt:formatDate value='${userInfoPage.addtime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							注册IP:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="addip" name="addip" ignore="ignore"
							   value="${userInfoPage.addip}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							状态（1：正常；-1：停用）:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="status" name="status" 
							   value="${userInfoPage.status}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>