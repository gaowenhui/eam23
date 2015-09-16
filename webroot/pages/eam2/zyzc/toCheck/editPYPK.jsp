<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>盘盈盘亏批量修改</title>
		<script type="text/javascript">
			$(function(){
				$("#cbrq").datebox({
			    	formatter:function(date){
			    		return formatDate(date);
			    	}
				});
				
				if($("#modIds").val() == null || $("#modIds").val() == ""){
					$("#myform").attr("action","<%=basePath%>zyzc/ToCheck_updateBody.do");
				}else{
					$("#myform").attr("action","<%=basePath%>zyzc/ToCheck_batUpdateBody.do");
				}
				
				if($("#saveSuccess").val() == "saveSuccess"){
					window.opener.query();
					window.close();
				}
			});
		
			function saveBody(){
				document.myform.submit();
			}
		</script>
	</head>

	<body>
		<s:form name="myform" id="myform">
			<s:hidden name="modIds" id="modIds"/>
			<s:hidden name="pdxx.id" />
			<s:hidden name="saveSuccess" id="saveSuccess"/>
			<table class="newtable" width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td class="td_zxy01">盘点数量：</td>
					<td class="td_zxy02">
					<s:textfield name="pdxx.pdsl" id="pdsl"/>
					</td>
					<td class="td_zxy01">使用人：</td>
					<td class="td_zxy02">
						<s:textfield name="pdxx.syrmc"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">使用部门：</td>
					<td class="td_zxy02">
						<s:textfield name="pdxx.sybmbmc"/>
					</td>
					<td class="td_zxy01">存放地点：</td>
					<td class="td_zxy02">
						<s:textfield name="pdxx.cfdd"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">盘点结果：</td>
					<td class="td_zxy02">
						<s:select name="pdxx.pdjg" list="#{'盘盈':'盘盈','盘亏':'盘亏','盘平':'盘平'}"	
						 headerValue="" value="%{#request.pdxx.pdjg}" id="pdjg"/>
					</td>
					<td class="td_zxy01">&nbsp;</td>
					<td class="td_zxy02">&nbsp;</td>
				</tr>
				<tr>
					<td class="td_zxy02" colspan="4" class="td_zxy01" style="text-align: right">
						<input type="button" value="提交" onclick="saveBody()" />
						<s:reset value="重置"></s:reset>
					</td>
				</tr>
			</table>
		</s:form>
	</body>
</html>