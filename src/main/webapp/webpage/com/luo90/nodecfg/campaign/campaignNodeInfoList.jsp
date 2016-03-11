<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,easyui,tools,DatePicker"></t:base>
<div class="easyui-layout" fit="true">
  <div region="west" style="padding:1px;width:400px;">
  <t:datagrid name="campaignNodeInfoList" title="节点活动管理" actionUrl="campaignNodeInfoController.do?datagrid" idField="id" fit="true">
   <t:dgCol title="编号" field="id" hidden="true"></t:dgCol>
   <t:dgCol title="活动名称" field="name"   width="120"></t:dgCol>
   <t:dgCol title="所属节点" field="nodeId" dictionary="campaign_node,id,name"  width="120" hidden="true"></t:dgCol>
   <t:dgCol title="活动录入时间" field="addTime" formatter="yyyy-MM-dd hh:mm:ss"  width="120" hidden="true"></t:dgCol>
   <t:dgCol title="活动有效期起" field="startTime" formatter="yyyy-MM-dd hh:mm:ss"  width="120" hidden="true"></t:dgCol>
   <t:dgCol title="活动有效期止" field="endTime" formatter="yyyy-MM-dd hh:mm:ss"  width="120" hidden="true"></t:dgCol>
   <t:dgCol title="表达式" field="expression"   width="120" hidden="true"></t:dgCol>
   <t:dgCol title="期望结果" field="result"   width="120" hidden="true"></t:dgCol>
   <t:dgCol title="活动备注" field="remark"   width="120" hidden="true"></t:dgCol>
   <t:dgCol title="活动状态" field="status"  width="120" dictionary="c_status" ></t:dgCol>
   <t:dgCol title="活动执行内容（多个逗号分隔）" field="execContent"   width="120" hidden="true"></t:dgCol>
   <t:dgCol title="操作" field="opt" width="100"></t:dgCol>
<%--    <t:dgDelOpt title="删除" url="campaignNodeInfoController.do?del&id={id}" /> --%>
   <t:dgFunOpt funname="setCampaignNodebyId(id,name)" title="编辑"></t:dgFunOpt>
   <t:dgToolBar title="录入" icon="icon-add" onclick="setCampaignNodebyId('','新增')"></t:dgToolBar>
  </t:datagrid>
  </div>
 </div>
 
 
<div region="center"  split="true">
<div tools="#tt" class="easyui-panel" title="活动设置" style="padding: 10px;" fit="true" border="false" id="function-panel"></div>
</div>
<div id="tt"></div>
</div>


<div region="right"  split="true">
<div tools="#r" class="easyui-panel" title="规则设置" style="padding: 10px;" fit="true" border="false" id="function-panel1"></div>
</div>
<div id="r"></div>
</div>

 <script type="text/javascript">
function setCampaignNodebyId(id,name) {
	$("#function-panel").panel({
		title:'活动设置:' + name,
		href:'campaignNodeInfoController.do?addorupdate&id=' + id
		});
	$('#function-panel').panel("refresh" );
	
}
</script>

<script type="text/javascript" src="http://www.zhangxinxu.com/study/js/jquery-smartMenu.js"></script>
<link rel="stylesheet" href="http://www.zhangxinxu.com/study/css/smartMenu.css" type="text/css" />


<script type="text/javascript">

		var imageMenuData = [
                     [{
                         text: "图片描边",
                         data: [[{
                             text: "5像素深蓝",
                             func: function() {
                                 $(this).css("border", "5px solid #34538b");
                             }
                         }, {
                             text: "5像素浅蓝",
                             func: function() {
                                 $(this).css("border", "5px solid #a0b3d6");
                             }
                         }, {
                             text: "5像素淡蓝",
                             func: function() {
                                 $(this).css("border", "5px solid #cad5eb");
                             }
                         }]]
                     }, {
                         text: "图片内间距",
                         func: function() {
                             $(this).css("padding", "10px");
                         }
                     }, {
                         text: "图片背景色",
                         func: function() {
                             $(this).css("background-color", "#beceeb");
                         }
                     }],
                     [{
                         text: "查看原图",
                         func: function() {
                             var src = $(this).attr("src");
                             window.open(src.replace("/s512", ""));    
                         }
                     }]
                 ];
		$("#function-panel1").smartMenu(imageMenuData);

</script>
