<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="userBasicList" title="用户基本信息" actionUrl="userBasicController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="true"></t:dgCol>
   <t:dgCol title="用户" field="userId" dictionary="user_info,user_id,nickname"    width="120"></t:dgCol>
   <t:dgCol title="真实姓名" field="realname"   width="120"></t:dgCol>
   <t:dgCol title="手机号" field="phone"   width="120"></t:dgCol>
   <t:dgCol title="性别（M：男，F：女）" field="gender"   width="120"></t:dgCol>
   <t:dgCol title="出生省" field="birthProvince"   width="120"></t:dgCol>
   <t:dgCol title="出生城市" field="birthCity"   width="120"></t:dgCol>
   <t:dgCol title="常住地址" field="address"   width="120"></t:dgCol>
   <t:dgCol title="行业" field="professionCode"   width="120"></t:dgCol>
   <t:dgCol title="年龄范围" field="ageScope"   width="120"></t:dgCol>
   <t:dgCol title="收入范围" field="revenue"   width="120"></t:dgCol>
   <t:dgCol title="资料完善时间" field="addtime" formatter="yyyy-MM-dd hh:mm:ss"  width="120"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="userBasicController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="userBasicController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="userBasicController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="userBasicController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>