<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String basePath1 = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"";
	String zclx = (String)request.getParameter("zclx");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>核查评估</title>
<script type="text/javascript">
		function reloadGrida(){
			$("#xiugailishi").trigger("reloadGrid");
		}
</script>

		<script type="text/javascript">

			function querystring(){
			var kpbh = document.getElementById("kpbh").value;
			var hcpgnf = document.getElementById("hcpgnf").value;
			var zclx ="<%=zclx%>";
				jQuery("#endtask_list").setGridParam({
				url:"<%=basePath%>jygdzc/AssetQuery_queryExamine.do?zcId=${zcId}&sheettype2=${sheettype2}",
				postData:{'kpbh': kpbh,'hcpgnf':hcpgnf,'zclx':zclx
				}
				}).trigger("reloadGrid");
			}
		</script>
</head>
<body>
<form action='' name='form1' style='margin:0px; '>
<s:hidden name="zcId"  value="%{#request.zcId}"/>
<s:hidden name="sheettype" value="%{#request.sheettype}"/>

		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td class="td_page" width='1200px'>
					
						卡片编号     ：   <input type='text' id='kpbh' size='40'>     核查评估年份     ：   <input type='text' id='hcpgnf' size='40'>
						<input name="" type="button" value="  查询  " onclick='querystring()'><input name="" type="button" value="  重置  " onclick='form1.reset();querystring()' >
				
						</tr>
			</table>
		<table id="endtask_list" align="center" ></table>
		<div id="pgtoolbar1"></div>
</form>
</body>
		<script type="text/javascript">
			jQuery("#endtask_list").setGridWidth($("#table1").width());
		$(window).bind('resize', function(){
			jQuery("#endtask_list").setGridWidth($("#table1").width());
		});
		
				jQuery("#endtask_list").jqGrid({				
					//url:"<%=basePath%>jygdzc/AssetManageBody_queryWorkFlow.do?zcId=${zcId}&sheettype=${sheettype}",
					//url:"<%=basePath%>end/userEnd_queryString.do?subSystem",
					datatype: "json",
					//mtype:"POST",
				   	colNames:['id','zclx','卡片编号','卡片名称','核查评估年份'],
				   	colModel:[
				   		{name:'id',align:'center',index:'id',hidden:true},
				   		{name:'zclx',align:'center',index:'zclx',hidden:true},
				   		{name:'kpbh',width:'100px',align:'center',index:'kpbh'},		
				   		{name:'kpmc',align:'center',width:'100px',align:'center',index:'userId'},
				   		{name:'hcpgnf',align:'center',width:'120px',index:'hcpgnf'}
				   	],
				   	pager:'pgtoolbar1',
				   	prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
					multiselect:false,
					rownumbers:true,
					autowidth:true,
					height:'auto',
					viewrecords:true,
					caption: '核查评估信息',
					jsonReader : {
						root:"rows",
						page: "page",
						total: "total",
						records: "records",
						repeatitems: false,
						id: "0"
					},
					ondblClickRow:function(gr){
							look(gr);
					}
				});
				function show(gr){
						window.open(gr,'_blank','height=600, width=1100, top=50, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				}
				function look(gr){
						var zclx =  jQuery("#endtask_list").getCell(gr,'zclx');
						var url="<%=basePath%>jygdzc/AssetQuery_viewExamine.do?zclx="+zclx+"&hcpgId="+gr;
						window.open(url,'_blank','height=600, width=1100, top=50, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				}
   </script>