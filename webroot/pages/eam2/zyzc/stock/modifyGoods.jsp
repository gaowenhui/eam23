<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>物品属性更改</title>
		<script type="text/javascript">
			$(function(){
				if($("#bodyIds").val() == null || $("#bodyIds").val() == ""){
					$("#myform").attr("action","<%=basePath%>zyzc/ZCManageBody_updateBody.do");
				}else{
					$("#myform").attr("action","<%=basePath%>zyzc/ZCManageBody_batUpdateBody.do");
				}
				
				if($("#saveSuccess").val() == "saveSuccess"){
					window.opener.refreshGrid();
					window.close();
				}
				
				$("#cbrq").datebox({
			    	formatter:function(date){
			    		return formatDate(date);
			    	}
				});
				
				if($("#yjflbm").val() == '1'){
					$("#comput1").attr("style","display:block;");
					$("#comput2").attr("style","display:block;");
					$("#comput3").attr("style","display:block;");
					$("#comput4").attr("style","display:none;");
				}else{
					$("#comput1").attr("style","display:none;");
					$("#comput2").attr("style","display:none;");
					$("#comput3").attr("style","display:none;");
					$("#comput4").attr("style","display:block;");
				}
			});
			
			function getJE(){
				var sl = $("#sl").val();
				var dj = $("#dj").val();
				$("#je").val(sl*dj);
			}
			
			function checkValues(){
				var values = new Array();
				values[0] = $("#yjflbm").val();
				values[1] = $("#ejflbm").val();
				values[2] = $("#sjflbm").val();
				values[3] = $("#zcmc").val();
				values[4] = $("#gg").val();
				values[5] = $("#sl").val();
				values[6] = $("#dj").val();
				values[7] = $("#je").val();
				for(var i=0; i < values.length; i++){
					if(values[i]== null || values[i] == "" || values[i] == 0){
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
							alert("资产名称不能为空！");
							return false;
						}else if(i==4){
							alert(values[i]);
							alert("规格不能为空！");
							return false;
						}else if(i==5){
							alert("数量不能为空！");
							return false;
						}else if(i==6){
							alert("单价不能为空！");
							return false;
						}else if(i==7){
							alert("金额不能为空！");
							return false;
						}
					}
				}
				return true;
			}
		
			function refresh(data){
				if(data==1){
					document.getElementById("ejflbm").value="";
				}
				myform.action="<%=request.getContextPath()%>/zyzc/ZCManageBody_findFl.do";
				myform.submit();
			}
			
			function saveBody(){
				if(checkValues()){
					document.myform.submit();
				}
			}
		</script>
	</head>

	<body>
		<s:form name="myform" id="myform">
			<s:hidden name="head.sheadId" id="sheadId"></s:hidden>
			<s:hidden name="head.sheetType"></s:hidden>
			<s:hidden name="sheettype" id="sheettype"></s:hidden>
			<s:hidden name="bodyIds" id="bodyIds"/>
			<s:hidden name="body.sbodyId" id="bodyId"/>
			<s:hidden name="saveSuccess" id="saveSuccess"/>
			<table class="newtable" width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>一级分类名称：
					</td>
					<td class="td_zxy02">
						<s:select name="body.yjflbm" list="%{#session.yjMap}" id="yjflbm"
						headerKey="0" headerValue="----请选择----" disabled="true" onchange="ejflRefresh(this)"/>
					</td>
					<td class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>二级分类名称：
					</td>
					<td class="td_zxy02">
						<s:select name="body.ejflbm" list="%{#session.ejMap}" id="ejflbm"
						 headerKey="0" headerValue="----请选择----" disabled="true" onchange="sjflRefresh(this)"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>三级分类名称：
					</td>
					<td class="td_zxy02">
						<s:select name="body.sjflbm" list="%{#session.sjMap}" id="sjflbm"
						 disabled="true" headerKey="0" headerValue="----请选择----" />
					</td>
					<td class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>资产名称：
					</td>
					<td class="td_zxy02">
						<s:textfield name="body.zcmc"   cssClass="input" id="zcmc"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>规 格：
					</td>
					<td class="td_zxy02">
						<s:textfield name="body.gg" id="gg" cssClass="input"/>
					</td>
					<td class="td_zxy01">供 应 商：</td>
					<td class="td_zxy02">
						<s:textfield name="body.gys" cssClass="input"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">序列号：</td>
					<td class="td_zxy02">
						<s:textfield name="body.xlh" cssClass="input" id="xlh"/>
					</td>
					<td class="td_zxy01">保修机构：</td>
					<td class="td_zxy02">
						<s:textfield name="body.bxjg" cssClass="input"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">出保日期：</td>
					<td class="td_zxy02">
						<s:date name="body.cbrq" var="chubaorq" format="yyyy-MM-dd"/>
						<s:textfield name="body.cbrq" id="cbrq" value="%{#chubaorq}" cssClass="input"/>
					</td>
					<td class="td_zxy01">单 位：</td>
					<td class="td_zxy02">
						<s:select name="body.jldw"  headerValue="" value="%{#request.body.jldw}"
							list="#{'本':'本','包':'包','根':'根','打':'打','件':'件','个':'个',
							'台':'台','车':'车','辆':'辆','令':'令','把':'把','张':'张','支':'支','瓶':'瓶',
							'套':'套','只':'只','盒':'盒','桶':'桶','箱':'箱','块':'块','节':'节',
							'组':'组','50个/包':'50个/包','10个/包':'10个/包'}"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>数 量：
					</td>
					<td class="td_zxy02">
						<s:textfield name="body.sl" cssClass="input" id="sl" onblur="getJE()"/>
					</td>
					<td class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>单 价(元)：
					</td>
					<td class="td_zxy02">
						<s:textfield  name="body.dj" cssClass="input" id="dj" onblur="getJE()"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>金 额(元)：
					</td>
					<td class="td_zxy02">
						<s:textfield name="body.je" readonly="true" id="je" cssClass="input"/>
					</td>
					<td class="td_zxy01">所属账管：</td>
					<td class="td_zxy02">
						<s:textfield  name="body.sszg" cssClass="input" id="sszg"/>
					</td>
				</tr>
				<tr style="display: none" id="comput1">
					<td class="td_zxy01">CPU型号：</td>
					<td class="td_zxy02">
						<s:textfield name="body.cpuxh" id="cpuxh" cssClass="input"/>
					</td>
					<td class="td_zxy01">内存：</td>
					<td class="td_zxy02">
						<s:textfield  name="body.memory" cssClass="input" id="memory"/>
					</td>
				</tr>
				<tr style="display: none" id="comput2">
					<td class="td_zxy01">硬盘：</td>
					<td class="td_zxy02">
						<s:textfield name="body.disk" id="disk" cssClass="input"/>
					</td>
					<td class="td_zxy01">内置硬盘：</td>
					<td class="td_zxy02">
						<s:textfield  name="body.nzdisk" cssClass="input" id="nzdisk"/>
					</td>
				</tr>
				<tr style="display: none" id="comput3">
					<td class="td_zxy01">系统显示器：</td>
					<td class="td_zxy02">
						<s:textfield name="body.xtxsq" id="xtxsq" cssClass="input"/>
					</td>
					<td class="td_zxy01">&nbsp;</td>
					<td class="td_zxy02">&nbsp;</td>
				</tr>
				<tr>
					<td class="td_zxy01">备注：</td>
					<td class="td_zxy02" colspan="3">
						<r:textarea id="bz1" rows="1" cssClass="area" name="body.bz1"/>
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