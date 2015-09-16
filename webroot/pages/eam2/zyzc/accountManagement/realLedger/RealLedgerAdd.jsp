<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@ page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	ZyKctz zyKctz = (ZyKctz)request.getAttribute("zyKctz");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>资产台账</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript">
			$(function(){
				$("#rq,#lyrq,#jydqrq,#ghsj").datebox({
			    	formatter:function(date){
			    		return formatDate(date);
			    	}
				});
				
			});
			function saveBody(){
				document.myform.action="<%=basePath%>zyzc/ZCBookManage_saveBody.do";
				document.myform.submit();
				//window.returnValue = 123;
			}
		</script>
	</head>
	<base target="_self"/>
	<body>
		<s:form action="InStockBody_saveBody.do" method="post" id="myform">
			<s:hidden name="zyKctz.kctzId" id="kctzId"></s:hidden>
			<s:hidden name="zyKctz.zcId" id="zcId"></s:hidden>
			<s:hidden name="sheettype" id="sheettype" value="zcBook"></s:hidden>
			<table class="newtable"  width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td class="td_zxy01">日期：</td>
					<td class="td_zxy02">
						<s:textfield name="zyKctz.rq" id="rq" cssClass="input" value="%{#request.zyKctz.rq}"/>
					</td>
					<td class="td_zxy01">入库数量：</td>
					<td class="td_zxy02">
						<s:textfield name="zyKctz.rksl" id="rksl" cssClass="input" value="%{#request.zyKctz.rksl}"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">出库数量：</td>
					<td class="td_zxy02">
						<s:textfield name="zyKctz.cksl" id="cksl" cssClass="input" value="%{#request.zyKctz.cksl}"/>
					</td>
					<td class="td_zxy01">库存数量：</td>
					<td class="td_zxy02">
						<s:textfield name="zyKctz.kcsl" id="kcsl" cssClass="input" value="%{#request.zyKctz.kcsl}"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">领用部门名称：</td>
					<td class="td_zxy02">
						<s:hidden name="zyKctz.lybmbm"/>
						<s:textfield name="zyKctz.lybmmc" id="lybmmc" cssClass="input" value="%{#request.zyKctz.lybmmc}"/>
					</td>
					<td class="td_zxy01">借用部门名称：</td>
					<td class="td_zxy02">
						<s:hidden name="zyKctz.jybmbm"/>
						<s:textfield name="zyKctz.jybmmc" id="jybmmc" cssClass="input" value="%{#request.zyKctz.jybmmc}"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">领用借用人名称：</td>
					<td class="td_zxy02">
						<s:hidden name="zyKctz.lyrbh"/>
						<s:textfield name="zyKctz.lyrmc" id="lyrmc" cssClass="input" value="%{#request.zyKctz.lyrmc}"/>
					</td>
					<td class="td_zxy01">领用日期：</td>
					<td class="td_zxy02">
						<s:textfield name="zyKctz.lyrq" id="lyrq" cssClass="input" value="%{#request.zyKctz.lyrq}"/>
					</td>
					
				</tr>
				<tr>
					<td class="td_zxy01">借用到期日期：</td>
					<td class="td_zxy02">
						<s:textfield name="zyKctz.jydqrq" id="jydqrq" cssClass="input" value="%{#request.zyKctz.jydqrq}"/>
					</td>
					<td class="td_zxy01">变动原因：</td>
					<td class="td_zxy02">
						<s:textfield name="zyKctz.bdyy" id="bdyy" cssClass="input" value="%{#request.zyKctz.bdyy}"/>
					</td>
					
				</tr>
				<tr>
					<td class="td_zxy01">单据类型：</td>
					<td class="td_zxy02">
						<s:hidden name="zyKctz.djh"/>
						<s:textfield name="zyKctz.djlx" id="djlx" cssClass="input" value="%{#request.zyKctz.djlx}"/>
					</td>
					<td class="td_zxy01">归还时间：</td>
					<td class="td_zxy02">
						<s:hidden name="zyKctz.ghbh"/>
						<s:textfield name="zyKctz.ghsj" id="ghsj" cssClass="input" value="%{#request.zyKctz.ghsj}"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">是否最新记录：</td>
					<td class="td_zxy02">
						<s:textfield name="zyKctz.sfzxjl" id="sfzxjl" cssClass="input" value="%{#request.zyKctz.sfzxjl}"/>
					</td>
					<td class="td_zxy01">台账状态：</td>
					<td class="td_zxy02">
						<s:textfield name="zyKctz.tzzt" id="tzzt" cssClass="input" value="%{#request.zyKctz.tzzt}"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">备注：</td>
					<td class="td_zxy02" colspan="3">
						<s:textarea name="zyKctz.bz" id="bz" rows="4" cssClass="area" value="%{#request.zyKctz.bz}"></s:textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="td_zxy01" style="text-align:right">
						<input type="button" value="提交" onclick="saveBody()"/>
						<s:reset label="重置"></s:reset>
					</td>
				</tr>
				<!--  
				<tr>
					<td class="td_zxy01">备注:<input type="text" name="zyKctz.rksl" value="<%=zyKctz==null?"":zyKctz.getRksl()==null?"":zyKctz.getRksl() %>"/></td>
					<td class="td_zxy01">规格:<input type="text" name="zyKctz.cksl" value="<%=zyKctz==null?"":zyKctz.getCksl()==null?"":zyKctz.getCksl() %>"/></td>
				</tr>
				-->
			</table>
		</s:form>
	</body>
</html>
<script language ="JavaScript">
	if('<%=request.getAttribute("savebody")%>' != "null") {
		window.opener.addAsset();
		window.close();
	}
</script>