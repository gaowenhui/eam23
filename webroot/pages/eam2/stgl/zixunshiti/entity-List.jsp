<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<base href="<%=basePath %>"/>
        <title>实体查询</title>
<link href="../../css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" media="screen" href="../../JQuery/themes/jquery-ui-1.8.1.custom.css" />
<link rel="stylesheet" type="text/css" media="screen" href="../../JQuery/themes/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" media="screen" href="../../JQuery/themes/ui.multiselect.css" />
<link rel="stylesheet" type="text/css" href="../../JQuery/themes/easyui.css">
<link rel="stylesheet" type="text/css" href="../../JQuery/themes/icon.css">
<script type="text/javascript" src="../../js/openWin.js"></script>
<script src="../../JQuery/js/jquery.js" type="text/javascript"></script>
<script src="../../JQuery/js/i18n/grid.locale-en.js" type="text/javascript"></script>
<script src="../../JQuery/js/jquery.jqGrid.min.js" type="text/javascript"></script>
<script src="../../JQuery/js/jquery.easyui.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../../js/oper_table.js"></script>
<script type="text/javascript" src="../../js/custom/tools.js"></script>
<style>
	.STYLE1 {
		font-size: 20px;
		font-family: "simsun";
		font-weight: bold;
		color: #0000ff;
	}
</style>
		<script type="text/javascript">

            function addTrFromOpenWin(url){
                //弹出窗口，trHtml为弹出窗口的返回值
                var trHtml = window.showModalDialog(url, '', 'dialogWidth=800px;dialogHeight=400px');
                if (trHtml.length > 0) {
                    //取得目标table
                    var table = document.getElementById('items');
                    //插入行tr
                    var trObj = table.insertRow(table.rows.length);
                    //插入列
                    var tdObj;
                    for (var i = 0; i < trHtml.length + 1; i++) {
                        tdObj = trObj.insertCell(i);
                        tdObj.className = 'td07';
                        if (i == 0) {
                            tdObj.innerHTML = '<input type="checkbox" name="purchaseItems" value=""/>';
                        }
                        else {
                            tdObj.innerHTML = trHtml[i - 1];
                            
                        }
                    }
                }
            }
            function getWidthAndHeigh(resize) {
                var iframeHeight = document.body.clientHeight;
                var iframeWidth = document.body.clientWidth;
                var browser=navigator.appName;
             // chrome
                if (browser == "chrome") {
                        iframeWidth -= 16;
                        iframeHeight -= 85;
                }
                // firefox
                else if (browser == "firefox") {
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
                return {width: iframeWidth, height: iframeHeight};
        }

        </script>
    </head>
    <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="25" align="center" valign="bottom" class="td06">
    	
	<table width="98%" border="0" cellspacing="3" cellpadding="0">
      <tr>
        <td width="15"><img src="resource/ProjectImages/index_32.gif" width="9" height="9"></td>
        <td valign="bottom" class="title"><div align="left">实体查询</div></td>
      </tr>
    </table>
	</td>
  </tr>
</table>
       
        <table class="newtable" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td  class="td_form01">资产编号： </td>
            <td   class="td_form02"><s:textfield name=""/></td>
            <td   class="td_form01">实体名称（中文）：</td>
            <td   class="td_form02"><s:textfield name=""/></td>
            <td   class="td_form01">经营分类：</td>
            <td  class="td_form02"><select name="select3">
                <option value="0"></option>
                <option value="1">持续经营类</option>
                <option value="2">处置类</option>
              </select>            </td>
          </tr>
          <tr>
            <td class="td_form01">管理部门：</td>
            <td class="td_form02"><s:textfield name=""/></td>
            <td class="td_form01">委托管理机构：</td>
            <td class="td_form02"><s:textfield name=""/></td>
            <td class="td_form01">地区：</td>
            <td class="td_form02"><select name="select3" id="s1" >
              <option>省份</option>
            </select>
              <select name="select8" id="s2" >
                <option>地级市</option>
              </select>     </td>
          </tr>
		  <tr>
             <td class="td_form02" colspan="6" >
			    <div align="right">
			    <input type='button'   value='查询'  style='height:20px;font-size:-3'/>
			    <input type='button'  value='重置'  style='height:20px;font-size:-3'/>
	        </div></td>		  
		  <tr>		  </tr>
        </table>
        <br/>
	<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
       <tr>
         <td height="5" align="right">
                <table id="entity_list"> </table>
				<div id="pgtoolbar1"></div>
       </td>
     </tr>
    </table>
	<script type="text/javascript">
				jQuery("#entity_list").jqGrid({
					datatype: "local",
					colNames:['资产编号','实体中文名称','经营分类','管理部门','委托管理机构','地区','行业','注册日期','注册地址','营业执照号'],
					colModel:[	
						{name:'entityNum',index:'entityNum'},
						{name:'entityName',index:'entityName'},
						{name:'classification',index:'classification'},
						{name:'dept',index:'dept'},
						{name:'management',index:'adress'},
						{name:'area',index:'area'},	
						{name:'industry',index:'industry'},	
						{name:'dateRegistration',index:'dateRegistration'},
						{name:'adressRegistration',index:'adressRegistration'},
						{name:'businessLicenseNum',index:'businessLicenseNum'}
					],
					autowidth:true,
					height:'auto',
					multiselect: true,
					pager:'#pgtoolbar1',
					caption:'实体查询',
					toolbar:[true,"top"]
						});
				var mydata = [ 
				        {entityNum:'<a href="entity-info-alter.html" target="_blank" >TH000001</a>',entityName:'',entityEnName:'',classification:'',dept:'',adress:'',area:'',industry:'',dateRegistration:'',adressOfRegistration:'',businessLicenseNum:''},
						{entityNum:'<a href="entity-info-alter.html" target="_blank" >TH000001</a>',entityName:'',entityEnName:'',classification:'',dept:'',adress:'',area:'',industry:'',dateRegistration:'',adressOfRegistration:'',businessLicenseNum:''},
						{entityNum:'<a href="entity-info-alter.html" target="_blank" >TH000001</a>',entityName:'',entityEnName:'',classification:'',dept:'',adress:'',area:'',industry:'',dateRegistration:'',adressOfRegistration:'',businessLicenseNum:''},
						{entityNum:'<a href="entity-info-alter.html" target="_blank" >TH000001</a>',entityName:'',entityEnName:'',classification:'',dept:'',adress:'',area:'',industry:'',dateRegistration:'',adressOfRegistration:'',businessLicenseNum:''}];
				for(var i=0;i<=mydata.length;i++)
					jQuery("#entity_list").jqGrid('addRowData',i+1,mydata[i]);					
					jQuery("#entity_list").jqGrid('navGrid','#pgtoolbar1',{edit:false,add:false,del:false});					
				    $("#t_entity_list").append("<input type='button' id='add' value='新增'  style='height:20px;font-size:-3'/>");
				    $("#add","#t_entity_list").click(function(){
				                window.open('weihu_newEntity.do','修改','');
					});
					
					 $("#t_entity_list").append("<input type='button' id='modify' value='修改'  style='height:20px;font-size:-3'/>");
				    $("#modify","#t_entity_list").click(function(){
				                window.open('weihu_newEntity.do','修改','');
					});
				$(window).bind('resize', function() {  
						// resize the datagrid to fit the page properly: 
						var size = getWidthAndHeigh(true);
						jQuery("#entity_list").setGridWidth(size.width * 0.98); 
						
					}); 
					
					</script>

</body>
</html>
				