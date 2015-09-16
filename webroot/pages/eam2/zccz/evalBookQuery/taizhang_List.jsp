<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc" %>
<%@ include file="/inc/ProjectJQuery2.inc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<head>
<base href="<%=basePath %>"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>处置评估审查台账</title>

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

	$(function(){
		if(window.parent.clearPanelTool){
			window.parent.clearPanelTool();
		}
		$("#ngrqbegin,#ngrqend,#scrqbegin,#scrqend,#sprqbegin,#sprqend").datebox({
	    	formatter:function(date){
	    		return formatDate(date);
	    	}
	    });
	    
	    addStr = $("#TableBox").html();
	});
</SCRIPT>
</head>
<html>
<%@ include file="/inc/exportExcel.inc"%>
<body>
<form name='form1' style='margin:0'>
		<table class="newtable" width="100%" border="0" align="center" id='table1'
			cellpadding="0" cellspacing="0">
			<tr>
				<td width="11%" class="td_zxy01">
					编号：
				</td>
				<td class="td_zxy02">
					<input name="evalVO3.bianhao" class="input" id="bianhao" type="text" size="45">
				</td>
				<td width="11%" class="td_zxy01">
					标 题：
				</td>
				<td class="td_zxy02">
					<input   id="biaoti" class="input" type="text" size="45">
				</td>
			</tr>
			<tr>
				<td width="11%" class="td_zxy01">
					评估机构：
				</td>
				<td class="td_zxy02">
					 <input   id="pinggujigou" class="input" type="text" size="45"/>
				</td>
				<td class="td_zxy01">
					拟稿人：
				</td>
				<td class="td_zxy02">
					<s:textfield name="evalVO3.ngr" cssClass="input" id='ngr' type="text" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">
					审查结论：
				</td>
				<td class="td_zxy02">
					<select id="scjl">
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
				<td class="td_zxy01">
					审批结果：
				</td>
				<td class="td_zxy02">
					<select name="spjg" id="spjg">
						<option value=""></option>
							<option value="0">
							通过
						</option>
						<option value="1">
							不通过
						</option>
					</select>
				</td>
			</tr>
			<tr>	<td class="td_zxy01">
					拟稿日期：
				</td>
				<td class="td_zxy02">
					从
					<input id='ngrqbegin' type="text"  style="width:105px"/>
					到
					<input id="ngrqend" type="text" style="width:105px">
				</td>
				<td class="td_zxy01">
					审查时间：
				</td>
				<td class="td_zxy02">
					从
					<input id="scrqbegin" type="text"  style="width:105px"/>
					到
					<input type="text" id="scrqend"  style="width:105px"/>
				</td>
				
			</tr>
			<tr>
				<td class="td_zxy01">
					审批时间：
				</td>
				<td class="td_zxy02">
					从
					<input type="text" id="sprqbegin" style="width:105px"/>
					到
					<input type="text" id="sprqend" style="width:105px">
				</td>
				<td class="td_zxy01">&nbsp;
				</td>
				<td class="td_zxy02">&nbsp;
				</td>
			</tr>
			<tr>
				<td colspan="6" class="td_zxy02">
					<div align="right">
						<input name="Submit222" type="button" value="  按资产查询  " class="buttonface"
							onclick="querystring()" />
						<input name="Submit222" type="button" value="  按项目查询  " class="buttonface"
							onclick="querystring_tongji()" />
						<input name="Submit32" type="reset" value="  重置  " class="buttonface" />
					</div>
				</td>
			</tr>
		</table>
		</form>
		<br>
	<table id="zccz_list" align="center"></table>
	<div id="pgtoolbar1"></div>
<script type="text/javascript">
$(function(){
		var buttonJSonString_anzhiPerson = '[{"buttonHandler":"excel","buttonIcon":"icon-redo","buttonText":"按资产查询导出"},\
											{"buttonHandler":"tongjiexcel","buttonIcon":"icon-redo","buttonText":"按项目查询导出"}\
		]';
			addButtons($("#gview_zccz_list > .ui-jqgrid-titlebar"),buttonJSonString_anzhiPerson);

	jQuery("#zccz_list").setGridWidth($("#table1").width());
	 	 $(window).bind('resize', function(){
		jQuery("#zccz_list").setGridWidth($("#table1").width());
	});
	 
});
 	 $(window).bind('resize', function(){
	jQuery("#zccz_list").setGridWidth($("#table1").width());
});

function excel(){
		//var urlStr = "<%=basePath%>zccz/evalCommentQuery_queryString3.do";
		var urlStr = "com.tansun.eam2.zccz.action.EvalCommentQueryAction&com.tansun.eam2.zccz.vo.EvalVO3";
		var cp = jQuery("#zccz_list").getGridParam('page');
    	var ps = jQuery("#zccz_list").getGridParam('rowNum');
    	var bianhao = document.getElementById("bianhao").value;
		var biaoti= document.getElementById("biaoti").value;
		var ngr = document.getElementById("ngr").value;
		var scjl = document.getElementById("scjl").value;
		var spjg = document.getElementById("spjg").value;
		var ngrqbegin = document.getElementById("ngrqbegin").value;
		var ngrqend = document.getElementById("ngrqend").value;
		var scrqbegin = document.getElementById("scrqbegin").value;
		var scrqend = document.getElementById("scrqend").value;
		var sprqbegin = document.getElementById("sprqbegin").value;
		var sprqend = document.getElementById("sprqend").value;
		var pinggujigou= document.getElementById("pinggujigou").value;
		var params = "{\"evalVO3.bianhao\":\"" + bianhao + "\",";
		params += "\"evalVO3.biaoti\":\"" + biaoti + "\",";
		params += "\"evalVO3.ngr\":\"" + ngr + "\",";
		params += "\"evalVO3.scjl\":\"" + scjl + "\",";
		params += "\"evalVO3.spjg\":\"" + spjg + "\",";
		params += "\"evalVO3.ngrqbegin\":\"" + ngrqbegin + "\",";
		params += "\"evalVO3.ngrqend\":\"" + ngrqend + "\",";
		params += "\"evalVO3.scrqbegin\":\"" + scrqbegin + "\",";
		params += "\"evalVO3.scrqend\":\"" + scrqend + "\",";
		params += "\"evalVO3.sprqbegin\":\"" + sprqbegin + "\",";
		params += "\"evalVO3.sprqend\":\"" + sprqend + "\",";
		params += "\"evalVO3.pinggujigou\":\"" + pinggujigou + "\"}";
		params += "\"paginator.currentPage\":\"" + 1 + "\",";
		params += "\"paginator.pageSize\":\"" + 10000000 + "\"}";
		exportExcel("zccz_list", urlStr, params, '处置评估审查台账','rn,cb');
}

//{name:'zczmjz',index:'账面价值',formatter:"currency",width:'100px',formatoptions : {decimalPlaces: 2}},
jQuery("#zccz_list").jqGrid({				
	url:"<%=basePath%>zccz/evalCommentQuery_queryString3.do",
	datatype: "json",
	mtype:"POST",
	colNames:['id','编号','拟稿日期','拟稿人','补充提交日期',	'审查结论',	'审查时间',	'意见条数',	'标题',	'评估机构',	'报告类型','评估资产类别',
	'省别',	'卡片编号',	'资产名称',	'资产类别',	'评估基准日', '目的', '方法',	'价值类型',
	'账面原值','基准日账面价值',	'评估值','评估增减值','评估增减幅度',
	'审批结果',	'审批时间',	'会议次数',	'审批意见'],
colModel:[
	{name:'id',index:'id',hidden:true},
	{name:'bianhao',index:'编号',width:'100px'},
	{name:'ngrq',index:'拟稿日期',width:'80px'},
	{name:'nigaorenxm',index:'拟稿人',width:'80px'},
	{name:'bccltjsj',index:'补充提交日期',width:'100px'},
	{name:'c_scjl',index:'审查结论',width:'100px'},
	{name:'scsj',index:'审查时间',width:'80px'  },
	{name:'yjts',index:'意见条数',width:'80px'},
	{name:'biaoti',index:'标题',width:'300px'},
	{name:'pgjg',index:'评估机构'},
	{name:'c_bglx',index:'报告类型'},
	{name:'pgzclbName',index:'评估资产类别'},
	
	{name:'sfmc',index:'资产所在省份名称'},
	{name:'zkpbh',index:'卡片编号',width:'100px'},
	{name:'zcmc1',index:'资产名称',width:'200px'},
	{name:'zclb',index:'资产类别',width:'80px'},
	{name:'pgjzr',index:'评估基准日',width:'80px'},
	{name:'pgmd',index:'评估目的'},
	{name:'pgff',index:'评估方法'},
	{name:'c_jzlx',index:'价值类型'},
	
	{name:'zczmyz',index:'账面原值',formatter:"currency",width:'80px',formatoptions : {decimalPlaces: 2}},
	{name:'jzrzmjz',index:'基准日账面价值',formatter:"currency",width:'100px',formatoptions : {decimalPlaces: 2}},
	{name:'pingguzhi',formatter:"currency",index:'评估值',width:'80px',formatoptions : {decimalPlaces: 2}},
	{name:'zjz',formatter:"currency",index:'增减值',width:'80px',formatoptions : {decimalPlaces: 2}},
	{name:'zjfd',index:'增减幅度',width:'80px'},//formatter: 'number',formatoptions:{suffix: "%"},
	
	{name:'spjg',index:'审批结果',width:'80px'},
	{name:'spsj',index:'审批时间',width:'80px'},
	{name:'hycs',index:'会议次数',width:'80px'},
	{name:'spwyj',index:'审批意见',width:'200px'}],
	pager:'pgtoolbar1',
   	rowNum:20,
   	forceFit:true,
   	rowList:[10,20,30],
   	prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
	multiselect:false,
	rownumbers:true,
	autowidth:false,
	height:'auto',
	viewrecords:true,
	shrinkToFit:false,
	caption: '处置评估审查台账(单位：元)',
	jsonReader : {
		root:"rows",
		page: "page",
		total: "total",
		records: "records",
		repeatitems: false,
		id: "0"
	}
});

//统计查询导出
function tongjiexcel(){
		//var urlStr = "<%=basePath%>zccz/evalCommentQuery_queryString3.do";
		var urlStr = "com.tansun.eam2.zccz.action.EvalCommentQueryAction4Excel&com.tansun.eam2.zccz.vo.EvalVO3";
		var bianhao = document.getElementById("bianhao").value;
		var biaoti= document.getElementById("biaoti").value;
		var ngr = document.getElementById("ngr").value;
		var scjl = document.getElementById("scjl").value;
		var spjg = document.getElementById("spjg").value;
		var ngrqbegin = document.getElementById("ngrqbegin").value;
		var ngrqend = document.getElementById("ngrqend").value;
		var scrqbegin = document.getElementById("scrqbegin").value;
		var scrqend = document.getElementById("scrqend").value;
		var sprqbegin = document.getElementById("sprqbegin").value;
		var sprqend = document.getElementById("sprqend").value;
		var pinggujigou= document.getElementById("pinggujigou").value;
		var cp = jQuery("#zccz_list").getGridParam('page');
    	var ps = jQuery("#zccz_list").getGridParam('rowNum');
		var params = "{\"evalVO3.bianhao\":\"" + bianhao + "\",";
		params += "\"evalVO3.biaoti\":\"" + biaoti + "\",";
		params += "\"evalVO3.ngr\":\"" + ngr + "\",";
		params += "\"evalVO3.scjl\":\"" + scjl + "\",";
		params += "\"evalVO3.spjg\":\"" + spjg + "\",";
		params += "\"evalVO3.ngrqbegin\":\"" + ngrqbegin + "\",";
		params += "\"evalVO3.ngrqend\":\"" + ngrqend + "\",";
		params += "\"evalVO3.scrqbegin\":\"" + scrqbegin + "\",";
		params += "\"evalVO3.scrqend\":\"" + scrqend + "\",";
		params += "\"evalVO3.sprqbegin\":\"" + sprqbegin + "\",";
		params += "\"evalVO3.sprqend\":\"" + sprqend + "\",";
		params += "\"evalVO3.pinggujigou\":\"" + pinggujigou + "\"}";
		params += "\"paginator.currentPage\":\"" + 1 + "\",";
		params += "\"paginator.pageSize\":\"" + 10000000 + "\"}";
		exportExcel("zccz_list", urlStr, params, '处置评估审查台账','rn,cb');
}
			//按项目查询
			function querystring_tongji(){
				var bianhao = document.getElementById("bianhao").value;
				var biaoti= document.getElementById("biaoti").value;
				var ngr = document.getElementById("ngr").value;
				var scjl = document.getElementById("scjl").value;
				var spjg = document.getElementById("spjg").value;
				var ngrqbegin = document.getElementById("ngrqbegin").value;
				var ngrqend = document.getElementById("ngrqend").value;
				var scrqbegin = document.getElementById("scrqbegin").value;
				var scrqend = document.getElementById("scrqend").value;
				var sprqbegin = document.getElementById("sprqbegin").value;
				var sprqend = document.getElementById("sprqend").value;
				var pinggujigou= document.getElementById("pinggujigou").value;
				jQuery("#zccz_list").setGridParam({
				url:"<%=basePath%>zccz/evalCommentQuery_queryString4.do",
				postData:{'evalVO3.bianhao':bianhao ,
							'evalVO3.biaoti':biaoti ,
							'evalVO3.ngr':ngr ,
							'evalVO3.scjl':scjl ,
							'evalVO3.spjg':spjg ,
							'evalVO3.ngrqbegin':ngrqbegin ,
							'evalVO3.ngrqend':ngrqend ,
							'evalVO3.scrqbegin':scrqbegin ,
							'evalVO3.scrqend':scrqend ,
							'evalVO3.sprqbegin':sprqbegin ,
							'evalVO3.sprqend':sprqend,
							'evalVO3.pinggujigou':pinggujigou
				}
				}).hideCol("sfmc") 
				.hideCol("zkpbh")     
				.hideCol("zcmc1")     
				.hideCol("zclb")      
				.hideCol("pgff") 
				.hideCol("c_jzlx")
				.trigger("reloadGrid");
				//隐藏 省份、卡片编号、资产名称、资产类别、评估方法、价值类型
				//基准日、评估目的
				//显示 基准日账面价值、评估值、账面原值、账面价值、增减值、增减幅度
			}
			
			//按资产查询
			function querystring(){
				var bianhao = document.getElementById("bianhao").value;
				var biaoti= document.getElementById("biaoti").value;
				var ngr = document.getElementById("ngr").value;
				var scjl = document.getElementById("scjl").value;
				var spjg = document.getElementById("spjg").value;
				var ngrqbegin = document.getElementById("ngrqbegin").value;
				var ngrqend = document.getElementById("ngrqend").value;
				var scrqbegin = document.getElementById("scrqbegin").value;
				var scrqend = document.getElementById("scrqend").value;
				var sprqbegin = document.getElementById("sprqbegin").value;
				var sprqend = document.getElementById("sprqend").value;
				var pinggujigou= document.getElementById("pinggujigou").value;
				jQuery("#zccz_list").setGridParam({
				url:"<%=basePath%>zccz/evalCommentQuery_queryString3.do",
				postData:{'evalVO3.bianhao':bianhao ,
							'evalVO3.biaoti':biaoti ,
							'evalVO3.ngr':ngr ,
							'evalVO3.scjl':scjl ,
							'evalVO3.spjg':spjg ,
							'evalVO3.ngrqbegin':ngrqbegin ,
							'evalVO3.ngrqend':ngrqend ,
							'evalVO3.scrqbegin':scrqbegin ,
							'evalVO3.scrqend':scrqend ,
							'evalVO3.sprqbegin':sprqbegin ,
							'evalVO3.sprqend':sprqend,
							'evalVO3.pinggujigou':pinggujigou
				}
				}).setGridParam({})
				.showCol("sfmc")
				.showCol("zkpbh")
				.showCol("zcmc1")
				.showCol("zclb")
				.showCol("pgff")
				.showCol("c_jzlx")
				.trigger("reloadGrid");
				//show 省份、卡片编号、资产名称、资产类别、评估方法、价值类型
		}
</script>
</body>
</html>