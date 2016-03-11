<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>节点活动规则</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="campaignNodeController.do?save">
			<input id="id" name="id" type="hidden" value="${campaignNodePage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							所属活动:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="campaignId" name="campaignId" 
							   value="${campaignNodePage.campaignId}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							所属节点:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="nodeId" name="nodeId" 
							   value="${campaignNodePage.nodeId}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							表达式配置:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="expression" name="expression" 
							   value="${campaignNodePage.expression}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							表达式解析变量集合，多个 逗号分隔:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="args" name="args" 
							   value="${campaignNodePage.args}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>