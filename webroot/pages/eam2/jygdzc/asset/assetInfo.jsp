<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	boolean isdisable = false;
	isdisable = "true".equals((String) request
			.getAttribute("isdisable")) ? true : false;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>添加资产</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="STYLESHEET" type="text/css" href="resource/js/DHtmlTab/dhtmlxtabbar.css">
	<script type="text/javascript" src="resource/ProjectJQuery/js/jquery.js"></script>
	<script type="text/javascript" src="resource/js/DHtmlTab/dhtmlxcommon.js"></script>
	<script type="text/javascript" src="resource/js/DHtmlTab/dhtmlxtabbar.js"></script>
	<script type="text/javascript">
	$(function(){
	    $(window).bind('unload', function(){
	   		window.opener.reloadGrid();
			window.close();
		});
	})
	function qq(typeValue){
		alert(typeValue);
	}
	
	function initVar(zcId, zclx){
	document.getElementById("zcId").value = zcId;
	if(zcId != null && zcId != ""){
		if(zclx==1){
			zclx = "building";
		}else if(zclx==2){
			zclx = "vehicle";
		}else{
			zclx = "else";
		}
		tabbar.setContentHref("a2","<%=basePath %>jygdzc/AssetManageBody_modifyBody.do?isdisable=${isdisable}&headId=${headId}&sheettype2=change&sheettype=" + zclx + "&zcId=" + zcId);
		tabbar.setContentHref("a3","<%=basePath %>jygdzc/AssetManageBody_modifyBody.do?isdisable=${isdisable}&headId=${headId}&sheettype=risk&sheettype2=change&zcId=" + zcId);
		tabbar.setContentHref("a4","<%=basePath %>jygdzc/AssetManageBody_modifyBody.do?isdisable=${isdisable}&headId=${headId}&sheettype2=change&sheettype=changeHistory&zcId=" + zcId);
		tabbar.setContentHref("a5","<%=basePath %>jygdzc/AssetManageBody_modifyBody.do?isdisable=${isdisable}&sheettype=cardInfo&sheettype2=change&zcId=" + zcId);
		tabbar.setContentHref("a6","<%=basePath %>jygdzc/AssetManageBody_modifyBody.do?isdisable=${isdisable}&sheettype=rent&sheettype2=change&zcId=" + zcId);
		tabbar.setContentHref("a7","<%=basePath %>jygdzc/AssetManageBody_modifyBody.do?isdisable=${isdisable}&sheettype=entrust&sheettype2=change&zcId=" + zcId);
		tabbar.setContentHref("a8","<%=basePath %>jygdzc/AssetManageBody_modifyBody.do?isdisable=${isdisable}&sheettype=flow&sheettype2=change&zcId=" + zcId);
		tabbar.setContentHref("a9","<%=basePath %>jygdzc/AssetManageBody_modifyBody.do?isdisable=${isdisable}&sheettype=attachment&sheettype2=change&zcId=" + zcId);
		tabbar.setContentHref("a0","<%=basePath %>jygdzc/AssetManageBody_modifyBody.do?isdisable=${isdisable}&sheettype=cost&sheettype2=change&zcId=" + zcId);
		tabbar.setContentHref("a10","<%=basePath %>jygdzc/AssetManageBody_modifyBody.do?isdisable=${isdisable}&sheettype=deal&sheettype2=change&zcId=" + zcId);
		tabbar.setContentHref("a11","<%=basePath %>jygdzc/AssetManageBody_modifyBody.do?isdisable=${isdisable}&sheettype=investment&sheettype2=change&zcId=" + zcId);
		tabbar.setContentHref("a12","<%=basePath %>jygdzc/AssetManageBody_viewAsset.do?isdisable=${isdisable}&sheettype=examineInfo&sheettype2=change&zcId=" + zcId + "&zclx=" + zclx);
		tabbar.enableTab("a2");
		tabbar.enableTab("a3");
		tabbar.enableTab("a4");
		tabbar.enableTab("a5");
		tabbar.enableTab("a6");
		tabbar.enableTab("a7");
		tabbar.enableTab("a8");
		tabbar.enableTab("a9");
		tabbar.enableTab("a0");
		tabbar.enableTab("a10");
		tabbar.enableTab("a11");
		tabbar.enableTab("a12");
		}
	}
	function sfszzkp(){
			var isTrue = false;
	        var zcId =  document.getElementById("zcId").value;
			var delblyjurl = "<%=basePath %>jygdzc/AssetManageBody_cksfyzkp.do" ;
			if(zcId!=null&&""!=zcId){
				$.post(delblyjurl,{zcId:""+zcId+""},function(objString){
					reobj = eval('(' + objString + ')');
					aa=reobj.zkp;
					if("true"==aa){
						if(confirm("未设置主卡片 是否默认将原币原值最大的设为主卡片？")){
							var url2 = "<%=basePath %>jygdzc/AssetManageBody_setMainCardByYbYz.do";
							$.post(url2,{zcId:""+zcId+""}, function(ojb){
							});
							tabbar.forceLoad("a5","<%=basePath %>jygdzc/AssetManageBody_modifyBody.do?isdisable=${isdisable}&sheettype=card&zcId=" + zcId);
							isTrue = false ;
						}else{
							isTrue = true;
						}
					}else{
						isTrue = true;
					}
				});
			}
			return isTrue;
	}
	</script>
  </head>
  <body>
   <input type="hidden" name="zcId">
	<div id="a_tabbar" style="width:1100; height:100%;"/>
	<script>
		$.ajaxSetup({
		  async: false
		});
		tabbar = new dhtmlXTabBar("a_tabbar", "top");
		tabbar.setSkin('dhx_skyblue');
		tabbar.setImagePath("<%=basePath %>resource/js/DHtmlTab/imgs/");
		tabbar.addTab("a1", "主信息", "80px");
		tabbar.addTab("a2", "基本信息", "80px");tabbar.disableTab("a2");
		tabbar.addTab("a3", "风险信息", "80px");tabbar.disableTab("a3");
		tabbar.addTab("a4", "变动信息", "80px");tabbar.disableTab("a4");
		tabbar.addTab("a5", "卡片信息", "80px");tabbar.disableTab("a5");
		tabbar.addTab("a6", "租赁合同", "80px");tabbar.disableTab("a6");
		tabbar.addTab("a7", "委管合同", "80px");tabbar.disableTab("a7");
		tabbar.addTab("a8", "流程信息", "80px");tabbar.disableTab("a8");
		tabbar.addTab("a9", "附件信息", "80px");tabbar.disableTab("a9");
		tabbar.addTab("a0", "费用信息", "80px");tabbar.disableTab("a0");
		tabbar.addTab("a10", "处置信息", "80px");tabbar.disableTab("a10");
		tabbar.addTab("a11", "投资历史", "80px");tabbar.disableTab("a11");
		tabbar.addTab("a12", "核查评估", "80px");tabbar.disableTab("a12");
		tabbar.setHrefMode("iframes-on-demand");
		tabbar.setContentHref("a1","<%=basePath %>jygdzc/AssetManageBody_modifyBody.do?isdisable=${isdisable}&headId=${headId}&zcId=${zcId}&sheettype=main&sheettype2=change");
		tabbar.setTabActive("a1");
		//tabbar.attachEvent("onSelect", function(id) {
		  //  if (tabbar.cells(id)._frame);
		    //alert(tabbar.cells(id)._frame.contentWindow.location);
		 //   return true;
	//	});
		tabbar.attachEvent("onSelect", function(id,perviouslyId) {
		    if(id=="a1"){
			    if(document.getElementById('zcId').value!=""){
					tabbar.setContentHref("a1","<%=basePath %>jygdzc/AssetManageBody_modifyBody.do?isdisable=${isdisable}&headId=${headId}&zcId="+document.getElementById('zcId').value+"&sheettype=main&sheettype2=change");	
				}
		    }
		    if(perviouslyId == "a5"){
				if(sfszzkp()){
					return true;
				}else{
					return false;
				}	
		    }
		    return true;
		});
		tabbar.enableAutoReSize("enable")
		tabbar.enableAutoSize("enable","enable");
	</script>
  </body>
  
</html>

