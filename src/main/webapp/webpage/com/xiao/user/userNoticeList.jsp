<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="userNoticeList" title="站内信" actionUrl="userNoticeController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="true"></t:dgCol>
   <t:dgCol title="userId" field="userId"   width="120"></t:dgCol>
   <t:dgCol title="标题" field="title"   width="120"></t:dgCol>
   <t:dgCol title="类型，默认为0， 后续备用" field="type"   width="120"></t:dgCol>
   <t:dgCol title="内容" field="context"   width="120"></t:dgCol>
   <t:dgCol title="发送时间" field="sendtime" formatter="yyyy-MM-dd hh:mm:ss"  width="120"></t:dgCol>
   <t:dgCol title="阅读时间" field="opentime" formatter="yyyy-MM-dd hh:mm:ss"  width="120"></t:dgCol>
   <t:dgCol title="状态  0未读，1 已读，3 删除" field="status"   width="120"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="userNoticeController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="userNoticeController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="userNoticeController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="userNoticeController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>