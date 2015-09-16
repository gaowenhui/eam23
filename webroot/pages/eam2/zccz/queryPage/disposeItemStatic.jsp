<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String kp = (String)request.getAttribute("kp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>处置项目查询</title>
</head>
<s:form>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="getFS(1)">
<br><div align="center">
<span class="STYLE7 STYLE1">处置项目审批及执行情况统计表</span>
</div><br>
	
<table id="conditions" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
	<tr>
		<td class="td_zxy01">拟稿部门：</td>
		<td class="td_zxy02"><s:textfield id="nigaobumen" size="30" cssClass="input" /></td>
		<td class="td_zxy01">拟稿人：</td>
		<td class="td_zxy02"><s:textfield id="nigaoren" size="30" cssClass="input" /></td>
	</tr> 
	<tr>
		<td class="td_zxy01">项目名称：</td>
		<td class="td_zxy02"><s:textfield id="xiangmumingcheng" cssClass="input" /></td>
		<td class="td_zxy01">项目状态：</td>
		<td class="td_zxy02">
		<s:select list="#{'':'','0':'处置方案未执行','1':'处置方案执行中','2':'已结案'}" id="xiangmuzhuangtai" cssClass="input"/>
		</td>
	</tr>	
	<tr>
		<td class="td_zxy01">处置类型：</td>
		<td class="td_zxy02"><s:select list="#{'1':'通用资产处置','0':'实体整体处置','2':'实体人员安置'}" onchange="getFS(this.value)" id="chuzhileibie" cssClass="input"/></td>
		<td class="td_zxy01">处置方式：</td>
		<td class="td_zxy02"><select id="chuzhifangshi" cssClass="input"><option></option></select></td>
	</tr>
	<tr>
		<td class="td_zxy01">申报日期&nbsp;从：</td>
		<td class="td_zxy02"><s:textfield id="sbrqc"  name="sbrqc"  cssClass="input"  /></td>
		<td class="td_zxy01">到：</td>
		<td class="td_zxy02"><s:textfield id="sbrqd" name="sbrqd" cssClass="input" /></td>
	</tr>
	
	<tr>
		<td class="td_zxy01">会议次数</td>
		<td class="td_zxy02"><s:textfield id="hycs" name="hycs" cssClass="input"  /></td>
		<td class="td_zxy01">受理序号</td>
		<td class="td_zxy02"><s:textfield id="slxh" name="slxh" cssClass="input"  /></td>
	</tr>
	
	<tr>
		<td class="td_form01" colspan="6">
			<input type="button" value="查询" class="buttonface" onclick="query();"/>
			<s:reset value="重置" cssClass="buttonface"></s:reset>
		</td>
	</tr> 
</table>
	
<table id="tongji_list" width="100%"></table>
<div id="pgtoolbar1"></div>
</body>
</s:form>
<%@ include file="/inc/exportExcel.inc"%>
</html>
<script type="text/javascript">
	jQuery("#tongji_list").jqGrid({
		datatype:"json",
		colNames:['id','编号','卡片总数量','拟稿部门','拟稿人','项目名称','受理序号','处置方式','资产类型','原值','净值','评估价值','建议处置收入','预计处置费用','预计损失','会议次数','审批结论','项目状态','实际回收','实际处置费用','申报日期'],
		colModel:[
		    {name:'id',index:'id',align:"center",hidden:true,width:100},
			{name:'cldbianhao',index:'cldbianhao',align:"center",width:100},
			{name:'kpzsl',index:'kpzsl',align:"center",width:100},
			{name:'cldngbm',index:'cldngbm',align:"center",width:100},
			{name:'cldngr',index:'cldngr',align:"center",width:100},
			{name:'czxmmc',index:'czxmmc',align:"center",width:100},
			{name:'slxh',index:'slxh',align:"center",width:100},
			{name:'cldczfs',index:'cldczfs',align:"center",width:100},
			{name:'cldczzclb',index:'cldczzclb',align:"center",width:100},
			{name:'cldyz',index:'cldyz',formatter:'number',align:"center",width:100},
			{name:'cldjz',index:'cldjz',formatter:'number',align:"center",width:100},
			{name:'cldje',index:'cldje',formatter:'number',align:"center",width:100},
			{name:'cldyjczsr',index:'cldyjczsr',formatter:'number',align:"center",width:185},
			{name:'cldyjczfy',index:'cldyjczfy',formatter:'number',align:"center",width:185},
			{name:'cldyjss',index:'cldyjss',formatter:'number',align:"center",width:100},
			{name:'hycs',index:'hycs',align:"center",width:100},
			{name:'spjl',index:'spjl',align:"center",width:100},
			{name:'zhuangtai',index:'zhuangtai',align:"center",width:100},
			{name:'sjhs',index:'sjhs',align:"center",width:100},
			{name:'sjczfy',index:'sjczfy',align:"center",width:190},
			{name:'sbrq',index:'sbrq',align:"center",width:190}
		],
		multiselect:true,
		rownumbers:true,
		autowidth:true,
		height:'auto',
		pager:'pgtoolbar1',
		viewrecords:true,
		caption:'处置项目列表 (单位：元)',
		rowNum:10,
		prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
	  	rowList:[10,20,30],
		jsonReader:{
			root:"rows",
			page:"page",
			total:"total",
			records:"records",
			repeatitems:false,
			id:"0"
		},
		ondblClickRow:function(gr){
			var id  = jQuery("#tongji_list").getCell(gr,'id');
			lookItemInfo(id);
		},
		loadComplete:function(data){			
			if(data != null && data.rows.length>0){
				jQuery("#tongji_list").setGridHeight(data.rows.length * 22 + 18);	
			}else{
				jQuery("#tongji_list").setGridHeight(0);
			}		
		},			
		shrinkToFit:false
	});   
	
	// 日期转换
	$(function(){
		$("#sbrqc,#sbrqd").datebox({
			formatter:function(date){
				return formatDate(date);
			}
		});
	});
	
	//双击事件
	function lookItemInfo(itemLsbId){
		window.open('<%=basePath %>zccz/dealTrace1Head_viewCzItemInfo.do?flag=disposeItemInfo&itemLsbId='+itemLsbId);
	}
				
	// 查询
	function query(){
		var sbrqc = document.getElementById("sbrqc").value;
		var sbrqd = document.getElementById("sbrqd").value;
		var nigaobumen = document.getElementById("nigaobumen").value;
		var nigaoren = document.getElementById("nigaoren").value;
		var xiangmumingcheng = document.getElementById("xiangmumingcheng").value;
		var chuzhifangshi = document.getElementById("chuzhifangshi").value;
		var xiangmuzhuangtai = document.getElementById("xiangmuzhuangtai").value;
		var chuzhileibie = document.getElementById("chuzhileibie").value;
		var hycs = document.getElementById("hycs").value;
		var slxh = document.getElementById("slxh").value;
		jQuery("#tongji_list").setGridParam({postData:{
			'queryVO.nigaobumen' : nigaobumen,
			'queryVO.nigaoren' : nigaoren,
			'queryVO.xiangmumingcheng' : xiangmumingcheng,
			'queryVO.chuzhifangshi' : chuzhifangshi,
			'queryVO.xiangmuzhuangtai' : xiangmuzhuangtai,
			'queryVO.sbrqc' : sbrqc,
			'queryVO.sbrqd' : sbrqd,
			'queryVO.hycs' : hycs,
			'queryVO.chuzhileibie' : chuzhileibie,
			'queryVO.slxh' : slxh
			
		},
		url:"<%=basePath%>zccz/disposeItemStatic_query.do"
		}).trigger("reloadGrid");
	} 
	function tongji(){
		var sbrqc = document.getElementById("sbrqc").value;
		var sbrqd = document.getElementById("sbrqd").value;
		var nigaobumen = document.getElementById("nigaobumen").value;
		var nigaoren = document.getElementById("nigaoren").value;
		var xiangmumingcheng = document.getElementById("xiangmumingcheng").value;
		var chuzhifangshi = document.getElementById("chuzhifangshi").value;
		var xiangmuzhuangtai = document.getElementById("xiangmuzhuangtai").value;
		var chuzhileibie = document.getElementById("chuzhileibie").value;
		var hycs = document.getElementById("hycs").value;
		var slxh = document.getElementById("slxh").value;
		
		$.post("<%=basePath%>zccz/disposeItemStatic_querykp.do",
						{
							'queryVO.nigaobumen' : nigaobumen,
							'queryVO.nigaoren' : nigaoren,
							'queryVO.xiangmumingcheng' : xiangmumingcheng,
							'queryVO.chuzhifangshi' : chuzhifangshi,
							'queryVO.xiangmuzhuangtai' : xiangmuzhuangtai,
							'queryVO.sbrqc' : sbrqc,
							'queryVO.sbrqd' : sbrqd,
							'queryVO.hycs' : hycs,
							'queryVO.chuzhileibie' : chuzhileibie,
							'queryVO.slxh' : slxh
						},function(data){
							alert("卡片总数量为:"+ data );
					});
	}
	$(document).ready(function(){	
		var buttonJSonString = '[{"buttonHandler":"excel","buttonIcon":"icon-redo","buttonText":"导出"},\
								{"buttonHandler":"tongji","buttonIcon":"icon-redo","buttonText":"统计"}\
		]';
		addButtons(jQuery("#gview_tongji_list > .ui-jqgrid-titlebar"),buttonJSonString);
		window.parent.clearPanelTool();
	});
	
	// excel导出
	function excel(){
	    //var urlStr = "<%=basePath%>zccz/disposeItemStatic_query.do";
		var urlStr = "com.tansun.eam2.zccz.action.DisposeItemStaticAction&com.tansun.eam2.zccz.vo.DisposeItemStaticVO";	    
	    var nigaobumen = document.getElementById("nigaobumen").value;
		var nigaoren = document.getElementById("nigaoren").value;
		var xiangmumingcheng = document.getElementById("xiangmumingcheng").value;
		var chuzhifangshi = document.getElementById("chuzhifangshi").value;
		var sbrqc = document.getElementById("sbrqc").value;
		var sbrqd = document.getElementById("sbrqd").value;
		var xiangmuzhuangtai = document.getElementById("xiangmuzhuangtai").value;
		var chuzhileibie = document.getElementById("chuzhileibie").value;
		var hycs = document.getElementById("hycs").value;
	 	var params = "{\"queryVO.nigaobumen\":\"" + nigaobumen + "\",";
			params += "\"queryVO.nigaoren\":\"" + nigaoren + "\",";
			params += "\"queryVO.xiangmumingcheng\":\"" + xiangmumingcheng + "\",";
			params += "\"queryVO.chuzhifangshi\":\"" + chuzhifangshi + "\",";
			params += "\"queryVO.xiangmuzhuangtai\":\"" + xiangmuzhuangtai + "\",";
			params += "\"queryVO.sbrqc\":\"" + sbrqc + "\",";
			params += "\"queryVO.sbrqd\":\"" + sbrqd + "\",";
			params += "\"queryVO.hycs\":\"" + hycs + "\",";
			params += "\"queryVO.chuzhileibie\":\"" + chuzhileibie + "\",";
			params += "\"paginator.currentPage\":\"" + 1 + "\",";
			params += "\"paginator.pageSize\":\"" + 1000000 + "\"}";
		exportExcel("tongji_list", urlStr, params, '处置项目列表','rn,cb');
	}
			
	function view() {
		var gr = jQuery("#tongji_list").jqGrid('getGridParam','selarrrow');
		if (gr.length == 0){
			alert("请选择一条记录");
		}else if(gr.length > 1){	
			alert("请选择一条记录");
		}else{
			window.open('<%=basePath%>jygdzc/AssetManageBody_viewAsset.do?sheettype=assetXxInfo&zcId='+gr,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
		}
		return false;
	};
				
	function lookAsset(gr){
		window.open('<%=basePath%>jygdzc/AssetManageBody_viewAsset.do?sheettype=assetXxInfo&zcId='+gr,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
	}    
	
	function getFS(leibie){
		if(leibie == 2) {
			$("#chuzhifangshi").html("<option>--请选择--</option>");
		} else {
			var url = "<%=request.getContextPath()%>/zccz/disposeItemStatic_findCZFS.do";
			$.post(url,{"leibie" : leibie},function(returnStr){
				var returnObj = eval('(' + returnStr + ')');
				if(returnObj.yds.length>=1){
					$("#chuzhifangshi").html("<option>--请选择--</option>");
					for(var i=0; i<returnObj.yds.length; i++){
						$("#chuzhifangshi").append("<option value='" + returnObj.yds[i].ydid + "'>" + returnObj.yds[i].ydtext + "</option>");
					}
				}
			});
		}
	}         
</script>