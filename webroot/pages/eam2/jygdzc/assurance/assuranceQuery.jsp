<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>保单查询</title>
<SCRIPT language=JavaScript type=text/JavaScript>
	$(function(){
		if(window.parent.clearPanelTool){
			window.parent.clearPanelTool();
		}
	})
  var idStr = new Array();
	function stage(){
		var index=document.getElementById("select_asset").selectedIndex
		if(index==2||index==""){
			document.getElementById("tr_1").style.display="none"
			document.getElementById("tr_2").style.display="none"
		}
		else{
			document.getElementById("tr_1").style.display="block"
			document.getElementById("tr_2").style.display="block"
		}
	}
	function view() {
				var gr = jQuery("#purchase_list").getGridParam('selarrrow');
				if (gr.length == 0){
					alert("请选择要查看的记录!");
				}else if(gr.length > 1){	
					alert("一次只能查看一条记录")
				}else{
					var headId  = jQuery("#purchase_list").getCell(gr,'id');
					var Url = 'zltb/IntentionQuery_findPTEndByHeadId.do?headId='+headId;
					$.post(Url,{ 
						"headId":""+headId+""
						},function(data){
							if(data!="0"){
								gr = ""+data+"";
								var url ='zltbWorkflow/zltbWorkflow_endView.do?view=true&id='+gr;
								url = encodeURIComponent(url);
								url = basePathJs + 'index.do?urlPortal=' + url;
								window.open(url,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
							}else{
								alert("此条租赁信息在办结数据列表中已被删除");
							}
					});
				}
				return false;
		};
		function view1(headId) {
			var Url = 'zltb/IntentionQuery_findPTEndByHeadId.do?headId='+headId;
			$.post(Url,{ 
				"headId":""+headId+""
				},function(data){
					if(data!="0"){
						gr = ""+data+"";
						var url ='zltbWorkflow/zltbWorkflow_endView.do?view=true&id='+gr;
						url = encodeURIComponent(url);
						url = basePathJs + 'index.do?urlPortal=' + url;
						window.open(url,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
					}else{
						alert("此条租赁信息在办结数据列表中已被删除");
					}
			});
			return false;
		};
	jQuery("#purchase_list").setGridWidth($("#table").width());
 		$(window).bind('resize', function(){
		jQuery("#purchase_list").setGridWidth($("#table").width());
	});	
</SCRIPT>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<table width="100%" border="0"  id="table" class="newtable" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td class="td_ylp01">标题：</td>
		<td class="td_ylp02"><s:textfield id="biaoti" /></td>
		<td class="td_ylp01">编号：</td>
		<td class="td_ylp03"><s:textfield id="bianhao" /></td>
		<td class="td_ylp01">资产所属地区：</td>
		<td class="td_ylp02">
		<e:select parRefKey="PROVIENCE" headerKey="" headerValue="请选择"  id="czcdq"  list="#{}" />
		</td>
		
  	</tr>
	<tr id="tr_1" > <!--  style="display:none" -->
		<td class="td_ylp01">资产编号：</td>
		<td class="td_ylp02"><s:textfield id="zcbh" /></td>
		<td class="td_ylp01">资产名称：</td>
		<td class="td_ylp03"><s:textfield id="zcmc" /></td>
		<td class="td_ylp01">车辆牌号：</td>
		<td class="td_ylp02">
	  		<s:textfield name="clph"  id="clph"  />
	  	</td>
		
 	</tr>
 	<tr id="tr_2" >
		<td class="td_ylp01">主卡片编号：</td>
		<td class="td_ylp02"><s:textfield id="cardcode" /></td>
		<td class="td_ylp01">主卡片名称：</td>
		<td class="td_ylp03" ><s:textfield id="zcname" /></td>
		<td class="td_ylp01">卡片一级分行：</td>
		<td class="td_ylp02" >
			<e:select parRefKey="ENTITY_TRADE" parentId="438" headerKey="" headerValue="" list="#{}" id="firstbranch"/>
	  	</td>
	</tr>
	<tr>
		<td  colspan="6" class="td_form01">
				<input name="Submit2" type="button"  value="查询" onclick="query()" />
				
				
				<input name="Submit3" type="button"  value="重置"
							onClick="javascript:window.location.reload();" />
		</td>
	</tr>
</table>

<table  class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td align="right">
			<table id="purchase_list"></table>
		  	<div id="pgtoolbar1"></div>
		</td>
  	</tr>
</table>
<%@ include file="/inc/exportExcel.inc"%>
</body>
</html>

<script type="text/javascript">
	jQuery("#purchase_list").jqGrid({       
		//url:'<%=basePath%>zltb/IntentionQuery_query4insurance.do',
		datatype: "json",
		//mtype:"POST", 
		colNames: ['id','标题','编号', '资产编号','资产名称','地区','主卡片编号','主卡片名称','卡片一级分行','车辆牌号'],
		colModel: [
			{name: 'id',index: 'id',align: "center",hidden: true},
			{name: 'biaoti',index: 'biaoti',align: "center",width:100},
			{name: 'bianhao',index: 'bianhao',align: "center",width:100},
			{name: 'zcbh',index: 'zcbh',align: "center",width:100},
			{name: 'zcmc',index: 'zcmc',align: "center",width:100},
			{name: 'czcdq',index: 'czcdq',align: "center",width:100},
			{name: 'cardcode',index: 'cardcode',align: "center",width:100},
			{name: 'zcname',index: 'zcname',align: "center",width:100},
			{name: 'firstbranch',index: 'firstbranch',align: "center",width:100},
			{name: 'clph',index: 'clph',align: "center",width:100}
		],
		loadComplete:function(data){
			if(data && data.rows.length>0){
				jQuery("#purchase_list").setGridHeight(data.rows.length * 22 + 18);
			}else{
				jQuery("#purchase_list").setGridHeight(0);
			}
		},
		shrinkToFit:false,
		multiselect:true,
		pager:'pgtoolbar1',
		rownumbers:true,
		autowidth:true,
		height:'auto',
		viewrecords:true,
		caption: '保单查询',
		rowNum:10,
		prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
	  	rowList:[10,20,30],
	  	ondblClickRow:function(gr){
	  		var id  = jQuery("#purchase_list").getCell(gr,'id');
			view1(id);
		},
     onSelectRow: function(rowid, status){
			if(status){
				idStr.insert(idStr.length, rowid);
			}else{
				idStr.remove(rowid);
			}
		},
		onSelectAll:function(ids, status){
			if(status){
				for(var i = 0; i < ids.length; i++){
					if(ids[i] != null && ids[i].length != 0){
						var index = idStr.indexOf(ids[i]);
						if(index == -1){
							idStr.insert(idStr.length, ids[i]);
						}
					}
				}
			}else{
				for(var i = 0; i < ids.length; i++){
					if(ids[i] != null && ids[i].length != 0){
						var index = idStr.indexOf(ids[i]);
						if(index != -1){
							idStr.removeAt(index);
						}
					}
				}
			}
		},
		gridComplete:function(){
			var allIds = jQuery("#purchase_list").jqGrid('getDataIDs');
			for(var i = 0; i < allIds.length; i++){
				var index = idStr.indexOf(allIds[i]);
				if(index != -1){
					idStr.removeAt(index);
					jQuery("#purchase_list").setSelection(allIds[i]);
				}
			}
		},
		jsonReader : {
			root:"rows",
			page: "page",
			total: "total",
			records: "records",
			repeatitems: false,
			id: "3"
		}
	});
	
	// 添加按钮
	$(document).ready(function(){	
		var buttonJSonString = '[{"buttonHandler":"view","buttonIcon":"icon-search","buttonText":"查看"},\
								{"buttonHandler":"excel","buttonIcon":"icon-redo","buttonText":"条件导出"},\
								{"buttonHandler":"query4Select","buttonIcon":"icon-redo","buttonText":"勾选导出"}\
								]';
		addButtons(jQuery("#gview_purchase_list > .ui-jqgrid-titlebar"),buttonJSonString);
	});
	
	// 查询
	function query(){
		var biaoti = document.getElementById("biaoti").value;//标题
		var bianhao = document.getElementById("bianhao").value; //编号
		var clph = document.getElementById("clph").value; //车辆牌号
		var czcdq = document.getElementById("czcdq").value;//地区
		var zcbh = document.getElementById("zcbh").value; //资产编号
		var zcmc = document.getElementById("zcmc").value;//资产名称
		var cardcode = document.getElementById("cardcode").value;//资产名称
		var zcname = document.getElementById("zcname").value;//贷款账号
		var firstbranch = document.getElementById("firstbranch").value;//审核风险等级
		jQuery("#purchase_list").setGridParam({
			url:'<%=basePath%>zltb/IntentionQuery_query4insurance.do',
			postData:{
			'assQueryVO.biaoti' : biaoti,
			'assQueryVO.bianhao' : bianhao,
			'assQueryVO.czcdq' : czcdq,
			'assQueryVO.clph' : clph,
			'assQueryVO.zcbh' : zcbh,
			'assQueryVO.zcmc' : zcmc,
			'assQueryVO.cardcode' : cardcode,
			'assQueryVO.zcname' : zcname,
			'assQueryVO.firstbranch' : firstbranch
		}}).trigger("reloadGrid");
	}
	
	// excel导出
	function excel(){
		var urlStr ="com.tansun.eam2.jygdzc.action.AssuranceQueryAction&com.tansun.eam2.jygdzc.vo.AssuranceQueryVO"
	   // var urlStr = '<%=basePath%>zltb/IntentionQuery_query4insurance.do';
		var biaoti = document.getElementById("biaoti").value;//标题
		var bianhao = document.getElementById("bianhao").value; //编号
		var clph = document.getElementById("clph").value; //车辆牌号
		var czcdq = document.getElementById("czcdq").value;//地区
		var zcbh = document.getElementById("zcbh").value; //资产编号
		var zcmc = document.getElementById("zcmc").value;//资产名称
		var cardcode = document.getElementById("cardcode").value;//资产名称
		var zcname = document.getElementById("zcname").value;//贷款账号
		var firstbranch = document.getElementById("firstbranch").value;//审核风险等级
	    var cp = jQuery("#purchase_list").getGridParam('page');
	    var ps = jQuery("#purchase_list").getGridParam('rowNum');
	    var params = "{\"assQueryVO.biaoti\":\"" + biaoti + "\",";
			params += "\"assQueryVO.bianhao\":\"" + bianhao + "\",";
			params += "\"assQueryVO.clph\":\"" + clph + "\",";
			params += "\"assQueryVO.czcdq\":\"" + czcdq + "\",";
			params += "\"assQueryVO.zcbh\":\"" + zcbh + "\",";
			params += "\"assQueryVO.zcmc\":\"" + zcmc + "\",";
			params += "\"assQueryVO.cardcode\":\"" + cardcode + "\",";
			params += "\"assQueryVO.zcname\":\"" + zcname + "\",";
			params += "\"assQueryVO.firstbranch\":\"" + firstbranch + "\"}";
			//params += "\"paginator.currentPage\":\"" + 1 + "\",";
			//params += "\"paginator.pageSize\":\"" + 10000000 + "\"}";
		exportExcel("purchase_list", urlStr, params, '保单列表','rn,cb');
	}
	function query4Select(){
		if(idStr!=null && idStr.length >= 1&&""!=idStr){
		    var urlStr ="<%=basePath%>zltb/IntentionQuery_query4Select.do";
			var params = "{\"idStr\":\"" + idStr + "\"}";
			exportExcel("purchase_list", urlStr, params, '保单列表','rn,cb');
		}else{
			alert("请先选择数据");
		}
	}
</script>
