<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>节点属性配置</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="nodeAttrController.do?save">
			<input id="id" name="id" type="hidden" value="${nodeAttrPage.id }">
			<input id="nodeId" name="nodeId" type="hidden" value="${nodeAttrPage.nodeId }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							属性编码:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="code" name="code" 
							   value="${nodeAttrPage.code}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							属性名称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="name" name="name" 
							   value="${nodeAttrPage.name}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							属性类型:
						</label>
					</td>
					<td class="value">
							   <t:dictSelect field="type" typeGroupCode="c_datatype" hasLabel="false" defaultVal="${nodeAttrPage.type}" ></t:dictSelect>
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>