<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>物品详细信息</title>
		<script type="text/javascript">
			$(function(){
				if($("#ejflbm").val()=="31" || $("#ejflbm").val()=="32"){
					$("#cmpInfo1,#cmpInfo2,#cmpInfo3").attr("style","display: block")
				}
				
				if($("#ejflbm").val()=="128"){
					$("#tempName").append("发动机编号：");
					$("#tempText").append("<input type='text' name='body.fdjbh' readonly='true' class='input'/>");
				}
			});
		</script>
	</head>
	<body>
		<s:form name="myform"  id="myform">
			<s:hidden name="sheettype" id="sheetType"/>
			<table class="newtable" width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td class="td_zxy01">一级分类名称：</td>
					<td class="td_zxy02">
						<s:textfield name="body.yjflmc" readonly="true" id="yjflmc" cssClass="input"/>
					</td>
					<td class="td_zxy01">二级分类名称：
					</td>
					<td class="td_zxy02">
						<s:hidden name="body.ejflbm" id="ejflbm"/>
						<s:textfield name="body.ejflmc" readonly="true" id="ejflmc" cssClass="input"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">三级分类名称：</td>
					<td class="td_zxy02">
						<s:textfield name="body.sjflmc" readonly="true" id="sjflmc" cssClass="input"/>
					</td>
					<td class="td_zxy01">资产名称：</td>
					<td class="td_zxy02">
						<s:textfield name="body.zcmc" readonly="true" cssClass="input" id="zcmc"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">规 格：</td>
					<td class="td_zxy02">
						<s:textfield name="body.gg" readonly="true" cssClass="input" id="gg"/>
					</td>
					<td class="td_zxy01">供应商：</td>
					<td class="td_zxy02">
						<s:textfield name="body.gys" readonly="true" id="gys" readonly="true" cssClass="input"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">出保日期：</td>
					<td class="td_zxy02">
						<s:date name="body.cbrq" var="chubaorq" format="yyyy-MM-dd"/>
						<s:textfield name="body.cbrq" id="cbrq" value="%{#chubaorq}" cssClass="input"/>
					</td>
					<td class="td_zxy01">序列号：</td>
					<td class="td_zxy02">
						<s:textfield name="body.xlh" cssClass="input" id="xlh"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">保修机构：</td>
					<td class="td_zxy02">
						<s:textfield name="body.bxjg" cssClass="input"/>
					</td>
					<td class="td_zxy01">数 量：</td>
					<td class="td_zxy02">
						<s:textfield name="body.sl" readonly="true" cssClass="input" id="sl"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">单 位：</td>
					<td class="td_zxy02">
						<s:textfield name="body.jldw" readonly="true" cssClass="input"/>
					</td>
					<td class="td_zxy01">单 价(元)</td>
					<td class="td_zxy02">
						<s:textfield  name="body.dj" readonly="true" cssClass="input" id="dzyhdj"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">金 额(元)：</td>
					<td class="td_zxy02">
						<s:textfield name="body.je" readonly="true" id="je" readonly="true" cssClass="input"/>
					</td>
					<td class="td_zxy01">所属账管：</td>
					<td class="td_zxy02">
						<s:textfield  name="body.sszg" cssClass="input" id="sszg"/>
					</td>
				</tr>
				
				<!-- computerInfo -->
				<tr id="cmpInfo1" style="display: none">
					<td class="td_zxy01">内存：</td>                                               
					<td class="td_zxy02">                                                          
						<s:textfield name="body.memory" readonly="true" cssClass="input" id="memory"/>
					</td>                                                                          
					<td class="td_zxy01">硬盘：</td>                                               
					<td class="td_zxy02">                                                          
						<s:textfield name="body.disk" readonly="true" id="disk" cssClass="input"/>     
					</td>
				</tr> 
				<tr id="cmpInfo2" style="display: none">                                                                         
					<td class="td_zxy01">内置硬盘：</td>                                               
					<td class="td_zxy02">                                                          
						<s:textfield  name="body.memory" readonly="true" id="memory" cssClass="input"/>
					</td>                                                                          
					<td class="td_zxy01">cpu型号：</td>                                               
					<td class="td_zxy02">                                                          
						<s:textfield name="body.cpuxh" readonly="true" id="cpuxh" cssClass="input"/>     
					</td>
				</tr> 
				<tr id="cmpInfo3" style="display: none"> 
					<td class="td_zxy01">系统显示器：</td>                                               
					<td class="td_zxy02">                                                          
						<s:textfield  name="body.xtxsq" readonly="true" id="xtxsq" cssClass="input"/>
					</td> 
					<td class="td_zxy01">&nbsp;</td>                                               
					<td class="td_zxy02">&nbsp;</td>
				</tr>
				<tr>
					<td class="td_zxy01">备注：</td>                                               
					<td class="td_zxy02" colspan="3" style="width:100%">                                                          
						<s:textfield name="body.bz1" readonly="true" id="bz1" cssClass="input"/>     
					</td>                                                                          
				</tr>                                                                               
			</table>
		</s:form>
	</body>
</html>