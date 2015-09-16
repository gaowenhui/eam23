<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/kpgl/checkJS.inc"%>
<%
	String gridIndex = request.getParameter("gridIndex");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>编辑评估信息</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<script type="text/javascript">
			$(function(){
			//	$("#pingguzhiwy").val(new Number($("#pingguzhi").val()) / 10000);
			//	$("#jzrzmjzwy").val(new Number($("#jzrzmjz").val()) / 10000);
				$("#myForm").ajaxForm({
					success : function(responseText, statusText, xhr, $form){
						if(responseText == "SUCCESS"){
							window.opener.reloadMessage("<%=gridIndex %>");
							window.close();
						}else{
							$("#pingguzhi").val(new Number($("#pingguzhi").val()));
							$("#jzrzmjz").val(new Number($("#jzrzmjz").val()));
							alert("保存失败,请联系管理员!");
						}
					}
				});
				var submitButton = '[{"buttonHandler":"submitForm","buttonIcon":"icon-ok","buttonText":"保存"}]';
				addButtons($("#headButton"),submitButton);
			});
			
			
			function check(){
				var str = true;
				if($.trim($("#pgff").val()) == ""){
					alert("请输入评估方法");
					str = false;
					return str;
				}
				if($.trim($("#pingguzhi").val()) == ""){
					alert("请输入评估值");
					str = false;
					return str;
				}
				if($.trim($("#CCzfs").val()) == ""){
					alert("请输入处置方式");
					str = false;
					return str;
				}
				if($.trim($("#CJzlx").val()) == ""){
					alert("请输入价值类型");
					str = false;
					return str;
				}
				if($.trim($("#jzrzmjz").val()) == ""){
					alert("请输入评估基准日账面价值");
					str = false;
					return str;
				}
				return str;	
			}
			
			function submitForm(){
				if(check()){
					//$("#pingguzhi").val(new Number($("#pingguzhiwy").val()) * 10000);
					//$("#jzrzmjz").val(new Number($("#jzrzmjzwy").val()) * 10000);
					$("#myForm").submit();
				}
			}
		</script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<s:form action="zccz/dealEvalBody_submitPgxx.do" id="myForm">
			<s:hidden id="id" name="cpl.id" />
			<s:hidden id="czpgscclid" name="cpl.czpgscclid" />
			<div class="panel-header" style="width: 100%;">
				<div class="panel-title">编辑评估信息</div>
				<div id="headButton" class="panel-tool"></div>
			</div>
			<table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" class="newtable">
				<tr>
					<td class="td_zxy01">评估方法：
					<font color="#FF0000"><strong>* </strong></font> 
					</td>
					<td class="td_zxy02">
						<e:select cssClass="input" id="pgff" name="cpl.pgff" list="#{}" parRefKey="ESTIMATE_METHOD" headerKey="" headerValue="请选择" />
					</td>	
					<td class="td_zxy01">评估值（元）：
					<font color="#FF0000"><strong>* </strong></font>
					</td>
					<td class="td_zxy02">
						<r:textfield cssClass="input" id="pingguzhi" name="cpl.pingguzhi" onblur="checkFloat(this);"/>
					</td>			
				</tr>
				<tr>
					<td class="td_zxy01">处置方式：
					<font color="#FF0000"><strong>* </strong></font>
					</td>
					<td class="td_zxy02">
						<e:select cssClass="input" list="#{}" parRefKey="ASSET_DISPOSE_METHOD" headerKey="" headerValue="请选择" id="CCzfs" name="cpl.CCzfs" />
					</td>
					<td class="td_zxy01">价值类型：
					<font color="#FF0000"><strong>* </strong></font>
					</td>
					<td class="td_zxy02">
						<e:select cssClass="input" list="#{}" parRefKey="ESTIMATE_VALUE_TYPE" headerKey="" headerValue="请选择" id="CJzlx" name="cpl.CJzlx" />
					</td>	
				</tr>
				<tr>
					<td class="td_zxy01" align="center">评估基准日账面价值（元）（账面原值-累计折旧-减值准备，即账面净额）：
					<font color="#FF0000"><strong>* </strong></font>
					</td>
					<td class="td_zxy02">
						<r:textfield cssClass="input" id="jzrzmjz" name="cpl.jzrzmjz" onblur="checkFloat(this);"/>
					</td>
					<td class="td_zxy01">&nbsp;</td>
					<td class="td_zxy02">&nbsp;</td>
				</tr>
				<tr>
					<td class="td_zxy01" align="center">备注：</td>
					<td class="td_zxy03" colspan="3">
						<r:textarea cssClass="input2" rows="4" id="beizhu" name="cpl.beizhu" />
					</td>
				</tr>
			</table>
		</s:form>
	</body>
</html>
