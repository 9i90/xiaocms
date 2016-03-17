<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="sysNoticeList" title="系统公告" actionUrl="sysNoticeController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="true"></t:dgCol>
   <t:dgCol title="标题" field="title"   width="120"></t:dgCol>
   <t:dgCol title="内容" field="content"   width="120"></t:dgCol>
   <t:dgCol title="录入时间" field="addtime" formatter="yyyy-MM-dd hh:mm:ss"  width="120"></t:dgCol>
   <t:dgCol title="状态（0：草稿；1：发布；2：关闭）" field="status"   width="120"></t:dgCol>
   <t:dgCol title="发布时间" field="publish" formatter="yyyy-MM-dd hh:mm:ss"  width="120"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="sysNoticeController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="sysNoticeController.do?addorupdate" funname="add" height="600" width="800"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="sysNoticeController.do?addorupdate" funname="update" height="600" width="800"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="sysNoticeController.do?addorupdate" funname="detail" height="600" width="800"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>