<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>站内信</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="userNoticeController.do?save">
			<input id="id" name="id" type="hidden" value="${userNoticePage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							userId:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="userId" name="userId" 
							   value="${userNoticePage.userId}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							标题:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="title" name="title" ignore="ignore"
							   value="${userNoticePage.title}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							类型，默认为0， 后续备用:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="type" name="type" ignore="ignore"
							   value="${userNoticePage.type}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							内容:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="context" name="context" ignore="ignore"
							   value="${userNoticePage.context}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							发送时间:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="sendtime" name="sendtime" ignore="ignore"
							     value="<fmt:formatDate value='${userNoticePage.sendtime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							阅读时间:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="opentime" name="opentime" ignore="ignore"
							     value="<fmt:formatDate value='${userNoticePage.opentime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							状态  0未读，1 已读，3 删除:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="status" name="status" ignore="ignore"
							   value="${userNoticePage.status}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>