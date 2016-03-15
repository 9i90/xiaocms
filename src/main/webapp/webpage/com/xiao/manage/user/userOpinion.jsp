<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>用户反馈</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="userOpinionController.do?save">
			<input id="id" name="id" type="hidden" value="${userOpinionPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							userId:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="userId" name="userId" ignore="ignore"
							   value="${userOpinionPage.userId}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							反馈标题:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="title" name="title" ignore="ignore"
							   value="${userOpinionPage.title}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							phone:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="phone" name="phone" ignore="ignore"
							   value="${userOpinionPage.phone}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							反馈内容:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="content" name="content" ignore="ignore"
							   value="${userOpinionPage.content}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							状态（1：反馈发出；2：已处理；）:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="status" name="status" 
							   value="${userOpinionPage.status}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>