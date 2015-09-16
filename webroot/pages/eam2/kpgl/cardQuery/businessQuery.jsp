<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>业务查询</title>
<SCRIPT language=JavaScript type=text/JavaScript>
function getWidthAndHeigh(resize){
	var iframeHeight = document.body.clientHeight;
	var iframeWidth = document.body.clientWidth;
	var browser = navigator.appName;
	// chrome
	if (browser == "chrome") {
		iframeWidth -= 16;
		iframeHeight -= 85;
	}
	// firefox
	else 
		if (browser == "firefox") {
			iframeWidth -= 15;
			iframeHeight -= 85;
			if (resize) {
				iframeWidth += 18;
				iframeHeight += 13;
			}
		}
		// IE
		else {
			iframeWidth -= 12;
			iframeHeight -= 83;
			if (resize) {
				iframeHeight += 15;
				iframeWidth += 10;
			}
		}
	return {
		width: iframeWidth,
		height: iframeHeight
	};
}
</SCRIPT>
<style> 
.STYLE1 {
	font-size: 20px;
	font-family: "simsun";
	font-weight: bold;
	color: #0000ff;
}
</style>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" align="center" cellpadding="0" class="newtable" cellspacing="0">
  	<tr>
	    <td class="td_form01">业务类型：</td>
	    <td class="td_form02">
	    	<s:select list="{1:'卡片新增',2:'卡片减少',3:'卡片修改',4:'卡片减值',5:'卡片调配',6:'卡片调配',7:'卡片拆分',8:'卡片合并',9:'卡片变动'}"></s:select>
    	</td>
	    <td class="td_form01">拟稿日期：</td>
	    <td colspan="3" class="td_form02">
	    	从<input type="text" name="textfield22" />
	    	到<input type="text" name="textfield23" />
	    </td>
  	</tr>
  	<tr>
	    <td class="td_form01">卡片编号：</td>
		<td class="td_form02"><s:textfield name="" id="cardcode" /></td>
		<td class="td_form01">卡片名称：	</td>
		<td class="td_form02"><s:textfield name="" id="zcname" /></td>
		<td class="td_form01">卡片类型：</td>
		<td class="td_form02"><s:select list="{}" /></td>
	</tr>
	<tr>
		<td class="td_form01">是否承继：</td>
		<td class="td_form02"><s:select list="{1:'是',0:'否'}" id="ifjc" value="1" ></s:select></td>
		<td class="td_form01">管理部门：</td>
		<td class="td_form02">
			<s:textfield id="glbm" name=""></s:textfield>
			<img src="../../images/search.gif" width="21" height="20" align="absmiddle"></img>
		</td>
		<td class="td_form01">使用部门：	</td>
		<td class="td_form02">
			<s:textfield id="usepartment" name=""></s:textfield>
			<img src="../../images/search.gif" width="21" height="20" align="absmiddle"></img>
		</td>
	</tr>
	<tr>
		<td class="td_form01">卡片状态：	</td>
		<td class="td_form02"><s:select list="#{'01':'正在使用','02':'空闲状态','03':'退役'}"/></td>
		<td class="td_form01"> 一级分行： </td>
		<td class="td_form02">&nbsp;<s:select list="{}" id="firstbranch" ></s:select></td>
		<td class="td_form01">&nbsp;</td>
		<td class="td_form02">&nbsp;</td>
	</tr>

  <tr >
    <td class="td_form01" colspan="6">
		<s:submit value="查询"></s:submit>
		<s:reset value="重置"></s:reset>
		</td>
  </tr>
</table>

<table width="100%" class="newtable" id="aaa">
	<tr>
		<td align="right">
		 	<div id="pgtoolbar2"></div>
		  	<table id="all_Attachment1" width="100%"></table>
		</td>
	</tr>
</table>

</body>
</html>

<script type="text/javascript">
jQuery("#all_Attachment1").jqGrid({
	datatype: "local",
	height: 250,
	colNames:['业务类型','拟稿日期','卡片编号','卡片名称','卡片类型', '卡片状态', '是否承继', '资产编号','资产名称','使用部门','管理部门','一级分行'],
	colModel:[
		{name:'businessType',index:'id',align:"center",sorttype:"int"},
		{name:'draftDate',index:'id',align:"center",sorttype:"int"},
		{name:'id',index:'id',align:"center",sorttype:"int"},
		{name:'name',index:'name', align:"center"},
		{name:'type',index:'type', align:"center"},
		{name:'zhuangtai',index:'zhuangtai', align:"center"},
		{name:'sfcj',index:'sfcj', align:"center"},
		{name:'zcid',index:'zcid', align:"center"},
		{name:'zcmc',index:'zcmc',align:"center" },
		{name:'sybm',index:'sybm', align:"center"},	
		{name:'glbm',index:'glbm', align:"center"},
		{name:'yjfh',index:'yjfh', align:"center"},	
	],
	autowidth: true,
	height:'auto',
	multiselect: true,
	pager: '#pgtoolbar2',
	toolbar: [false,"top"],
	//editurl:,"ct_goods_for_take_away.htm",
	caption: "业务信息"
});
var mydata1 = [{id:'<a href="#" onClick="javascript:openwindow(\'card-info.html\',\'\',1111,600)">202020</a>'}];
for(var i=0;i<=mydata1.length;i++)
	jQuery("#all_Attachment1").jqGrid('addRowData',i+1,mydata1[i]);
	jQuery("#all_Attachment1").jqGrid('navGrid','#pgtoolbar2',{edit:false,add:false,del:false});
					
$(window).bind('resize', function(){
	var size = getWidthAndHeigh(true);
	jQuery("#all_Attachment1").setGridWidth(size.width * 1.00);
});
</script>