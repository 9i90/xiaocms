<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="sysNoticeList" title="系统公告" actionUrl="sysNoticeController.do?datagrid" idField="id" fit="true" queryMode="group" >
   <t:dgCol title="编号" field="id" hidden="true"></t:dgCol>
   <t:dgCol title="标题" field="title"   width="120"></t:dgCol>
   <t:dgCol title="内容" field="content"   width="140"></t:dgCol>
   <t:dgCol title="录入时间" field="addtime" formatter="yyyy-MM-dd hh:mm:ss"  width="100"></t:dgCol>
   <t:dgCol title="发布时间" field="publish" query="true" queryMode="group" formatter="yyyy-MM-dd hh:mm:ss"  width="100"></t:dgCol>
   <t:dgCol title="状态" field="status" query="true" dictionary="s_notice_s"  width="70"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="sysNoticeController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="sysNoticeController.do?addorupdate" funname="add" height="450" width="700"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="sysNoticeController.do?addorupdate" funname="update" height="450" width="700"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="sysNoticeController.do?addorupdate" funname="detail" height="450" width="700"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
 <script type="text/javascript">
 $(document).ready(function(){ 
		$("input[name='publish_begin']").attr("class", "Wdate").attr("style",
		"height:30px;width:180px;").click(function() {
			WdatePicker({
						dateFmt : 'yyyy-MM-dd HH:mm:ss'
					});
		});
		$("input[name='publish_end']").attr("class", "Wdate").attr("style",
				"height:30px;width:180px;").click(function() {
					WdatePicker({
								dateFmt : 'yyyy-MM-dd HH:mm:ss'
							});
				});
	});
 </script>