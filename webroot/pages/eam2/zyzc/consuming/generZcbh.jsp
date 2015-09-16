<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String yjflbm = (String)request.getAttribute("yjflbm");
	String ejflbm = (String)request.getAttribute("ejflbm");
	String sjflbm = (String)request.getAttribute("sjflbm");
	String zcbhExitThisPage = (String)request.getAttribute("zcbhExitThisPage");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>资产属性更改</title>
		<script type="text/javascript">
			$(function(){
				if($("#saveSuccess").val() != "saveSuccess"){
					$.post("<%=basePath%>zyzc/ZCManageBody_generZcbhTreeMap.do",
						   {
							   "yjflbm":"<%=yjflbm%>",
							   "ejflbm":"<%=ejflbm%>",
							   "sjflbm":"<%=sjflbm%>",
							   "zcbhExitThisPage":"<%=zcbhExitThisPage%>"
						   },
						   function(returnStr){
							   	var returnObj = eval('(' + returnStr + ')');
								if(returnObj.ejfls.length>=1){
									for(var i=0; i<returnObj.ejfls.length; i++){
										$("#zcbh").append("<option value='" + returnObj.ejfls[i].zcbhKey + "'>" + returnObj.ejfls[i].zcbhValue + "</option>");
									}
								}
						   }
					);
				}
			});
			
			function checkValues(){
				var values = new Array();
				values[0] = $("#yjflbm").val();
				values[1] = $("#ejflbm").val();
				values[2] = $("#sjflbm").val();
				values[3] = $("#zcbh").val();
				for(var i=0; i < values.length; i++){
					if(values[i]== null || values[i] == "" || values[i] == 0 || values[i] == 0.0){
						if(i==0){
							alert("一级分类不能为空！");
							return false;
						}else if(i==1){
							alert("二级分类不能为空！");
							return false;
						}else if(i==2){
							alert("三级分类不能为空！");
							return false;
						}else if(i==3){
							alert("资产编号不能为空！");
							return false;
						}
					}
				}
				return true;
			}
			
			function gernerZcIdByZcbh(zcbh){
				$.post("<%=basePath%>zyzc/ZCManageBody_gernerZcIdByZcbh.do",
					   {"zcbh":""+zcbh,"bodyId":""+$("#bodyId").val()},
					   function(data){}
				);
				return true;
			}
			
			function saveBody(){
				if(checkValues() == true){
					gernerZcIdByZcbh($("#zcbh").val());
					window.opener.refreshGrid();
					window.close();
				}
			}
		</script>
	</head>

	<body>
		<script type="text/javascript">
			$.ajaxSetup({
				async : false
			});
		</script>
		<s:form action="" name="myform" id="myform">
			<s:hidden name="head.sheadId" id="sheadId"></s:hidden>
			<s:hidden name="head.sheetType"></s:hidden>
			<s:hidden name="sheettype" id="sheettype"></s:hidden>
			<s:hidden name="bodyIds" id="bodyIds"/>
			<s:hidden name="body.sbodyId" id="bodyId"/>
			<s:hidden name="saveSuccess" id="saveSuccess"/>
			<table class="newtable" width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td class="td_zxy01">
						一级分类名称：
					</td>
					<td class="td_zxy02">
						<s:select name="body.yjflbm" list="%{#session.yjMap}" id="yjflbm"
						 value="%{#request.body.yjflbm}" onchange="refresh(1)"/>
					</td>
					<td class="td_zxy01">
						二级分类名称：
					</td>
					<td class="td_zxy02">
						<s:select name="body.ejflbm" list="%{#session.ejMap}" id="ejflbm"
						 value="%{#request.body.ejflbm}" onchange="refresh(2)"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						三级分类名称：
					</td>
					<td class="td_zxy02">
						<s:select name="body.sjflbm" list="%{#session.sjMap}" id="sjflbm"
							value="%{#request.body.sjflbm}"/>
					</td>
					<td class="td_zxy01"> 
						<font color="#FF0000"><strong>*</strong></font>资产编号：
					</td>
					<td class="td_zxy02">
						<s:select name="body.zcbh" id='zcbh' list="#{}"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy02" colspan="4" class="td_zxy01" style="text-align:right">
						<input type="button" value="提交" onclick="saveBody()" />
					</td>
				</tr>
			</table>
		</s:form>
	</body>
</html>