<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<!DOCTYPE html>
<html>
 <head>
  <title>文章管理</title>
  <t:base type="jquery,easyui,tools,DatePicker"></t:base>
 </head>
 <body style="overflow-y: hidden" scroll="no">
  <t:formvalid formid="formobj" dialog="true" usePlugin="password" layout="table" action="articleInfoController.do?save">
			<input id="id" name="id" type="hidden" value="${articleInfoPage.id }">
			<table style="width: 600px;" cellpadding="0" cellspacing="1" class="formtable">
				
				<tr>
					<td align="right">
						<label class="Validform_label">
							所属栏目:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="siteCode" name="siteCode" 
							   value="${articleInfoPage.siteCode}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
					<td align="right">
						<label class="Validform_label">
							文章分类（多个逗号分隔）:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="type" name="type" 
							   value="${articleInfoPage.type}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							标题:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="title" name="title" 
							   value="${articleInfoPage.title}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
					<td align="right">
						<label class="Validform_label">
							关键字（多个逗号分隔）:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="keyword" name="keyword" ignore="ignore"
							   value="${articleInfoPage.keyword}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							图片地址:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="litpic" name="litpic" ignore="ignore"
							   value="${articleInfoPage.litpic}">
						<span class="Validform_checktip"></span>
					</td>
					<td align="right">
						<label class="Validform_label">
							作者:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="author" name="author" ignore="ignore"
							   value="${articleInfoPage.author}">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							是否热门（1：热门；0：非热门）:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="hot" name="hot" ignore="ignore"
							   value="${articleInfoPage.hot}">
						<span class="Validform_checktip"></span>
					</td>
					<td align="right">
						<label class="Validform_label">
							站长推荐（1：推荐；0：不推荐）:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="recommended" name="recommended" 
							   value="${articleInfoPage.recommended}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							内容:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="content" name="content" 
							   value="${articleInfoPage.content}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							录入时间:
						</label>
					</td>
					<td class="value">
						<input class="Wdate" onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})" readonly="readonly"  style="width: 150px" id="addtime" name="addtime" 
							     value="<fmt:formatDate value='${articleInfoPage.addtime}' type="date" pattern="yyyy-MM-dd hh:mm:ss"/>" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							文章来源(user：用户后台录入;sina：新浪;等等其他自己根据需要编):
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="source" name="source" 
							   value="${articleInfoPage.source}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							浏览次数:
						</label>
					</td>
					<td class="value">
						${articleInfoPage.readCount}
					</td>
				</tr>
				<tr>
					<td align="right">
						<label class="Validform_label">
							状态:
						</label>
					</td>
					<td class="value">
						<input class="inputxt" id="status" name="status" 
							   value="${articleInfoPage.status}" datatype="*">
						<span class="Validform_checktip"></span>
					</td>
				</tr>
			</table>
		</t:formvalid>
 </body>