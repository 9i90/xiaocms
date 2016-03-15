<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>用户基本信息</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="userBasicController.do?save">
			<input id="id" name="id" type="hidden" value="${userBasicPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				<tr>
					<td align="right">
						<label class="Validform_label">
							userId:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="userId" name="userId" 
							   value="${userBasicPage.userId}" datatype="n">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							真实姓名:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="realname" name="realname" 
							   value="${userBasicPage.realname}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							手机号:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="phone" name="phone" 
							   value="${userBasicPage.phone}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							性别（M：男，F：女）:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="gender" name="gender" 
							   value="${userBasicPage.gender}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							出生省:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="birthProvince" name="birthProvince" ignore="ignore"
							   value="${userBasicPage.birthProvince}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							出生城市:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="birthCity" name="birthCity" ignore="ignore"
							   value="${userBasicPage.birthCity}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							常住地址:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="address" name="address" ignore="ignore"
							   value="${userBasicPage.address}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							行业:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="professionCode" name="professionCode" ignore="ignore"
							   value="${userBasicPage.professionCode}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							年龄范围:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="ageScope" name="ageScope" ignore="ignore"
							   value="${userBasicPage.ageScope}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							收入范围:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="revenue" name="revenue" ignore="ignore"
							   value="${userBasicPage.revenue}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							资料完善时间:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"  style="width: 150px" id="addtime" name="addtime" 
							     value="<fmt:formatDate value='${userBasicPage.addtime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>