<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="userInfoList" title="用户信息" actionUrl="userInfoController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="true"></t:dgCol>
   <t:dgCol title="userId" field="userId"   width="120"></t:dgCol>
   <t:dgCol title="openid" field="openid"   width="120"></t:dgCol>
   <t:dgCol title="微信号" field="wxname"   width="120"></t:dgCol>
   <t:dgCol title="头像url地址" field="headUrl"   width="120"></t:dgCol>
   <t:dgCol title="用户名（预留，后期好像要做注册）" field="username"   width="120"></t:dgCol>
   <t:dgCol title="password" field="password"   width="120"></t:dgCol>
   <t:dgCol title="昵称" field="nickname"   width="120"></t:dgCol>
   <t:dgCol title="邀请人" field="inviteUser"   width="120"></t:dgCol>
   <t:dgCol title="注册时间" field="addtime" formatter="yyyy-MM-dd hh:mm:ss"  width="120"></t:dgCol>
   <t:dgCol title="注册IP" field="addip"   width="120"></t:dgCol>
   <t:dgCol title="状态（1：正常；-1：停用）" field="status"   width="120"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="userInfoController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="userInfoController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="userInfoController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="userInfoController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>