<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	boolean view =false;
	view = "true".equals((String) request
			.getAttribute("view")) ? true : false;
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>固产投保</title>
<SCRIPT language=JavaScript type=text/JavaScript>
	$(function(){
	  var tblb = "${tblb}";
	  	if(tblb=="0"){
	  		document.getElementById("chexian_ListDiv").style.display="block";
	  		document.getElementById("feichexian_ListDiv").style.display="none";
	 	 }else {
	 	 	document.getElementById("chexian_ListDiv").style.display="none";
	  		document.getElementById("feichexian_ListDiv").style.display="block";
	  		
	 	 }
	 	 reloadGrid();
	});
	function addValue(gr){
		var tblb ="${tblb}"; 
		url="<%=basePath%>zltb/IntentionManageBody_saveJjzcTbgcXx.do";
		$.post(url,{tbId:"${tbId}",zcId:"" + gr + "",tblb:"${tblb}",headId:"${headId}"},function(returnStr){
			 reloadGrid();
			//if(tblb==0){
			//	window.opener.setCheXianView(returnStr);
			//	$("#chexian_List").setGridParam({
			//	postData:{
			//		tbId: "${tbId}",
			//		tblb: "${tblb}"
			//	},
			//	url:"<%=basePath%>zltb/IntentionManageBody_queryJjzcTbgcXx.do"
			//}).trigger("reloadGrid");
			//}else if(tblb==1){
			//	window.opener.setFeiCheXianView(returnStr);
			//	$("#feichexian_List").setGridParam({
			//	postData:{
			//		tbId: "${tbId}",
			//		tblb: "${tblb}"
			//	},
			//	url:"<%=basePath%>zltb/IntentionManageBody_queryJjzcTbgcXx.do"
			//}).trigger("reloadGrid");
			//}
		});
	}
	function reloadGrid(){
		var tblb =${tblb}; 
		url="<%=basePath%>zltb/IntentionManageBody_total.do";
		$.post(url,{tbId:"${tbId}",tblb:"${tblb}"},function(returnStr){
			if(tblb==0){
				window.opener.setCheXianView(returnStr);
				$("#chexian_List").setGridParam({
				postData:{
					tbId: "${tbId}",
					tblb: "${tblb}"
				},
				url:"<%=basePath%>zltb/IntentionManageBody_queryJjzcTbgcXx.do"
			}).trigger("reloadGrid");
			}else if(tblb==1){
				window.opener.count(returnStr);
				//window.opener.setFeiCheXianView(returnStr);
				$("#feichexian_List").setGridParam({
				postData:{
					tbId: "${tbId}",
					tblb: "${tblb}"
				},
				url:"<%=basePath%>zltb/IntentionManageBody_queryJjzcTbgcXx.do"
			}).trigger("reloadGrid");
			}
		});
	};
	function closeBody(){
		 window.close();
	}
	function lookAsset(gr){
		window.open('<%=basePath%>jygdzc/AssetManageBody_viewAsset.do?sheettype=assetXxInfo&zcId='+gr,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=yes');
		//window.open('<%=basePath%>jygdzc/AssetManageBody_viewAsset.do?sheettype=assetXxInfo&zcId='+gr);
	}
</SCRIPT>

</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
	<div id="table"  width="100%"></div>
	<div id ="chexian_ListDiv"> 
	<table class="newtable" width="100%" border="0" align="center"   cellpadding="0" cellspacing="0">
				<tr>
					<td align="right">
						<table id="chexian_List"></table>
						<div id="pgtoolbar1"></div>
					</td>
				</tr>
	</table>
	</div>
	<div id ="feichexian_ListDiv"> 
	<table class="newtable" width="100%" border="0" align="center"   cellpadding="0" cellspacing="0">
				<tr>
					<td align="right">
						<table id="feichexian_List"></table>
						<div id="pgtoolbar2"></div>
					</td>
				</tr>
	</table>
	</div>
</body>
</html>

<script type="text/javascript">
			$(function(){	
				if("true"!="<%=view%>"){
					var buttonButtonJSonString = '[{"buttonHandler":"addchexian","buttonIcon":"icon-add","buttonText":"增加"},\
												  {"buttonHandler":"delchexian","buttonIcon":"icon-remove","buttonText":"删除"},\
												  {"buttonHandler":"closeBody","buttonIcon":"icon-ok","buttonText":"确定"}\
					]';
					addButtons(jQuery("#gview_chexian_List > .ui-jqgrid-titlebar"),buttonButtonJSonString);
				}
			});
			
			function delchexian(){
			var gr = jQuery("#chexian_List").jqGrid('getGridParam','selarrrow');
				 if (gr.length == 0){
					alert("请选择要删除的记录!");
				}else{	
					if(confirm("确认删除？")){
						var delblyjurl ="<%=basePath%>zltb/IntentionManageBody_deleteJjzcTbgcXx.do?";
						$.post(delblyjurl,{zcId:"" + gr + "",tbId:"${tbId}"},function(returnStr){
							reloadGrid();
						});
					}
				}
				return false;
			};
			function addchexian(){
				var vReturnValue=window.showModalDialog("<%=basePath%>jygdzc/AssetQuery_init.do?returnValue=true&isModal=true&ywlx=chexian","_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:1050px;dialogHeight:600px;center:yes");
				if(typeof(vReturnValue)!='undefined'){
					addValue(vReturnValue);
				}
				//window.open('<%=basePath%>jygdzc/AssetQuery_init.do?returnValue=true&ywlx=chexian','','height=500, width=1100, top=100, left=200, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				return false;
			};
						                     jQuery("#chexian_List").jqGrid({   
						                    		url:"<%=basePath%>zltb/IntentionManageBody_queryJjzcTbgcXx.do?tbId=${tbId}&tblb=${tblb}",    
								datatype:"json",
								mtype:"POST", 
						                                  colNames: ['id','资产编号', '资产名称', '资产状态','车辆牌号','行驶证所有人','规格型号','购置日期','使用日期','已行驶里程'],
						                                  colModel: [
						                                  {name:'id',index:'id',editable:true,hidden:true},
									 {name:'zcbh',index:'zcbh',align:"center"},
									 {name:'zcmc',index:'zcmc',align:"center"},
									 {name:'CZczc',index:'CZczc',align:"center"},
									 {name:'clph',index:'clph',align:"center"},
									 {name:'clxszsyr',index:'clxszsyr',align:"center"},
									 {name:'clmcjggxh',index:'clmcjggxh',align:"center"},
									 {name:'gzrq',index:'gzrq',align:"center"},
									 {name:'qyrq',index:'qyrq',align:"center"},
									 {name:'yxslc',index:'yxslc',align:"center"}
						                                   ],
						                                 pager:'pgtoolbar1',
						                                 rownumbers:true,
						                                 multiselect:true,
									autowidth:true,
									rowNum:20,
									ondblClickRow:function(gr){
										lookAsset(gr);
									},
									prmNames:{page:"paginator.currentPage",rows:"paginator.pageCount"},
								  	rowList:[10,20,30],
									height:'auto',
									caption:'资产变动列表',
									jsonReader:{
										root:"rows",
										page:"page",
										total:"total",
										records:"records",
										repeatitems:false,
										id:"0"
									}
						});                 
						   jQuery("#chexian_List").setGridWidth($("#table").width());
						 	  $(window).bind('resize', function(){
									jQuery("#chexian_List").setGridWidth($("#table").width());
						       });
						                      </script>
<script type="text/javascript">
			$(function(){	
				if("true"!="<%=view%>"){
					var buttonButtonJSonString = '[{"buttonHandler":"addfeichexian","buttonIcon":"icon-add","buttonText":"增加"},\
												  {"buttonHandler":"delfeichexian","buttonIcon":"icon-remove","buttonText":"删除"},\
												  {"buttonHandler":"closeBody","buttonIcon":"icon-ok","buttonText":"确定"}\
					]';
					addButtons(jQuery("#gview_feichexian_List > .ui-jqgrid-titlebar"),buttonButtonJSonString);
				}
			});
			function delfeichexian(){
			var gr = jQuery("#feichexian_List").jqGrid('getGridParam','selarrrow');
				 if (gr.length == 0){
					alert("请选择要删除的记录!");
				}else{	
					if(confirm("确认删除？")){
						var delblyjurl ="<%=basePath%>zltb/IntentionManageBody_deleteJjzcTbgcXx.do?";
						$.post(delblyjurl,{zcId:"" + gr + "",tbId:"${tbId}"},function(returnStr){
							reloadGrid();
						});
					}
				}
				return false;
			};
			function addfeichexian(){
				//window.open('<%=basePath%>jygdzc/AssetQuery_init.do?returnValue=true&isModal=true&ywlx=feichexian','','height=500, width=1100, top=100, left=200, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				var vReturnValue=window.showModalDialog('<%=basePath%>jygdzc/AssetQuery_init.do?returnValue=true&isModal=true&ywlx=feichexian','_blank','help:no;scroll:yes;resizable:no;status:0;dialogWidth:1050px;dialogHeight:600px;center:yes');
				if(typeof(vReturnValue)!='undefined'){
					addValue(vReturnValue);
				}
				return false;
			};
		
                                jQuery("#feichexian_List").jqGrid({   
                               		url:"<%=basePath%>zltb/IntentionManageBody_queryJjzcTbgcXx.do?tbId=${tbId}&tblb=${tblb}",    
									datatype:"json",
									mtype:"POST", 
                                         colNames: ['id','资产编号', '资产名称', '资产状态','建筑面积','房产证所有权人','用地性质','土地面积','取得日期','准用年限'],
                                         colModel: [
                                         {name:'id',index:'id',hidden:true},
										 {name:'zcbh',index:'zcbh',align:"center"},
										 {name:'zcmc',index:'zcmc',align:"center"},
										 {name:'CZczc',index:'CZczc',align:"center"},
										 {name:'jzmj',index:'jzmj',align:"center"},
										 {name:'fczsyqr',index:'fczsyqr',align:"center"},
										 {name:'CYdxz',index:'CYdxz',align:"center"},
										 {name:'tdmj',index:'tdmj',align:"center"},
										 {name:'qdrq',index:'qdrq',align:"center"},
										 {name:'zynx',index:'zynx',align:"center"}
                                          ],
                                        pager:'pgtoolbar2',
                                        rownumbers:true,
                                        multiselect:true,
										autowidth:true,
										rowNum:20,
										ondblClickRow:function(gr){
											lookAsset(gr);
										},
										prmNames:{page:"paginator.currentPage",rows:"paginator.pageCount"},
									  	rowList:[10,20,30],
										height:'auto',
										caption:'资产变动列表',
										jsonReader:{
											root:"rows",
											page:"page",
											total:"total",
											records:"records",
											repeatitems:false,
											id:"0"
										}
							});                 
						    jQuery("#feichexian_List").setGridWidth($("#table").width());
							 	  $(window).bind('resize', function(){
										jQuery("#feichexian_List").setGridWidth($("#table").width());
							});
                             </script>


