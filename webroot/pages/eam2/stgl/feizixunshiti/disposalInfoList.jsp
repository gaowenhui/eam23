<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String stid = (String)request.getAttribute("stid");
	String id = (String)request.getAttribute("id");
	String look = (String)request.getAttribute("look");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>实体处置信息</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<script type="text/javascript">
		var winVar = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no, directories=no ,center=yes";
		$(function(){
			//页面刚加载时，设置表格的宽度
			jQuery("#project_list").setGridWidth($("#tableWidth").width());
			$(window).bind('resize', function(){
				jQuery("#project_list").setGridWidth($("#tableWidth").width());
			});
			//添加按钮  "#gview_list > .ui-jqgrid-titlebar
			var buttonxiangmuJSonString = '[{"buttonHandler":"disposationTrace","buttonIcon":"icon-add","buttonText":"会后跟踪"}\
			]';
			addButtons(jQuery("#gview_project_list > .ui-jqgrid-titlebar"),buttonxiangmuJSonString);
		});	
		function disposationTrace(){
		
		}
	</script>
  </head>
  <body>
  <div  width="100%" id="tableWidth">&nbsp;</div>
  <s:hidden id="id" name="sf.id"></s:hidden>
 <table id="project_list"></table>
 <div  width="100%" id="persondisposoal" style="display:none">&nbsp;</div>
 <div  width="100%" id="assetdsposoal" style="display:none">&nbsp;</div>
 <div  width="100%" id="entitydisposoal" style="display:none">&nbsp;</div>
	<script type="text/javascript">
	jQuery("#project_list").jqGrid({				
		url:'http://localhost:8080/eam2/zccz/dealTrace1Head_queryProject.do',
		postData:{'vo.xmlx'   : '0'},
		datatype: "json",
		mtype:"POST",
	   	colNames: ['xmid', '处置项目名称', '项目状态', '处置方式', '会议次数', '审批委员', '主持人'],
		colModel: [
		   {name: 'id',index: 'id',align: "center",sorttype: "int",hidden: true
		},
		 {name: 'czxmmc',align: "center",index: 'diqu',sorttype: "int"
		},
		 {name: 'xmzt',index: 'czfs',align: "center",sorttype: "int"
		},
		 {name: 'czfs',index: 'czfs',align: "center",sorttype: "int"
		},
		 {name: '',index: 'czfs',align: "center",sorttype: "int"
		},
		 {name: '',index: 'zxzt',align: "center",sorttype: "float"
		},
		 {name: '',index: 'cz',align: "center",sorttype: "int"
		}],
		multiselect:true,
		rownumbers:true,
		autowidth:true,
		height:'auto',
		viewrecords:true,
		caption: '处置项目信息',
		rowNum:10,
	  	rowList:[10,20,30],
		jsonReader : {
			root:"rows",
			page: "page",
			total: "total",
			records: "records",
			repeatitems: false,
			id: "0"
		}
	});
 
	</script>
  </body>
</html>
