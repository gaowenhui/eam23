<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<% 
  //boolean isNgbmzhcl = "拟稿部门综合处理".equals(workflowVO.taskName);
	   boolean isNgbmzhcl = true;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>委管合同</title>
    <script type="text/javascript">
    $(function(){	
    	$("select,input,img,textarea").attr("disabled","disabled");
    	$("#close").attr("disabled",false);
     });
    jQuery("#purchase_list").setGridWidth($("#widthRule").width());
    jQuery("#file_list").setGridWidth($("#widthRule").width());
    $(window).bind('resize', function(){
		jQuery("#purchase_list").setGridWidth($("#widthRule").width());
		jQuery("#file_list").setGridWidth($("#widthRule").width());
	});  
	function close1(){
	   window.parent.close();
 	}
 	function lookAsset(gr){
			window.open('<%=basePath%>jygdzc/AssetManageBody_viewAsset.do?sheettype=assetXxInfo&zcId='+gr,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=yes');
			//window.open('<%=basePath%>jygdzc/AssetManageBody_viewAsset.do?sheettype=assetXxInfo&zcId='+gr);
	}
	</script>
  </head>
  <body>
  <form action="" method="post" name="myForm"> 
     <table  class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
	<td align="right">
	<table id="purchase_list" width="100%"></table>
	  <div id="pgtoolbar1"></div>
	</td>
  </tr>
</table>
<table width="100%" id="widthRule" cellpadding="0" cellspacing="0"  border="0" align="center"  class="newtable" >
<s:hidden name="headId"/>
<s:hidden name="sheettype" value="%{#request.sheettype}"/>
<s:hidden name="jjzcHtZlwg.CHtlx" id="htlx" value="1"/>
<s:hidden name="jjzcHtZlwg.zcid" id="zcid" />
<s:hidden name="jjzcHtZlwg.zcmc" id="zcmc"/>
<s:hidden name="jjzcHtZlwg.zcbh" id="zcbh"/>
<s:hidden name="ywlx" value="%{#request.ywlx}"/>
<s:hidden name="bussiness" value="addZW"/>
<s:hidden name="jjzcHtZlwg.id" id="htId"/>
<s:set name="biaodanid" value="jjzcHtZlwg.id" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<s:hidden name="operate"/>
	<tr>
      <td colspan="4" class="td_top" align="left" >合同信息</td>
    </tr>
	<tr>
	   <td class="td_form01">合同编号：</td>
       <td class="td_form02"><s:textfield name="jjzcHtZlwg.htbh"   id="htbh"   readonly="true"/></td>
       <td class="td_form01">交易对象：</td>
      <td class="td_form02">
	 <s:select list="#{'':'','1':'建行','2':'非建行'}" name="jjzcHtZlwg.jydx" id="jydx"/></td>
	</tr> 
	 <tr>
	   <td  class="td_form01">合同状态：</td>
       <td  class="td_form02"  ><s:select list="#{'':'','1':'执行中','2':'待执行','3':'执行完毕'}" name="jjzcHtZlwg.CHtzt" id="CHtzt"/></td>
   	   <td class="td_form01">一级分行：</td>
       <td class="td_form02">
	   <e:select parRefKey="ENTITY_TRADE" headerKey="" headerValue="" parentId="438" list="#{}" name="jjzcHtZlwg.CYjfh" id="CYjfh"/>
	    </td>
 </tr>
	 <tr>
	  <td class="td_form01">委托管理单位：</td>
      <td class="td_form02">
	  	<s:textfield name="jjzcHtZlwg.CWtgldw" value="建行" id="CWtgldw" readonly="true"/>
	  </td>
	   <td class="td_form01">委托管理原值(元)：</td>
       <td class="td_form02"  ><s:textfield name="jjzcHtZlwg.wtglyz" id="wtglyz" /></td>
	</tr>
	<tr>
		<td class="td_form01">委托费用比例(%)：</td>
      <td class="td_form02"  ><s:textfield name="jjzcHtZlwg.wtfybi" id="wtfybi" /></td>
      
	  <td class="td_form01">委托管理价格(元)：</td>
      <td class="td_form02"  ><s:textfield name="jjzcHtZlwg.wtgljg" id="wtgljg" /></td>
    </tr>
	<tr>
      <td class="td_form01">委托管理数量：</td>
      <td class="td_form02"  ><s:textfield name="jjzcHtZlwg.wtglsl" id="wtglsl" /></td>
	  <td class="td_form01">月委托管理费(元)：</td>
      <td class="td_form02"  ><s:textfield name="jjzcHtZlwg.ywtglf" id="ywtglf" /></td>
    </tr>
	<tr>
	 <td class="td_form01">累计实收委管费(元)：</td>
      <td class="td_form02"  ><s:textfield name="jjzcHtZlwg.ljsswgf" id="ljsswgf" /></td>
      <td class="td_form01">累计应收委管费(元)：</td>
      <td class="td_form02"  ><s:textfield name="jjzcHtZlwg.ljyswgf" id="ljyswgf" /></td>
    </tr>
    <tr>
	 <td class="td_form01">租金价格是否含物业费：</td>
      <td class="td_form02"  ><s:select list="#{'':'','0':'否','1':'是'}" name="jjzcHtZlwg.zjsfhwyf" id="zjsfhwyf"/></td>
      <td class="td_form01">租金价格是否含水电费：</td>
      <td class="td_form02"  ><s:select list="#{'':'','0':'否','1':'是'}" name="jjzcHtZlwg.zjsfhsdf" id="zjsfhsdf"/></td>
    </tr>
	<tr>
      <td class="td_form01">合同起始日期：</td>
      <td class="td_form02"  >
      	<s:date name="%{#request.jjzcHtZlwg.htqsrq}" format="yyyy-MM-dd" var="draftDate1"/>
      	<s:textfield name="jjzcHtZlwg.htqsrq"  id="htqsrq" value="%{#draftDate1}" readonly="true"/></td>
      <td class="td_form01">合同到期日期：</td>
      <td class="td_form02"  >
      	<s:date name="%{#request.jjzcHtZlwg.htdqrq}" format="yyyy-MM-dd" var="draftDate2"/>
      	<s:textfield name="jjzcHtZlwg.htdqrq" id="htdqrq" value="%{#draftDate2}" readonly="true"/></td>
    </tr>
	<tr>
      <td class="td_form01">上次清算日期：</td>
      <td class="td_form02"  >
      <s:date name="%{#request.jjzcHtZlwg.scqsrq}" format="yyyy-MM-dd" var="draftDate211"/>
      <s:textfield name="jjzcHtZlwg.scqsrq"  id="scqsrq"  readonly="true" value="%{#draftDate2111}"/></td>
      <td class="td_form01">上次清算截止日期：</td>
      <td class="td_form02"  >
       <s:date name="%{#request.jjzcHtZlwg.scqsjzrq}" format="yyyy-MM-dd" var="draftDate211"/>
      <s:textfield name="jjzcHtZlwg.scqsjzrq"  id="scqsjzrq"  readonly="true" value="%{#draftDate2111}"/></td>
    </tr>
	<tr>
      <td class="td_form01">本次清算调整金额（元）：</td>
      <td class="td_form02"  ><s:textfield name="jjzcHtZlwg.zlqstzje" id="zlqstzje"/></td>
      <td class="td_form01">&nbsp;</td>
      <td class="td_form02" >&nbsp;</td>
    </tr>
	<tr>
      <td class="td_form01">结算方式：</td>
      <td class="td_form02"  ><s:select list="#{'':'','1':'月付','2':'季付','3':'年付','4':'其他'}" name="jjzcHtZlwg.jsfs" id="jsfs"/>
			</td>
      <td class="td_form01">度量单位：</td>
      <td class="td_form02"  >
	 <s:select list="#{'':'','1':'个','2':'平方米'}" name="jjzcHtZlwg.dldw" id="dldw"/>
	 </td>
    </tr>
	<tr>
      <td class="td_form01">录入人：</td>
      <td class="td_form02"  ><s:textfield name="jjzcHtZlwg.lrr" readonly="true"  id="lrr"/></td>
      <td class="td_form01">录入日期：</td> 
      <td class="td_form02"  ><s:date name="%{#request.jjzcHtZlwg.lrrq}" format="yyyy-MM-dd" var="draftDate"/>
		<s:textfield id="lrrq" name="jjzcHtZlwg.lrrq" value="%{#draftDate}" readonly="true"/></td>
    </tr>
    </table>
	   <%@ include file="/inc/file.inc"%>
	   <table>
	     <tr>
	     <td colspan="4">
	      <input type="button" value="保存" onclick="addV();"  >
	      <input type="button" value="关闭" id="close" onclick="close1();" >
	     </td>
	   </tr>
	   </table>
	</form>
  </body>
</html>
<script type="text/javascript">
			jQuery("#purchase_list").jqGrid({ 
			url:"<%=basePath%>htqs/ContractManageBody_getZc4Ht.do?htlx =${htlx}&htId=${htId}&type=pass",      
			datatype:"json",
			colNames: ['ID','资产编号', '资产名称','资产类型','主卡片编号','主卡片名称','地区','原币原值'],
			colModel: [
				{name:'id',index:'id',align:"center",hidden:true},
				{name:'zcbh',index:'zcbh',align:"center"},
				{name:'zcmc',index:'zcmc',align:"center"},
				{name:'CZclx',index:'CZclx',align:"center"},
				{name:'zkpbh',index:'zkpbh',align:"center"},
				{name:'zkpmc',index:'zkpmc',align:"center"},
				{name:'CZcdq',index:'CZcdq',align:"center"},
				{name:'ybyz',index:'ybyz',align:"center"}],
			   multiselect:true,
				rownumbers:false,
				autowidth:true,
				height:'auto',
				viewrecords:true,
				ondblClickRow:function(gr){
					lookAsset(gr);
				},
				caption:'资产列表',
				jsonReader:{
				records:"records",
				repeatitems:false,
				id:"0"
			}
		});
							 </script>
<SCRIPT LANGUAGE="JavaScript">
	if('${message}' != "") {
		alert("${message}"); 
		if("${ywlx}"!=null&&""!="${ywlx}"){
			window.parent.opener.reloadGrid();
		}else{
			window.opener.reloadGrid();
		}
	}
</SCRIPT>