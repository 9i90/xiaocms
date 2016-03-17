<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>文章浏览记录</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="articleReadController.do?save">
			<input id="id" name="id" type="hidden" value="${articleReadPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							文章ID:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="articleId" name="articleId" 
							   value="${articleReadPage.articleId}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							分享人ID:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="shareUserId" name="shareUserId" ignore="ignore"
							   value="${articleReadPage.shareUserId}" datatype="n">
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
						<input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="addtime" name="addtime" 
							     value="<fmt:formatDate value='${articleReadPage.addtime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							阅读IP:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="addip" name="addip" 
							   value="${articleReadPage.addip}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							请求SESSIONID:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="sessionId" name="sessionId" 
							   value="${articleReadPage.sessionId}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>