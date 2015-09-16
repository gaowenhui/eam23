<%@page language="java" import="java.util.*"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery2.inc"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>处置评估审查意见明细</title>

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

</SCRIPT>

<script type="text/javascript">
	$(function(){
		$("#cbrq").datebox({
	    	formatter:function(date){
	    		return formatDate(date);
	    	}
		})
	});
	function refresh(data){
		if(data==1){
			document.getElementById("ejflbm").value="";
		}
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
			
			<table class="newtable" width="100%" border="0" align="center" id='table1'
				cellpadding="0" cellspacing="0">


				<tr>
					<td width="11%" class="td_zxy01">
						标 题：
					</td>
					<td class="td_zxy02">
						<input   id="s1" name = "evalVO1.bgmc"  type="text" class="input"/>
					</td>
					<td width="11%" class="td_zxy01" class="input">
						编号：
					</td>
					<td class="td_zxy02">
						<input type='text' name = "evalVO1.cldh"  id="s2" class="input" />
					</td>
				<tr></tr>
				<td width="11%" class="td_zxy01" >
					审查结论：
				</td>
				<td class="td_zxy02">
					<select id="s3" name ="evalVO1.scjl">
						<option value=""></option>
						<option value="1">
							通过
						</option>
						<option value="2">
							通过（附参考意见）
						</option>
						<option value="3">
							不通过
						</option>
						<option value="4">
							不具备评估审查条件
						</option>
					</select>
				</td>
				<td width="11%" class="td_zxy01">
					具体意见：
				</td>
				<td class="td_zxy02">
					<input type='text' id="s4"  name = "evalVO1.jtyj" class="input"/>
				</td>
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
			<br>
			<div align="center">
				<table id="zccz_list" align="center"></table>

				<div id="pgtoolbar1"></div>
			</div>
			<script type="text/javascript">
		function excel(){
			//var urlStr = "<%=basePath%>zccz/evalCommentQuery_queryString1.do";
			var urlStr = "com.tansun.eam2.zccz.action.EvalKnowQueryAction&com.tansun.eam2.zccz.vo.EvalVO1";
			var s1 = document.getElementById("s1").value;
			var s2 = document.getElementById("s2").value;
			var s3 = document.getElementById("s3").value;
			var s4 = document.getElementById("s4").value;
			var cp = jQuery("#zccz_list").getGridParam('page');
		    var ps = jQuery("#zccz_list").getGridParam('rowNum');
		    
		    var params = "{\"evalVO1.bgmc\":\"" + s1 + "\",";
				params += "\"evalVO1.cldh\":\"" + s2 + "\",";
				params += "\"evalVO1.scjl\":\"" + s3 + "\",";
				params += "\"evalVO1.jtyj\":\"" + s4 + "\",";
				params += "\"paginator.currentPage\":\"" + 1 + "\",";
				params += "\"paginator.pageSize\":\"" + 10000000 + "\"}";
			exportExcel("zccz_list", urlStr, params, '处置评估审查意见明细','rn,cb');
			
		}
	
	
	
$(function(){
	var buttonJSonString_anzhiPerson = '[{"buttonHandler":"excel","buttonIcon":"icon-redo","buttonText":"导出"}\]';addButtons($("#gview_zccz_list > .ui-jqgrid-titlebar"),buttonJSonString_anzhiPerson);
});

$(window).bind('resize', function(){
	jQuery("#zccz_list").setGridWidth($("#table1").width());
});
	
				jQuery("#zccz_list").jqGrid({				
					url:"<%=basePath%>zccz/evalCommentQuery_queryString1.do",
					datatype: "json",
					mtype:"POST",
				   	colNames:['id','标 题','编号','审查结论','具体意见','审批结果','审批意见'],
				   	colModel:[
				   		{name:'id',index:'id',hidden:true},
				   		{name:'bgmc',index:'bgmc',width:'80px'},
				   		{name:'cldh',index:'cldh',width:'190px'},
		   				{name:'scjl',index:'scjl',width:'120px'},
				   		{name:'jtyj',index:'jtyj',width:'400px'},
				   		{name:'spjl',index:'spjl'},
				   		{name:'yjnr',index:'yjnr'}
				   	],
				   	pager:'pgtoolbar1',
				   	rowNum:20,
				   	rownumbers:true,
				   	prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
					multiselect:false,
					autowidth:true,
					height:'auto',
					viewrecords:true,
					rowList:[10,20,30],
					caption: '审查意见明细表',
					jsonReader : {
						root:"rows",
						page: "page",
						total: "total",
						records: "records",
						repeatitems: false,
						id: "0"
					}
				});
			function querystring(){
				var s1 = document.getElementById("s1").value;
				var s2 = document.getElementById("s2").value;
				var s3 = document.getElementById("s3").value;
				var s4 = document.getElementById("s4").value;
				jQuery("#zccz_list").setGridParam({
				url:"<%=basePath%>zccz/evalCommentQuery_queryString1.do",
				postData:{'evalVO1.bgmc':s1, 
					'evalVO1.cldh':s2, 
					'evalVO1.scjl':s3,
					'evalVO1.jtyj':s4 
				}
				}).trigger("reloadGrid");
		}
        </script>