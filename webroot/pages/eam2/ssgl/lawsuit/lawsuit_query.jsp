<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<html>
	<head>
<title>诉讼查询</title>
<script type="text/javascript" language="javascript">
//立案日期//起诉日期
$(function(){
	$("#qssjbegin,#qssjend").datebox({
    	formatter:function(date){
    		return formatDate(date);
    	}
    });
    
    //添加按钮
	var buttonJSonString = '[{"buttonHandler":"addAss","buttonIcon":"icon-add","buttonText":"增加"},\
								{"buttonHandler":"modifyAss","buttonIcon":"icon-save","buttonText":"修改"}\
							]';
	addButtons(jQuery("#gview_entity_list > .ui-jqgrid-titlebar"),buttonJSonString);
     //需要加到页面 初始化js中。
	jQuery("#ssgl_list").setGridWidth($("#sss").width());
	jQuery("#entity_list").setGridWidth($("#sss").width());
	$(window).bind('resize', function(){
		jQuery("#entity_list").setGridWidth($("#sss").width());
		jQuery("#ssgl_list").setGridWidth($("#sss").width());
    });
    
    			    //添加按钮  "#gview_list > .ui-jqgrid-titlebar
	var buttonssglJSonString = '[{"buttonHandler":"addssglAss","buttonIcon":"icon-add","buttonText":"增加"},\
								{"buttonHandler":"modssglAss","buttonIcon":"icon-edit","buttonText":"修改"},\
								{"buttonHandler":"delssglAss","buttonIcon":"icon-remove","buttonText":"删除"},\
								 {"buttonHandler":"queryMore","buttonIcon":"icon-search","buttonText":"详细"},\
								{"buttonHandler":"showlog","buttonIcon":"icon-search","buttonText":"查看日志"},\
								{"buttonHandler":"excel","buttonIcon":"icon-redo","buttonText":"导出"}\
								]';
	addButtons(jQuery("#gview_ssgl_list > .ui-jqgrid-titlebar"),buttonssglJSonString);
});
function redirect(x){
	if(x==0){
		document.getElementById("qisu").style.display="block";
		document.getElementById("beisu").style.display="none";
	}else{
		document.getElementById("qisu").style.display="none";
		document.getElementById("beisu").style.display="block"
	}
}
function aa(){
	var vv=document.getElementById("sel");
	if(vv.selectedIndex==1){
		div1.style.display='block';
		div2.style.display='block'; 
	}else{
		div2.style.display='none' ;div1.style.display='none';
	}
}
		function selectWin(){
			var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";
			if(document.getElementById('sazclbid').value=='1'){
				selectZc();
			}else if(document.getElementById('sazclbid').value=='2'){
				selfTransactEntity()
			}else if(document.getElementById('sazclbid').value=='4'){
				window.open("<%=basePath %>stock/maintain_listStockMaintain.do"
				+ "?assetType=7"
				+ "&sign=1"
				+ "&option=ssgl" ,'',winOpenStr);
				//stock_List.jsp
			}else if(document.getElementById('sazclbid').value=='5'){
				window.open("<%=basePath%>zqgl/debt_debtList.do"
				+ "?assetType=7"
				+ "&sign=1"
				+ "&option=ssgl" ,'',winOpenStr);
				//basic_debt_list.jsp
			}else if(document.getElementById('sazclbid').value=='3'){
				window.open("<%=basePath %>wtdk/loansQuery_init.do?option=ssgl&ctlButton=show&assetType=2",'',winOpenStr);
				//loansQuery.jsp
			}
		}
				
		function  chagezc(){
			if(document.getElementById('sazclbid').value=='1'){
				document.getElementById("selectzc").style.display='';
			}else if(document.getElementById('sazclbid').value=='2'){
				document.getElementById("selectzc").style.display='';
			}else if(document.getElementById('sazclbid').value=='4'){
				document.getElementById("selectzc").style.display='';
			}else if(document.getElementById('sazclbid').value=='3'){
				document.getElementById("selectzc").style.display='';
			}else  if(document.getElementById('sazclbid').value=='5'){
				document.getElementById("selectzc").style.display='';
			}else {
				document.getElementById("selectzc").style.display='none';
			}
				$("#sazcmc").val("");
				$("#sazcid").val("");
	}
	  var winVar = "height=500, width=800, top=100, left=100,toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no, directories=no ,center=yes";
		function selfTransactEntity(){
		window.open('<%=request.getContextPath()%>/stgl/weihu_listEntities.do?debtSign='+1+'&zixunType='+1,'',winVar);
		return false;
		}
		
		function getEntity(gr){
		$.post("<%=request.getContextPath()%>/zqgl/debt_returnJson.do",{
		 'stid':''+gr
		},function(returnStr){
		var returnObj = eval('('+ returnStr + ')');
			$("#sazcmc").val(returnObj.stzwmc);
			$("#sazcid").val(returnObj.id);
	});
}
	function openTreeByType(type4Card){
		type4Card = 'department'
		var url = "<%=request.getContextPath()%>/kpgl/cardTree_tree.do?type4Card="+type4Card;
		var _g_privateDialogFeatures = 'height=400, width=200,toolbar=no,scrollbars=yes,location=no,directories=no,menubar=no,resizable=no,left=400,top=200';
		window.open(url,'',_g_privateDialogFeatures);
	}
	
	function getCallBack4Tree(type4Card,id,value){
		document.getElementById("jbr").value = value;
		//document.getElementById(type4Card+"value").value 	= value;
	}
	
	function selectZc(){
		var url ="<%=basePath%>jygdzc/AssetQuery_init.do?fromurl=susong&returnValue=true";
		var _g_privateDialogFeatures = 'height=600, width=1024,toolbar=no,scrollbars=yes,location=no,directories=no,menubar=no,resizable=no,left=100,top=100';
		window.open(url,'',_g_privateDialogFeatures);
	}
</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<form action='lawsuit_queryString.do' name='form1'>
		
<table width="100%" border="0"  class="newtable" align="center" cellpadding="0" cellspacing="0" id='sss'>
  <tr>
    <td class="td_form01" width="120">所属省份：</td>
	<td class="td_form02">			
		<e:select parRefKey="PROVIENCE" list="#{}" name="sfid" id="sfid" headerKey="" headerValue="" value="" />
	</td>
	<td class="td_form01" width="11%">
	 涉案资产类别：
	</td>
	<td class="td_form02" width="22%">
		<s:select name="sazclbid" id="sazclbid" onchange="chagezc()" list="#{'':'','1':'固定资产类','2':'实体类','3':'委托贷款类','4':'债券类','5':'债权类','6':'其他'}" />
		<s:hidden name='sazclbbm' />
		<s:hidden name='sazclbmc' />
	</td>
	<td class="td_form01" width="11%">
		涉案资产名称：
	</td>
	<td class="td_form02" valign="middle">
		<s:hidden name='sazcid' id='sazcid' />
		<s:textfield name='sazcmc' id='sazcmc' style="width:83%"/>
		<img src="<%=basePath%>resource/ProjectImages/search.gif"
			onclick='selectWin()' id='selectzc' width="21" height="20" align="absmiddle">
	</td>
  </tr>
  <tr>
   <td class="td_form01">
   	    诉讼类型：</td><td class="td_form02">
      <select name="sslxid" id="sslxid" onChange="redirect(this.options.selectedIndex)">
 		<option value="">
			</option>
			<option value="0">
				起诉
			</option>
			<option value="1">
				被诉
			</option>
	</select>
		</td>
  <td class="td_form01">
   	    案件类别：</td><td class="td_form02">
          <select name="select2" id="qisu"  style="display:block" >
             <option value="" ></option>
			  <option value="1" >胜诉执结案件</option>
			  <option value="2">胜诉执行过程中案件</option>
			   <option value="3">败诉执结案件案件</option>
			    <option value="4">败诉执行过程中案件</option>
				 <option value="5">审理过程中案件</option>
          </select>
		   <select id="beisu" style="display:none" >
		    <option value="" ></option>
			  <option value="1" >胜诉结案</option>
			  <option value="2">败诉结案</option>
			   <option value="3">审理过程中案件</option>
          </select></td><td class="td_form01">
		  结案状态：</td><td class="td_form02">
          <select name="ssztid" id="ssztid">
		    <option value="" selected> </option>
            <option value="1">结案</option>
            <option value="2">未结案</option>
          </select>
           </td>
		</tr>
		<tr>
		 <td class="td_form01">起诉日期：</td><td class="td_form02" colspan="3">
	从<input name="qssjbegin" type="text"    id="qssjbegin" size="20" readonly="true">
	到<input name="qssjend" type="text"    id="qssjend" size="20" readonly="true">
	</td>
		<td class="td_form01">&nbsp;</td><td class="td_form02">&nbsp;</td>
  </tr>
				<tr>
					<td class="td_form01" colspan=6>
						<input name="" type="button" 
							value="  查询  " onclick='querystring()'>
						
						<input name="Submit" type="reset" 
							value="  重置  " onClick="javascript:window.location.reload();">
					</td>
				</tr>
</table>
</form>
		<table id="ssgl_list" align="center"></table>
		<div id="pgtoolbar1"></div>
		<script type="text/javascript">
				jQuery("#ssgl_list").jqGrid({	
					url:"#",			
					datatype: "json",
					mtype:"POST",
					//所属省份 资产类型 收案日期  被告 第三人  
				   	colNames:['id','序号','省份名称','资产类型','起诉日期','原告','被告','第三人','诉讼类型','案件类别'],
				   	colModel:[
				   		{name:'id',index:'id',editable:true,hidden:true},
				   		{name:'ajbh',index:'ajbh',editable:true,hidden:true},
				   		{name:'sfmc',index:'sfid',editable:true},
				   		{name:'sazclbmc',index:'sazclbmc',editable:true},
				   		{name:'qssj',index:'qssj',editable:true},
				   		{name:'yg',index:'yg',editable:true},
				   		{name:'bg',index:'bg',editable:true},
				   		{name:'dsr',index:'dsr',editable:true},
				   		{name:'sslxmc',index:'sslxmc',editable:true},
				   		{name:'ajlbmc',index:'ajlbmc',editable:true}
				   	],
				   	 loadComplete:function(data){
						if(data && data.rows.length>0){
							jQuery("#ssgl_list").setGridHeight(data.rows.length * 22 + 18);
						}else{
							jQuery("#ssgl_list").setGridHeight(0);
						}
					},
					shrinkToFit:false,
					multiselect:true,
					rownumbers:true,
					autowidth:true,
					height:'auto',
					pager:'pgtoolbar1',
					viewrecords:true,
					caption:'诉讼查询',
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
					},
					ondblClickRow:function(gr){
							queryMore(gr);
					}
				});
				
				function show(gr){
						var url= jQuery("#did_list").getCell(gr,'url');
						var taskId=jQuery("#did_list").getCell(gr,'taskId');
						var headId = jQuery("#did_list").getCell(gr,'headId');
						var param = jQuery("#did_list").getCell(gr,'param');
						url='<%=basePath%>'+url+"?taskId="+taskId+"&headId="+headId+"&"+param;
						window.open(url,'_self');
				}
				
function queryMore(){
	var gr = jQuery("#ssgl_list").jqGrid('getGridParam','selarrrow');
		if(isSingle(gr)){
			var result = window.showModalDialog("<%=basePath%>ssgl/lawsuit_modifySs.do?look=1&id="+gr,"_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:1050px;dialogHeight:600px;center:yes");
			if(typeof(result)!='undefined'){
				jQuery("#ssgl_list").trigger("reloadGrid");
			}else{
				jQuery("#ssgl_list").trigger("reloadGrid");
			}
	}
}
			function delssglAss(){
				var gr = jQuery("#ssgl_list").jqGrid('getGridParam','selarrrow');
				if(gr == ''){
					alert("请选择要删除的记录!"); 		
				}else if(confirm("确认删除！")){
					var delblyjurl ="<%=basePath%>ssgl/lawsuit_delete.do?id="+gr;
					$.post(delblyjurl,{yjids:"" + gr + ""}, function(data){
						jQuery("#ssgl_list").trigger("reloadGrid");
					});
				}
			}
			
			function showlog(){
				var gr = jQuery("#ssgl_list").jqGrid('getGridParam','selarrrow');
				if(isSingle(gr)){
					window.showModalDialog("<%=basePath%>log/logView.do?zcid="+gr+"&tableName=SsBaseinfo&colName=id&zcmc=sazcmc&subSys=10","_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:1050px;dialogHeight:600px;center:yes");
				}
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
			
String.prototype.startWith=function(str){
	if(str==null||str==""||this.length==0||str.length>this.length)
		return false;
	if(this.substr(0,str.length)==str)
		return true;
	else
		return false;
	return true;
}



function modssglAss(){
	var gr = jQuery("#ssgl_list").jqGrid('getGridParam','selarrrow');
	var grstr = ''+jQuery("#ssgl_list").jqGrid('getGridParam','selarrrow');
	//alert("|"+grstr+"|");
	if((gr.length ==2 && (gr[0]==gr[1]))){
		gr=gr[0];
		var result = window.showModalDialog("<%=basePath%>ssgl/lawsuit_modifySs.do?id="+gr,"_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:1050px;dialogHeight:600px;center:yes");
		if(typeof(result)!='undefined'){
			jQuery("#ssgl_list").trigger("reloadGrid");
		}else{
			jQuery("#ssgl_list").trigger("reloadGrid");
		}
	} else if(( gr != '' &&gr.length == 1 )){
		var result = window.showModalDialog("<%=basePath%>ssgl/lawsuit_modifySs.do?id="+gr,"_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:1050px;dialogHeight:600px;center:yes");
		if(typeof(result)!='undefined'){
			jQuery("#ssgl_list").trigger("reloadGrid");
		}else{
			jQuery("#ssgl_list").trigger("reloadGrid");
		}
	}else if(gr.length > 1 ){
		if(gr.length ==2 && gr[0]==''){
			gr=gr=gr[1];
			var result = window.showModalDialog("<%=basePath%>ssgl/lawsuit_modifySs.do?id="+gr,"_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:1050px;dialogHeight:600px;center:yes");
			if(typeof(result)!='undefined'){
				jQuery("#ssgl_list").trigger("reloadGrid");
			}else{
				jQuery("#ssgl_list").trigger("reloadGrid");
			}
		}else{
			alert('只能修改一条记录');
		}
		
	} else if(gr == ''||gr ==null) {
		alert("请选择要修改的记录1");
	}else{
		alert("请选择要修改的记录2");
	}
}
	function addssglAss(){
		var rdBasicWidth = "400px";
		var rdBasicHeight = "300px";
		var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
		var x=(screen.width-800)/2; 
		var y=(screen.height-400)/2;
		var result =window.showModalDialog("<%=basePath%>ssgl/lawsuit_index.do","_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:1050px;dialogHeight:600px;center:yes");
		if(typeof(result)!='undefined'){
			jQuery("#ssgl_list").trigger("reloadGrid");
		}else{
			jQuery("#ssgl_list").trigger("reloadGrid");
		}
		jQuery("#ssgl_list").trigger("reloadGrid");
	
	}
	function reloadJqGrid(){
		jQuery("#ssgl_list").trigger("reloadGrid");
	}		
	
	
	
	function selectZc(){
	var url ="<%=basePath%>jygdzc/AssetQuery_init.do?fromurl=susong&returnValue=true";
	var _g_privateDialogFeatures = 'height=600, width=1024,toolbar=no,scrollbars=yes,location=no,directories=no,menubar=no,resizable=no,left=100,top=100';
	window.open(url,'',_g_privateDialogFeatures);
	}
	function addValue(sss,xxx){
	  document.getElementById("sazcid").value = sss;
	  document.getElementById("sazcmc").value = xxx;
	}	
</script>

<%@ include file="/inc/exportExcel.inc"%>
</body>
</html>
	<script type="text/javascript">
		function addAss(){
			var rdBasicWidth = "1000px";
			var rdBasicHeight = "800px";
			var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
				window.open('<%=basePath%>ssgl/lawsuit_add.do');
			return false;
		}
		function showmod(){
			var result = window.showModalDialog("<%=basePath%>ssgl/lawsuit_add.do","_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:1050px;dialogHeight:600px;center:yes");
			if(typeof(result)=='undefined'){
				jQuery("#ssgl_list").trigger("reloadGrid");
			}
		}
		function excel(){
			var urlStr="com.tansun.eam2.ssgl.action.SsglAction&com.tansun.eam2.ssgl.vo.SsBaseinfoQueryVO";
			var sfid = document.getElementById("sfid").value;
			var sazclbid = document.getElementById("sazclbid").value;
			var sazcmc = document.getElementById("sazcmc").value;
			var sslxid = document.getElementById("sslxid").value; 
			var ssztid = document.getElementById("ssztid").value;
			var qssjbegin = document.getElementById("qssjbegin").value;
			var qssjend = document.getElementById("qssjend").value; 
			if(qssjbegin==""||qssjbegin==null){
				qssjbegin = "1970-01-01";
			}
			if(qssjend==""||qssjend==null){
				qssjend = "2050-12-31";
			}
		    var params = "{\"ssBaseinfoQueryVO.sfid\":\"" + sfid + "\",";
				params += "\"ssBaseinfoQueryVO.sazclbid\":\"" + sazclbid + "\",";
				params += "\"ssBaseinfoQueryVO.sazcmc\":\"" + sazcmc + "\",";
				params += "\"ssBaseinfoQueryVO.sslxid\":\"" + sslxid + "\",";
				params += "\"ssBaseinfoQueryVO.ssztid\":\"" + ssztid + "\",";
				params += "\"ssBaseinfoQueryVO.qssjbegin\":\"" + qssjbegin + "\",";
				params += "\"ssBaseinfoQueryVO.qssjend\":\"" + qssjend + "\",";
				params += "\"paginator.currentPage\":\"" + 1 + "\",";
			    params += "\"paginator.pageSize\":\"" + 10000000 + "\"}";
			exportExcel("ssgl_list", urlStr, params, '诉讼列表','rn,cb');
			
		}
		function querystring(){
			var sfid = document.getElementById("sfid").value;
			var sazclbid = document.getElementById("sazclbid").value;
			var sazcmc = document.getElementById("sazcmc").value;
			var sslxid = document.getElementById("sslxid").value; 
			var ssztid = document.getElementById("ssztid").value;
			var qssjbegin = document.getElementById("qssjbegin").value;
			var qssjend = document.getElementById("qssjend").value; 
			var qisu = document.getElementById("qisu").value; 
			var beisu = document.getElementById("beisu").value; 
				jQuery("#ssgl_list").setGridParam({
				postData:{
				    'ssBaseinfoQueryVO.sfid': sfid,//所属省份
					'ssBaseinfoQueryVO.sazclbid': sazclbid,//资产类别
					'ssBaseinfoQueryVO.sazcmc': sazcmc, //涉案资产
					'ssBaseinfoQueryVO.sslxid': sslxid,//诉讼类型
					'ssBaseinfoQueryVO.ssztid': ssztid,//案件类别
					'ssBaseinfoQueryVO.qssjbegin': qssjbegin,//起诉日期从
					'ssBaseinfoQueryVO.qssjend':qssjend,//起诉日期到
					'ssBaseinfoQueryVO.qisu':qisu,//起诉
					'ssBaseinfoQueryVO.beisu':beisu//被诉
				},
				url:"<%=basePath%>ssgl/lawsuit_queryString.do"
				}).trigger("reloadGrid");
		}
        </script>