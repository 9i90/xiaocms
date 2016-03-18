<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="center" style="padding:1px;">
  <t:datagrid name="userAccountLogList" title="账户变动日志" actionUrl="userAccountLogController.do?datagrid" idField="id" fit="true" queryMode="group">
   <t:dgCol title="编号" field="id" hidden="true"></t:dgCol>
   <t:dgCol title="用户" field="userId" dictionary="user_info,user_id,nickname"  width="120"></t:dgCol>
   <t:dgCol title="资金变动类型" field="type"   width="120"></t:dgCol>
   <t:dgCol title="变动资金" field="money"   width="120"></t:dgCol>
   <t:dgCol title="关联数据ID" field="dataId"   width="120" hidden="true"></t:dgCol>
   <t:dgCol title="变动时间" field="addtime" query="true" queryMode="group" formatter="yyyy-MM-dd hh:mm:ss"  width="120"></t:dgCol>
   <t:dgCol title="总金额" field="oldTotal"   width="120"></t:dgCol>
   <t:dgCol title="变动前可用金额" field="oldUseMoney"   width="120"></t:dgCol>
   <t:dgCol title="变动前推广收益" field="oldExtensionProfit"   width="120"></t:dgCol>
   <t:dgCol title="变动前邀请收益" field="oldInviteProfit"   width="120"></t:dgCol>
   <t:dgCol title="变动后总金额" field="newTotal"   width="120"></t:dgCol>
   <t:dgCol title="变动后可用金额" field="newUseMoney"   width="120"></t:dgCol>
   <t:dgCol title="变动后推广收益" field="newExtensionProfit"   width="120"></t:dgCol>
   <t:dgCol title="变动后邀请收益" field="newInviteProfit"   width="120"></t:dgCol>
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