<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery2.inc"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<SCRIPT language=JavaScript type=text/JavaScript>
	function windowOpen(theURL,winName,features,width,hight,scrollbars,top,left){
	  var parameter="top="+top+",left="+left+",width="+width+",height="+hight;
	  if(scrollbars=="no") {
	  	parameter+=",scrollbars=no";
	  }  else {
	  	parameter+=",scrollbars=yes";  	
	  }
	  window.open(theURL,winName,parameter);
	}
	function displayUpperLayer(index){
		for(var i=0;i<4;i++){
			if(index==i){
			   document.getElementById("upperLayer"+i).style.display="block";
			}else{
			   document.getElementById("upperLayer"+i).style.display="none";
			}
		}
	}
	function showSubimtPage(){
		document.getElementById("subimtPage").style.display="block";
	}
	function cancleSubmit(){
		document.getElementById("subimtPage").style.display="none";

	}
	function EditForm(){
		var id = jQuery("#zccz_list").jqGrid('getGridParam','selarrrow');
		if(isSingle(id)){
			$("#zccz_list").editGridRow(id,{
				url : "<%=basePath%>zccz/evalCommentQuery_updateMemo.do?id="+id,
				addCaption : "编辑备注",
				afterSubmit : function(returnObj, postData){
					//alert(returnObj.status);
					if(returnObj.status == 200){
						jQuery("#zccz_list").trigger("reloadGrid");
						  $("#editmodzccz_list").remove();
						return true;
					}else{
						alert("修改失败,请联系管理员!");
						return false;
					}
				}
			});
		}
	}
	$(function(){
			$("#datebegin,#dateend").datebox({
			    	formatter:function(date){
			    		return formatDate(date);
			    	}
				})
		var buttonJSonString_anzhiPerson = '[{"id":"edit","buttonHandler":"EditForm","buttonIcon":"icon-edit","buttonText":"编辑备注"},{"buttonHandler":"excel","buttonIcon":"icon-redo","buttonText":"导出"}\]';
			addButtons($("#gview_zccz_list > .ui-jqgrid-titlebar"),buttonJSonString_anzhiPerson);
			
		$("#cbrq").datebox({
	    	formatter:function(date){
	    		return formatDate(date);
	    	}
		})
	});
	
	function excel(){
			//var urlStr = "<%=basePath%>zccz/evalCommentQuery_queryString2.do";
		alert("ll");
		  var urlStr = "com.tansun.eam2.zccz.action.EvalPingguQueryAction&com.tansun.eam2.zccz.vo.EvalVO2";	
			var biaoti = document.getElementById("biaoti").value;
			var scxm = document.getElementById("scxm").value;
			var scyd = document.getElementById("scyd").value;
			var jtyj=document.getElementById("jtyj").value;
			var cp = jQuery("#zccz_list").getGridParam('page');
		    var ps = jQuery("#zccz_list").getGridParam('rowNum');
		    var params = "{\"evalVO2.biaoti\":\"" + biaoti + "\",";
				params += "\"evalVO2.scxmmc\":\"" + scxm + "\",";
				params += "\"evalVO2.scydmc\":\"" + scyd + "\",";
				params += "\"evalVO2.jtyj\":\"" + jtyj + "\",";
				params += "\"paginator.currentPage\":\"" + 1 + "\",";
				params += "\"paginator.pageSize\":\"" + 10000000 + "\"}";
			exportExcel("zccz_list", urlStr, params, '评估报告问题明细列表','rn,cb');
		}
	function isSingle(ids){
		if(ids.length < 1){
			alert("请选择一条记录");
			return false;
		}else if(ids.length > 1){
			alert("只能选择一条记录");
			return false;
		}else{
			return true;
		}
	}
	

$(window).bind('resize', function(){
	jQuery("#zccz_list").setGridWidth($("#table1").width());
});	


			function refresh(data){
				if(data==1){
					document.getElementById("scxm").value="";
				}
				myform.action="<%=request.getContextPath()%>/zccz/evalCommentQuery_findFl.do";
				myform.submit();

			}
			
			function saveBody(){
				document.myform.submit();
			}
			
			
		</script>
	</head>
<%@ include file="/inc/exportExcel.inc"%>
	<body>
		<form name='myform'>
			<table class="newtable" width="100%" border="0" align="center" id='table1' cellpadding="0" cellspacing="0">
				<tr>
					<td width="11%" class="td_zxy01">
						审查项目：
					</td>
					<td class="td_zxy02">

						<input type='text' name="evalVO2.scxmmc"  value='<s:property value="evalVO2.scxmmc" />' id='scxm' class="input"/>
					</td>
					<td width="11%" class="td_zxy01">
						审查要点：
					</td>
					<td class="td_zxy02">
						<input type='text' name="evalVO2.scydmc" value='<s:property value="evalVO2.scydmc" />' id = 'scyd' class="input"/>
					</td>
				</tr>
				<tr>
					<td  class="td_zxy01">
						具体意见：
					</td>
					<td class="td_zxy02">
						<input type='text' name="evalVO2.jtyj"  value='<s:property value="evalVO2.jtyj" />' id = 'jtyj' class="input"/>
					</td>
					<td width="11%" class="td_zxy01">
						标 题：
					</td>
					<td class="td_zxy02">
						<input name="evalVO2.biaoti" id="biaoti" value='<s:property value="evalVO2.biaoti" />' type="text" class="input"/>
					</td>
				</tr>
					<tr>	<td class="td_zxy01">
					提交日期：
				</td>
				<td class="td_zxy02">
					从
					<input id='datebegin' name="evalVO2.tjrqB" type="text"  style="width:105px"/>
					到
					<input id="dateend" name="evalVO2.tjrqE" type="text" style="width:105px"/>
				</td>
				<td class="td_zxy01">　</td>
				<td class="td_zxy02">　</td>
				</tr>
				<tr>
					<td colspan="6" class="td_zxy02">
						<div align="right">
							<input name="Submit222" type="button" value="  查询  " class="buttonface"
								onclick="querystring()" />
							<input name="Submit32" type="submit" value="  重置  "  class="buttonface"/>
						</div>
					</td>
				</tr>
			</table>
			<div align="center">
				<table id="zccz_list" align="center" valign='top'></table><div id="pgtoolbar1"></div>
			</div>
			<script type="text/javascript">

	
	
	
				jQuery("#zccz_list").jqGrid({				
					url:"<%=basePath%>zccz/evalCommentQuery_queryString2.do",
					datatype: "json",
					mtype:"POST",
				   	colNames:['id','审查项目','审查要点','具体意见','标 题','备注'],
				   	colModel:[
				   		{name:'id',index:'id',hidden:true},
				   		{name:'scxmmc',index:'scxmmc'},
				   		{name:'scydmc',index:'scydmc'},
				   		{name:'jtyj',index:'jtyj'},
				   		{name:'bgmc',index:'bgmc'},
				   		{name:'memo',index:'memo',editable:true}
				   	],
				   	pager:'pgtoolbar1',
				   	rowNum:20,
				   	prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
					multiselect:true,
					rownumbers:true,
					autowidth:true,
					height:'auto',
					rowList:[10,20,30],
					viewrecords:true,
					caption: '评估报告问题明细列表',
					jsonReader : {
						root:"rows",
						page: "page",
						total: "total",
						records: "records",
						repeatitems: false,
						id: "0"
					}
				});
		//查询按钮			
		function querystring(){
			//标题
			var biaoti = document.getElementById("biaoti").value;
			//审查项目
			var scxm = document.getElementById("scxm").value;
			//审查要点
			var scyd = document.getElementById("scyd").value;
			//具体意见
			var jtyj=document.getElementById("jtyj").value;
			//提交开始日期
			var datebegin=document.getElementById("datebegin").value;
			//提交结束日期
			var dateend=document.getElementById("dateend").value;
				jQuery("#zccz_list").setGridParam({
				url:"<%=basePath%>zccz/evalCommentQuery_queryString2.do",
				postData:{'evalVO2.biaoti': biaoti, 
					'evalVO2.scxmmc': scxm, 
					'evalVO2.scydmc':scyd,
					'evalVO2.jtyj':jtyj,
					'evalVO2.tjrqB':datebegin,
					'evalVO2.tjrqE':dateend
				}
				}).trigger("reloadGrid");
		}
        </script>