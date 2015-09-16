<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<base href="<%=basePath %>"/>
        <title>非造价咨询类实体查询</title>
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
    <td height="25" align="center" valign="bottom" class="td06"><table width="95%" border="0" cellspacing="3" cellpadding="0">
      <tr>
        <td width="14"><img src="resource/ProjectImages/index_32.gif" width="9" height="9"></td>
        <td width="698"   align="left" valign="middle" class="title">非造价咨询类实体查询及维护</td>
		<td width="585" align="right" valign="bottom" class="title"><a href="main.html"> 返回主页</a></td>
      </tr>
    </table></td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td  class="td_form01">资产编号： </td>
    <td   class="td_form02"><s:textfield name="zyShead.ngrq" id="draftDate" label=""/></td>
    <td   class="td_form01">实体名称：</td>
    <td   class="td_form02"><s:textfield name="zyShead.ngrq" id="draftDate" label=""/></td>
    <td class="td_form01">地区：</td>
    <td class="td_form02"><select name="select4">
        <option value="0"></option>
        <option value="1">河北</option>
        <option value="2">天津</option>
    </select></td>
  </tr>
  <tr>
    <td class="td_form01">管理部门：</td>
    <td class="td_form02"><s:textfield name="zyShead.ngrq" id="draftDate" label=""/></td>
    <td class="td_form01">有无历史遗留问题：</td>
    <td class="td_form02"><select name="select">
      <option value="0"></option>
      <option value="1">有</option>
      <option value="2">无</option>
    </select></td>
    <td  colspan="2" class="td_form02"><div align="right">
      <input name="Submit2222" type="submit"  value="  查询  "  />
      <input name="Submit322" type="submit"   value="  重置  " />
    </div></td>
  </tr>
</table>
<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
       <tr>
         <td height="5" align="right">
                <table id="entity_list"> </table>
				<div id="pgtoolbar1"></div>
       </td>
     </tr>
</table>

</body>
</html>
<script type="text/javascript">
				jQuery("#entity_list").jqGrid({
					datatype: "local",
					colNames:['资产编号','实体名称', '地区','管理部门','实体现状','历史遗留问题','尚有人员数','原值（万元）','账面资产总额（万元）','账面资产负债（万元）'],
					colModel:[	
						{name:'entityNo',index:'entityNo'},
						{name:'entityName',index:'entityName'},
						{name:'foundationTime',index:'foundationTime'},
						{name:'status',index:'classification'},
						{name:'holder',index:'holder'},
						{name:'asset',index:'asset'},
						{name:'way',index:'way'},	
						{name:'account',index:'industry'},	
						{name:'escapeCapital',index:'escapeCapital'},
						{name:'legalPer',index:'legalPer'}
					],
					autowidth:true,
					height:'auto',
					multiselect: true,
					pager: '#pgtoolbar1',
					caption: '实体查询',
					toolbar: [true,"top"]
						});
				var mydata = [ 
				        {entityNo:'',entityName:'',foundationTime:'',status:'',holder:'',asset:'',way:'',account:'',escapeCapital:'',legalPer:''},
						{entityNo:'',entityName:'',foundationTime:'',status:'',holder:'',asset:'',way:'',account:'',escapeCapital:'',legalPer:''},
						{entityNo:'',entityName:'',foundationTime:'',status:'',holder:'',asset:'',way:'',account:'',escapeCapital:'',legalPer:''},
						{entityNo:'',entityName:'',foundationTime:'',status:'',holder:'',asset:'',way:'',account:'',escapeCapital:'',legalPer:''}];
				for(var i=0;i<=mydata.length;i++)
					jQuery("#entity_list").jqGrid('addRowData',i+1,mydata[i]);					
					jQuery("#entity_list").jqGrid('navGrid','#pgtoolbar1',{edit:false,add:false,del:false});					
				    
					$("#t_entity_list").append("<input type='button' id='add' value='增加'  style='height:20px;font-size:-3'/>");
					$("#add","#t_entity_list").click(function(){
				               window.open('chuzhi_newEntity.do','增加','');
					});
					
				    $("#t_entity_list").append("<input type='button' id='modify' value='修改'  style='height:20px;font-size:-3'/>");
				    $("#modify","#t_entity_list").click(function(){
				                window.open('chuzhi_newEntity.do','修改','');
					});
				$(window).bind('resize', function() {  
						// resize the datagrid to fit the page properly: 
						var size = getWidthAndHeigh(true);
						jQuery("#entity_list").setGridWidth(size.width * 0.98); 
						
					}); 
</script>
