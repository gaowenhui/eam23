<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/stgl/checkJS.inc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<base href="<%=basePath %>"/>
<title>债权债务信息查询</title>
<script>
	
	$(function(){
	   if(window.parent.clearPanelTool){
					window.parent.clearPanelTool();
				}
		//添加按钮  "#gview_list > .ui-jqgrid-titlebar
		var buttonDebt = '[{"buttonHandler":"queryDebt","buttonIcon":"icon-search","buttonText":"查询"},\
									{"buttonHandler":"exportDebt","buttonIcon":"icon-save","buttonText":"导出"}\
		]';
		addButtons(jQuery("#gview_table_debt > .ui-jqgrid-titlebar"),buttonDebt);
		
		//添加按钮  "#gview_list > .ui-jqgrid-titlebar
		var buttonClaims = '[{"buttonHandler":"queryClaims","buttonIcon":"icon-search","buttonText":"查询"},\
									{"buttonHandler":"exportClaims","buttonIcon":"icon-save","buttonText":"导出"}\
		]';
		addButtons(jQuery("#gview_table_claims > .ui-jqgrid-titlebar"),buttonClaims);

	//页面刚加载时，设置表格的宽度
		jQuery("#table_claims").setGridWidth($("#tableWidth").width());
		jQuery("#table_debt").setGridWidth($("#tableWidth").width());
		$(window).bind('resize', function(){
			jQuery("#table_claims").setGridWidth($("#tableWidth").width());
			jQuery("#table_debt").setGridWidth($("#tableWidth").width());
		});
	});

	function stage(){
	   var index=document.getElementById("leixing").selectedIndex;
		if(index==0){
		   document.getElementById("tr_debt").style.display="none";
		   document.getElementById("tr_claims").style.display="block";
		   document.getElementById("div_debt").style.display="none";
		   document.getElementById("div_claims").style.display="block";
	   }else if(index==1){
		   document.getElementById("tr_debt").style.display="block";
		   document.getElementById("tr_claims").style.display="none";
		   document.getElementById("div_debt").style.display="block";
		   document.getElementById("div_claims").style.display="none";
	   }
	}

	function queryDebt(){
		//实体名称
		var stzwmc = document.getElementById("stzwmc").value;
		//债权债务类型
		var leixing = document.getElementById("leixing").value;
		//债权人名称
		var zqrmc = document.getElementById("zqrmc").value;
		//是否诉讼
		var sfss = document.getElementById("sfss").value;
		//债权期限
		var zqqxMin = document.getElementById("zqqxMin").value;
		var zqqxMax = document.getElementById("zqqxMax").value;
		//债务
		jQuery("#table_debt").setGridParam({
			postData:{
			'debtQueryVO.stzwmc':stzwmc,
			'debtQueryVO.leixing':leixing,
			'debtQueryVO.zqrmc':zqrmc,
			'debtQueryVO.sfss':sfss},
			url:"<%=basePath %>stgl/zhaiquanzhaiwu_query.do"
		}).trigger("reloadGrid") ;
	}
	function queryClaims(){
		//实体名称
		var stzwmc = document.getElementById("stzwmc").value;
		//债权债务类型
		var leixing = document.getElementById("leixing").value;
		//债务人名称
		var zwrmc = document.getElementById("zwrmc").value;
		//是否诉讼
		var sfss = document.getElementById("sfss").value;
		//债权期限
		var zqqxMin = document.getElementById("zqqxMin").value;
		var zqqxMax = document.getElementById("zqqxMax").value;
		//债权
		jQuery("#table_claims").setGridParam({
			postData:{
			'debtQueryVO.stzwmc':stzwmc,
			'debtQueryVO.leixing':leixing,
			'debtQueryVO.zwrmc':zwrmc,
			'debtQueryVO.sfss':sfss},
			url:"<%=basePath %>stgl/zhaiquanzhaiwu_query.do"
		}).trigger("reloadGrid") ;
	}
	
	// 债务信息excel导出 add by chenyuxiao
	function exportDebt(){
//		var urlStr = '<%=basePath %>stgl/zhaiquanzhaiwu_query.do';
		var urlStr = 'com.tansun.eam2.stgl.actions.NCEMClaimsDebtQueryAction&com.tansun.eam2.stgl.vo.DebtQueryVO';
		var stzwmc = document.getElementById("stzwmc").value;
		var leixing = document.getElementById("leixing").value;
		var zwrmc = document.getElementById("zwrmc").value;
		var sfss = document.getElementById("sfss").value;
		var zqqxMin = document.getElementById("zqqxMin").value;
		var zqqxMax = document.getElementById("zqqxMax").value;
		
		var params = "{\"debtQueryVO.stzwmc\":\"" + stzwmc + "\",";
			params += "\"debtQueryVO.leixing\":\"" + leixing + "\",";
			params += "\"debtQueryVO.zwrmc\":\"" + zwrmc + "\",";
			params += "\"debtQueryVO.sfss\":\"" + sfss + "\"}";
		exportExcel("table_debt", urlStr, params, '债务信息','rn,cb');
	}
	
	// 债权信息excel导出 add by chenyuxiao
	function exportClaims(){
//		var urlStr = '<%=basePath %>stgl/zhaiquanzhaiwu_query.do';
		var urlStr = 'com.tansun.eam2.stgl.actions.NCEMClaimsDebtQueryAction&com.tansun.eam2.stgl.vo.DebtQueryVO';
		var stzwmc = document.getElementById("stzwmc").value;
		var leixing = document.getElementById("leixing").value;
		var zqrmc = document.getElementById("zqrmc").value;
		var sfss = document.getElementById("sfss").value;
		var zqqxMin = document.getElementById("zqqxMin").value;
		var zqqxMax = document.getElementById("zqqxMax").value;
		var params = "{\"debtQueryVO.stzwmc\":\"" + stzwmc + "\",";
			params += "\"debtQueryVO.leixing\":\"" + leixing + "\",";
			params += "\"debtQueryVO.zqrmc\":\"" + zqrmc + "\",";
			params += "\"debtQueryVO.sfss\":\"" + sfss + "\"}";
		exportExcel("table_claims", urlStr, params, '债权信息','rn,cb');
	}
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="25" align="center" valign="bottom" class="td06"><table width="100%" border="0" cellspacing="3" cellpadding="0">
	      <tr>
	        <td width="14"><img src="<%=request.getContextPath() %>/resource/ProjectImages/index_32.gif" width="9" height="9"></td>
	        <td width="698" valign="middle" class="title">债权债务信息查询</td>
			<td width="585" align="right" valign="bottom" class="title"> </td>
	      </tr>
	    </table></td>
	  </tr>
	</table>
	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr>
	    <td  width="11%" class="td_form01">实体名称： </td>
	    <td  width="22%" class="td_form02"><s:textfield name="debtQueryVO.stzwmc"  id="stzwmc"  label=""/></td>
	    <td  width="11%" class="td_form01">债权（债务）类型：</td>
	    <td  width="22%" class="td_form02">
	    <s:select list="#{'0':'债权','1':'债务'}" name="debtQueryVO.leixing"  id="leixing"  onchange="stage();" />
	    </td>
	    <td  width="11%" class="td_form01">&nbsp;</td>
	    <td   class="td_form02">&nbsp;</td>
	  </tr>
	  <tr id="tr_debt" style="display: none">
	    <td class="td_form01">债权人名称:</td>
	    <td class="td_form02"><s:textfield name="debtQueryVO.zqrmc"  id="zqrmc"  label=""  onblur="checkChar(this);"/></td>
	    <td class="td_form01">是否诉讼：</td>
	    <td class="td_form02"> 
	    
	    	<s:select   list="#{'':'',0:'不诉讼',1:'诉讼'}"  name="staffQueryVO.sfss"  id="sfss"/> 
	     </td>
	    <td class="td_form01">债权期限（天）：</td>
		<td class="td_form02">从<s:textfield name="debtQueryVO.zqqxMin"  id="zqqxMin"  style='width:71'  label=""/>到<s:textfield name="debtQueryVO.zqqxMax"  id="zqqxMax"  style='width:71' label=""/></td>
	  </tr>
	  <tr>
	  <td>
    </tr>
     <tr id="tr_claims" style="display: block">
	    <td class="td_form01">债务人名称:</td>
	    <td class="td_form02"><s:textfield name="debtQueryVO.zwrmc"  id="zwrmc"  label=""  onblur="checkChar(this);"/></td>
	    <td class="td_form01">是否诉讼：</td>
	    <td class="td_form02"> 
	    
	    	<s:select   list="#{'':'',0:'不诉讼',1:'诉讼'}"  name="staffQueryVO.sfss"  id="sfss"/> 
	     </td>
	    <td class="td_form01">债权期限（天）：</td>
	    <td class="td_form02">从<s:textfield name="debtQueryVO.zqqxaMin"  id="debtQueryVO.zqqxMin"  style='width:71'  label=""/>到<s:textfield name="debtQueryVO.zqqxMax"  id="debtQueryVO.zqqxMax"  style='width:71' label=""/></td>
	  </tr>
	</table>
	
	<div id="tableWidth" name="tableWidth" width="100%"/>
	<div  id="div_debt" style="display:none">
		<table id="table_debt" ></table>
		<div id="toobar_debt" ></div>
	</div>
	<div  id="div_claims" style="display:block">
		<table id="table_claims" ></table>
		<div id="toobar_claims" ></div>
	</div>
	<%@ include file="/inc/exportExcel.inc"%>
	</body>
	</html>

<script type="text/javascript">
		jQuery("#table_debt").jqGrid({				
			datatype: "json",
		   	colNames:['id','实体名称','债权人名称','担保方式','抵押财产、保证人等说明','是否提起诉讼','是否提起诉讼','诉讼时效','债权期限（天）','债权金额（元）'],
		   	colModel:[
				{name:'id',index:'id',editable:false,hidden:true},
				{name:'stzwmc',index:'stmc',editable:false},
				{name:'zqrmc',index:'zqrmc',editable:false},
				{name:'dbfs',index:'dbfs',editable:false},
				{name:'bzrdsm',index:'bzrdsm',editable:false},
				{name:'sfss',index:'sfss',editable:false,hidden:true},
				{name:'sfValue',index:'sfValue'},
				{name:'sssx',index:'sssx',editable:false},
				{name:'zqqx',index:'zqqx',editable:false},
				{name:'zqje',index:'zqje',editable:false}
		   	],
		   	shrinkToFit:false,
			multiselect:true,
			rownumbers:true,
			autowidth:true,
		    height:'auto',
			pager:'toobar_debt',
			viewrecords:true,
			caption:'债务信息',
			footerrow : true, 
			userDataOnFooter : true,
			rowNum:10,
			prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
		  	rowList:[10,20,30],
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false
			}
		});
</script>

<script type="text/javascript">
		jQuery("#table_claims").jqGrid({				
			datatype: "json",
		   	colNames:['id','实体名称','债务人名称','担保方式','抵押财产、保证人等说明','是否提起诉讼','是否提起诉讼','诉讼时效','债权期限（天）','债权金额（元）'],
		   	colModel:[
				{name:'id',index:'id',editable:false,hidden:true},
				{name:'stzwmc',index:'stmc',editable:false},
				{name:'zwrmc'},
				{name:'dbfs'},
				{name:'bzrdsm'},
				{name:'sfss',index:'sfss',editable:false,hidden:true},
				{name:'sfValue',index:'sfValue',editable:false},
				{name:'sssx'},
				{name:'zqqx'},
				{name:'zqje'}
		   	],
		   	   	shrinkToFit:false,
				multiselect:true,
				rownumbers:true,
				autowidth:true,
		        height:'auto',
				pager:'toobar_claims',
				viewrecords:true,
				caption:'债权信息',
				footerrow : true, 
				userDataOnFooter : true,
				rowNum:10,
				prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
			  	rowList:[10,20,30],
			  jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false
			}
		});
</script>
