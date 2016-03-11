<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>查询SQL管理</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="cSqlInfoController.do?save">
			<input id="id" name="id" type="hidden" value="${cSqlInfoPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							SQL名称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="name" name="name" 
							   value="${cSqlInfoPage.name}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							SQL内容:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="content" name="content" 
							   value="${cSqlInfoPage.content}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							结果字段，多个逗号分隔:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="field" name="field" 
							   value="${cSqlInfoPage.field}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							有效标志（1：有效，0：无效）:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="aviFlag" name="aviFlag" 
							   value="${cSqlInfoPage.aviFlag}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>