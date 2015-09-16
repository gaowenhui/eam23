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
										{"buttonHandler":"excel","buttonIcon":"icon-redo","buttonText":"导出"}\
			]';
			addButtons(jQuery("#gview_jyzl_ledger > .ui-jqgrid-titlebar"),buttonaddJSonString);
			$("#beginTime1,#beginTime2,#endTime1,#endTime2").datebox({
				formatter:function(date){
				return formatDate(date);
				}
			});
			jQuery("#jyzl_ledger").setGridWidth($("#table1").width());
	 		$(window).bind('resize', function(){
				jQuery("#jyzl_ledger").setGridWidth($("#table1").width());
			});	
		});
		// excel导出 add by 陈煜霄
		function excel(){
			var urlStr = "com.tansun.eam2.jygdzc.action.IntentionLedgerAction&com.tansun.eam2.jygdzc.vo.JyzlLedgerVO";
			//var zcbh = document.getElementById("zcbh").value;
			//var zcmc = document.getElementById("zcmc").value;
			var jyfl = document.getElementById("jyfl").value;
			var yjfh = document.getElementById("yjfh").value;
			var kpbh = document.getElementById("kpbh").value;
			var czr = document.getElementById("czr").value;
			var jydx = document.getElementById("jydx").value;
			//var sfzxwb = document.getElementById("sfzxwb").value;
			var glr = document.getElementById("glr").value;
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
		    var params = "{\"jyzlLedgerVO.jyfl\":\"" + jyfl + "\",";
				params += "\"jyzlLedgerVO.yjfh\":\"" + yjfh + "\",";
				params += "\"jyzlLedgerVO.kpbh\":\"" + kpbh + "\",";
				params += "\"jyzlLedgerVO.czr\":\"" + czr + "\",";
				params += "\"jyzlLedgerVO.jydx\":\"" + jydx + "\",";
				//params += "\"jyzlLedgerVO.sfzxwb\":\"" + sfzxwb + "\",";
				params += "\"jyzlLedgerVO.glr\":\"" + glr + "\",";
				params += "\"jyzlLedgerVO.begintime1\":\"" + beginTime1 + "\",";
				params += "\"jyzlLedgerVO.begintime2\":\"" + beginTime2 + "\",";
				params += "\"jyzlLedgerVO.endtime1\":\"" + endTime1 + "\",";
				params += "\"jyzlLedgerVO.endtime2\":\"" + endTime2 + "\",";
				params += "\"paginator.currentPage\":\"" + 1 + "\",";
				params += "\"paginator.pageSize\":\"" + 10000000 + "\"}";
			exportExcel("jyzl_ledger", urlStr, params, '资产租赁列表','rn,cb');
		}
		function look() {
			var gr = jQuery("#jyzl_ledger").jqGrid('getGridParam','selarrrow');
			if (gr.length == 0){
				alert("请选择要查看的记录!");
			}else if(gr.length > 1){	
				alert("一次只能查看一条记录")
			}else{
				 window.open('<%=basePath%>htqs/ContractQuery_viewBody.do?sheettype=contractInfo5&htId='+gr+'&htlx=2','','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
			}
			return false;
		};
		function view(gr) {
			 window.open('<%=basePath%>htqs/ContractQuery_viewBody.do?sheettype=contractInfo5&htId='+gr+'&htlx=2','','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
		};
		function query(){
			//var zcbh = document.getElementById("zcbh").value;
			//var zcmc = document.getElementById("zcmc").value;
			var jyfl = document.getElementById("jyfl").value;
			var yjfh = document.getElementById("yjfh").value;
			var kpbh = document.getElementById("kpbh").value;
			var czr = document.getElementById("czr").value;
			var jydx = document.getElementById("jydx").value;
			//var sfzxwb = document.getElementById("sfzxwb").value;
			var glr = document.getElementById("glr").value;
			var beginTime1 = document.getElementById("beginTime1").value;
			var beginTime2 = document.getElementById("beginTime2").value;
			var endTime1 = document.getElementById("endTime1").value;
			var endTime2 = document.getElementById("endTime2").value;
			jQuery("#jyzl_ledger").setGridParam({
				url:"<%=basePath%>zltb/IntentionLedger_query.do",
				postData:{
					//'jyzlLedgerVO.zcbh':zcbh,
					//'jyzlLedgerVO.zcmc':zcmc,
					'jyzlLedgerVO.jyfl':jyfl,
					'jyzlLedgerVO.yjfh':yjfh,
					'jyzlLedgerVO.kpbh':kpbh,
					'jyzlLedgerVO.czr':czr,
					'jyzlLedgerVO.jydx':jydx,
					//'jyzlLedgerVO.sfzxwb':sfzxwb,
					'jyzlLedgerVO.begintime1':beginTime1,
					'jyzlLedgerVO.begintime2':beginTime2,
					'jyzlLedgerVO.endtime1':endTime1,
					'jyzlLedgerVO.endtime2':endTime2,
					'jyzlLedgerVO.glr':glr
				}}).trigger("reloadGrid") ;
				
			}
</SCRIPT>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form action="" name="myForm" method="post">
<table width="100%" id="table1"   border="0" align="center" class="newtable" cellpadding="0" cellspacing="0">
<!-- 
  <tr>
    <td class="td_ylp01">资产编号： </td>
    <td class="td_ylp02"><s:textfield name="jyzlLedgerVO.zcbh" id="zcbh" /></td>
    <td class="td_ylp01">资产名称： </td>
    <td class="td_ylp03"><s:textfield name="jyzlLedgerVO.zcmc" id="zcmc" /></td>
    <td class="td_ylp01"> 经营分类： </td>
    <td class="td_ylp02">
    <e:select parRefKey="ASSET_MANAGE_TYPE" headerKey="" headerValue=""
						list="#{}" name="jyzlLedgerVO.jyfl" id="jyfl" value="0" /></td>
  </tr>
  -->
  <tr>
    <td class="td_ylp01"> 一级分行： </td>
    <td class="td_ylp02">
    	<e:select parRefKey="department" headerKey=""  headerValue=""
						parentId="438" list="#{}" id="yjfh" name="jyzlLedgerVO.yjfh" />
    </td>
    <td class="td_ylp01"> 经营分类： </td>
    <td class="td_ylp03">
    <e:select parRefKey="ASSET_MANAGE_TYPE" headerKey="" headerValue=""
						list="#{}" name="jyzlLedgerVO.jyfl" id="jyfl" value="0" /></td>
	<td class="td_ylp01"> 卡片编号： </td>
    <td class="td_ylp02"><s:textfield name="jyzlLedgerVO.kpbh" id="kpbh" /></td>
  </tr>
  <tr>
  	<td class="td_ylp01"> 交易对象： </td>
    <td class="td_ylp02"><s:select list="#{'':'','1':'建行',2:'非建行'}" name="jyzlLedgerVO.jydx" id="jydx" /></td>
    <td class="td_ylp01"> 承租人： </td>
    <td class="td_ylp03"><s:textfield name="jyzlLedgerVO.czr" id="czr" /></td>
    <!-- 
  	<td class="td_ylp01">执行完毕： </td>
    <td class="td_ylp03"><s:select list="#{'':'','1':'是',0:'否'}" name="jyzlLedgerVO.sfzxwb" id="sfzxwb"  /></td>
     -->
    <td class="td_ylp01"> 管理人： </td>
    <td class="td_ylp02" colspan="5"><s:textfield name="jyzlLedgerVO.glr" id="glr" /></td>
  </tr>
  <tr>
    <td class="td_ylp01"> 合同起始日期： </td>
    <td class="td_ylp02" colspan="5"> 
     从 <s:textfield name="jyzlLedgerVO.beginTime1" id="beginTime1"  />
   	到 <s:textfield name="jyzlLedgerVO.beginTime2" id="beginTime2" />
    </td>
  </tr>
  <tr>
    <td class="td_ylp01"> 合同到期日期： </td>
    <td class="td_ylp03" colspan="5"> 
      从 <s:textfield name="jyzlLedgerVO.endTime1" id="endTime1"  />
   	到 <s:textfield name="jyzlLedgerVO.endTime2" id="endTime2"  />
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
	<table id="jyzl_ledger"></table>
	<div id="pgtoolbar1"></div>
<%@ include file="/inc/exportExcel.inc"%>
</body>
</html>
<script type="text/javascript">
                   jQuery("#jyzl_ledger").jqGrid({  
                   				//url : "<%=basePath%>zltb/IntentionLedger_query.do",
								datatype:"json",
								colNames: ['id','一级分行','资产编号','资产名称','资产类型','主卡片编号', '本币原值', '地理位置','建筑面积','承租人','租赁面积原值','租赁部分所处位置','承租面积','合同开始日期','合同到期日期','用途','月收费标准','月租金','年租金','付款方式','应收未收金额','本年实收金额','整个租期累计收款','执行完毕','交易对象','管理人'],
								colModel: [
											{name:'id',index:'id',hidden:true},
									        {name:'yjfh',index:'yjfh',width:120},
											{name:'zcbh',index:'zcbh'},
											{name:'zcmc',index:'zcmc'},
											{name:'jyfl',index:'jyfl',width:80},
											{name:'kpbh',index:'kpbh',width:100},
											{name:'ybyz',index:'ybyz',width:100},
											{name:'cfdd',index:'cfdd'},
											{name:'jzmj',index:'jzmj',width:100},
									        {name:'czr',index:'czr'},
											{name:'zlmjyz',index:'zlmjyz'},
											{name:'zlmjscwz',index:'zlmjscwz',width:120},
											{name:'czsl',index:'czsl',width:80},
											{name:'htqsrq',index:'htqsrq',width:100},
											{name:'htdqrq',index:'htdqrq',width:100},
											{name:'zlyt',index:'zlyt'},
											{name:'ysfbz',index:'ysfbz',width:80},
											{name:'yzj',index:'yzj',width:80},
											{name:'nzjjg',index:'nzjjg',width:80},
											{name:'jsfs',index:'jsfs',width:80},
											{name:'yswsje',index:'yswsje'},
											{name:'bnssje',index:'bnssje'},
											{name:'sszje',index:'sszje'},
											{name:'sfzxwb',index:'sfzxwb',width:80},
											{name:'jydx',index:'jydx',width:80},
											{name:'glr',index:'glr',width:80}
                                            ],
                                           	loadComplete:function(data){
											if(data && data.rows.length>0){
												jQuery("#jyzl_ledger").setGridHeight(data.rows.length * 22 + 18);
											}else{
												jQuery("#jyzl_ledger").setGridHeight(0);
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
												var allIds = jQuery("#jyzl_ledger").jqGrid('getDataIDs');
												for(var i = 0; i < allIds.length; i++){
													var index = idStr.indexOf(allIds[i]);
													if(index != -1){
														idStr.removeAt(index);
														jQuery("#jyzl_ledger").setSelection(allIds[i]);
													}
												}
											},
                                           	viewrecords:true,
                                            caption: '租赁信息台账表',
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
