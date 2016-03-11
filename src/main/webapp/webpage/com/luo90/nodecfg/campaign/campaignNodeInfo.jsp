<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<script type="text/javascript">

$(function() {
	
	$('#saveBtn').linkbutton({
		
	});
});
function submitForm1(){
	alert("asd");
	$('#formobj').form('submit');
}

</script>
<!DOCTYPE html>
<html>
 <head>
  <title>节点活动管理</title>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="false" usePlugin="password" layout="table" action="campaignNodeInfoController.do?save">
			<input id="id" name="id" type="hidden" value="${campaignNodeInfoPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							活动名称:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="name" name="name" 
							   value="${campaignNodeInfoPage.name}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right"><label class="Validform_label"> 所属节点: </label></td>
					<td class="value">
		                <t:dictSelect field="nodeId" dictTable="campaign_node" dictField="id" dictText="name" dictCondition=" where avi_flag='1'"  hasLabel="false" defaultVal="${campaignNodeInfoPage.nodeId}" ></t:dictSelect>
		                <span class="Validform_checktip">请选择节点</span>
		            </td>
				</tr>
				
				<tr>
					<td align="right">
						<label class="Validform_label">
							活动录入时间:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="addTime" name="addTime" 
							     value="<fmt:formatDate value='${campaignNodeInfoPage.addTime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							活动有效期起:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="startTime" name="startTime" 
							     value="<fmt:formatDate value='${campaignNodeInfoPage.startTime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							活动有效期止:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="endTime" name="endTime" 
							     value="<fmt:formatDate value='${campaignNodeInfoPage.endTime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							表达式:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="expression" name="expression" 
							   value="${campaignNodeInfoPage.expression}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							期望结果:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="result" name="result" 
							   value="${campaignNodeInfoPage.result}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							活动备注:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="remark" name="remark" ignore="ignore"
							   value="${campaignNodeInfoPage.remark}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							活动状态:
						</label>
					</td>
					<td class="value">
						<t:dictSelect field="status" typeGroupCode="c_status" hasLabel="false" defaultVal="${campaignNodeInfoPage.status}" ></t:dictSelect>
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							活动执行内容（多个逗号分隔）:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="execContent" name="execContent" ignore="ignore"
							   value="${campaignNodeInfoPage.execContent}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
		<a id="saveBtn" class="easyui-linkbutton" onclick="submitForm1()">保存</a>
		
		
 </body>
