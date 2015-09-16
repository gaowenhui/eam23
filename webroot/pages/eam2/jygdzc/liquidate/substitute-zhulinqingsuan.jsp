<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>第三方清算</title>
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


<table  width="98%" border="0" align="center" cellspacing="0">
  <tr>
    <td>
      <br/>
      <br/>
      <div align="center">
        <span class="STYLE7 STYLE1">中国建银投资有限责任公司经营性固定资产清算审批处理单</span>
      </div>
      <br/>
	  <div align="center">
	  <table width="100%" border="0" cellpadding="2" cellspacing="0" align="center">
  		<tr>
			<td   align="right">当前环节：拟稿 &nbsp;&nbsp;</td>
			<td  width="150"align="right">当前处理人：张三&nbsp;&nbsp;</td>
 		 </tr>
		</table>
	  <hr color="#6600CC" align="center" width="100%" />
	  <div align="center"></div>
	  <table class="newtable"  width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="12%"  class="td_form01" >标 题：</td>
          <td class="td_form02" colspan="5"><input name="appDate" type="text" class="input"  id="appDate" size="90" value="清算审批" /></td>
        </tr>
        <tr>
          <td class="td_form01" width="12%">编号：</td>
          <td class="td_form02"  width="38%"><input name="appPerson" type="text" class="input"  size="30" readonly="readonly" /></td>
          <td class="td_form01" width="12%">急缓程度：</td>
          <td colspan="3" class="td_form02"><select name="select">
            <option>一般</option>
            <option>急</option>
            <option>特急</option>
          </select></td>
        </tr>
        <tr>
          <td width="12%"  class="td_form01">拟稿人：</td>
          <td  class="td_form02"><input name="appPerson" type="text" id="appPerson" size="30" class="input"  value="张三" /></td>
          <td class="td_form01" width="12%" >联系电话：</td>
          <td width="38%" class="td_form02"><input name="appTel" type="text"  id="appTel" size="30" value="1234"  class="input"></td>
        </tr>
        <tr>
          <td  class="td_form01">拟稿日期：</td>
          <td width="38%"  class="td_form02"><input name="appDate" type="text"  id="appDate" size="30" class="input"  value="2010-08-20" /></td>
          <td  class="td_form01">拟稿部门：</td>
          <td class="td_form02" ><input name="appDate" type="text"  id="appDate" class="input"  size="30"></td>
        </tr>
        <tr>
          <td class="td_form01">清算类型：</td>
          <td class="td_form02"><select name="select">
            <option>建行清算</option>
            <option>第三方清算</option>
          </select></td>
          <td class="td_form01" >&nbsp;</td>
          <td class="td_form02">&nbsp;</td>
        </tr>
      </table>
	  </div>
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
	    <td height="63" class="td_form01" width="12%">财务会计部意见：</td>
	    <td class="td_form02" colspan="5"> 
	      <textarea name="textarea" cols="150" disabled="disabled" style="background-color:#CCCCCC" rows="4"></textarea></td>
	  </tr>
	 
	    <tr> 
	    <td class="td_form01" width="120">业务管理部门意见：</td>
	    <td class="td_form02" colspan="5"><textarea name="textarea2" cols="150" rows="4" style="background-color:#CCCCCC" disabled="disabled" ></textarea></td>
	  </tr>
	   <tr> 
	    <td height="63" class="td_form01">委托管理机构意见：</td>
	    <td class="td_form02" colspan="5"> 
	      <textarea name="textarea"  disabled="disabled"cols="150" rows="4" style="background-color:#CCCCCC"></textarea></td>
	  </tr>		
	   <tr> 
	    <td height="63" class="td_form01">备注：</td>
	    <td class="td_form02" colspan="5"> 
	      <textarea name="textarea" cols="150" rows="4"></textarea></td>
	  </tr>  
      <tr>
        <td nowrap class="td_form01">附件：</td>
        <td colspan="5" class="td_form02">
			<table width="100%" height="100%" border="0" align="center"cellpadding="5" cellspacing="0" class="table01" id="fileTable3">
				<tr>
					 <td colspan="2" align="right" class="td03">
					  <input type="file" name="file3" id="file3" style="display: none;" onChange="addRow(this,'fileTable3')"/>
					  <input type="button" class="buttonface" value="选择文件..." onClick="file3.click();" name="optionButton4" />                 </td>
				</tr>
			</table>		</td>
      </tr>		  
	</table>
	</td>
	</tr>
</table>
	<br/>

</body>
</html>
<script type="text/javascript">
                                        jQuery("#purchase_list").jqGrid({       
                                            datatype: "local",    
colNames: ['合同编号','合同类型','资产编号', '资产名称','资产所属地区','清算开始日期','清算截止日期','应收租金','修改后应收租金','实收租金','上次变动金额','本次变动资金','清算调整金额','变动原因'],
                                            colModel: [
											{
                                                name: 'qspc',
                                                index: 'htbh',
												align: "center"
                                            },{
                                                name: 'qslx',
                                                index: 'htbh',
												align: "center"
                                            },{
                                                name: 'ngbm',
                                                index: 'htbh',
												align: "center"
                                            },{
                                                name: 'htbh',
                                                index: 'htbh',
												align: "center"
                                            },{
                                                name: 'htlx',
                                                index: 'htbh',
												align: "center"
                                            },{
                                                name: 'zcbh',
                                                index: 'zcbh',
												align: "center"
                                            },{
                                                name: 'zcmc',
                                                index: 'zcmc',
												align: "center"
                                            },  {
                                                name: 'zclb',
                                                index: 'zclb',
												align: "center"
                                            },{
                                                name: 'zcssdy',
                                                index: 'zcssdy',
												align: "center"
                                            },{
                                                name: 'czr',
                                                index: 'czr',
												align: "center"
                                            },{
                                                name: 'yzj',
                                                index: 'yzj',
												align: "center"
                                            },{
                                                name: 'htqsrq',
                                                index: 'htqsrq',
												align: "center"
                                            },{
                                                name: 'htdqrq',
                                                index: 'htdqrq',
												align: "center"
                                            },{
                                                name: 'qsksrq',
                                                index: 'qsksrq',
												align: "center"
                                            }],
										    height: 'auto',
											caption: '清算合同列表',
                                            autowidth: true,
                                            multiselect: true,
                                            toolbar: [true, "top"]
                                        });
                                        var mydata = [{    
										 qspc: '<a href="#" onClick="javascript:openwindow(\'../contract/contract-info.html\',\'\',1111,600)">2110030100002375</a>',
                                           ngbm: '<a href="#" onClick="javascript:openwindow(\'../asset/asset-info.html\',\'\',1111,600)">2110030100002375</a>'
                                         }];
                                        for (var i = 0; i <= mydata.length; i++) 
                                            jQuery("#purchase_list").jqGrid('addRowData', i + 1, mydata[i]);
										
                                        jQuery("#purchase_list").jqGrid('navGrid', '#pgtoolbar1', {
                                            edit: false,
                                            add: false,
                                            del: false
                                        });
                   					$("#t_purchase_list").append("<input type='button' value='清算' onClick='javascript:openwindow(\"contractList.html\",\"\",1111,500)'");
									$("#t_purchase_list").append("<input type='button' value='修改' onClick='javascript:openwindow(\"liquidate-info.html\",\"\",1111,500)'");
									$("#t_purchase_list").append("<input type='button' value='删除' onClick='javascript:if(confirm(\"确实要删除吗？\"))location=\"#\"'");
								$("#t_purchase_list").append("<input type='button' value='查看清算信息' onClick='javascript:openwindow(\"liquidate-info.html\",\"\",1111,500)'");
							 $(window).bind('resize', function(){
                                     var size = getWidthAndHeigh(true);
                                            jQuery("#purchase_list").setGridWidth(size.width * 1.00);
                                        });  
                                      
							 </script>

     
				<script type="text/javascript">
                                        jQuery("#puechase_reason").jqGrid({
                                            datatype: "local",
                                            colNames: ['标 题', '审批单号', '审批日期', '模块名称', '流程名称'],
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
