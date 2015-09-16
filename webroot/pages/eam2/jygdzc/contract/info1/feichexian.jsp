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
    <title>非车险</title>
     <script type="text/javascript">
     jQuery("#purchase_list").setGridWidth($("#widthRule").width());
     jQuery("#file_list").setGridWidth($("#widthRule").width());
     $(window).bind('resize', function(){
     	jQuery("#purchase_list").setGridWidth($("#widthRule").width());
		jQuery("#file_list").setGridWidth($("#widthRule").width());
	 });  
	
		$(function(){	
            $("#jiqixjsrq").datebox({formatter:function(date){return formatDate(date);}});
			$("#jiqixksrq").datebox({formatter:function(date){return formatDate(date);}});
			$("#ggzrxjsrq").datebox({formatter:function(date){return formatDate(date);}});
			$("#ggzrxksrq").datebox({formatter:function(date){return formatDate(date);}});
			$("#ccxksrq").datebox({formatter:function(date){return formatDate(date);}});
			$("#ccxjsrq").datebox({formatter:function(date){return formatDate(date);}});
			$("#htdqrq").datebox({formatter:function(date){return formatDate(date);}});
			$("#htqsrq").datebox({formatter:function(date){return formatDate(date);}});
			//在列表的标题右端添加按钮，最后一个按钮距右端20px
			var buttonJSonString = '[{"buttonHandler":"add_card","buttonIcon":"icon-add","buttonText":"增加"},\
									{"buttonHandler":"delete_card","buttonIcon":"icon-remove","buttonText":"删除"}\
			]';
			addButtons(jQuery("#gview_purchase_list> .ui-jqgrid-titlebar"),buttonJSonString);
			var buttonFileJSonString = '[{"buttonHandler":"addFileAss","buttonIcon":"icon-add","buttonText":"增加"},\
									{"buttonHandler":"delFileAss","buttonIcon":"icon-remove","buttonText":"删除"}\
			]';
			addButtons(jQuery("#gview_file_list > .ui-jqgrid-titlebar"),buttonFileJSonString);
		});
			
	function delete_card(){
		var zcIds = jQuery("#purchase_list").jqGrid('getGridParam','selarrrow');
		if(zcIds.length<1){
			alert("没有能删除的资产信息！");
			return false;
		}
		if(confirm("确认要删除吗?")){
			var htId = document.getElementById('htId').value;
			var htlx = document.getElementById('htlx').value;
			var url ="<%=request.getContextPath()%>/htqs/ContractManageBody_deleteZc4Ht.do";
			$.post(url,{zcIds:"" + zcIds + "",htId:"" + htId + "",htlx:"" + htlx + ""}, function(data){
				jQuery("#purchase_list").trigger("reloadGrid");
			});
			return false;
		}else{return false;}
	};
	function add_card(){
		var url = '<%=request.getContextPath()%>/jygdzc/AssetQuery_init.do?returnValue=true&sheettype=check&headId=${headId}';
	  	var g_ = 'height=600, width=1000, top=10, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no';
		 window.open(url,'',g_);
		 //window.open(url);
	  	return false;
	}
      //查询的回调方法
	  function addValue(gr){
			document.getElementById("zcid").value=gr;
			var hh=document.getElementById("zcid").value;
			$.post("<%=basePath%>htqs/ContractManageBody_getZcList.do",{
				zcIds: '' + hh,
				htId: document.getElementById("htId").value,
				htlx: document.getElementById('htlx').value
			},function(data){
				jQuery("#purchase_list").trigger("reloadGrid");
			});
		}
	function submitValue(){
		var zcId=document.getElementById("zcid").value;
		if(zcId==""){
			alert("请选择资产！");
			return false;
		}
		  //$("#zcmc").val(jQuery("#purchase_list").getCell(''+ zcId,'zcmc'));
		 // $("#zcbh").val(jQuery("#purchase_list").getCell(''+ zcId,'zcbh'));
	    //addValue(zcId);
		return true;
	}
	
	function close1(){
	   window.close();
	 }
	 function addV(){
  		var zcIds = jQuery("#purchase_list").getDataIDs();
		if(zcIds.length<1){
			alert("您还没有选择资产信息！");
			return false;
		}
		var returnValue = submitValue();//保存之前需要给相应的隐藏域赋值
		if(returnValue == false){
			return false;
		}
		myForm.action="<%=request.getContextPath()%>/htqs/ContractManageBody_saveBody.do";
		myForm.submit();
	 }
		 
	   	 //生成编号
	function createBianhao(){
		if(document.getElementById("htbh").value!=""){
			alert("已生成编号！");
			return false;
		}
		$.post("<%=basePath %>/htqs/ContractManageBody_createNum.do",{
			"code":"fcxht"
		},function(data){
			document.getElementById("htbh").value = data;
		});
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
	</td>
  </tr>
</table>
<table width="100%" id="widthRule" class="newtable"  border="0" cellspacing="0" cellpadding="0" align="center" >
<s:hidden name="headId"/>
<s:hidden name="sheettype"/>
<s:hidden name="jjzcHtBx.cldId"/>
<s:hidden name="jjzcHtBx.htlx" id="htlx" value="4"/>
<s:hidden name="bussiness" id="bussiness" value="addHT"/>
<s:hidden name="jjzcHtBx.zcid" id="zcid" />
<s:hidden name="jjzcHtBx.zcmc" id="zcmc"/>
<s:hidden name="jjzcHtBx.zcbh" id="zcbh"/>
<s:hidden name="jjzcHtBx.id" id="htId"/>
<s:hidden name="operate"/>
<s:set name="biaodanid" value="jjzcHtBx.id" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
	<tr>
      <td colspan="4" class="td_top" align="left" >合同信息</td>
    </tr>
	<tr>
	   <td class="td_form01">合同编号：</td>
      <td class="td_form02" nowrap="nowrap"><s:textfield name="jjzcHtBx.htbh" id="htbh"  readonly="true"/>
					  	<input type="button" value="生成编号" onclick="createBianhao();"/>
       <td class="td_form01">实物合同编号：</td>
      <td class="td_form02">
	  <s:textfield name="jjzcHtBx.swhtbh"/>
      </td>
	</tr>
	 <tr>
	   <td  class="td_form01">合同状态：</td>
       <td  class="td_form02"  ><s:select list="#{'1':'执行中','2':'待执行','3':'执行完毕'}" name="jjzcHtBx.htzt"/></td>
   	   <td class="td_form01">一级分行：</td>
       <td class="td_form02">
	  <e:select parRefKey="ENTITY_TRADE" headerKey="" headerValue="" parentId="438" list="#{}" name="jjzcHtBx.CYjfh"/> </td>
 </tr>
    <tr>
	 <td class="td_form01">保险公司名称：</td>
      <td class="td_form02"><s:textfield name="jjzcHtBx.bxgsmc"/></td>
      <td class="td_form01">保险公司地址：</td>
      <td class="td_form02"><s:textfield name="jjzcHtBx.bxgsdz"/></td>
    </tr>
	<tr>
	  <td class="td_form01">保险公司联系人：</td>
	  <td class="td_form02"><s:textfield name="jjzcHtBx.bxgslxr"/></td>
	  <td class="td_form01">联系人电话：</td>
	  <td class="td_form02"><s:textfield name="jjzcHtBx.lxrdh"/></td>
    </tr>
	 <tr>
      <td  class="td_form01">机器损坏险保险费率(%)：</td>
      <td class="td_form02"><s:textfield name="jjzcHtBx.jiqishxbxfl"/></td>
      <td class="td_form01">机器损坏险保费(元)：</td>
      <td class="td_form02"><s:textfield name="jjzcHtBx.jiqishxbf"/></td>
    </tr>
    <!-- 
	 <tr>
      <td  class="td_form01">机器损坏险开始日期：</td>
      <td class="td_form02">
	      <s:date name="%{#request.jjzcHtBx.jiqixksrq}" format="yyyy-MM-dd" var="draftDate1"/>
	      <s:textfield name="jjzcHtBx.jiqixksrq" id="jiqixksrq" value="%{#draftDate1}" readonly="true"/></td>
      <td  class="td_form01">机器损坏险结束日期：</td>
      <td class="td_form02">
	      <s:date name="%{#request.jjzcHtBx.jiqixjsrq}" format="yyyy-MM-dd" var="draftDate2"/>
	      <s:textfield name="jjzcHtBx.jiqixjsrq" id="jiqixjsrq" value="%{#draftDate2}" readonly="true"/></td>
    </tr> -->
	 <tr>
      <td  class="td_form01">公众责任保险保险费率(%)：</td>
      <td class="td_form02"><s:textfield name="jjzcHtBx.ggzrxbxfl"/></td>
      <td class="td_form01">公众责任保险保费(元)：</td>
      <td class="td_form02"><s:textfield name="jjzcHtBx.ggzrxbf"/></td>
    </tr>
	<!-- 
	 <tr>
      <td  class="td_form01">公众责任保险开始日期：</td>
      <td class="td_form02">
	      <s:date name="%{#request.jjzcHtBx.ggzrxksrq}" format="yyyy-MM-dd" var="draftDate3"/>
	      <s:textfield name="jjzcHtBx.ggzrxksrq" id="ggzrxksrq" value="%{#draftDate3}" readonly="true"/></td>
      <td  class="td_form01">公众责任保险结束日期：</td>
      <td class="td_form02">
	      <s:date name="%{#request.jjzcHtBx.ggzrxjsrq}" format="yyyy-MM-dd" var="draftDate4"/>
	      <s:textfield name="jjzcHtBx.ggzrxjsrq" id="ggzrxjsrq" value="%{#draftDate4}" readonly="true"/></td>
    </tr> -->
	 <tr>
      <td  class="td_form01">财产一切险及附加地震险保险费率(%)：</td>
      <td class="td_form02"><s:textfield name="jjzcHtBx.ccxbxfl"/></td>
      <td class="td_form01">财产一切险及附加地震险保费(元)：</td>
      <td class="td_form02"><s:textfield name="jjzcHtBx.ccxbf"/></td>
    </tr>
	<!-- 
	 <tr>
      <td  class="td_form01">财产险及附加地震险开始日期：</td>
      <td class="td_form02">
	      <s:date name="%{#request.jjzcHtBx.ccxksrq}" format="yyyy-MM-dd" var="draftDate5"/>
	      <s:textfield name="jjzcHtBx.ccxksrq" id="ccxksrq"  value="%{#draftDate5}" readonly="true"/></td>
      <td  class="td_form01">财产险及附加地震险结束日期：</td>
      <td class="td_form02">
	      <s:date name="%{#request.jjzcHtBx.ccxjsrq}" format="yyyy-MM-dd" var="draftDate6"/>
	      <s:textfield name="jjzcHtBx.ccxjsrq" id="ccxjsrq"  value="%{#draftDate6}" readonly="true"/></td>
     </tr> -->
     <tr>
			      <td class="td_form01">合同开始日期：</td>
			      <td class="td_form02"  >
			      	<s:date name="%{#request.jjzcHtBx.htqsrq}" format="yyyy-MM-dd" var="draftDate1"/>
			      	<s:textfield name="jjzcHtBx.htqsrq"  id="htqsrq" value="%{#draftDate1}" readonly="true"/></td>
			      <td class="td_form01">合同结束日期：</td>
			      <td class="td_form02"  >
			      	<s:date name="%{#request.jjzcHtBx.htdqrq}" format="yyyy-MM-dd" var="draftDate2"/>
			      	<s:textfield name="jjzcHtBx.htdqrq" id="htdqrq" value="%{#draftDate2}" readonly="true"/></td>
			    </tr>
	   </table>
	   <%@ include file="/inc/file.inc"%>
	   <table>
	     <tr>
	     <td colspan="4">
	      <input type="button" value="保存" onclick="addV();"  >
	      <input type="button" value="关闭" onclick="close1();" >
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
	{name:'ybyz',index:'ybyz',align:"center"}
	                       	],
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	ondblClickRow:function(gr){
		lookAsset(gr);
	},
	height:'auto',
	prmNames:{},
	viewrecords:true,
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
		window.opener.reloadGrid();
		window.close();
	}
</SCRIPT>