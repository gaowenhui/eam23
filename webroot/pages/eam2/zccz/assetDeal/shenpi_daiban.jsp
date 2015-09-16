<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc" %>
<%@ include file="/inc/ProjectJQuery.inc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
<head>

<title>安排审批待办</title>

<link rel="stylesheet" type="text/css" media="screen" href="../../../JQuery/themes/jquery-ui-1.8.1.custom.css" />
<link rel="stylesheet" type="text/css" media="screen" href="../../../JQuery/themes/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" media="screen" href="../../../JQuery/themes/ui.multiselect.css" />
	
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
			function tijiao(){
			//window.showModalDialog("tijiao.html",window,'status: No;dialogHeight:50px;dialogWidth:2px;dialogTop:150px;dialogLeft:900px');
			  window.open("tijiao.html","","status:no,height=50,width=20");
			//	window.open("http://www.baidu.com","_self");
			}
			function workflow(){
			  window.showModalDialog("workflow.htm",window,'status: No;dialogHeight:650px;dialogWidth:800px;dialogTop:100px;dialogLeft:300px');
			}
			function showSubmitPage(){
				document.getElementById("submitpage").style.display="block";
			}
			function hiddenSubmitPage(){
				document.getElementById("submitpage").style.display="none";
			}
		</script>
		</head>

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<center>
	
	<br/>
	<br/>
	
			<form name="form1" method="post" action="">
  <table width="98%" border="0" cellspacing="0" cellpadding="0" align="center" id="items">
                        <tr>
                          <td align="right">
	<table id="purchase_list"> </table>
			<div id="pgtoolbar1"></div>
				<script type="text/javascript">
				jQuery("#purchase_list").jqGrid({
					datatype: "local",
					colNames:['序号','时间','主题', '发送人', '当前环节'],
					colModel:[
								
						{name:'id',index:'id',width:50,align:"center",sorttype:"int"},
						{name:'date',index:'date',width:100,sorttype:"date"},
						{name:'theme',index:'theme'},
						{name:'person',index:'person'},
						{name:'tache',index:'tache'}
					],
					height:'auto',
					autowidth:true,
					multiselect: true,
					caption: '安排审批待办',
					toolbar: [true,"top"]
						});
			var mydata = [
{id:'1',date:'2010-8-4 ',theme:'建银大厦舞池板',person:'黄晓丽',tache:'会议组织 '},
{id:'2',date:'2010-8-5 ',theme:'建银大厦舞池板',person:'黄晓丽',tache:'会议组织 '},
{id:'3',date:'2010-8-6 ',theme:'建银大厦舞池板',person:'黄晓丽',tache:'会议组织 '},
{id:'4',date:'2010-8-7 ',theme:'建银大厦舞池板',person:'黄晓丽',tache:'会议组织 '},
{id:'5',date:'2010-8-8 ',theme:'建银大厦舞池板',person:'黄晓丽',tache:'会议组织 '}
			];
				for(var i=0;i<=mydata.length;i++)
					jQuery("#purchase_list").jqGrid('addRowData',i+1,mydata[i]);
				jQuery("#purchase_list").jqGrid('navGrid','#pgtoolbar1',{edit:false,add:false,del:false});
				$("#t_purchase_list").append("<input type='button' value='置顶' style='height:20px;font-size:-3'/>");
				$("#t_purchase_list").append("<input type='button' value='上移' style='height:20px;font-size:-3'/>");
				$("#t_purchase_list").append("<input type='button' value='下移' style='height:20px;font-size:-3'/>");
				$("#t_purchase_list").append("<input type='button' value='排序' style='height:20px;font-size:-3'/>");
				$("#t_purchase_list").append("<input type='button' value='组织会议' style='height:20px;font-size:-3'/>");
				$(window).bind('resize', function() {  
						// resize the datagrid to fit the page properly: 
						var size = getWidthAndHeigh(true);
						jQuery("#purchase_lis").setGridWidth(size.width * 0.98); 
					});				

		</script>
				</td>
                </tr>
              </table>

		  </form>
		</center>
	</body>
</html>

