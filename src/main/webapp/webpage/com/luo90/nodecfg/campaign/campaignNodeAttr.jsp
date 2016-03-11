<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>节点活动属性</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="campaignNodeAttrController.do?save">
			<input id="id" name="id" type="hidden" value="${campaignNodeAttrPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							活动ID:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="nodeInfoId" name="nodeInfoId" 
							   value="${campaignNodeAttrPage.nodeInfoId}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							attrId:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="attrId" name="attrId" 
							   value="${campaignNodeAttrPage.attrId}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							value:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="value" name="value" 
							   value="${campaignNodeAttrPage.value}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							属性类型（1:in;2:out）:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="infoType" name="infoType" 
							   value="${campaignNodeAttrPage.infoType}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>