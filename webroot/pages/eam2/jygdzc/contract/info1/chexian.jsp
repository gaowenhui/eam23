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
		<title>车险</title>
		<script type="text/javascript">
		jQuery("#file_list").setGridWidth($("#widthRule").width());
		jQuery("#purchase_list").setGridWidth($("#widthRule").width());
		$(window).bind('resize', function(){
			jQuery("#file_list").setGridWidth($("#widthRule").width());
			jQuery("#purchase_list").setGridWidth($("#widthRule").width());
		});  
		 $(function(){	
	    	$("select,input,img,textarea").attr("disabled","disabled");
	    	$("#close").attr("disabled",false);
	     });
	    
		function close1(){
		   window.close();
		 }
		 function lookAsset(gr){
			window.open('<%=basePath%>jygdzc/AssetManageBody_viewAsset.do?sheettype=assetXxInfo&zcId='+gr,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=yes');
			//window.open('<%=basePath%>jygdzc/AssetManageBody_viewAsset.do?sheettype=assetXxInfo&zcId='+gr);
		}
		</script>
	</head>
	<body>
		<form action="" method="post" name="myForm">
			<table class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td align="right">
						<table id="purchase_list" width="100%"></table>
					</td>
				</tr>
			</table>
			<table width="100%" id="widthRule" class="newtable" border="0" cellspacing="0" cellpadding="0" align="center">
				<s:hidden name="headId"/>
				<s:hidden name="sheettype"/>
				<s:hidden name="jjzcHtBx.cldId"/>
				<s:hidden name="jjzcHtBx.htlx" id="htlx" value="3"/>
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
					<td class="td_form02"><s:textfield name="jjzcHtBx.htbh" id="htbh" readonly="true" />
					</td>
					<td class="td_form01">实物合同编号：</td>
					<td class="td_form02"><s:textfield name="jjzcHtBx.swhtbh" id="swhtbh"/></td>
				</tr>
				<tr>
					<td class="td_form01">合同状态：</td>
					<td class="td_form02"><s:select list="#{'1':'执行中','2':'待执行','3':'执行完毕'}" name="jjzcHtBx.CHtzt"  id="CHtzt"/></td>
					<td class="td_form01">一级分行：
					</td>
					<td class="td_form02"><e:select parRefKey="ENTITY_TRADE" headerKey="" headerValue=""parentId="438" list="#{}" id="CYjfh" name="jjzcHtBx.CYjfh" />
					</td>
				</tr>
				<tr>
					<td class="td_form01">保险公司名称：</td>
					<td class="td_form02"><s:textfield name="jjzcHtBx.bxgsmc" id="bxgsmc"/></td>
					<td class="td_form01">保险公司地址：</td>
					<td class="td_form02"><s:textfield name="jjzcHtBx.bxgsdz" id="bxgsdz"/></td>
				</tr>
				<tr>
					<td class="td_form01">保险公司联系人：</td>
					<td class="td_form02"><s:textfield name="jjzcHtBx.bxgslxr" id="bxgslxr"/></td>
					<td class="td_form01">联系人电话：</td>
					<td class="td_form02"><s:textfield name="jjzcHtBx.lxrdh" id="lxrdh"/></td>
				</tr>
				<tr>
					<td class="td_form01">车牌号：</td>
					<td class="td_form02"><s:textfield name="jjzcHtBx.cph" id="cph"/></td>
					<td class="td_form01">&nbsp;</td>
					<td class="td_form02">&nbsp;</td>
				</tr>
				<tr>
					<td class="td_form01">商业险保费(元)：</td>
					<td class="td_form02" ><s:textfield name="jjzcHtBx.syxbf" id="syxbf"/></td>
				<!--  
	 <tr>
      <td  class="td_form01">商业险保险开始日期：</td>
      <td class="td_form02"><s:textfield name="jjzcHtBx.syxksrq" id="syxksrq" value="%{#request.jjzcHtBx.syxksrq}"/></td>
      <td  class="td_form01">商业险保险结束日期：</td>
      <td class="td_form02"><s:textfield name="jjzcHtBx.syxjsrq" id="syxjsrq"   value="%{#request.jjzcHtBx.syxjsrq}"/></td>
    </tr>
    -->
					<td class="td_form01">交强险保费(元)：</td>
					<td class="td_form02" ><s:textfield name="jjzcHtBx.jqxbf" id="jqxbf"/></td>
				</tr>
				<!-- 
		 <tr>
      <td  class="td_form01">交强险保险开始日期：</td>
      <td class="td_form02"><s:textfield name="jjzcHtBx.htqsrq" id="jiqixksrq"  value="%{#request.jjzcHtBx.jqxbxksrq}"/>
                            <s:textfield name="jjzcHtBx.jqxbxksrq" id="jiqixksrq"  value="%{#request.jjzcHtBx.jqxbxksrq}"/>
      </td>
      <td  class="td_form01">交强险保险结束日期：</td>
      <td class="td_form02"><s:textfield name="jjzcHtBx.jqxbxjsrq" id="jiqixjsrq" value="%{#request.jjzcHtBx.jqxbxjsrq}"/></td>
    </tr>
    -->
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
				<tr>
					<td class="td_form01">车船税金额(元)</td>
					<td class="td_form02" ><s:textfield name="jjzcHtBx.ccsje" id="ccsje"/>
					</td>
					<td class="td_form01">税费合计(元)：</td>
					<td class="td_form02"><s:textfield name="jjzcHtBx.sfhj" id="sfhj"/></td>
				</tr>
			</table>
			<%@ include file="/inc/file.inc"%>

			<table>
				<tr>
					<td colspan="4">
						<input type="button" value="保存" onclick="addV();">
						<input type="button" value="关闭" id="close" onclick="close1();">
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
	rownumbers:false,
	autowidth:true,
	height:'auto',
	ondblClickRow:function(gr){
		lookAsset(gr);
	},
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
