<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/context/mytags.jsp"%>
<t:base type="jquery,smartMenu"></t:base>
<body>

<div class="easyui-layout" fit="true">
  <div id="editP" region="center" style="padding:1px;">
  asdasdasd
  <button>asd</button>
  </div>
 </div>
 </body>
 <script>
 var imageMenuData = [
 	[{
 		text: "图片描边",
 		data: [[{
 			text: "5像素深灰蓝",
 			func: function() {
 				$(this).css("border", "5px solid #34538b");
 			}
 		}, {
 			text: "5像素浅灰蓝",
 			func: function() {
 				$(this).css("border", "5px solid #a0b3d6");
 			}
 		}, {
 			text: "5像素淡灰蓝",
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
 var bodyMenuData = [[{ text: "页面空白处点击是否冲突测试" }]];
 

 $(function() {
		
	 $("#editP").smartMenu(imageMenuData, {
		 	name: "image"	
		 });
		 $("div").smartMenu(bodyMenuData, {
		 	name: "body"	
		 });
	});
 </script>