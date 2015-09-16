<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="org.jbpm.api.history.HistoryTask"%>
<%@ page language="java" import="org.jbpm.api.task.*"%>
<%@ page language="java" import="java.util.Set"%>
<%@ include file="/inc/taglibs.inc"%>
<%
	
	String userName = (String)request.getAttribute("userName");
	Task task = (Task)request.getAttribute("task");
	//HistoryTask beforeTask = (HistoryTask)request.getAttribute("beforeTask");
	Set outComes = (Set)request.getAttribute("outComes");
	HashMap contents = (HashMap)request.getAttribute("contents");
	if(contents==null){
		contents = new HashMap();
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>日常管理审批单</title>
<link rel="stylesheet" type="text/css" media="screen" href="../JQuery/themes/jquery-ui-1.8.1.custom.css" />
<link rel="stylesheet" type="text/css" media="screen" href="../JQuery/themes/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" media="screen" href="../JQuery/themes/ui.multiselect.css" />
<link rel="stylesheet" type="text/css" href="../JQuery/themes/easyui.css">
<link rel="stylesheet" type="text/css" href="../JQuery/themes/icon.css">
<script type="text/javascript" src="../js/openWin.js"></script>
<script src="../JQuery/js/jquery.js" type="text/javascript"></script>
<script src="../JQuery/js/i18n/grid.locale-en.js" type="text/javascript"></script>
<script src="../JQuery/js/jquery.jqGrid.min.js" type="text/javascript"></script>
<script src="../JQuery/js/jquery.easyui.min.js" type="text/javascript"></script>
<script type="text/javascript" src="../js/oper_table.js"></script>
<script type="text/javascript" src="../js/custom/tools.js"></script>
<script language="JavaScript" type="text/javascript" src="../js/win_center.js"></script>
<script type= "text/javascript" src= "../js/tab.js"> </script>
<script language="JavaScript" type="text/javascript" src="../js/tree-card.js"></script>
<script language="JavaScript" type="text/javascript"  src="<%=request.getContextPath()%>/resource/js/validate.js"></script>
<link href="<%=path %>/resource/css/maincss.css" rel="stylesheet" type="text/css">
<style>
	.STYLE1 {
		font-size: 20px;
		font-family: "simsun";
		font-weight: bold;
		color: #0000ff;
	}
</style>
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
	function showSubimtPage(){
		document.getElementById("subimtPage").style.display="block";
	}
	function cancleSubmit(){
		document.getElementById("subimtPage").style.display="none";

	}
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
		
		
		function draft(){
			if(doValidate(form1)){
				form1.action="quequan_draftsub.do";
				form1.submit();
			}
		}

</SCRIPT>

</head>
<link rel="stylesheet" type="text/css" href="resource/css/maincss.css">
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" class='body1'>
<form action ="<%=request.getContextPath() %>/quequan/quequan_draftsub.do"  name='form1' method="post">
<table  width="98%" border="0" align="center" cellspacing="0">
<tr>
    <td align='center' >
      <br>
    	<div id="idMenu0" class="container0"  style='float:left;width:120px' >
	   <input type='button' value='保存'  class='text1' onclick='draft()' class='text1' align='center'></div>
	   <input type='button' value='草稿'  class='text1' onclick='draft()' class='text1' align='center'></div>
	   
    </td></tr>
  <tr>
    <td>
    
     
      <br>
       <br>
      <div align="center">
        <span class="STYLE7 STYLE1">日常管理审批单</span>
      </div>
          <div align="center">  
      <table  border='1' align='right'>
      

      </table>
      </div>
      <br>
	  <div align="center">    当前环节:起草审批单　　　
         处理人:<s:property value="#session.user.username" />　<br /></div>
      <hr color="#6600CC" align="center" width="100%">
     
        <table class="newtable"  width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
		  <tr>
	<td width="97" class="td_form01">标题</td>
	<td class="td_form02"  colspan="5"><input name="etcld.zt" type="text"   value='确权流程20101018-0' id="etcld.zt" size="90"  vmode='not null'  vdisp='标题'  ></td>
	</tr>
	 <tr>
	    <td width="97" class="td_form01">呈送</td>
	    <td class="td_form02" colspan="5" >
	    <input name="etcld.cs" type="text"  id="etcld.cs" size="90"    vmode='not null' value='呈送'  vdisp='呈送'  >
	    </td>
	</tr>
	<tr>	
		<td width="97" class="td_form01">申请日期</td>
	    <td class="td_form02"><input name="appDate" type="text"  id="appDate" size="20" value="2010-10-18"></td>
		<td class="td_form01">申请部门</td>
	    <td class="td_form02"><input name="etcld.sqbm" type="text"  id="etcld.sqbm" size="20" vmode='not null' value='申请部门'  vdisp='申请部门' ></td>
		<td class="td_form01">事项类型</td>
		<td class="td_form02">
		<select>
		
		<option value='确权审批'>确权审批</option>
		<option value='业务维修'>业务维修</option>
		<option value='更新改造'>更新改造</option>
		<option value='其他事项审批'>其他事项审批</option>
		
		
		</select></td>
	  </tr>
	  <tr>
	 	
		<td class="td_form01">经办人</td>
		<td class="td_form02">
		<input name="etcld.jbr" type="text"  id="etcld.jbr" size="20"   vmode='not null'  vdisp='经办人'  value='<s:property value="#session.user.username" />' ></td>
		<td class="td_form01">经办人电话</td>
		<td class="td_form02">
		<input name="etcld.jbrdh" type="text" id="etcld.jbrdh" size="20" value='010-12345678' vtype='phone'  ></td>
		 <td class="td_form01">会签部门</td>
	    <td class="td_form02" colspan="5"><input name="etcld.hqbm" type="text"   vmode='not null'  vdisp='会签部门'  value='会签部门'  id="etcld.hqbm" size="20" ><input type="button" value="选择部门" class="text1"></td>
	  </tr>	
	  <tr>
	  	<td class="td_form01">是否涉及费用</td>
	    <td class="td_form02" ><input name="appDate" type="checkbox"  ></td>
	    <td class="td_form01">申请费用总金额</td>
	    <td class="td_form02" ><input name="etcld.sqfyzje" type="text"    vmode='not null' value='100' vdisp='申请费用总金额'  vtype='number'  id="etcld.sqfyzje" size="20" ></td>
		<td class="td_form01">审批费用总金额</td>
	    <td class="td_form02"><input name="etcld.spfyzje" type="text"    vmode='not null' value='100'  vdisp='审批费用总金额' vtype='number'  id="etcld.spfyzje" size="20" ></td>
		
	  </tr>	
	

	  </table>
        <table  class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td align="right">
			<table id="purchase_list"></table>
              <div id="pgtoolbar1"></div>
			<table id="puechase_reason" ></table>
              <div id="pgtoolbar2"></div>

            </td>
          </tr>
        </table>
        
             
        <table class="newtable"  width="100%" border="0" align="center" cellpadding="0" cellspacing="0"> 
	  
	  <tr> 
	    <td height="63" class="td_form01">批示意见</td>
	    <td class="td_form02" colspan="5"> 
	      <textarea  disabled="disabled" name="textarea" cols="150" rows="4" style="background-color:#CCCCCC"></textarea></td>
	  </tr>
	  <tr> 
	    <td height="63" class="td_form01">业务运营组意见</td>
	    <td class="td_form02" colspan="5"> 
	      <textarea disabled="disabled" name="textarea" cols="150" rows="4" style="background-color:#CCCCCC"></textarea></td>
	  </tr>
	   <tr> 
	    <td height="63" class="td_form01">会签部门意见</td>
	    <td class="td_form02" colspan="5"> 
	      <textarea disabled="disabled" name="textarea" cols="150" rows="4" style="background-color:#CCCCCC"></textarea></td>
	  </tr>
	   <tr> 
	    <td height="63" class="td_form01">拟稿部门意见</td>
	    <td class="td_form02" colspan="5"> 
	      <textarea name="textarea" cols="150" rows="4" style="background-color:#CCCCCC" disabled="disabled" ></textarea></td>
	  </tr>	
	 
	    <tr> 
	    <td height="63" class="td_form01">备注</td>
	    <td class="td_form02" colspan="5"><textarea name="textarea2" cols="150" rows="4"></textarea></td>
	  </tr> 
	
	
	</table>
	</td>
	</tr>
	</table>	

</form>
</body>
</html>
		<script type="text/javascript">
                                        jQuery("#purchase_list").jqGrid({       
                                            datatype: "local",    
                                            colNames: ['资产编号', '资产名称', '存放地点', '原值','申请金额','审定金额','操作'],
                                            colModel: [
											{
                                                name: 'id',
                                                index: 'id',
												align: "center"
                                            }, 
											 {
                                                name: 'name',
                                                index: 'name',
												align: "center"
                                            }, {
                                                name: 'didian',
                                                index: 'didian',
												align: "center"
                                            },{
                                                name: 'yuanzhi',
                                                index: 'yuanzhi',
												align: "center",
                                                width: 100
                                            },  {
                                                name: 'shenqingjine',
                                                index: 'shenqingjine',
												align: "center"
                                            }, {
                                                name: 'shendingjine',
                                                index: 'shendingjine',
												align: "center"
                                            },{
                                                name: 'caozuo',
                                                index: 'caozuo',
												align: "center"
                                            }],
										    height: 'auto',
                                            autowidth: true,
                                            multiselect: true,
                                            caption: '资产列表',
                                            toolbar: [true, "top"]
                                        });
                                        var mydata = [{    
                                           id: '<a href="asset-info.html" target="_blank">0000006520909</a>',
										    name: '捷达小轿车',
											didian: '北京分行',
                                            yuanzhi: '0',
                                            shenqingjine: '2312312',
											shendingjine: '2312312',
                                          	caozuo: '<a href="cakanmingxi.html" target="_blank">查看明细</a>'
                                         }];
                                        for (var i = 0; i <= mydata.length; i++) 
                                            jQuery("#purchase_list").jqGrid('addRowData', i + 1, mydata[i]);
										
                                        jQuery("#purchase_list").jqGrid('navGrid', '#pgtoolbar1', {
                                            edit: false,
                                            add: false,
                                            del: false
                                        });
									
                                       $("#t_purchase_list").append("<input type='button' id='asset_add' value='添加资产' style='height:20px;font-size:-3'/>");
                                        $("#asset_add", "#t_purchase_list").click(function(){
                                            window.open('assetList.html', '添加资产',
											 'height=600, width=1211,toolbar=yes,scrollbars=yes,menubar=yes,resizable=yes,left=100,top=0');
                                        });
                                        
                                        $("#t_purchase_list").append("<input type='button' id='kpsc' value='删除' style='height:20px;font-size:-3'/>");
                                         $("#kpsc", "#t_purchase_list").click(function(){
                                            confirm('确实要删除吗？');
                                        });
                                    
                             </script>

     
				<script type="text/javascript">
                                        jQuery("#puechase_reason").jqGrid({
                                            datatype: "local",
                                            colNames: ['标题', '审批单号', '审批日期', '模块名称', '流程名称'],
                                            colModel: [{
                                                name: 'biaoti',
                                                index: 'biaoti',
                                                width: 100,
                                                align: "center"
												},  {
                                                name: 'approval_num',
                                                index: 'approval_num',
												align: "center",
                                                width: 100
                                            }, {
                                                name: 'approval_date',
                                                index: 'approval_date',
                                                align: "center",
                                                width: 100
                                            }, {
                                                name: 'mkmc',
                                                index: 'mkmc',
                                                width: 150
                                            }, {
                                                name: 'Process',
                                                index: 'Process',
                                                width: 100,
                                                sorttype: "float"
                                            }],
                                            autowidth: true,
                                            height: 'auto',
                                            multiselect: true,
                                            caption: '办理依据',
                                            toolbar: [true, "top"]
                                        });
                                        var mydata = [{
                                            biaoti: '',
											approval_num: '200901010890',
											approval_date: '09/10/2010',
                                            mkmc: '',
                                            Process: ''
                                       
                                        }];
                                        for (var i = 0; i <= mydata.length; i++) 
                                            jQuery("#puechase_reason").jqGrid('addRowData', i + 1, mydata[i]);
                                        
                                        jQuery("#puechase_reason").jqGrid('navGrid', '#pgtoolbar1', {
                                            edit: false,
                                            add: false,
                                            del: false
                                        });
                                        $("#t_puechase_reason").append("<input type='button' id='blyj' value='增加' style='height:20px;font-size:-3'/>");
                                        $("#blyj", "#t_puechase_reason").click(function(){
                                            window.open('../transact-bases.html', '添加办理依据', 'height=500, width=900,toolbar=yes,scrollbars=yes,menubar=yes,resizable=yes,left=200,top=100');
                                        });
                                        
                                        $("#t_puechase_reason").append("<input type='button'id='aa' value='删除' style='height:20px;font-size:-3'/>");
											$("#aa", "#t_puechase_reason").click(function(){
											  confirm('你确定要删除吗？');
											});
                                        $(window).bind('resize', function(){
                                            // resize the datagrid to fit the page properly: 
                                            var size = getWidthAndHeigh(true);
                                            jQuery("#purchase_list").setGridWidth(size.width * 0.98);
											jQuery("#private_use").setGridWidth(size.width * 0.98);
                                            jQuery("#puechase_reason").setGridWidth(size.width * 0.98);
                                        });
									
                                    </script>					 
