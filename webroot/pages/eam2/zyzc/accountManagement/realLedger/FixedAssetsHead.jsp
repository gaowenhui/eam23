<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<base href="<%=basePath%>"/>
		<title>固定资产实物台账</title>
		<script type="text/javascript">
			$(function(){
				$("#real_goods_list").setGridWidth($("#gridTable").width());
				$(window).bind('resize',function(){
					$("#real_goods_list").setGridWidth($("#gridTable").width());
				});
				
				//添加按钮  "#gview_list > .ui-jqgrid-titlebar
				var buttonJSonString = '[{"buttonHandler":"detail","buttonIcon":"icon-search","buttonText":"查看"},\
										 {"buttonHandler":"excel","buttonIcon":"icon-redo","buttonText":"导出"}\
				]';
				window.parent.clearPanelTool();
				addButtons(jQuery("#gview_real_goods_list > .ui-jqgrid-titlebar"),buttonJSonString);
				
				$("#qyzzrq,#qyzwrq").datebox({
			    	formatter:function(date){
			    		return formatDate(date);
			    	}
				});
			});
			
			//当一级分类改变时触发此方法，显示出二级分类供选择
			function ejflRefresh(fl){
				$.post("<%=basePath%>zyzc/ZCQuery_ejflRefresh.do",{
					"zyZc.yjflbm" : $(fl).val()
				},function(returnStr){
					var returnObj = eval('(' + returnStr + ')');
					if(returnObj.ejfls.length>=1){
						for(var i=0; i<returnObj.ejfls.length; i++){
							$("#ejflbm").append("<option value='" + returnObj.ejfls[i].ejflbm + "'>" + returnObj.ejfls[i].ejflmc + "</option>");
						}
					}
				});
				$("#sjflbm").html("<option value='0'>--请选择--</option>");
				$("#ejflbm").html("<option value='0'>--请选择--</option>");
			}
			
			//当二级分类改变时触发此方法，显示出三级分类供选择（如果有三级分类）
			function sjflRefresh(fl){
				$.post("<%=basePath%>zyzc/ZCQuery_sjflRefresh.do",{
					"zyZc.ejflbm" : $(fl).val()
				},function(returnStr){
					var returnObj = eval('(' + returnStr + ')');
					if(returnObj.sjfls.length>=1){
						for(var i=0; i<returnObj.sjfls.length; i++){
							$("#sjflbm").append("<option value='" + returnObj.sjfls[i].sjflbm + "'>" + returnObj.sjfls[i].sjflmc + "</option>");
						}
					}
				});
				$("#sjflbm").html("<option value='0'>--请选择--</option>");
			}
			
			function creatCard(){
				window.open('<%=basePath%>kpgl/cardHead_newHead.do?sheetType=add',
				'','height=400, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				
			}
			function cardDetail(){
				window.open('../../../card_Management/card/card-info.html');
				window.open('<%=basePath%>zyzc/ZCBookManage_viewBody.do?sheettype=zcBook&head.sheadId=${head.sheadId};',
				'','height=400, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
			}
			
			//查看物品详细信息
			function detail(){
				var gr = jQuery("#real_goods_list").jqGrid('getGridParam','selarrrow');
				if (gr.length == 0){
					alert("请选择要查看的记录!");
				}else if(gr.length > 1){
					alert("一次只能查看一条记录!");
				}else if (gr.length == 1){
					window.open('<%=basePath%>zyzc/ZCManageBody_viewGoodDetail.do?bodyId=' + gr+"&sheettype="+$("#sheettype").val()+"_view",
				'','height=400, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				}
			}
			
			function modifyGoods(){
				var gr = jQuery("#real_goods_list").jqGrid('getGridParam','selarrrow');
				if (gr.length == 0){
					alert("请选择要修改的记录!");
				}else if(gr.length > 1){
					alert("一次只能修改一条记录!");
				}else if (gr.length == 1){
					window.open('<%=basePath%>zyzc/ZCBookManage_modifyRecord.do?bodyIds='+ gr,
					'','height=400, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				}
			}
			
			function addBook(){
				window.open('<%=basePath%>zyzc/ZCBookManage_addBody.do',
				'','height=400, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				
			}
			
			// excel导出 addby 陈煜霄
			function excel(){
				var dataIdArr = jQuery("#real_goods_list").getDataIDs();
				 if(dataIdArr.length == 0){
				 	alert("没有可以导出的资产！");
				 }else if(dataIdArr.length > 0){
				    //var urlStr = jQuery("#real_goods_list").getGridParam('url');
				    var urlStr = "com.tansun.eam2.zyzc.action.ZCBookQueryAction&com.tansun.eam2.zyzc.vo.QueryPurchaseVo";
				    var yjflbm = document.getElementById("yjflbm").value;
					var ejflbm = document.getElementById("ejflbm").value;
					var sjflbm = document.getElementById("sjflbm").value;
					var gg = document.getElementById("gg").value;
					var zcmc = document.getElementById("zcmc").value;
					var zdjg = document.getElementById("zdjg").value;
					var zgjg = document.getElementById("zgjg").value;
					var sfsckp = document.getElementById("sfsckp").value;
					var ghlx = "realFixedAsset";
				    var params = "{\"queryPurVo.yjflbm\":\"" + yjflbm + "\",";
						params += "\"queryPurVo.ejflbm\":\"" +ejflbm + "\",";
						params += "\"queryPurVo.sjflbm\":\"" + sjflbm + "\",";
						params += "\"queryPurVo.zcmc\":\"" + zcmc + "\",";
						params += "\"queryPurVo.gg\":\"" + gg + "\",";
						params += "\"queryPurVo.zdjg\":\"" + zdjg + "\",";
						params += "\"queryPurVo.zgjg\":\"" + zgjg + "\",";
						params += "\"queryPurVo.ghlx\":\"" + ghlx + "\",";
						params += "\"queryPurVo.sfsckp\":\"" + sfsckp + "\",";
						params += "\"paginator.currentPage\":\"" + 1 + "\",";
						params += "\"paginator.pageSize\":\"" + 10000000 + "\"}";
					exportExcel("real_goods_list", urlStr, params, '自用资产实物台账','rn,cb');
				}
			}
			
			function query(){
				var url1 = "<%=basePath %>zyzc/ZCBookQuery_querySWTZ.do";
				jQuery("#real_goods_list").setGridParam({
						url:url1,
						postData:{
							"queryPurVo.yjflbm"		:	$("#yjflbm").val(),
							"queryPurVo.ejflbm"		:	$("#ejflbm").val(),
							"queryPurVo.sjflbm"		:	$("#sjflbm").val(),
							"queryPurVo.zcmc"		:	$("#zcmc").val(),
							"queryPurVo.gg"			:	$("#gg").val(),
							"queryPurVo.zcbh"		:	$("#zcbh").val(),
							"queryPurVo.zdjg"		:	$("#zdjg").val(),
							"queryPurVo.zgjg"		:	$("#zgjg").val(),
							"queryPurVo.sfsckp"		:	$("#sfsckp").val()
						}
				}).trigger("reloadGrid");
			}
			
			function checkDataValidate(startDate, endDate){
				if(startDate.length > 0 && endDate.length > 0){
					if(isDate(startDate) > isDate(endDate)){
						alert("开始日期应小于结束日期，请重新输入！");
						return false;
					}
					return true;
				}
				return true;
			}
        </script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<s:form  name="myform" id="myform">
		<s:hidden name="zctzlx" id="zctzlx" value="swgdzc"></s:hidden>
		<s:hidden name="queryPurVo.tzlx" id="tzlx" value="swtz"></s:hidden>
		<s:hidden name="queryPurVo.zclx" id="zclx" value="gdzc"></s:hidden>
		<s:hidden name="sheettype" id="sheettype" value="zcBook_swtz"></s:hidden>
		 <table id="gridTable" class="newtable" width="100%" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td class="td_zxy01">一级分类： </td>
              <td class="td_zxy02">
					<s:select name="queryPurVo.yjflbm" list="#{1:'计算机类固定资产',5:'非计算机类固定资产'}" headerKey="0" 
						headerValue="--请选择--"  id="yjflbm" onchange="ejflRefresh(this)"></s:select>
			  </td>
	          <td class="td_zxy01">二级分类： </td>
              <td class="td_zxy02">
					<s:select  name="queryPurVo.ejflbm" list="%{#session.ejMap}" headerKey="0" 
						headerValue="--请选择--" id="ejflbm" onchange="sjflRefresh(this)"></s:select>
				</td>
	        </tr>
	        <tr>
				<td class="td_zxy01">三级分类：</td>
				<td class="td_zxy02">
					<s:select name="queryPurVo.sjflbm" list="%{#session.sjMap}" headerKey="0" 
						headerValue="--请选择--" id="sjflbm"></s:select>
				</td>
				<td class="td_zxy01">资产名称：</td>
				<td class="td_zxy02">
					<s:textfield name="queryPurVo.zcmc" cssClass="input" id="zcmc"/>
				</td>
			</tr>
	        <tr>
              <td class="td_zxy01">品牌/规格型号：</td>
				<td class="td_zxy02">
					<s:textfield name="queryPurVo.gg" cssClass="input" id="gg"/>
			  </td>
			  <td class="td_zxy01">财产原值 从：</td>
              <td class="td_zxy02">
              	<s:textfield name="queryPurVo.zdjg" id="zdjg"/>&nbsp;至：<s:textfield name="queryPurVo.zgjg" id="zgjg"/>
              </td>
            </tr>
			<tr>
              <td class="td_zxy01">是否生成卡片：</td>
              <td class="td_zxy02">
			  	<select name="queryPurVo.sfsckp" id="sfsckp">
			  		<option selected="selected"></option>
					<option>是</option>
					<option>否</option>
			  	</select>
			  </td>
			  <td class="td_zxy01">&nbsp;</td>
              <td class="td_zxy02">&nbsp;</td>
            </tr>
			<tr>
				<td class="td_zxy02" colspan="4" style="text-align:right">
					<input type="button" value="查询" class="buttonface" onclick="query();"/>
					<input type="reset" value="重置" class="buttonface"/>
				</td>
			</tr>	
    	</table>
		
	   <table id="real_goods_list"></table>
	   <div id="pgtoolbar"></div>
	   <script type="text/javascript">
	   //增加领用人  ,'领用人'    {name:'lyrmc',index:'lyrmc'}
		jQuery("#real_goods_list").jqGrid({
			datatype:"json",
			colNames:['id','一级分类','二级分类','三级分类','资产名称','品牌/规格型号',
					  '资产编号','财产原值','是否生成卡片','领用人'],
			colModel:[
				{name:'zcId',index:'zcId',hidden:true},
				{name:'yjflmc',index:'yjflmc'},
				{name:'ejflmc',index:'ejflmc'},
				{name:'sjflmc',index:'sjflmc'},
				{name:'zcmc',index:'zcmc'},
				{name:'gg',index:'gg'},
				{name:'zcbh',index:'zcbh',align:'right'},
				{name:'czyz',index:'czyz',align:'right'},
				{name:'sfsckp',index:'sfsckp',align:'center'},
				{name:'lyrmc',index:'lyrmc'}
			],
			pager:'pgtoolbar',
			multiselect:true,
			rownumbers:true,
			autowidth:true,
			height:'auto',
			rowNum:20,
			rowList:[10,20,30],
			viewrecords:true,
			prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
			caption:"固定资产实物台账",
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
		</s:form>
		<%@ include file="/inc/exportExcel.inc"%>
	</body>
</html>