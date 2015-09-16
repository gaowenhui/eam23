<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/stgl/checkJS.inc" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<base href="<%=basePath %>"/>
<title>资产信息查询</title>
<script>
function stage(){
   var index=document.getElementById("stnzcfl").selectedIndex;
	if(index==0){
	   document.getElementById("table_all_div").style.display="block";
	   document.getElementById("tr_cash").style.display="none";
	   document.getElementById("table_cash_div").style.display="none";
	   document.getElementById("tr_land").style.display="none";
	   document.getElementById("table_land_div").style.display="none";
	   document.getElementById("tr_house").style.display="none";
	   document.getElementById("table_house_div").style.display="none";
	   document.getElementById("tr_machine").style.display="none";
	   document.getElementById("table_machine_div").style.display="none";
	   document.getElementById("tr_transportation").style.display="none";
	   document.getElementById("table_transportation_div").style.display="none";
	   document.getElementById("tr_investment").style.display="none";
	   document.getElementById("table_investment_div").style.display="none";
	   document.getElementById("tr_other").style.display="none";
	   document.getElementById("table_other_div").style.display="none";
   }else if(index==1){
	   document.getElementById("table_all_div").style.display="none";
	   document.getElementById("tr_cash").style.display="block";
	   document.getElementById("table_cash_div").style.display="block";
	   document.getElementById("tr_land").style.display="none";
	   document.getElementById("table_land_div").style.display="none";
	   document.getElementById("tr_house").style.display="none";
	   document.getElementById("table_house_div").style.display="none";
	   document.getElementById("tr_machine").style.display="none";
	   document.getElementById("table_machine_div").style.display="none";
	   document.getElementById("tr_transportation").style.display="none";
	   document.getElementById("table_transportation_div").style.display="none";
	   document.getElementById("tr_investment").style.display="none";
	   document.getElementById("table_investment_div").style.display="none";
	   document.getElementById("tr_other").style.display="none";
	   document.getElementById("table_other_div").style.display="none";
   }else if(index==2){
	   document.getElementById("table_all_div").style.display="none";
	   document.getElementById("tr_cash").style.display="none";
	   document.getElementById("table_cash_div").style.display="none";
	   document.getElementById("tr_land").style.display="block";
	   document.getElementById("table_land_div").style.display="block";
	   document.getElementById("tr_house").style.display="none";
	   document.getElementById("table_house_div").style.display="none";
	   document.getElementById("tr_machine").style.display="none";
	   document.getElementById("table_machine_div").style.display="none";
	   document.getElementById("tr_transportation").style.display="none";
	   document.getElementById("table_transportation_div").style.display="none";
	   document.getElementById("tr_investment").style.display="none";
	   document.getElementById("table_investment_div").style.display="none";
	   document.getElementById("tr_other").style.display="none";
	   document.getElementById("table_other_div").style.display="none";
   }else if(index==3){
	   document.getElementById("table_all_div").style.display="none";
	   document.getElementById("tr_cash").style.display="none";
	   document.getElementById("table_cash_div").style.display="none";
	   document.getElementById("tr_land").style.display="none";
	   document.getElementById("table_land_div").style.display="none";
	   document.getElementById("tr_house").style.display="block";
	   document.getElementById("table_house_div").style.display="block";
	   document.getElementById("tr_machine").style.display="none";
	   document.getElementById("table_machine_div").style.display="none";
	   document.getElementById("tr_transportation").style.display="none";
	   document.getElementById("table_transportation_div").style.display="none";
	   document.getElementById("tr_investment").style.display="none";
	   document.getElementById("table_investment_div").style.display="none";
	   document.getElementById("tr_other").style.display="none";
	   document.getElementById("table_other_div").style.display="none";
   }else if(index==4){
	   document.getElementById("table_all_div").style.display="none";
	   document.getElementById("tr_cash").style.display="none";
	   document.getElementById("table_cash_div").style.display="none";
	   document.getElementById("tr_land").style.display="none";
	   document.getElementById("table_land_div").style.display="none";
	   document.getElementById("tr_house").style.display="none";
	   document.getElementById("table_house_div").style.display="none";
	   document.getElementById("tr_machine").style.display="block";
	   document.getElementById("table_machine_div").style.display="block";
	   document.getElementById("tr_transportation").style.display="none";
	   document.getElementById("table_transportation_div").style.display="none";
	   document.getElementById("tr_investment").style.display="none";
	   document.getElementById("table_investment_div").style.display="none";
	   document.getElementById("tr_other").style.display="none";
	   document.getElementById("table_other_div").style.display="none";
   }else if(index==5){
	   document.getElementById("table_all_div").style.display="none";
	   document.getElementById("tr_cash").style.display="none";
	   document.getElementById("table_cash_div").style.display="none";
	   document.getElementById("tr_land").style.display="none";
	   document.getElementById("table_land_div").style.display="none";
	   document.getElementById("tr_house").style.display="none";
	   document.getElementById("table_house_div").style.display="none";
	   document.getElementById("tr_machine").style.display="none";
	   document.getElementById("table_machine_div").style.display="none";
	   document.getElementById("tr_transportation").style.display="block";
	   document.getElementById("table_transportation_div").style.display="block";
	   document.getElementById("tr_investment").style.display="none";
	   document.getElementById("table_investment_div").style.display="none";
	   document.getElementById("tr_other").style.display="none";
	   document.getElementById("table_other_div").style.display="none";
   }else if(index==6){
	   document.getElementById("table_all_div").style.display="none";
	   document.getElementById("tr_cash").style.display="none";
	   document.getElementById("table_cash_div").style.display="none";
	   document.getElementById("tr_land").style.display="none";
	   document.getElementById("table_land_div").style.display="none";
	   document.getElementById("tr_house").style.display="none";
	   document.getElementById("table_house_div").style.display="none";
	   document.getElementById("tr_machine").style.display="none";
	   document.getElementById("table_machine_div").style.display="none";
	   document.getElementById("tr_transportation").style.display="none";
	   document.getElementById("table_transportation_div").style.display="none";
	   document.getElementById("tr_investment").style.display="block";
	   document.getElementById("table_investment_div").style.display="block";
	   document.getElementById("tr_other").style.display="none";
	   document.getElementById("table_other_div").style.display="none";
   }else if(index==7){
	   document.getElementById("table_all_div").style.display="none";
	   document.getElementById("tr_cash").style.display="none";
	   document.getElementById("table_cash_div").style.display="none";
	   document.getElementById("tr_land").style.display="none";
	   document.getElementById("table_land_div").style.display="none";
	   document.getElementById("tr_house").style.display="none";
	   document.getElementById("table_house_div").style.display="none";
	   document.getElementById("tr_machine").style.display="none";
	   document.getElementById("table_machine_div").style.display="none";
	   document.getElementById("tr_transportation").style.display="none";
	   document.getElementById("table_transportation_div").style.display="none";
	   document.getElementById("tr_investment").style.display="none";
	   document.getElementById("table_investment_div").style.display="none";
	   document.getElementById("tr_other").style.display="block";
	   document.getElementById("table_other_div").style.display="block";
	   }else {}
}
$(function(){
    
    if(window.parent.clearPanelTool){
			window.parent.clearPanelTool();
		}
	//添加按钮  "#gview_list > .ui-jqgrid-titlebar
	var buttonallAllAsset = '[{"buttonHandler":"queryAllAsset","buttonIcon":"icon-search","buttonText":"查询"},\
								{"buttonHandler":"exportAllAsset","buttonIcon":"icon-save","buttonText":"导出"}\
	]';
	addButtons(jQuery("#gview_table_all > .ui-jqgrid-titlebar"),buttonallAllAsset);
	
	//添加按钮，现金  "#gview_list > .ui-jqgrid-titlebar
	var buttonCash = '[{"buttonHandler":"queryCash","buttonIcon":"icon-search","buttonText":"查询"},\
								{"buttonHandler":"exportCash","buttonIcon":"icon-save","buttonText":"导出"}\
	]';
	addButtons(jQuery("#gview_table_cash > .ui-jqgrid-titlebar"),buttonCash);
	
	//添加按钮，土地  "#gview_list > .ui-jqgrid-titlebar
	var buttonallLand = '[{"buttonHandler":"queryLand","buttonIcon":"icon-search","buttonText":"查询"},\
								{"buttonHandler":"exportLand","buttonIcon":"icon-save","buttonText":"导出"}\
	]';
	addButtons(jQuery("#gview_table_land > .ui-jqgrid-titlebar"),buttonallLand);
	
	//添加按钮，房屋  "#gview_list > .ui-jqgrid-titlebar
	var buttonHouse = '[{"buttonHandler":"queryHouse","buttonIcon":"icon-search","buttonText":"查询"},\
								{"buttonHandler":"exportHouse","buttonIcon":"icon-save","buttonText":"导出"}\
	]';
	addButtons(jQuery("#gview_table_house > .ui-jqgrid-titlebar"),buttonHouse);
	
	//添加按钮，机器设备  "#gview_list > .ui-jqgrid-titlebar
	var buttonMachine = '[{"buttonHandler":"queryMachine","buttonIcon":"icon-search","buttonText":"查询"},\
								{"buttonHandler":"exportMachine","buttonIcon":"icon-save","buttonText":"导出"}\
	]';
	addButtons(jQuery("#gview_table_machine > .ui-jqgrid-titlebar"),buttonMachine);
	
	//添加按钮，交通工具  "#gview_list > .ui-jqgrid-titlebar
	var buttonTransportation = '[{"buttonHandler":"queryTransportation","buttonIcon":"icon-search","buttonText":"查询"},\
								{"buttonHandler":"exportTransportation","buttonIcon":"icon-save","buttonText":"导出"}\
	]';
	addButtons(jQuery("#gview_table_transportation > .ui-jqgrid-titlebar"),buttonTransportation);
			
	//添加按钮，对外投资 "#gview_list > .ui-jqgrid-titlebar
	var buttonInvestment= '[{"buttonHandler":"queryInvestment","buttonIcon":"icon-search","buttonText":"查询"},\
								{"buttonHandler":"exportInvestment","buttonIcon":"icon-save","buttonText":"导出"}\
	]';
	addButtons(jQuery("#gview_table_investment > .ui-jqgrid-titlebar"),buttonInvestment);
	
	//添加按钮,其他  "#gview_list > .ui-jqgrid-titlebar
	var buttonOther = '[{"buttonHandler":"queryOther","buttonIcon":"icon-search","buttonText":"查询"},\
								{"buttonHandler":"exportOther","buttonIcon":"icon-save","buttonText":"导出"}\
	]';
	addButtons(jQuery("#gview_table_other > .ui-jqgrid-titlebar"),buttonOther);
});	
	function queryAllAsset(){
	    var stmc = document.getElementById("stmc").value;
			//总结果
			jQuery("#table_all").setGridParam({
				postData:{
				'assetQueryVO.stmc':stmc},
				url:"<%=basePath%>stgl/chuzhizichan_viewAsset.do"
			}).trigger("reloadGrid") ;	
	}
	//查询所有资产的结果导出
	function exportAllAsset(){
		//var urlStr = '<%=basePath %>stgl/chuzhizichan_viewAsset.do';
		var urlStr = 'com.tansun.eam2.stgl.actions.NCEMAssetQueryAction&com.tansun.eam2.stgl.vo.ZCXXQueryVO';
		var stmc = document.getElementById("stmc").value;
		var params = "{\"assetQueryVO.stmc\":\"" + stmc + "\"}";
		exportExcel("table_all", urlStr, params, '所有资产信息','rn,cb');
	}
		
	function queryCash(){	
		var stmc = document.getElementById("stmc").value;
		var stnzcfl = document.getElementById("stnzcfl").value;
		//现金
		var hzhanghu = document.getElementById("hzhanghu").value;
			//现金表
			jQuery("#table_cash").setGridParam({
				postData:{
				'assetQueryVO.stmc':stmc,
				'assetQueryVO.stnzcfl':stnzcfl,
				'assetQueryVO.hzhanghu':hzhanghu},
				url:"<%=basePath%>stgl/chuzhizichan_viewAsset.do"
			}).trigger("reloadGrid") ;
	}
	//查询现金的结果导出
	function exportCash(){
		//var urlStr = '<%=basePath %>stgl/chuzhizichan_viewAsset.do';
		var urlStr = 'com.tansun.eam2.stgl.actions.NCEMAssetQueryAction&com.tansun.eam2.stgl.vo.ZCXXQueryVO';
		var stmc = document.getElementById("stmc").value;
		var stnzcfl = document.getElementById("stnzcfl").value;
		
		var hzhanghu = document.getElementById("hzhanghu").value;
		var params = "{\"assetQueryVO.stmc\":\"" + stmc + "\",";
			params += "\"assetQueryVO.stnzcfl\":\"" + stnzcfl + "\",";
			params += "\"assetQueryVO.hzhanghu\":\"" + hzhanghu + "\"}";
			
		exportExcel("table_cash", urlStr, params, '现金信息','rn,cb');
	}
	function queryLand(){
		var stmc = document.getElementById("stmc").value;
		var stnzcfl = document.getElementById("stnzcfl").value;
		//土地
		var jtdmc = document.getElementById("jtdmc").value;
		var jsjzyr = document.getElementById("jsjzyr").value;
		var jtdsfdy = document.getElementById("jtdsfdy").value;
		var jtdsyqz = document.getElementById("jtdsyqz").value;
			//土地表
			jQuery("#table_land").setGridParam({
				postData:{
				'assetQueryVO.stmc':stmc,
				'assetQueryVO.stnzcfl':stnzcfl,		
				'assetQueryVO.jtdmc':jtdmc,
				'assetQueryVO.jsjzyr':jsjzyr,
				'assetQueryVO.jtdsfdy':jtdsfdy,
				'assetQueryVO.jtdsyqz':jtdsyqz},
				url:"<%=basePath%>stgl/chuzhizichan_viewAsset.do"
			}).trigger("reloadGrid") ;	
	}
	//查询土地结果导出
	function exportLand(){
		//var urlStr = '<%=basePath %>stgl/chuzhizichan_viewAsset.do';
		var urlStr = 'com.tansun.eam2.stgl.actions.NCEMAssetQueryAction&com.tansun.eam2.stgl.vo.ZCXXQueryVO';
		var stmc = document.getElementById("stmc").value;
		var stnzcfl = document.getElementById("stnzcfl").value;
		//土地
		var jtdmc = document.getElementById("jtdmc").value;
		var jsjzyr = document.getElementById("jsjzyr").value;
		var jtdsfdy = document.getElementById("jtdsfdy").value;
		var jtdsyqz = document.getElementById("jtdsyqz").value;
		var params = "{\"assetQueryVO.stmc\":\"" + stmc + "\",";
			params += "\"assetQueryVO.stnzcfl\":\"" + stnzcfl + "\",";
			params += "\"assetQueryVO.jtdmc\":\"" + jtdmc + "\",";
			params += "\"assetQueryVO.jtdsfdy\":\"" + jtdsfdy + "\",";
			params += "\"assetQueryVO.jtdsyqz\":\"" + jtdsyqz + "\"}";
		exportExcel("table_land", urlStr, params, '土地信息','rn,cb');
	}
	function queryHouse(){
		var stmc = document.getElementById("stmc").value;
		var stnzcfl = document.getElementById("stnzcfl").value;
		//房屋
		var kfwmc = document.getElementById("kfwmc").value;
		var kfwsjzyr = document.getElementById("kfwsjzyr").value;
		var ksfdy = document.getElementById("ksfdy").value;
		var kywfwsyqz = document.getElementById("kywfwsyqz").value;
			//房屋表
			jQuery("#table_house").setGridParam({
				postData:{
				'assetQueryVO.stmc':stmc,
				'assetQueryVO.stnzcfl':stnzcfl,		
				'assetQueryVO.kfwmc':kfwmc,
				'assetQueryVO.kfwsjzyr':kfwsjzyr,
				'assetQueryVO.ksfdy':ksfdy,
				'assetQueryVO.kywfwsyqz':kywfwsyqz},
				url:"<%=basePath%>stgl/chuzhizichan_viewAsset.do"
			}).trigger("reloadGrid") ;
	}
	//查询房屋结果导出
	function exportHouse(){
		//var urlStr = '<%=basePath %>stgl/chuzhizichan_viewAsset.do';
		var urlStr = 'com.tansun.eam2.stgl.actions.NCEMAssetQueryAction&com.tansun.eam2.stgl.vo.ZCXXQueryVO';
		var stmc = document.getElementById("stmc").value;
		var stnzcfl = document.getElementById("stnzcfl").value;
		//房屋
		var kfwmc = document.getElementById("kfwmc").value;
		var kfwsjzyr = document.getElementById("kfwsjzyr").value;
		var ksfdy = document.getElementById("ksfdy").value;
		var kywfwsyqz = document.getElementById("kywfwsyqz").value;
		var params = "{\"assetQueryVO.stmc\":\"" + stmc + "\",";
			params += "\"assetQueryVO.stnzcfl\":\"" + stnzcfl + "\",";
			params += "\"assetQueryVO.kfwmc\":\"" + kfwmc + "\",";
			params += "\"assetQueryVO.kfwsjzyr\":\"" + kfwsjzyr + "\",";
			params += "\"assetQueryVO.ksfdy\":\"" + ksfdy + "\",";
			params += "\"assetQueryVO.kywfwsyqz\":\"" + kywfwsyqz + "\"}";
		exportExcel("table_house", urlStr, params, '房屋信息','rn,cb');
	}
	function queryMachine(){
		var stmc = document.getElementById("stmc").value;
		var stnzcfl = document.getElementById("stnzcfl").value;
		//机器设备
		var msbmc = document.getElementById("msbmc").value;
		var msbqs = document.getElementById("msbqs").value;
		var msbsjzyr = document.getElementById("msbsjzyr").value;
		var msbsfdy = document.getElementById("msbsfdy").value;
			//机器设备表
			jQuery("#table_machine").setGridParam({
				postData:{
				'assetQueryVO.stmc':stmc,
				'assetQueryVO.stnzcfl':stnzcfl,
				'assetQueryVO.msbmc':msbmc,
				'assetQueryVO.msbqs':msbqs,
				'assetQueryVO.msbsjzyr':msbsjzyr,
				'assetQueryVO.msbsfdy':msbsfdy},
				url:"<%=basePath%>stgl/chuzhizichan_viewAsset.do"
			}).trigger("reloadGrid") ;
	}
	//查询机器设备的excell导出
	function exportMachine(){
		//var urlStr = '<%=basePath %>stgl/chuzhizichan_viewAsset.do';
		var urlStr = 'com.tansun.eam2.stgl.actions.NCEMAssetQueryAction&com.tansun.eam2.stgl.vo.ZCXXQueryVO';
		var stmc = document.getElementById("stmc").value;
		var stnzcfl = document.getElementById("stnzcfl").value;
		//机器设备
		var msbmc = document.getElementById("msbmc").value;
		var msbqs = document.getElementById("msbqs").value;
		var msbsjzyr = document.getElementById("msbsjzyr").value;
		var msbsfdy = document.getElementById("msbsfdy").value;
		var params = "{\"assetQueryVO.stmc\":\"" + stmc + "\",";
			params += "\"assetQueryVO.stnzcfl\":\"" + stnzcfl + "\",";
			params += "\"assetQueryVO.msbmc\":\"" + msbmc + "\",";
			params += "\"assetQueryVO.msbqs\":\"" + msbqs + "\",";
			params += "\"assetQueryVO.msbsjzyr\":\"" + msbsjzyr + "\",";
			params += "\"assetQueryVO.msbsfdy\":\"" + msbsfdy + "\"}";
		exportExcel("table_machine", urlStr, params, '机器设备信息','rn,cb');
	}
	function queryTransportation(){
		var stmc = document.getElementById("stmc").value;
		var stnzcfl = document.getElementById("stnzcfl").value;
		//交通工具
		var lcph = document.getElementById("lcph").value;
		var lqs = document.getElementById("lqs").value;
		var lsjzyr = document.getElementById("lsjzyr").value;
		var lsfdy = document.getElementById("lsfdy").value;
		   //交通工具
			jQuery("#table_transportation").setGridParam({
				postData:{
				'assetQueryVO.stmc':stmc,
				'assetQueryVO.stnzcfl':stnzcfl,
				'assetQueryVO.lcph':lcph,
				'assetQueryVO.lqs':lqs,
				'assetQueryVO.lsjzyr':lsjzyr,
				'assetQueryVO.lsfdy':lsfdy},
				url:"<%=basePath%>stgl/chuzhizichan_viewAsset.do"
			}).trigger("reloadGrid") ;
	}
	//查询交通工具的结果导出
	function exportTransportation(){
		//var urlStr = '<%=basePath %>stgl/chuzhizichan_viewAsset.do';
		var urlStr = 'com.tansun.eam2.stgl.actions.NCEMAssetQueryAction&com.tansun.eam2.stgl.vo.ZCXXQueryVO';
		var stmc = document.getElementById("stmc").value;
		var stnzcfl = document.getElementById("stnzcfl").value;
		//交通工具
		var lcph = document.getElementById("lcph").value;
		var lqs = document.getElementById("lqs").value;
		var lsjzyr = document.getElementById("lsjzyr").value;
		var lsfdy = document.getElementById("lsfdy").value;
		var params = "{\"assetQueryVO.stmc\":\"" + stmc + "\",";
			params += "\"assetQueryVO.stnzcfl\":\"" + stnzcfl + "\",";
			params += "\"assetQueryVO.lcph\":\"" + lcph + "\",";
			params += "\"assetQueryVO.lqs\":\"" + lqs + "\",";
			params += "\"assetQueryVO.lsjzyr\":\"" + lsjzyr + "\",";
			params += "\"assetQueryVO.lsfdy\":\"" + lsfdy + "\"}";
		exportExcel("table_transportation", urlStr, params, '交通工具信息','rn,cb');
	}
	function queryInvestment(){
		var stmc = document.getElementById("stmc").value;
		var stnzcfl = document.getElementById("stnzcfl").value;
		//对外投资
		var nbtqymc = document.getElementById("nbtqymc").value;
		var ntzfs = document.getElementById("ntzfs").value;
			//对外投资表
			jQuery("#table_investment").setGridParam({
				postData:{
				'assetQueryVO.stmc':stmc,
				'assetQueryVO.stnzcfl':stnzcfl,
				'assetQueryVO.nbtqymc':nbtqymc,
				'assetQueryVO.ntzfs':ntzfs},
				url:"<%=basePath%>stgl/chuzhizichan_viewAsset.do"
			}).trigger("reloadGrid") ;
	}
	function exportInvestment(){
		//var urlStr = '<%=basePath %>stgl/chuzhizichan_viewAsset.do';
		var urlStr = 'com.tansun.eam2.stgl.actions.NCEMAssetQueryAction&com.tansun.eam2.stgl.vo.ZCXXQueryVO';
		var stmc = document.getElementById("stmc").value;
		var stnzcfl = document.getElementById("stnzcfl").value;
		//对外投资
		var nbtqymc = document.getElementById("nbtqymc").value;
		var ntzfs = document.getElementById("ntzfs").value;
		var params = "{\"assetQueryVO.stmc\":\"" + stmc + "\",";
			params += "\"assetQueryVO.stnzcfl\":\"" + stnzcfl + "\",";
			params += "\"assetQueryVO.nbtqymc\":\"" + nbtqymc + "\",";
			params += "\"assetQueryVO.ntzfs\":\"" + ntzfs + "\"}";
		exportExcel("table_investment", urlStr, params, '对外投资信息','rn,cb');
	}
	
	function queryOther(){
		var stmc = document.getElementById("stmc").value;
		var stnzcfl = document.getElementById("stnzcfl").value;
		var pqtzcmc = document.getElementById("pqtzcmc").value;
		var pqtzcqs = document.getElementById("pqtzcqs").value;
		var pqtzcsjzyr = document.getElementById("pqtzcsjzyr").value;
		var pqtzcsfdy = document.getElementById("pqtzcsfdy").value;
			//其他资产表
			jQuery("#table_other").setGridParam({
				postData:{
				'assetQueryVO.stmc':stmc,
				'assetQueryVO.stnzcfl':stnzcfl,
				'assetQueryVO.pqtzcmc':pqtzcmc,
				'assetQueryVO.pqtzcqs':pqtzcqs,
				'assetQueryVO.pqtzcsjzyr':pqtzcsjzyr,
				'assetQueryVO.pqtzcsfdy':pqtzcsfdy},
				url:"<%=basePath%>stgl/chuzhizichan_viewAsset.do"
			}).trigger("reloadGrid") ;
	}
	//导出其他资产列表
	function exportOther(){
	var urlStr = 'com.tansun.eam2.stgl.actions.NCEMAssetQueryAction&com.tansun.eam2.stgl.vo.ZCXXQueryVO';
		var stmc = document.getElementById("stmc").value;
		var stnzcfl = document.getElementById("stnzcfl").value;
		var pqtzcmc = document.getElementById("pqtzcmc").value;
		var pqtzcqs = document.getElementById("pqtzcqs").value;
		var pqtzcsjzyr = document.getElementById("pqtzcsjzyr").value;
		var pqtzcsfdy = document.getElementById("pqtzcsfdy").value;
		var params = "{\"assetQueryVO.stmc\":\"" + stmc + "\",";
			params += "\"assetQueryVO.stnzcfl\":\"" + stnzcfl + "\",";
			params += "\"assetQueryVO.pqtzcmc\":\"" + pqtzcmc + "\",";
			params += "\"assetQueryVO.pqtzcqs\":\"" + pqtzcqs + "\",";
			params += "\"assetQueryVO.pqtzcsjzyr\":\"" + pqtzcsjzyr + "\",";
			params += "\"assetQueryVO.pqtzcsfdy\":\"" + pqtzcsfdy + "\"}";
		exportExcel("table_investment", urlStr, params, '其他资产信息','rn,cb');
	}

//页面刚加载时，设置表格的宽度
$(function(){
	jQuery("#table_all").setGridWidth($("#tableWidth").width());
	jQuery("#table_cash").setGridWidth($("#tableWidth").width());
	jQuery("#table_land").setGridWidth($("#tableWidth").width());
	jQuery("#table_house").setGridWidth($("#tableWidth").width());
	jQuery("#table_machine").setGridWidth($("#tableWidth").width());
	jQuery("#table_transportation").setGridWidth($("#tableWidth").width());
	jQuery("#table_investment").setGridWidth($("#tableWidth").width());
	jQuery("#table_other").setGridWidth($("#tableWidth").width());
 
	$(window).bind('resize', function(){
		jQuery("#table_all").setGridWidth($("#tableWidth").width());
		jQuery("#table_cash").setGridWidth($("#tableWidth").width());
		jQuery("#table_land").setGridWidth($("#tableWidth").width());
		jQuery("#table_house").setGridWidth($("#tableWidth").width());
		jQuery("#table_machine").setGridWidth($("#tableWidth").width());
		jQuery("#table_transportation").setGridWidth($("#tableWidth").width());
		jQuery("#table_investment").setGridWidth($("#tableWidth").width());
		jQuery("#table_other").setGridWidth($("#tableWidth").width());
	});
});
</script>

</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td height="25" align="center" valign="bottom" class="td06"><table width="100%" border="0" cellspacing="3" cellpadding="0">
	      <tr>
	        <td width="14"><img src="<%=request.getContextPath() %>/resource/ProjectImages/index_32.gif" width="9" height="9"></td>
	        <td width="698" valign="middle" class="title">资产信息查询</td>
			<td width="585" align="right" valign="bottom" class="title">&nbsp;</td>
	      </tr>
	    </table></td>
	  </tr>
	</table>
	<table class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	  <tr>
	    <td width="11%" class="td_form01">实体名称： </td>
	    <td width="14%"  class="td_form02"><s:textfield name="assetQueryVO.stmc" id="stmc" label=""/></td>
	    <td  width="11%"  class="td_form01">资产类型：</td>
	    <td  width="14%"  class="td_form02">    
	      <e:select parRefKey="ENTITY_ASSET_TYPE" list="#{}" headerKey=" "  headerValue="" name="assetQueryVO.stnzcfl"  id="stnzcfl" onChange="stage();return false;" />
	      </td>
	    <td  width="11%"  class="td_form01">&nbsp;</td>
	    <td  width="14%"  class="td_form02">&nbsp;</td>
	    <td  width="11%"  class="td_form01">&nbsp;</td>
	    <td  class="td_form02">&nbsp;</td>
	  </tr>
	  <tr  id="tr_cash" style="display:none">
	    <td class="td_form01">账户：</td>
	    <td class="td_form02"><s:textfield name="assetQueryVO.hzhanghu" id="hzhanghu" label=""/></td>
	    <td class="td_form01">&nbsp;</td>
	    <td class="td_form02">&nbsp;</td>
	    <td class="td_form01">&nbsp;</td>
	    <td class="td_form02">&nbsp;</td>
	    <td  class="td_form01">&nbsp;</td>
	    <td  class="td_form02">&nbsp;</td>
	  </tr>
	  <tr  id="tr_land" style="display:none">
	    <td class="td_form01">名称：</td>
	    <td class="td_form02"><s:textfield name="assetQueryVO.jtdmc" id="jtdmc" label=""/></td>
	    <td class="td_form01">实际占有人：</td>
	    
	    <td class="td_form02"><s:textfield name="assetQueryVO.jsjzyr" id="jsjzyr" label=""/></td>
	    <td class="td_form01">抵押：</td>
	    <td class="td_form02"> 
	       <s:select list="#{'':'请选择',1:'是',0:'否'}"  name="assetQueryVO.jtdsfdy" id="jtdsfdy" />  </td>
	    <td  class="td_form01"> 《土地使用权证》</td>
	    <td  class="td_form02"> 
	    <s:select list="#{'':'',1:'有',2:'无',3:'下落不明'}"   name="sf.jtdsyqz" id="jtdsyqz" /> </td>
	  </tr>
	  <tr  id="tr_house" style="display:none">
	    <td class="td_form01">名称：</td>
	    <td class="td_form02"><s:textfield name="assetQueryVO.kfwmc" id="kfwmc"  label=""/></td>
	    <td class="td_form01">实际占有人：</td>
	    <td class="td_form02"><s:textfield name="assetQueryVO.kfwsjzyr" id="kfwsjzyr" label=""/></td>
	    <td class="td_form01">抵押：</td>
	    <td class="td_form02"><s:select list="#{'':'',1:'是',0:'否'}"   name="assetQueryVO.ksfdy" id="ksfdy" /></td>
	    <td  class="td_form01"> 《房屋使用权证》</td>
	    <td  class="td_form02">  
	    	<s:select list="#{'':'',1:'有',2:'无',3:'下落不明'}"   name="assetQueryVO.kywfwsyqz" id="kywfwsyqz" />
    	</td>
	  </tr>
	  <tr id="tr_machine" style="display:none">
	    <td class="td_form01">名称：</td>
	    <td class="td_form02"><s:textfield name="assetQueryVO.msbmc" id="msbmc" label=""/></td>
	    <td class="td_form01">权属：</td>
	    <td class="td_form02"><s:textfield name="assetQueryVO.msbqs" id="msbqs" label=""/></td>
	    <td class="td_form01">实际占有人：</td>
	    <td class="td_form02"><s:textfield name="assetQueryVO.msbsjzyr" id="msbsjzyr" label=""/></td>
	    <td class="td_form01">抵押：</td>
	    <td class="td_form02"> <s:select list="#{'':'',1:'是',0:'否'}"  name="assetQueryVO.msbsfdy" id="msbsfdy" /> 
	     </td>
	  </tr>
	  <tr id="tr_transportation" style="display:none">
	    <td class="td_form01">名称（车牌号）：</td>
	    <td class="td_form02"><s:textfield name="assetQueryVO.lcph" id="lcph" label=""/></td>
	    <td class="td_form01">权属：</td>
	    <td class="td_form02"><s:textfield name="assetQueryVO.lqs" id="lqs" label=""/></td>
	    <td class="td_form01">实际占有人：</td>
	    <td class="td_form02"><s:textfield name="assetQueryVO.lsjzyr" id="lsjzyr" label=""/></td>
	    <td class="td_form01">抵押：</td>
	    <td class="td_form02"><s:select list="#{'':'',1:'是',0:'否'}"   name="assetQueryVO.lsfdy" id="lsfdy" />  </td>
	  </tr>
	  <tr id="tr_investment" style="display:none">
	    <td class="td_form01">被投资企业名称：</td>
	    <td class="td_form02"><s:textfield name="assetQueryVO.nbtqymc" id="nbtqymc" label=""/></td>
	    <td class="td_form01">投资方式：</td>
	    <td class="td_form02"><s:textfield name="assetQueryVO.ntzfs" id="ntzfs" label=""/></td>
	    <td class="td_form01">&nbsp;</td>
	    <td class="td_form02">&nbsp;</td>
	    <td  class="td_form01">&nbsp;</td>
	    <td  class="td_form02">&nbsp;</td>
	  </tr>
	  <tr  id="tr_other" style="display:none">
	    <td class="td_form01">名称：</td>
	    <td class="td_form02"><s:textfield name="assetQueryVO.pqtzcmc" id="pqtzcmc" label=""/></td>
	    <td class="td_form01">权属：</td>
	    <td class="td_form02"><s:textfield name="assetQueryVO.pqtzcqs" id="pqtzcqs" label=""/></td>
	    <td class="td_form01">实际占有人：</td>
	    <td class="td_form02"><s:textfield name="assetQueryVO.pqtzcsjzyr" id="pqtzcsjzyr" label=""/></td>
	    <td class="td_form01">抵押：</td>
	    <td class="td_form02"><s:select list="#{'':'',1:'是',0:'否'}"  name="assetQueryVO.pqtzcsfdy" id="pqtzcsfdy" /></td>
	  </tr>
	</table>
	<div id="tableWidth" width="100%"/ >
	
	<div id="table_all_div" style="display:block">
		<table id="table_all"> </table>
		<div id="toobarAll"> </div>
		<script type="text/javascript">
		//全部资产
		jQuery("#table_all").jqGrid({				
			//url:"<%=basePath %>stgl/farenBody_listCurrReps.do",
			datatype: "json",
			//mtype:"POST",
		   	colNames:['实体名称','名称','资产类型', '账户','金额（元）','实际占有人','存放何处','权属','抵押','描述'],
		   	colModel:[
				{name:'stmc',index:'stmc' },
				{name:'zmingcheng',index:'zmingcheng' },
				{name:'stnzcfl',index:'stnzcfl' },
				{name:'hzhanghu',index:'hzhanghu'},
				{name:'hjine',index:'hjine' },
				{name:'zsjzyr',index:'zsjzyr'},
				{name:'zcfhc',index:'zcfhc'},
				{name:'zquanshu',index:'zquanshu'},
				{name:'zdiya',index:'zdiya'},
				{name:'zmiaoshu',index:'zmiaoshu'}
		   	],
			shrinkToFit:false,
			multiselect:true,
			rownumbers:true,
			autowidth:true,
			height:'auto',
			pager:'toobarAll',
			viewrecords:true,
			caption:'资产信息',
			rowNum:10,
			prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize", sidx:"paginator.sortname", sord:"paginator.sorttype"},
		  	rowList:[10,20,30],
			userDataOnFooter : true, 
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false
			}
		});			
	</script>
	</div>
	
	<div  id="table_cash_div" style="display:none">
		<table id="table_cash" ></table>
		<div id="toobarCash" ></div>	
		<script type="text/javascript">
	    //现金
		jQuery("#table_cash").jqGrid({				
			//url:"<%=basePath %>stgl/farenBody_listCurrReps.do",
			datatype: "json",
			//mtype:"POST",
		   	colNames:['实体名称','资产类型','账户名称' ,'账户','金额（元）'],
		   	colModel:[
				{name:'stmc',index:'stmc' },
				{name:'stnzcfl',index:'stnzcfl' },
				{name:'hzhmc',index:'hzhmc' },
				{name:'hzhanghu',index:'hzhanghu' },
				{name:'hjine',index:'hjine' }
		   	],
			shrinkToFit:false,
			multiselect:true,
			rownumbers:true,
			autowidth:true,
			height:'auto',
			pager:'toobarCash',
			viewrecords:true,
			caption:'现金',
			rowNum:10,
			prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize", sidx:"paginator.sortname", sord:"paginator.sorttype"},
		  	rowList:[10,20,30],
			userDataOnFooter : true, 
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false
			}
		});					
	</script>
	</div>
	
	<div  id="table_land_div" style="display:none">
		<table id="table_land"  ></table>
		<div id="toobarLand" ></div>
		<script type="text/javascript">
	    //土地
		jQuery("#table_land").jqGrid({				
			//url:"<%=basePath %>stgl/farenBody_listCurrReps.do",
			datatype: "json",
			//mtype:"POST",
		   	colNames:['实体名称','资产类型','土地名称','土地取得方式','实际占有人','《土地使用权证》', '抵押', '面积（平方米）', '土地使用权人',  '描述'],
		   	colModel:[
				{name:'stmc',index:'stmc' },
				{name:'stnzcfl',index:'stnzcfl' },
				{name:'jtdmc',index:'jtdmc' },
				{name:'jtdqdfs',index:'jtdqdfs' },
				{name:'jsjzyr',index:'jsjzyr' },
				{name:'jtdsyqz',index:'jtdsyqz'},
				{name:'jtdsfdy',index:'jtdsfdy'},
				{name:'jtdmj',index:'jtdmj'},
				{name:'jtdsyqr',index:'jtdsyqr'},
				{name:'jtdms',index:'jtdms'}
		   	],
			shrinkToFit:false,
			multiselect:true,
			rownumbers:true,
			autowidth:true,
			height:'auto',
			pager:'toobarLand',
			viewrecords:true,
			caption:'土地信息',
			rowNum:10,
			prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize", sidx:"paginator.sortname", sord:"paginator.sorttype"},
		  	rowList:[10,20,30],
			userDataOnFooter : true, 
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false
			}
		});			
		</script>
	</div>
	
	<div id="table_house_div" style="display:none">
		<table id="table_house" ></table>
		<div id="toobarHouse" ></div>
		<script type="text/javascript">
	    //房屋
		jQuery("#table_house").jqGrid({				
			//url:"<%=basePath %>stgl/farenBody_listCurrReps.do",
			datatype: "json",
			//mtype:"POST",
		   	colNames:['实体名称','资产类型','房屋名称','地址','房屋所有权人','实际占有人','《房屋使用权证》','抵押','面积（平方米）','描述'],
		   	colModel:[
				{name:'stmc',index:'stmc' },
				{name:'stnzcfl',index:'stnzcfl' },
				{name:'kfwmc',index:'kfwmc' },
				{name:'kfwdz',index:'kfwdz' },
				{name:'kfwsyqr',index:'kfwsyqr' },
				{name:'kfwsjzyr',index:'kfwsjzyr' },
				{name:'kywfwsyqz',index:'kywfwsyqz' },
				{name:'ksfdy',index:'ksfdy' },
				{name:'kfwmj',index:'kfwmj' },
				{name:'kfwms',index:'kfwms' }
		   	],
			shrinkToFit:false,
			multiselect:true,
			rownumbers:true,
			autowidth:true,
			height:'auto',
			pager:'toobarHouse',
			viewrecords:true,
			caption:'房屋信息',
			rowNum:10,
			prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize", sidx:"paginator.sortname", sord:"paginator.sorttype"},
		  	rowList:[10,20,30],
			userDataOnFooter : true,
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false
			}
		});			
		</script>
	</div>
	
	<div  id="table_machine_div" style="display:none">
		<table id="table_machine" ></table>
		<div id="toobarMachine" ></div>
		<script type="text/javascript">
	    //机器设备
		jQuery("#table_machine").jqGrid({				
			//url:"<%=basePath %>stgl/farenBody_listCurrReps.do",
			datatype: "json",
			//mtype:"POST",
		   	colNames:['实体名称','资产类型','名称','存放何处','权属','实际占有人','抵押','抵押情况介绍','描述'],
		   	colModel:[
				{name:'stmc',index:'stmc' },
				{name:'stnzcfl',index:'stnzcfl' },
				{name:'msbmc',index:'msbmc' },
				{name:'msbcfwz',index:'msbcfwz' },
				{name:'msbqs',index:'msbqs' },
				{name:'msbsjzyr',index:'msbsjzyr' },
				{name:'msbsfdy',index:'msbsfdy' },
				{name:'msbdyjs',index:'msbdyjs' },
				{name:'msbms',index:'msbms' }
		   	],
			shrinkToFit:false,
			multiselect:true,
			rownumbers:true,
			autowidth:true,
			height:'auto',
			pager:'toobarMachine',
			viewrecords:true,
			caption:'机器设备信息',
			rowNum:10,
			prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize", sidx:"paginator.sortname", sord:"paginator.sorttype"},
		  	rowList:[10,20,30],
			userDataOnFooter : true,
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false
			}
		});			
		</script>
	</div>
	
	<div  id="table_transportation_div" style="display:none">
		<table id="table_transportation"  ></table>
		<div id="toobarTransportation"  ></div>
		<script type="text/javascript">
	    //交通运输工具
		jQuery("#table_transportation").jqGrid({				
			//url:"<%=basePath %>stgl/farenBody_listCurrReps.do",
			datatype: "json",
			//mtype:"POST",
		   	colNames:['实体名称','资产类型','名称(车牌号)','存放何处','权属','实际占有人','抵押','抵押情况介绍','描述'],
		   	colModel:[
				{name:'stmc',index:'stmc' },
				{name:'stnzcfl',index:'stnzcfl' },
				{name:'lcph',index:'lcph' },
				{name:'ljtgjcfwz',index:'ljtgjcfwz' },
				{name:'lqs',index:'lqs' },
				{name:'lsjzyr',index:'lsjzyr' },
				{name:'lsfdy',index:'lsfdy' },
				{name:'ldyjs',index:'ldyjs' },
				{name:'ljtgjms',index:'ljtgjms' }
		   	],
			
			shrinkToFit:false,
			multiselect:true,
			rownumbers:true,
			autowidth:true,
			height:'auto',
			pager:'toobarTransportation',
			viewrecords:true,
			caption:'交通运输工具',
			rowNum:10,
			footerrow : true, 
			prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize", sidx:"paginator.sortname", sord:"paginator.sorttype"},
		  	rowList:[10,20,30],

			userDataOnFooter : true, 
			
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false
			}
		});			
		</script>
	   </div>
	
	<div  id="table_investment_div" style="display:none">
		<table id="table_investment" ></table>
		<div id="toobarInvestment"  ></div>
		<script type="text/javascript">
	    //对外投资
		jQuery("#table_investment").jqGrid({				
			//url:"<%=basePath %>stgl/farenBody_listCurrReps.do",
			datatype: "json",
			//mtype:"POST",
		   	colNames:['实体名称','资产类型','被投资企业名称','投资额','投资方式','描述'],
		   	colModel:[
				{name:'stmc',index:'stmc' },
				{name:'stnzcfl',index:'stnzcfl' },
				{name:'nbtqymc',index:'nbtqymc' },
				{name:'ntze',index:'ntze' },
				{name:'ntzfs',index:'ntzfs' },
				{name:'ntzqkms',index:'ntzqkms' },
		   	],
			shrinkToFit:false,
			multiselect:true,
			rownumbers:true,
			autowidth:true,
			height:'auto',
			pager:'toobarInvestment',
			viewrecords:true,
			caption:'对外投资',
			rowNum:10,
			footerrow : true, 
			prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize", sidx:"paginator.sortname", sord:"paginator.sorttype"},
		  	rowList:[10,20,30],

			userDataOnFooter : true,
			
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false
			}
		});			
		</script>
	</div>
	
	<div  id="table_other_div" style="display:none">
		<table id="table_other" ></table>
		<div id="toobarOther" ></div>
		<script type="text/javascript">
	    //其他资产
		jQuery("#table_other").jqGrid({				
			//url:"<%=basePath %>stgl/farenBody_listCurrReps.do",
			datatype: "json",
			//mtype:"POST",
		   	colNames:['实体名称','资产类型','名称','存放何处','权属','实际占有人','抵押','抵押情况介绍','描述'],
		   	colModel:[
				{name:'stmc',index:'stmc' },
				{name:'stnzcfl',index:'stnzcfl' },
				{name:'pqtzcmc',index:'pqtzcmc' },
				{name:'pqtzccfwz',index:'pqtzccfwz' },
				{name:'pqtzcqs',index:'pqtzcqs' },
				{name:'pqtzcsjzyr',index:'pqtzcsjzyr' },
				{name:'pqtzcsfdy',index:'pqtzcsfdy' },
				{name:'pdyjs',index:'pdyjs' },
				{name:'pzcms',index:'pzcms' }
		   	],
			shrinkToFit:false,
			multiselect:true,
			rownumbers:true,
			autowidth:true,
			height:'auto',
			pager:'toobarOther',
			viewrecords:true,
			caption:'资产列表',
			rowNum:10,
			footerrow : true, 
			prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize", sidx:"paginator.sortname", sord:"paginator.sorttype"},
		  	rowList:[10,20,30],

			userDataOnFooter : true, 
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false
			}
		});			
		</script>
	</div>
	<%@ include file="/inc/exportExcel.inc"%>
</body>
</html>
