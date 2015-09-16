<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>卡片信息</title>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%String cardId = (String)request.getAttribute("cardId"); %>
<SCRIPT language=JavaScript type=text/JavaScript>
jQuery("#biandonglishi").setGridWidth($("#common_tableWidth").width());
jQuery("#gjkpxx").setGridWidth($("#common_tableWidth").width());
$(window).bind('resize', function(){
	jQuery("#biandonglishi").setGridWidth($("#common_tableWidth").width());
	jQuery("#gjkpxx").setGridWidth($("#common_tableWidth").width());
});
function displayUpperLayer(index){
	for(var i=0;i<5;i++){
		if(index==i){
		   document.getElementById("upperLayer"+i).style.display="block";
		}else{
		   document.getElementById("upperLayer"+i).style.display="none";
		}
	}
}
function getCard(cardId){
    var cardId = '<%=cardId%>';
	var url = "<%=request.getContextPath()%>/kpgl/cardQuery_cardType.do?cardId="+cardId;
	cardInfo.window.location = url ;
}
</SCRIPT>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="getCard();" >

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  	<tr>
    	<td height="25" align="center" valign="bottom" class="td06">
			<table width="100%" border="0" cellspacing="3" cellpadding="0">
		  		<tr>
					<td width="15"><img src="../../images/index_32.gif" width="9" height="9"></td>
					<td valign="bottom" class="title">卡片信息</td>
		  		</tr>
			</table>
		</td>
  	</tr>
</table>

<TABLE  border=0 id="upperTable" style="border-color:blue; " width="100%">
	<TR oncontextmenu='return false' ondragstart='return false' onselectstart ='return false' onselect='document.selection.empty()' oncopy='document.selection.empty()' onbeforecopy='return false' onmouseup='document.selection.empty()'>
	   <TD class="clicked" onClick="displayUpperLayer(0)">卡片信息</TD>
	   <TD class="ttd"  onClick="displayUpperLayer(1)">变动记录</TD>
	   <TD class="ttd"  onClick="displayUpperLayer(2)">资产信息</TD>
	   <!-- <TD class="ttd"  onClick="displayUpperLayer(3)">文档管理</TD>
	   <TD class="ttd"  onClick="displayUpperLayer(3)">权证管理</TD> -->
	</TR>
</TABLE>

<!-- *******************************卡片信息********************************** -->
<div class="panelUpper" style="display:block" id="upperLayer0">
	<iframe id="cardInfo" frameBorder=0 height="800" width="100%" scrolling="no" src="">
	</iframe>
</div>

<!-- *******************************变动记录********************************** -->
<div class="panelUpper" style="display:none" id="upperLayer1"><br>
	<table  class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
            <td align="right">
				<table id="biandonglishi"></table>
	            <div id="pgtoolbar1"></div>
				<table id="xiugailishi"></table>
	            <div id="pgtoolbar2"></div>
				<table id="bencibiandong"></table>
	            <div id="pgtoolbar3"></div>
				<table id="bencixiugai"></table>
	            <div id="pgtoolbar4"></div>
			</td>
		</tr>
	</table>
</div>

<!-- *******************************资产信息********************************** -->
<div  style="display:none" id="upperLayer2"><br>
	<table  class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr>
			<td align="right">
				<table width="100%" id="gjkpxx"></table>
			  	<div id="pgtoolbar5"></div>
			</td>
		</tr>
	</table>
</div>

<!-- *******************************文档管理********************************** -->
<div  style="display:none" id="upperLayer3">
	<table width="100%"  border="0" cellpadding="2" cellspacing="0" align="center" class="table01">
		<tr>
	        <td  width="97" class="td_form01">附件</td>
	        <td colspan="5" class="td_form02">
				<table width="100%" height="100%" border="0" align="center"cellpadding="5" cellspacing="0" class="table01" id="fileTable3">
					<tr>
					 	<td colspan="2" align="right" class="td03">
					  		<input type="file" name="file3" id="file3" style="display: none;" onChange="addRow(this,'fileTable3')"/>
					  		<input type="button" class="buttonface" value="选择文件..." onClick="file3.click();" name="optionButton4" />                
					 	</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>		
</div>

<!-- *******************************权证管理********************************** -->
<div  style="display:none"  id="upperLayer4">
	<table width="100%"  border="0" cellpadding="2" cellspacing="0" align="center" class="table01">
		<tr>
	        <td  width="97" class="td_form01">附件</td>
	        <td colspan="5" class="td_form02">
				<table width="100%" height="100%" border="0" align="center"cellpadding="5" cellspacing="0" class="table01" id="fileTable2">
					<tr>
						 <td colspan="2" align="right" class="td03">
						  <input type="file" name="file2" id="file2" style="display: none;" onChange="addRow(this,'fileTable2')"/>
						  <input type="button" class="buttonface" value="选择文件..." onClick="file2.click();" name="optionButton4" />                
						 </td>
					</tr>
				</table>
			</td>
		</tr>
	</table>		
</div>

</body>
</html>

<!-- *******************************变动历史JS********************************** -->
<script type="text/javascript">
jQuery("#biandonglishi").jqGrid({
    url:"<%=basePath %>kpgl/cardQuery_findRecordhistorys.do?cardId=<%=cardId%>",
	datatype: "json",
	mtype:"POST",
    colNames: ['变动方式','变动原因','改变前值','改变后值','变动时间','录入人'],
    colModel: [
	    {name: 'bdfs',index: 'bdfs'}, 
	    {name: 'bdyy',index: 'bdyy'},
	    {name: 'gbqz',index: 'gbqz'},  
	    {name: 'gbhz',index: 'gbhz'},
	    {name: 'bdzj',index: 'bdzj'},
	    {name: 'lrr',index: 'lrr'}
	],
   	pager:'pgtoolbar1',
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	height:'auto',
	viewrecords:true,
	rowNum:10,
	prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
  	rowList:[10,20,30],
	caption: '变动历史信息',
	jsonReader : {
		root:"rows",
		page: "page",
		total: "total",
		records: "records",
		repeatitems: false,
		id: "0"
	},
	loadComplete:function(data){
		if(data.rows.length>0){
		jQuery("#biandonglishi").setGridHeight(data.rows.length * 22 + 18);
		}else{
		jQuery("#biandonglishi").setGridHeight(0);
		}
	},
	shrinkToFit:false
});
										
</script>
<!-- *******************************修改历史JS********************************** 
<script type="text/javascript">
jQuery("#xiugailishi").jqGrid({
    datatype: "local",
    colNames: ['改变的属性','改变前值','改变后值','变动时间','录入人'],
    colModel: [
	    {name: 'gbdsx',index: 'gbdsx'},
	    {name: 'gbqz',index: 'gbqz'},
	    {name: 'gbhz',index: 'gbhz'},
	    {name: 'bdzj',index: 'bdzj'},
	    {name: 'lrr',index: 'lrr'}
    ],
	height: 'auto',
   	autowidth: true,
  	multiselect: true,
	pager: '#pgtoolbar2',
	caption: '修改历史信息',
    toolbar: [true, "top"]
});
jQuery("#xiugailishi").jqGrid('navGrid', '#pgtoolbar2', {
    edit: false,
    add: false,
    del: false
});
</script>-->
<!-- *******************************本次变动JS********************************** 					 		
<script type="text/javascript">
                                        jQuery("#bencibiandong").jqGrid({
                                           url:"<%=basePath %>kpgl/cardQuery_findModifyBodyAction.do?headId=<%=cardId%>",
	datatype: "json",
	mtype:"POST",
                                            colNames: ['变动方式','变动原因','改变前值','改变后值','变动时间','录入人'],
                                            colModel: [
                                            {
                                                name: 'bdfs',
                                                index: 'bdfs'
                                            }, {
                                                name: 'bdyy',
                                                index: 'bdyy'
                                            },{
                                                name: 'gbqz',
                                                index: 'gbqz'
                                            },  {
                                                name: 'gbhz',
                                                index: 'gbhz'
                                            },{
                                                name: 'bdzj',
                                                index: 'bdzj'
                                            },{
                                                name: 'lrr',
                                                index: 'lrr'
                                            }],
										    height: 'auto',
                                            autowidth: true,
                                            multiselect: true,
											pager: '#pgtoolbar3',
											caption: '本次变动信息',
                                            toolbar: [true, "top"]
                                        });
                                   //  var mydata = [{
                                     //   }];
                                      //  for (var i = 0; i <= mydata.length; i++) 
                                        //    jQuery("#biandonglishi").jqGrid('addRowData', i + 1, mydata[i]);
										
                                        jQuery("#bencibiandong").jqGrid('navGrid', '#pgtoolbar3', {
                                            edit: false,
                                            add: false,
                                            del: false
                                        });
</script>-->	

<!-- *******************************本次修改JS**********************************  
<script type="text/javascript">
                                        jQuery("#bencixiugai").jqGrid({
                                            datatype: "local",
                                            colNames: ['改变的属性','改变前值','改变后值','变动时间','录入人'],
                                            colModel: [
                                            {
                                                name: 'gbdsx',
                                                index: 'gbdsx'
                                            },{
                                                name: 'gbqz',
                                                index: 'gbqz'
                                            },  {
                                                name: 'gbhz',
                                                index: 'gbhz'
                                            },{
                                                name: 'bdzj',
                                                index: 'bdzj'
                                            },{
                                                name: 'lrr',
                                                index: 'lrr'
                                            }],
										    height: 'auto',
                                            autowidth: true,
                                            multiselect: true,
											pager: '#pgtoolbar4',
											caption: '本次修改信息',
                                            toolbar: [true, "top"]
                                        });
                                   //  var mydata = [{
                                     //   }];
                                      //  for (var i = 0; i <= mydata.length; i++) 
                                        //    jQuery("#biandonglishi").jqGrid('addRowData', i + 1, mydata[i]);
										
                                        jQuery("#bencixiugai").jqGrid('navGrid', '#pgtoolbar4', {
                                            edit: false,
                                            add: false,
                                            del: false
                                        });
									
                                     
							$("#upperLayer1").css("display","none");
</script>-->		

<!-- *******************************资产信息JS********************************** -->
<script type="text/javascript">
jQuery("#gjkpxx").jqGrid({
    url:"<%=basePath %>kpgl/cardQuery_findModifyBodyAction.do?headId=<%=cardId%>",
	datatype: "json",
	mtype:"POST",
    colNames: ['资产编号','资产名称','存放地点','使用部门'],
    colModel: [
    {name: 'zcbh',index: 'zcbh'},
    {
        name: 'zcmc',
        index: 'zcmc'
    },  {
        name: 'cfdd',
        index: 'cfdd'
    },{
        name: 'sybm',
        index: 'sybm'
    }],
   height: 'auto',
                                 autowidth: true,
                                 multiselect: true,
caption: '该卡片挂接资产信息',
	loadComplete:function(data){
		if(data.rows.length>0){
		jQuery("#gjkpxx").setGridHeight(data.rows.length * 22 + 18);
		}else{
		jQuery("#gjkpxx").setGridHeight(0);
		}
	},
	shrinkToFit:false
                             });
                                     $("#upperLayer2").css("display","none");
</script>
							 