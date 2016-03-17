<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="articleReadList" title="文章浏览记录" actionUrl="articleReadController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="true"></t:dgCol>
   <t:dgCol title="文章ID" field="articleId"   width="120"></t:dgCol>
   <t:dgCol title="分享人ID" field="shareUserId"   width="120"></t:dgCol>
   <t:dgCol title="阅读时间" field="addtime" formatter="yyyy-MM-dd hh:mm:ss"  width="120"></t:dgCol>
   <t:dgCol title="阅读IP" field="addip"   width="120"></t:dgCol>
   <t:dgCol title="请求SESSIONID" field="sessionId"   width="120"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="articleReadController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="articleReadController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="articleReadController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="articleReadController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>