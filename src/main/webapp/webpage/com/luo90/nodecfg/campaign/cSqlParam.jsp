<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>SQL参数</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="cSqlParamController.do?save">
			<input id="id" name="id" type="hidden" value="${cSqlParamPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							所属SQL:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="sqlId" name="sqlId" 
							   value="${cSqlParamPage.sqlId}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							类型（1：入参，2：出参）:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="type" name="type" 
							   value="${cSqlParamPage.type}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							编码:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="code" name="code" 
							   value="${cSqlParamPage.code}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							参数名称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="name" name="name" 
							   value="${cSqlParamPage.name}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							参数类型:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="dataType" name="dataType" 
							   value="${cSqlParamPage.dataType}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>