<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:formvalid formid="form_domainname" dialog="true" usePlugin="password" layout="table" action="sysConfigController.do?save">
			<input id="domainname_id" name="id" type="hidden" value="${domainname.id }">
			<input id="domainname_code" name="code" type="hidden" value="${domainname.code }">
			<input id="domainname_name" name="name" type="hidden" value="${domainname.name }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							${domainname.name }:
						</label>
					</td>
					<td class="value">
					
						<input class="inputxt" id="title" name="title" 
							   value="${domainname.contents}" style="width:400px;" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
					<td align="right">
							<button>保存</button>
					</td>
				</tr>
				
			</table>
		</t:formvalid>
		
		<t:formvalid formid="form_share" dialog="true" usePlugin="password" layout="table" action="sysConfigController.do?save">
			<input id="share_id" name="id" type="hidden" value="${share.id }">
			<input id="share_code" name="code" type="hidden" value="${share.code }">
			<input id="share_name" name="name" type="hidden" value="${share.name }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							${share.name }:
						</label>
					</td>
					<td class="value">
					
						<input class="inputxt" id="share_contents" name="contents" 
							   value="${share.contents}" style="width:400px;" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
					<td align="right">
							<button>保存</button>
					</td>
				</tr>
				
			</table>
		</t:formvalid>
  </div>
 </div>