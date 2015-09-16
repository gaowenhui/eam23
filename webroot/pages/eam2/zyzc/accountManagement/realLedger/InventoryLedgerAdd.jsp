<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@ page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>

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
				myform.action="<%=request.getContextPath()%>/zyzc/ZCBookManage_saveBody.do";
				$("#myform").submit();
				window.opener.query();
				window.close();
			}
			
		</script>
	</head>
	<base target="_self"/>
	<body>
		<s:form method="post" id="myform">
			<% ZyKctz zyKctz = (ZyKctz)request.getAttribute("zyKctz");%>
			<s:hidden name="zyKctz.kctzId" id="kctzId"></s:hidden>
			<s:hidden name="zyKctz.zcId" id="zcId"></s:hidden>
			<s:hidden name="sheettype" id="sheettype" value="zcBook"></s:hidden>
			<table class="newtable"  width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td class="td_zxy01">日期：</td>
					<td class="td_zxy02">
						<s:textfield name="zyKctz.rq" id="rq" cssClass="input" value="%{#session.zyKctz.rq}"/>
					</td>
					<td class="td_zxy01">入库数量：</td>
					<td class="td_zxy02">
						<s:textfield name="zyKctz.rksl" id="rksl" cssClass="input" value="%{#session.zyKctz.rksl}"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">出库数量：</td>
					<td class="td_zxy02">
						<s:textfield name="zyKctz.cksl" id="cksl" cssClass="input" value="%{#session.zyKctz.cksl}"/>
					</td>
					<td class="td_zxy01">库存数量：</td>
					<td class="td_zxy02">
						<s:textfield name="zyKctz.kcsl" id="kcsl" cssClass="input" value="%{#session.zyKctz.kcsl}"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">领用部门名称：</td>
					<td class="td_zxy02">
						<s:hidden name="zyKctz.lybmbm"/>
						<s:textfield name="zyKctz.lybmmc" id="lybmmc" cssClass="input" value="%{#session.zyKctz.lybmmc}"/>
					</td>
					<td class="td_zxy01">借用部门名称：</td>
					<td class="td_zxy02">
						<s:hidden name="zyKctz.jybmbm"/>
						<s:textfield name="zyKctz.jybmmc" id="jybmmc" cssClass="input" value="%{#session.zyKctz.jybmmc}"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">领用借用人名称：</td>
					<td class="td_zxy02">
						<s:hidden name="zyKctz.lyrbh"/>
						<s:textfield name="zyKctz.lyrmc" id="lyrmc" cssClass="input" value="%{#session.zyKctz.lyrmc}"/>
					</td>
					<td class="td_zxy01">领用日期：</td>
					<td class="td_zxy02">
						<s:textfield name="zyKctz.lyrq" id="lyrq" cssClass="input" value="%{#session.zyKctz.lyrq}"/>
					</td>
					
				</tr>
				<tr>
					<td class="td_zxy01">借用到期日期：</td>
					<td class="td_zxy02">
						<s:textfield name="zyKctz.jydqrq" id="jydqrq" cssClass="input" value="%{#session.zyKctz.jydqrq}"/>
					</td>
					<td class="td_zxy01">变动原因：</td>
					<td class="td_zxy02">
						<s:textfield name="zyKctz.bdyy" id="bdyy" cssClass="input" value="%{#session.zyKctz.bdyy}"/>
					</td>
					
				</tr>
				<tr>
					<td class="td_zxy01">单据类型：</td>
					<td class="td_zxy02">
						<s:hidden name="zyKctz.djh"/>
						<s:textfield name="zyKctz.djlx" id="djlx" cssClass="input" value="%{#session.zyKctz.djlx}"/>
					</td>
					<td class="td_zxy01">归还时间：</td>
					<td class="td_zxy02">
						<s:hidden name="zyKctz.ghbh"/>
						<s:textfield name="zyKctz.ghsj" id="ghsj" cssClass="input" value="%{#session.zyKctz.ghsj}"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">是否最新记录：</td>
					<td class="td_zxy02">
						<s:textfield name="zyKctz.sfzxjl" id="sfzxjl" cssClass="input" value="%{#session.zyKctz.sfzxjl}"/>
					</td>
					<td class="td_zxy01">台账状态：</td>
					<td class="td_zxy02">
						<s:textfield name="zyKctz.tzzt" id="tzzt" cssClass="input" value="%{#session.zyKctz.tzzt}"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">备注：</td>
					<td class="td_zxy02" colspan="3">
						<s:textarea name="zyKctz.bz" id="bz" rows="4" cssClass="area" value="%{#session.zyKctz.bz}"></s:textarea>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="td_zxy01" style="text-align:right">
						<input type="button" value="提交" onClick="saveBody()"/>
						<s:reset label="重置"></s:reset>
					</td>
				</tr>
			</table>
		</s:form>
	</body>
</html>