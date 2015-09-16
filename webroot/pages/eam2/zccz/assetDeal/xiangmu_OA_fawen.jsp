<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc" %>
<%@ include file="/inc/ProjectJQuery.inc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目OA发文</title>
<link href="../../../css/style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" media="screen" href="../../../JQuery/themes/jquery-ui-1.8.1.custom.css" />
<link rel="stylesheet" type="text/css" media="screen" href="../../../JQuery/themes/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" media="screen" href="../../../JQuery/themes/ui.multiselect.css" />
	<link rel="stylesheet" type="text/css" href="../../../JQuery/themes/easyui.css">
	<link rel="stylesheet" type="text/css" href="../../../JQuery/themes/icon.css">
<script src="../../../JQuery/js/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="../../../JQuery/js/i18n/grid.locale-en.js" type="text/javascript"></script>
<script src="../../../JQuery/js/jquery.jqGrid.min.js" type="text/javascript"></script>
<script src="../../../JQuery/js/jquery.easyui.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../../../js/openWin.js"></script>
<script type="text/javascript" src="../../../js/oper_table.js"></script>
<script type="text/javascript" src="../../../js/custom/tools.js"></script>
<style>
	.STYLE1 {
	    font-size: 20px;
		font-family:"simsun";
		font-weight:bold;
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
		<center>
	<br>
  <table width="98%" border="0" cellspacing="0" cellpadding="0" align="center" id="items">
                        <tr>
                          <td align="right">
	<table id="purchase_list"> </table>
			<div id="pgtoolbar1"></div>
				<script type="text/javascript">
				jQuery("#purchase_list").jqGrid({
					datatype: "local",
					colNames:['受理序号','文件标 题', '当前处理人'],
					colModel:[
								
						{name:'id',index:'id',width:100,align:"center",sorttype:"int"},
						{name:'title',index:'title',width:270},
						{name:'person',index:'person'}
					],
					height:'auto',
					autowidth:true,
					multiselect: true,
					caption: '项目OA发文',
					toolbar: [true,"top"]
						});
			var mydata = [
{id:'2009_0026 ',title:'贵州3项抵债资产处置报告 ',person:'杨金龙'},
{id:'2009_0027',title:'西宁建宁房地产经营开发公司南山路商品房及应收款项  ',person:'杨金龙'},
{id:'2009_0028',title:'实体三门峡市宏发股份有限公司所属三门峡晴宏保龄球馆已拆除废旧设备  ',person:'杨金龙'}
			];
				for(var i=0;i<=mydata.length;i++)
					jQuery("#purchase_list").jqGrid('addRowData',i+1,mydata[i]);
				jQuery("#purchase_list").jqGrid('navGrid','#pgtoolbar1',{edit:false,add:false,del:false});
				
				$(window).bind('resize', function() {  
						// resize the datagrid to fit the page properly: 
					var size = getWidthAndHeigh(true);
					jQuery("#puechase_reason").setGridWidth(size.width * 0.98); 
					}); 
		</script>
				</td>
                </tr>
              </table>
	</body>
</html>

