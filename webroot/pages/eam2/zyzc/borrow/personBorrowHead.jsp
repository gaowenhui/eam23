<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%String headId = request.getAttribute("head.sheadId").toString();%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<base href="<%=basePath%>"/>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>自用固定资产借用申请</title>
		<script type="text/javascript">
			$(function(){
				jQuery("#personal_borrow_list").setGridWidth($("#gridTable").width());
		        $(window).bind('resize', function(){
					jQuery("#personal_borrow_list").setGridWidth($("#gridTable").width());
		        });
		        
	       		var buttonJSonString = '[{"buttonHandler":"add","buttonIcon":"icon-add","buttonText":"增加"},\
	       								 {"buttonHandler":"modifyBody","buttonIcon":"icon-edit","buttonText":"修改"},\
	       								 {"buttonHandler":"detail","buttonIcon":"icon-search","buttonText":"查看"},\
										 {"buttonHandler":"deleteBody","buttonIcon":"icon-remove","buttonText":"删除"}\
				]';
				addButtons(jQuery("#gview_personal_borrow_list > .ui-jqgrid-titlebar"),buttonJSonString);
				
				var parentButtonStr = '[{"id":"tijiaohouyinchang","buttonHandler":"mainWindow.updateZySheadBDZT","buttonIcon":"icon-save","buttonText":"提交"}]';		
				window.parent.addButtonsFromChildren(parentButtonStr,"");
				       
			});
		
			//添加资产信息
			function add(){
				var sheadId = $("#sheadId").val();
				var sheettype = $("#sheettype").val();
				window.open('<%=basePath%>zyzc/ZCQuery_init.do?sheettype='+sheettype+'&headId='+sheadId,
				'','height=700, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
			}
		
			function deleteBody(){
				var gr = jQuery("#personal_borrow_list").jqGrid('getGridParam','selarrrow');
				if (gr.length == 0){
					alert("请选择要删除的记录!");
				}else{
					if(confirm("确认删除？")){
						var ZCManagedeleteBody ="<%=request.getContextPath()%>/zyzc/ZCManageBody_deleteBody.do";
						$.post(ZCManagedeleteBody,{delBodyIds:"" + gr + ""}, function(data){
							jQuery("#personal_borrow_list").trigger("reloadGrid");
						});
					}
				}
			}
			
			function modifyBody(){
				var gr=jQuery("#personal_borrow_list").jqGrid('getGridParam','selarrrow');
				var sheettype = $("#sheetType").val();
				if(gr.length > 1){
					alert('只能修改一条记录');
				}else if( gr.length == 1 ){
					var bodyId = gr;
					var displayFpslOrNOt = "No";
					var zksl = jQuery("#personal_borrow_list").getCell(gr,"zksl");
					window.open('<%=request.getContextPath()%>/zyzc/ZCManageBody_modBody.do?sheettype='+sheettype+'&bodyId='+bodyId+'&zksl='+zksl+'&displayFpslOrNOt='+displayFpslOrNOt,
						'','top=200,left=200,width=800,height=350,toolbar=no,menubar=no,scrollbars=no, resizable=no,location=no, status=no');
				}else alert("请选择要修改的记录");
			}
			
			//查看物品详细信息
			function detail(){
				var gr = jQuery("#personal_borrow_list").jqGrid('getGridParam','selarrrow');
				if (gr.length == 0){
					alert("请选择要查看的记录!");
				}else if(gr.length > 1){
					alert("一次只能查看一条记录!");
				}else if (gr.length == 1){
					window.open('<%=basePath%>zyzc/ZCManageBody_viewGoodDetail.do?bodyId=' + gr+"&sheettype="+$("#sheetType").val()+"_view",
				'','height=210, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				}
			}
			
			function saveZcListToBody(delBodyIds,sl){
				$.post("<%=basePath%>zyzc/ZCManageBody_saveZcListToBody.do",
						{
							"sqrmc"			:	""+$("#ngrmc").val(),
							"sqrid"			:	""+$("#ngrbh").val(),
							"sqbmid"		:	""+$("#ngbmbh").val(),
							"sqbmmc"		:	""+$("#ngbmmc").val(),
							"jylyrq"		:	""+$("#ngrq").val(),
							"delBodyIds"	:	""+delBodyIds,
							"dic3_id"		:	""+delBodyIds,
							"unionIds"		:	""+delBodyIds,
							"sl"			:	""+sl,
							"head.sheadId"	:	$("#sheadId").val(),
							"sheettype"		:	$("#sheettype").val()
						},function(data){
							jQuery("#personal_borrow_list").trigger("reloadGrid");
						}
				);
			}
			
			//点击保存按钮，更新该表的状态为“进行中”
			function updateZySheadBDZT(){
				var idArray = $("#personal_borrow_list").getDataIDs();
			    if(idArray == null||idArray.length == 0){
			       alert("请至少添加一条资产");
			        return false;
			    }
			    
			    var slArr = jQuery("#personal_borrow_list").getCol("sl");
			    var sqrmc = jQuery("#personal_borrow_list").getCol("sqrmc");
			    var sqbmmc = jQuery("#personal_borrow_list").getCol("sqbmmc");
			    var jylyrq = jQuery("#personal_borrow_list").getCol("jylyrq");
			    var jydqrq = jQuery("#personal_borrow_list").getCol("jydqrq");
			    var jyts = jQuery("#personal_borrow_list").getCol("jyts");
			    for(var i = 0; i < slArr.length; i++){
			    	if(slArr[i] == 0){
			    		alert("物品数量不能为0！");
			    		return false;
			    	}else if(sqrmc[i] == ""){
			    		alert("申请人不能为空！");
			    		return false;
			    	}else if(sqbmmc[i] == ""){
			    		alert("申请部门不能为空！");
			    		return false;
			    	}else if(jylyrq[i] == ""){
			    		alert("借用开始日期不能为空！");
			    		return false;
			    	}else if(jydqrq[i] == ""){
			    		alert("借用到期日期不能为空！");
			    		return false;
			    	}else if(jyts[i] == "" || jyts[i] == 0){
			    		alert("借用天数不能为0！");
			    		return false;
			    	}
			    }
			    
				var sheettype = document.getElementById("sheetType").value;
				var sheadId = document.getElementById("sheadId").value;
				$.post("<%=basePath%>zyzc/ZCManageBody_updateZySheadBDZT.do",
					   {'sheettype':sheettype,'headId':sheadId},
					   function(data){
					   		if(data == "ok"){
					   			alert("提交成功！");
					   			window.parent.removeObj("#tijiaohouyinchang");
					   		}else{
					   			alett("提交失败！");
					   		}
					   }
				);
			}
			
			//保存到台账
			function saveToTZ(){
				var sheettype = document.getElementById("sheetType").value;
				var sheadId = document.getElementById("sheadId").value;
				$.post("<%=basePath%>zyzc/ZCManageBody_saveInfoToKCtz.do",
					   {'sheettype':sheettype,'headId':sheadId},function(data){}
				);
			}
			
			//修改的情况下用此函数刷新grid
			function refreshGrid(){
				jQuery("#personal_borrow_list").trigger("reloadGrid");
			}
			
			function beforeWorkFlowSubmit(){
				$("input").removeAttr("disabled");	
				$("textarea").removeAttr("disabled");	
				$("select").removeAttr("disabled");	
				return true;
			}
		</script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<s:form action="zyzc/ZCManageHead_saveHead.do" method="POST" name="myform" id="myform">
			<br/><br/><br/>
			<div align="center"><span class="STYLE1">中国建银投资有限责任公司自用资产个人借用申请</span></div>
			<br/>
			<hr color="#6600CC" align="center" width="100%" />
			<s:hidden name="head.sheadId" id="sheadId"></s:hidden>
			<s:hidden name="head.sheetType" id="sheetType"></s:hidden>
			<s:hidden name="sheettype" id="sheettype"></s:hidden>
			<s:hidden name="headId" id="headId"></s:hidden>
			<s:hidden name="delBodyIds" id="delBodyIds"></s:hidden>
			<r:depthidden id="deptid" view="N" />
			<table id='gridTable' class="newtable" width="100%" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td class="td_zxy01">借用人：</td>
					<td class="td_zxy02">
						<s:hidden name="head.ngrbh" id="ngrbh"></s:hidden>
						<s:hidden name="head.ngbmbh" id="ngbmbh"></s:hidden>
						<s:hidden name="head.ngbmmc" id="ngbmmc"></s:hidden>
						<s:textfield name="head.ngrmc" disabled="true" cssClass="input" id="ngrmc" />
					</td>
					<td class="td_zxy01">拟稿日期：</td>
					<td class="td_zxy02">
						<s:textfield name="head.ngrq" disabled="true" id="ngrq" cssClass="input" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">借用人电话：</td>
					<td class="td_zxy02">
						<s:textfield name="head.ldxh" cssClass="input" id="ldxh" />
					</td>
					<td class="td_zxy01">急缓程度：</td>
					<td class="td_zxy02">
						<s:select name="head.jhcd" cssClass="input" id="jhcd" list="{'一般','急','特急'}"/>
					</td>
				</tr>
			</table>
			
			<table id="personal_borrow_list"></table>
			<div id="pgtoolbar" style="display: none"></div>
			<script type="text/javascript">
				jQuery("#personal_borrow_list").jqGrid({
				    url:"<%=basePath%>zyzc/ZCManageBody_displayBodyListWithHeadIdAndPager.do",
				     postData:{"head.sheadId" : $("#sheadId").val()},
					datatype: "json",
					colNames:['id','一级分类','二级分类','三级分类','数量','在库数量','单位',
							  '借用人','借用部门','借用开始日期','借用到期日期','借用天数','备注'],
					colModel:[
						{name:'sbodyId',index:'sbodyId',hidden:true},
						{name:'yjflmc',index:'yjflmc'},
						{name:'ejflmc',index:'ejflmc'},
						{name:'sjflmc',index:'sjflmc'},
						{name:'sl',index:'sl',align:"center",sorttype:"int"},	
						{name:'zksl',index:'zksl',hidden:true},	
						{name:'jldw',index:'jldw',align:"center"},
						{name:'sqrmc',index:'sqrmc',align:"center"},
						{name:'sqbmmc',index:'sqbmmc'},
						{name:'jylyrq',index:'jylyrq'},
						{name:'jydqrq',index:'jydqrq'},
						{name:'jyts',index:'jyts'},
						{name:'bz2',index:'bz2'}
					],
					multiselect:true,
					rownumbers:true,
					autowidth:true,
					height:'auto',
					rowNum:1000000,
					rowList:[10,20,30],
					viewrecords:true,
					prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
					caption: "个人借用物品清单 ",
					jsonReader : {
						root:"rows",
						page: "page",
						total: "total",
						records: "records",
						repeatitems: false,
						id: "0"
					},
					gridComplete:function(){
					var bodyIdArr = jQuery("#personal_borrow_list").getDataIDs();
					if(bodyIdArr.length > 0){
						$.post(
							"<%=basePath%>zyzc/ZCManageBody_getSlBySbodyId.do",
							{"bodyIdStr"	:	""+bodyIdArr},
							function(bodyAndSLStr){
								var bodyAndSLArr = bodyAndSLStr.split(">#[]#<");
								for(var i = 0; i < bodyAndSLArr.length; i++){
									if(bodyAndSLArr[i].length > 0){
										var bodyAndSL = bodyAndSLArr[i].split(">##<");
										jQuery("#personal_borrow_list").setCell(bodyAndSL[0],"zksl",bodyAndSL[1]);
									}
								}
							}
						);
					}
				}
				});
			</script>
		</s:form>
	</body>
</html>