<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="articleInfoList" title="文章管理" actionUrl="articleInfoController.do?datagrid" idField="id" fit="true" queryMode="group">
   <t:dgCol title="编号" field="id" hidden="true"></t:dgCol>
   <t:dgCol title="状态" field="status" dictionary="s_article"  width="120"></t:dgCol>
   <t:dgCol title="所属栏目" field="siteCode"   width="120"></t:dgCol>
   <t:dgCol title="文章分类" field="type"   width="120"></t:dgCol>
   <t:dgCol title="标题" field="title" query="true"  width="120"></t:dgCol>
   <t:dgCol title="关键字" field="keyword"   width="120"></t:dgCol>
   <t:dgCol title="图片地址" field="litpic"   width="120"></t:dgCol>
   <t:dgCol title="作者" field="author"   width="120"></t:dgCol>
   <t:dgCol title="是否热门" field="hot"   width="120"></t:dgCol>
   <t:dgCol title="站长推荐" field="recommended"   width="120"></t:dgCol>
<%--    <t:dgCol title="内容" field="content"   width="120"></t:dgCol> --%>
   <t:dgCol title="录入时间" field="addtime" query="true" queryMode="group" formatter="yyyy-MM-dd hh:mm:ss"  width="120"></t:dgCol>
   <t:dgCol title="文章来源" field="source"   width="120"></t:dgCol>
   <t:dgCol title="浏览次数" field="readCount"   width="120"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
   <t:dgDelOpt title="删除" url="articleInfoController.do?del&id={id}" />
   <t:dgToolBar title="录入" icon="icon-add" url="articleInfoController.do?addorupdate" funname="add"></t:dgToolBar>
   <t:dgToolBar title="编辑" icon="icon-edit" url="articleInfoController.do?addorupdate" funname="update"></t:dgToolBar>
   <t:dgToolBar title="查看" icon="icon-search" url="articleInfoController.do?addorupdate" funname="detail"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
 
 <script type="text/javascript">
 $(document).ready(function(){ 
		$("input[name='addtime_begin']").attr("class", "Wdate").attr("style",
		"height:30px;width:180px;").click(function() {
			WdatePicker({
						dateFmt : 'yyyy-MM-dd HH:mm:ss'
					});
		});
		$("input[name='addtime_end']").attr("class", "Wdate").attr("style",
				"height:30px;width:180px;").click(function() {
					WdatePicker({
								dateFmt : 'yyyy-MM-dd HH:mm:ss'
							});
				});
	});
 </script>