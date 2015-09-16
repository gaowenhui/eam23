<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@ page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>资产详细</title>
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
			function close(){
				window.close();
			}
		</script>
	</head>
	<base target="_self"/>
	<body>
		<s:form action="InStockBody_saveBody.do" method="post" id="myform">
			<s:hidden name="body.kctzId" id="kctzId"></s:hidden>
			<s:hidden name="body.zcId" id="zcId"></s:hidden>
			<s:hidden name="sheettype" id="sheettype" value="personal_comsuming"></s:hidden>
			<table class="newtable"  width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td class="td_zxy01">日期：</td>
					<td class="td_zxy02">
						<s:textfield name="body.rq" id="rq" cssClass="input" value="%{#request.body.rq}"/>
					</td>
					<td class="td_zxy01">入库数量：</td>
					<td class="td_zxy02">
						<s:textfield name="body.rksl" id="rksl" cssClass="input" value="%{#request.body.rksl}"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">出库数量：</td>
					<td class="td_zxy02">
						<s:textfield name="body.cksl" id="cksl" cssClass="input" value="%{#request.body.cksl}"/>
					</td>
					<td class="td_zxy01">库存数量：</td>
					<td class="td_zxy02">
						<s:textfield name="body.kcsl" id="kcsl" cssClass="input" value="%{#request.body.kcsl}"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">领用部门名称：</td>
					<td class="td_zxy02">
						<s:hidden name="body.lybmbm"/>
						<s:textfield name="body.lybmmc" id="lybmmc" cssClass="input" value="%{#request.body.lybmmc}"/>
					</td>
					<td class="td_zxy01">借用部门名称：</td>
					<td class="td_zxy02">
						<s:hidden name="body.jybmbm"/>
						<s:textfield name="body.jybmmc" id="jybmmc" cssClass="input" value="%{#request.body.jybmmc}"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">领用借用人名称：</td>
					<td class="td_zxy02">
						<s:hidden name="body.lyrbh"/>
						<s:textfield name="body.lyrmc" id="lyrmc" cssClass="input" value="%{#request.body.lyrmc}"/>
					</td>
					<td class="td_zxy01">领用日期：</td>
					<td class="td_zxy02">
						<s:textfield name="body.lyrq" id="lyrq" cssClass="input" value="%{#request.body.lyrq}"/>
					</td>
					
				</tr>
				<tr>
					<td class="td_zxy01">借用到期日期：</td>
					<td class="td_zxy02">
						<s:textfield name="body.jydqrq" id="jydqrq" cssClass="input" value="%{#request.body.jydqrq}"/>
					</td>
					<td class="td_zxy01">变动原因：</td>
					<td class="td_zxy02">
						<s:textfield name="body.bdyy" id="bdyy" cssClass="input" value="%{#request.body.bdyy}"/>
					</td>
					
				</tr>
				<tr>
					<td class="td_zxy01">单据类型：</td>
					<td class="td_zxy02">
						<s:hidden name="body.djh"/>
						<s:textfield name="body.djlx" id="djlx" cssClass="input" value="%{#request.body.djlx}"/>
					</td>
					<td class="td_zxy01">归还时间：</td>
					<td class="td_zxy02">
						<s:hidden name="body.ghbh"/>
						<s:textfield name="body.ghsj" id="ghsj" cssClass="input" value="%{#request.body.ghsj}"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">是否最新记录：</td>
					<td class="td_zxy02">
						<s:textfield name="body.sfzxjl" id="sfzxjl" cssClass="input" value="%{#request.body.sfzxjl}"/>
					</td>
					<td class="td_zxy01">台账状态：</td>
					<td class="td_zxy02">
						<s:textfield name="body.tzzt" id="tzzt" cssClass="input" value="%{#request.body.tzzt}"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">备注：</td>
					<td class="td_zxy02" colspan="3">
						<s:textarea name="body.bz" id="bz" rows="4" cssClass="area" value="%{#request.body.bz}"></s:textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="td_zxy01" style="text-align:right">
						<input type="button" value="关闭" onclick="close()"/>
					</td>
				</tr>

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