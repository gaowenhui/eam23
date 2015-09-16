<%@page language="java"  contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>租赁查询</title>
<SCRIPT language=JavaScript type=text/JavaScript>
       var idStr = new Array();
		$(function(){	
			if(window.parent.clearPanelTool){
				window.parent.clearPanelTool();
			}
			var buttonaddJSonString = '[{"buttonHandler":"look","buttonIcon":"icon-search","buttonText":"查看"},\
										{"buttonHandler":"excel1","buttonIcon":"icon-redo","buttonText":"条件导出"},\
										{"buttonHandler":"excel14Select","buttonIcon":"icon-redo","buttonText":"勾选导出"}\
			]';
			addButtons(jQuery("#gview_zczl_list > .ui-jqgrid-titlebar"),buttonaddJSonString);
			var buttonchangeJSonString = '[ {"buttonHandler":"look","buttonIcon":"icon-search","buttonText":"查看"},\
											{"buttonHandler":"excel2","buttonIcon":"icon-redo","buttonText":"条件导出"},\
											{"buttonHandler":"excel24Select","buttonIcon":"icon-redo","buttonText":"勾选导出"}\
			]';
			addButtons(jQuery("#gview_change_list > .ui-jqgrid-titlebar"),buttonchangeJSonString);
			var buttoncancelJSonString = '[{"buttonHandler":"look","buttonIcon":"icon-search","buttonText":"查看"},\
											{"buttonHandler":"excel3","buttonIcon":"icon-redo","buttonText":"条件导出"},\
											{"buttonHandler":"excel34Select","buttonIcon":"icon-redo","buttonText":"勾选导出"}\
			]';
			addButtons(jQuery("#gview_surrenderRent_list > .ui-jqgrid-titlebar"),buttoncancelJSonString);
			$("#beginTime1,#beginTime2,#endTime1,#endTime2").datebox({
				formatter:function(date){
				return formatDate(date);
				}
			});
				
		});
		function business(){
			var ywlx = document.getElementById('ywlx');
			var index=ywlx.selectedIndex
			if(index==1||index==0){
				rent.style.display="block";
				change.style.display="none";
				surrender.style.display="none";
			}else if(index==2){
				rent.style.display="none";
				
				change.style.display="block";
				surrender.style.display="none";
			}else if(index==3){
				rent.style.display="none";
				change.style.display="none";
				surrender.style.display="block";}
		}
		
		// excel导出 add by 陈煜霄
		function excel1(){
			//var urlStr = "<%=basePath%>zltb/IntentionQuery_query4View.do";
			var urlStr = "com.tansun.eam2.jygdzc.action.IntentionQueryAction&com.tansun.eam2.jygdzc.vo.JyzlQueryVO";
			var biaoti = document.getElementById("biaoti").value;
			var bianhao = document.getElementById("bianhao").value;
			var zcbh = document.getElementById("zcbh").value;
			var zcmc = document.getElementById("zcmc").value;
			var CZclx = document.getElementById("CZclx").value;
			var ywlx = document.getElementById("ywlx").value;
			var beginTime1 = document.getElementById("beginTime1").value;
			if(beginTime1==""||beginTime1==null){
				beginTime1 = "1970-01-01";
			}
			var beginTime2 = document.getElementById("beginTime2").value;
			if(beginTime2==""||beginTime2==null){
				beginTime2 = "2050-12-31";
			}
			var endTime1 = document.getElementById("endTime1").value;
			if(endTime1==""||endTime1==null){
				endTime1 = "1970-01-01";
			}
			var endTime2 = document.getElementById("endTime2").value;
			if(endTime2==""||endTime2==null){
				endTime2 = "2050-12-31";
			}
			//var cp = jQuery("#zczl_list").getGridParam('page');
		    //var ps = jQuery("#zczl_list").getGridParam('rowNum');
		    var params = "{\"jyzlQueryVO.biaoti\":\"" + biaoti + "\",";
				params += "\"jyzlQueryVO.bianhao\":\"" + bianhao + "\",";
				params += "\"jyzlQueryVO.zcbh\":\"" + zcbh + "\",";
				params += "\"jyzlQueryVO.zcmc\":\"" + zcmc + "\",";
				params += "\"jyzlQueryVO.CZclx\":\"" + CZclx + "\",";
				params = "{\"jyzlQueryVO.ywlx\":\"" + ywlx + "\",";
				params += "\"jyzlQueryVO.begintime1\":\"" + beginTime1 + "\",";
				params += "\"jyzlQueryVO.begintime2\":\"" + beginTime2 + "\",";
				params += "\"jyzlQueryVO.endtime1\":\"" + endTime1 + "\",";
				params += "\"jyzlQueryVO.endtime2\":\"" + endTime2 + "\",";
				params += "\"paginator.currentPage\":\"" + 1 + "\",";
				params += "\"paginator.pageSize\":\"" + 10000000 + "\"}";
			exportExcel("zczl_list", urlStr, params, '资产租赁列表','rn,cb');
		}
		function excel14Select(){
			if(idStr!=null && idStr.length >= 1&&""!=idStr){
			    var urlStr ="<%=basePath%>zltb/IntentionQuery_query4ViewSelect.do";
				var params = "{\"idStr\":\"" + idStr + "\"}";
				exportExcel("zczl_list", urlStr, params, '资产租赁列表','rn,cb');
			}else{
				alert("请先选择数据");
			}
		}
		function excel24Select(){
			if(idStr!=null && idStr.length >= 1&&""!=idStr){
			    var urlStr ="<%=basePath%>zltb/IntentionQuery_query4ViewSelect.do";
				var params = "{\"idStr\":\"" + idStr + "\"}";
				exportExcel("change_list", urlStr, params, '资产租赁列表','rn,cb');
			}else{
				alert("请先选择数据");
			}
		}
		function excel34Select(){
			if(idStr!=null && idStr.length >= 1&&""!=idStr){
			    var urlStr ="<%=basePath%>zltb/IntentionQuery_query4ViewSelect.do";
				var params = "{\"idStr\":\"" + idStr + "\"}";
				exportExcel("surrenderRent_list", urlStr, params, '资产租赁列表','rn,cb');
			}else{
				alert("请先选择数据");
			}
		}
		function excel2(){
			//var urlStr = "<%=basePath%>zltb/IntentionQuery_query4View.do";
			var urlStr = "com.tansun.eam2.jygdzc.action.IntentionQueryAction&com.tansun.eam2.jygdzc.vo.JyzlQueryVO";
			var biaoti = document.getElementById("biaoti").value;
			var bianhao = document.getElementById("bianhao").value;
			var zcbh = document.getElementById("zcbh").value;
			var zcmc = document.getElementById("zcmc").value;
			var CZclx = document.getElementById("CZclx").value;
			var ywlx = document.getElementById("ywlx").value;
			var beginTime1 = document.getElementById("beginTime1").value;
			if(beginTime1==""||beginTime1==null){
				beginTime1 = "1970-01-01";
			}
			var beginTime2 = document.getElementById("beginTime2").value;
			if(beginTime2==""||beginTime2==null){
				beginTime2 = "2050-12-31";
			}
			var endTime1 = document.getElementById("endTime1").value;
			if(endTime1==""||endTime1==null){
				endTime1 = "1970-01-01";
			}
			var endTime2 = document.getElementById("endTime2").value;
			if(endTime2==""||endTime2==null){
				endTime2 = "2050-12-31";
			}
			//var cp = jQuery("#zczl_list").getGridParam('page');
		    //var ps = jQuery("#zczl_list").getGridParam('rowNum');
		    var params = "{\"jyzlQueryVO.biaoti\":\"" + biaoti + "\",";
				params += "\"jyzlQueryVO.bianhao\":\"" + bianhao + "\",";
				params += "\"jyzlQueryVO.zcbh\":\"" + zcbh + "\",";
				params += "\"jyzlQueryVO.zcmc\":\"" + zcmc + "\",";
				params += "\"jyzlQueryVO.CZclx\":\"" + CZclx + "\",";
				params = "{\"jyzlQueryVO.ywlx\":\"" + ywlx + "\",";
				params += "\"jyzlQueryVO.begintime1\":\"" + beginTime1 + "\",";
				params += "\"jyzlQueryVO.begintime2\":\"" + beginTime2 + "\",";
				params += "\"jyzlQueryVO.endtime1\":\"" + endTime1 + "\",";
				params += "\"jyzlQueryVO.endtime2\":\"" + endTime2 + "\",";
				//params += "\"paginator.currentPage\":\"" + cp + "\",";
				//params += "\"paginator.pageSize\":\"" + ps + "\"}";
				params += "\"paginator.currentPage\":\"" + 1 + "\",";
				params += "\"paginator.pageSize\":\"" + 10000000 + "\"}";
			exportExcel("change_list", urlStr, params, '资产租赁列表','rn,cb');
		}
		function excel3(){
			//var urlStr = "<%=basePath%>zltb/IntentionQuery_query4View.do";
			var urlStr = "com.tansun.eam2.jygdzc.action.IntentionQueryAction&com.tansun.eam2.jygdzc.vo.JyzlQueryVO";
			var biaoti = document.getElementById("biaoti").value;
			var bianhao = document.getElementById("bianhao").value;
			var zcbh = document.getElementById("zcbh").value;
			var zcmc = document.getElementById("zcmc").value;
			var CZclx = document.getElementById("CZclx").value;
			var ywlx = document.getElementById("ywlx").value;
			var beginTime1 = document.getElementById("beginTime1").value;
			if(beginTime1==""||beginTime1==null){
				beginTime1 = "1970-01-01";
			}
			var beginTime2 = document.getElementById("beginTime2").value;
			if(beginTime2==""||beginTime2==null){
				beginTime2 = "2050-12-31";
			}
			var endTime1 = document.getElementById("endTime1").value;
			if(endTime1==""||endTime1==null){
				endTime1 = "1970-01-01";
			}
			var endTime2 = document.getElementById("endTime2").value;
			if(endTime2==""||endTime2==null){
				endTime2 = "2050-12-31";
			}
			//var cp = jQuery("#zczl_list").getGridParam('page');
		    //var ps = jQuery("#zczl_list").getGridParam('rowNum');
		    var params = "{\"jyzlQueryVO.biaoti\":\"" + biaoti + "\",";
				params += "\"jyzlQueryVO.bianhao\":\"" + bianhao + "\",";
				params += "\"jyzlQueryVO.zcbh\":\"" + zcbh + "\",";
				params += "\"jyzlQueryVO.zcmc\":\"" + zcmc + "\",";
				params += "\"jyzlQueryVO.CZclx\":\"" + CZclx + "\",";
				params = "{\"jyzlQueryVO.ywlx\":\"" + ywlx + "\",";
				params += "\"jyzlQueryVO.begintime1\":\"" + beginTime1 + "\",";
				params += "\"jyzlQueryVO.begintime2\":\"" + beginTime2 + "\",";
				params += "\"jyzlQueryVO.endtime1\":\"" + endTime1 + "\",";
				params += "\"jyzlQueryVO.endtime2\":\"" + endTime2 + "\",";
				//params += "\"paginator.currentPage\":\"" + cp + "\",";
				//params += "\"paginator.pageSize\":\"" + ps + "\"}";
				params += "\"paginator.currentPage\":\"" + 1 + "\",";
				params += "\"paginator.pageSize\":\"" + 10000000 + "\"}";
			exportExcel("surrenderRent_list", urlStr, params, '资产租赁列表','rn,cb');
		}
		function look() {
			var ywlx = document.getElementById('ywlx');
			var index=ywlx.selectedIndex;
			if(index==1||index==0){
				var gr = jQuery("#zczl_list").jqGrid('getGridParam','selarrrow');
				if (gr.length == 0){
					alert("请选择要查看的记录!");
				}else if(gr.length > 1){	
					alert("一次只能查看一条记录")
				}else{
					var Url = 'zltb/IntentionQuery_findPTEndByHeadId.do?headId='+gr;
					$.post(Url,{ 
						"headId":""+gr+""
						},function(data){
							if(data!="0"){
								gr = ""+data+"";
								var url ='zltbWorkflow/zltbWorkflow_endView.do?id='+gr;
								url = encodeURIComponent(url);
								url = basePathJs + 'index.do?urlPortal=' + url;
								window.open(url,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
							}else{
								alert("此次租赁申请未办结或者办结列表数据已删除");
							}
						});
				}
			}else if(index==2){
				var gr = jQuery("#change_list").jqGrid('getGridParam','selarrrow');
				if (gr.length == 0){
					alert("请选择要查看的记录!");
				}else if(gr.length > 1){	
					alert("一次只能查看一条记录")
				}else{
					var Url = 'zltb/IntentionQuery_findPTEndByHeadId.do?headId='+gr;
					$.post(Url,{ 
						"headId":""+gr+""
						},function(data){
							if(data!="0"){
								gr = ""+data+"";
								var url ='zltbWorkflow/zltbWorkflow_endView.do?id='+gr;
								url = encodeURIComponent(url);
								url = basePathJs + 'index.do?urlPortal=' + url;
								window.open(url,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
							}else{
								alert("此次租赁申请未办结或者办结列表数据已删除");
							}
						});
					//window.open('<%=basePath%>zltb/IntentionManageHead_modify.do?headId='+gr,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				}
			}else if(index==3){
				var gr = jQuery("#surrenderRent_list").jqGrid('getGridParam','selarrrow');
				if (gr.length == 0){
					alert("请选择要查看的记录!");
				}else if(gr.length > 1){	
					alert("一次只能查看一条记录")
				}else{
				//	window.open('<%=basePath%>zltb/IntentionManageHead_modify.do?headId='+gr,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
					var Url = 'zltb/IntentionQuery_findPTEndByHeadId.do?headId='+gr;
					$.post(Url,{ 
						"headId":""+gr+""
						},function(data){
							if(data!="0"){
								gr = ""+data+"";
								var url ='zltbWorkflow/zltbWorkflow_endView.do?id='+gr;
								url = encodeURIComponent(url);
								url = basePathJs + 'index.do?urlPortal=' + url;
								window.open(url,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
							}else{
								alert("此次租赁信息在办结列表中数据已删除");
							}
						});
				}
			}
				return false;
		};
		function view(gr) {
			var ywlx = document.getElementById('ywlx');
			var index=ywlx.selectedIndex
			var Url = 'zltb/IntentionQuery_findPTEndByHeadId.do?headId='+gr;
			$.post(Url,{ 
				"headId":""+gr+""
				},function(data){
					if(data!="0"){
						gr = ""+data+"";
						if(index==1||index==0){
							var url ='zltbWorkflow/zltbWorkflow_endView.do?id='+gr;
							//var url='zltb/IntentionManageHead_modify.do?headId='+gr;
							url = encodeURIComponent(url);
							url = basePathJs + 'index.do?urlPortal=' + url;
							window.open(url,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
						}else if(index==2){
							var url ='zltbWorkflow/zltbWorkflow_endView.do?id='+gr;
							url = encodeURIComponent(url);
							url = basePathJs + 'index.do?urlPortal=' + url;
							window.open(url,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
						}else if(index==3){
							var url ='zltbWorkflow/zltbWorkflow_endView.do?id='+gr;
							url = encodeURIComponent(url);
							url = basePathJs + 'index.do?urlPortal=' + url;
							window.open(url,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
						}
				}else{
					alert("此条租赁信息在办结数据列表中已被删除");
				}
			});
				return false;
		};
		function query(){
		    idStr = new Array();
			var biaoti = document.getElementById("biaoti").value;
			var bianhao = document.getElementById("bianhao").value;
			var zcbh = document.getElementById("zcbh").value;
			var zcmc = document.getElementById("zcmc").value;
			var CZclx = document.getElementById("CZclx").value;
			var ywlx = document.getElementById("ywlx").value;
			var beginTime1 = document.getElementById("beginTime1").value;
			var beginTime2 = document.getElementById("beginTime2").value;
			var endTime1 = document.getElementById("endTime1").value;
			var endTime2 = document.getElementById("endTime2").value;
			var x = document.getElementById("ywlx");
			if(x.selectedIndex == 1 || x.selectedIndex==0){
			  	jQuery("#zczl_list").setGridParam({
		  			postData:{
						'jyzlQueryVO.biaoti' : biaoti,
						'jyzlQueryVO.bianhao' : bianhao,
						'jyzlQueryVO.zcbh' : zcbh,
						'jyzlQueryVO.zcmc' : zcmc,
						'jyzlQueryVO.CZclx' : CZclx,
						'jyzlQueryVO.ywlx' : ywlx,
						'jyzlQueryVO.begintime1' : beginTime1,
						'jyzlQueryVO.begintime2' : beginTime2,
						'jyzlQueryVO.endtime1' : endTime1,
						'jyzlQueryVO.endtime2' : endTime2
						},
						url : "<%=basePath%>zltb/IntentionQuery_query4View.do"
					}).trigger("reloadGrid") ;
			}else if(x.selectedIndex == 2){
				jQuery("#change_list").setGridParam({
		  			postData:{
						'jyzlQueryVO.biaoti' : biaoti,
						'jyzlQueryVO.bianhao' : bianhao,
						'jyzlQueryVO.zcbh' : zcbh,
						'jyzlQueryVO.zcmc' : zcmc,
						'jyzlQueryVO.CZclx' : CZclx,
						'jyzlQueryVO.ywlx' : ywlx,
						'jyzlQueryVO.begintime1' : beginTime1,
						'jyzlQueryVO.begintime2' : beginTime2,
						'jyzlQueryVO.endtime1' : endTime1,
						'jyzlQueryVO.endtime2' : endTime2
						},
						url : "<%=basePath%>zltb/IntentionQuery_query4View.do"
					}).trigger("reloadGrid") ;
			}else if(x.selectedIndex == 3){
		  			jQuery("#surrenderRent_list").setGridParam({
		  			postData:{
						'jyzlQueryVO.biaoti' : biaoti,
						'jyzlQueryVO.bianhao' : bianhao,
						'jyzlQueryVO.zcbh' : zcbh,
						'jyzlQueryVO.zcmc' : zcmc,
						'jyzlQueryVO.CZclx' : CZclx,
						'jyzlQueryVO.ywlx' : ywlx,
						'jyzlQueryVO.begintime1' : beginTime1,
						'jyzlQueryVO.begintime2' : beginTime2,
						'jyzlQueryVO.endtime1' : endTime1,
						'jyzlQueryVO.endtime2' : endTime2
						},
						url : "<%=basePath%>zltb/IntentionQuery_query4View.do"
					}).trigger("reloadGrid") ;
			}
		}
				jQuery("#zczl_list").setGridWidth($("#table").width());
				jQuery("#change_list").setGridWidth($("#table").width());
				jQuery("#surrenderRent_list").setGridWidth($("#table").width());
	 	 		$(window).bind('resize', function(){
					jQuery("#zczl_list").setGridWidth($("#table").width());
					jQuery("#change_list").setGridWidth($("#table").width());
					jQuery("#surrenderRent_list").setGridWidth($("#table").width());
				});	
</SCRIPT>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form action="" name="myForm" method="post">
<table width="100%" id="table"   border="0" align="center" class="newtable" cellpadding="0" cellspacing="0">
  <tr>
    <td class="td_ylp01">标题： </td>
    <td class="td_ylp02"><s:textfield name="jyzlQueryVO.biaoti" id="biaoti" /></td>
    <td class="td_ylp01">编号： </td>
    <td class="td_ylp03"><s:textfield name="jyzlQueryVO.bianhao" id="bianhao" /></td>
    <td class="td_ylp01"> 资产编号： </td>
    <td class="td_ylp02"><s:textfield name="jyzlQueryVO.zcbh" id="zcbh" /></td>
  </tr>
  <tr>
    <td class="td_ylp01"> 资产名称： </td>
    <td class="td_ylp02"><s:textfield name="jyzlQueryVO.zcmc" id="zcmc" /></td>
    <td class="td_ylp01"> 资产类型： </td>
    <td class="td_ylp03">
    <e:select parRefKey="ASSET_TYPE"  headerKey=""  headerValue="" list="#{}" name="jyzlQueryVO.CZclx" value="" id="CZclx" />
    </td>
    <td class="td_ylp01"> 业务类型： </td>
    <td class="td_ylp02"><s:select list="#{'':'','0':'出租','1':'变更','2':'退租'}" name="jyzlQueryVO.ywlx" id="ywlx" onchange="business()"/></td>
  </tr>
  <tr>
    <td class="td_ylp01"> 意向租赁起始日期： </td>
    <td class="td_ylp02" colspan="5"> 
     从 <s:textfield name="jyzlQueryVO.beginTime1" id="beginTime1"  />
   	到 <s:textfield name="jyzlQueryVO.beginTime2" id="beginTime2" />
    </td>
  </tr>
  <tr>
    <td class="td_ylp01"> 意向租赁到期日期： </td>
    <td class="td_ylp03" colspan="5"> 
      从 <s:textfield name="jyzlQueryVO.endTime1" id="endTime1"  />
   	到 <s:textfield name="jyzlQueryVO.endTime2" id="endTime2"  />
   	</td>
  </tr>
  <tr>
	<td colspan="6" class="td_form01">
    <input name="Submit2" type="button"  value="查询" onclick="query()" />
	<input name="Submit3" type="button"  value="重置" onClick="javascript:window.location.reload();" />
	</td>
  </tr>
</table>
</form>
<table  id="rent" style="display:block"  class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
	<td align="right">
	<table id="zczl_list"></table>
	  <div id="pgtoolbar1"></div>
	</td>
  </tr>
</table>
<table  id="change" style="display:block"   class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
	<td align="right">
	<table id="change_list"></table>
	  <div id="pgtoolbar2"></div>
	</td>
  </tr>
</table>
<table  id="surrender"  style="display:block"  class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
	<td align="right">
	<table id="surrenderRent_list"></table>
	  <div id="pgtoolbar3"></div>
	</td>
  </tr>
</table>
<%@ include file="/inc/exportExcel.inc"%>
</body>
</html>
<script type="text/javascript">
                   jQuery("#zczl_list").jqGrid({  
								datatype:"json",
								colNames: ['id','标题','编号','资产编号','资产名称','资产类型','业务类型', '租赁起始日期', '租赁到期日期','承租人','意向租赁总金额'],
								colModel: [
											{name:'id',index:'id',hidden:true},
									        {name:'biaoti',index:'biaoti',width:100},
											{name:'bianhao',index:'bianhao',width:100},
											{name:'zcbh',index:'zcbh',width:100},
											{name:'zcmc',index:'zcmc',width:100},
											{name:'CZclx',index:'CZclx',width:100},
											{name:'ywlx',index:'ywlx',width:100},
											{name:'zlqsrq',index:'zlqsrq',width:100},
											{name:'zldqrq',index:'zldqrq',width:100},
											{name:'czr',index:'czr',width:100},
											{name:'yxzjzje',index:'yxzjzje',width:100}
                                            ],
                                           	loadComplete:function(data){
											if(data && data.rows.length>0){
												jQuery("#zczl_list").setGridHeight(data.rows.length * 22 + 18);
											}else{
												jQuery("#zczl_list").setGridHeight(0);
											}
											},
											shrinkToFit:false,
											pager:'pgtoolbar1',
										    rownumbers:true,
										    multiselect:true,
										    height: 'auto',
                                            autowidth: true,
                                   			ondblClickRow:function(gr){
												view(gr);
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
												var allIds = jQuery("#zczl_list").jqGrid('getDataIDs');
												for(var i = 0; i < allIds.length; i++){
													var index = idStr.indexOf(allIds[i]);
													if(index != -1){
														idStr.removeAt(index);
														jQuery("#zczl_list").setSelection(allIds[i]);
													}
												}
											},
                                           	viewrecords:true,
                                            caption: '租赁信息列表',
                                            rowNum:10,
											prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
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
<script type="text/javascript">
                                        jQuery("#change_list").jqGrid({ 
											datatype:"json",
                  							colNames: ['id','标题','编号','资产编号','资产名称','资产类型', '地区','业务类型', '租赁起始日期', '租赁到期日期','承租人','租赁状态'],
                                            colModel: [
                                            {name:'id',index:'id',hidden:true},
											{name:'biaoti',index:'biaoti',width:100},
											{name:'bianhao',index:'bianhao',width:100},
											{name:'zcbh',index:'zcbh',width:100},
											{name:'zcmc',index:'zcmc',width:100},
											{name:'CZclx',index:'CZclx',width:100},
											{name:'dq',index:'dq',width:100},
											{name:'ywlx',index:'ywlx',width:100},
											{name:'zlqsrq',index:'zlqsrq',width:100},
											{name:'zldqrq',index:'zldqrq',width:100},
											{name:'czr',index:'czr',width:100},
											{name:'zlzt',index:'zlzt',width:100}
                                            ],
                                            loadComplete:function(data){
											if(data && data.rows.length>0){
												jQuery("#change_list").setGridHeight(data.rows.length * 22 + 18);
											}else{
												jQuery("#change_list").setGridHeight(0);
											}
											},
											shrinkToFit:false,
										   	pager:'pgtoolbar2',
										    rownumbers:true,
										    height: 'auto',
                                            autowidth: true,
                                       		ondblClickRow:function(gr){
												view(gr);
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
											var allIds = jQuery("#change_list").jqGrid('getDataIDs');
											for(var i = 0; i < allIds.length; i++){
												var index = idStr.indexOf(allIds[i]);
												if(index != -1){
													idStr.removeAt(index);
													jQuery("#change_list").setSelection(allIds[i]);
												}
											}
										},
                                           	viewrecords:true,
                                           	multiselect:true,
											rowNum:10,
											prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
										  	rowList:[10,20,30],
                                            caption: '租赁信息',
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
<script type="text/javascript">
                                        jQuery("#surrenderRent_list").jqGrid({
											datatype:"json",
                                            colNames: ['id','标题','编号','资产编号','资产名称','资产类型', '地区','业务类型', '租赁起始日期', '租赁到期日期','承租人','租赁状态','退租日期','退租原因'],
                                            colModel: [
                                            {name:'id',index:'id',hidden:true},
											{name:'biaoti',index:'biaoti',width:100},
											{name:'bianhao',index:'bianhao',width:100},
											{name:'zcbh',index:'zcbh',width:100},
											{name:'zcmc',index:'zcmc',width:100},
											{name:'CZclx',index:'CZclx',width:100},
											{name:'dq',index:'dq',width:100},
											{name:'ywlx',index:'ywlx',width:100},
											{name:'zlqsrq',index:'zlqsrq',width:100},
											{name:'zldqrq',index:'zldqrq',width:100},
											{name:'czr',index:'czr',width:100},
											{name:'zlzt',index:'zlzt',width:100},
											{name:'tzrq',index:'tzrq',width:100},
											{name:'tzyy',index:'tzyy',width:100}
                                            ],
                                            loadComplete:function(data){
											if(data && data.rows.length>0){
												jQuery("#surrenderRent_list").setGridHeight(data.rows.length * 22 + 18);
											}else{
												jQuery("#surrenderRent_list").setGridHeight(0);
											}
											},
											shrinkToFit:false,
								   			pager:'pgtoolbar3',
										    rownumbers:true,
										    height: 'auto',
                                            autowidth: true,
                                            ondblClickRow:function(gr){
												view(gr);
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
											var allIds = jQuery("#surrenderRent_list").jqGrid('getDataIDs');
											for(var i = 0; i < allIds.length; i++){
												var index = idStr.indexOf(allIds[i]);
												if(index != -1){
													idStr.removeAt(index);
													jQuery("#surrenderRent_list").setSelection(allIds[i]);
												}
											}
										},
                                           	viewrecords:true,
                                           	multiselect:true,
											rowNum:10,
											prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
										  	rowList:[10,20,30],
                                            caption: '租赁信息',
 											jsonReader : {
												root:"rows",
												page: "page",
												total: "total",
												records: "records",
												repeatitems: false,
												id: "0"
											}
                                        });
                                        $("#change").css("display","none");
                                        $("#surrender").css("display","none");
										
                </script>
