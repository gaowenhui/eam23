<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>修改物品信息</title>
		<script type="text/javascript">
			$(function(){
				var isSaveSuccess = "<%=request.getAttribute("isSaveSuccess")%>";
				if(isSaveSuccess != null && isSaveSuccess != "null" && isSaveSuccess == "success"){
					window.opener.myform.zcId.value = $("#zcId").val();
					window.opener.displayModGoods();
					window.close();
				}
				
				$("#cbrq").datebox({
			    	formatter:function(date){
			    		return formatDate(date);
			    	}
				});
			});
			
			//当一级分类改变时触发此方法，显示出二级分类供选择
			function ejflRefresh(fl){
				$.post("<%=basePath%>zyzc/ZCQuery_ejflRefresh.do",{
					"zyZc.yjflbm" : $(fl).val()
				},function(returnStr){
					var returnObj = eval('(' + returnStr + ')');
					if(returnObj.ejfls.length>=1){
						for(var i=0; i<returnObj.ejfls.length; i++){
							$("#ejflbm").append("<option value='" + returnObj.ejfls[i].ejflbm + "'>" + returnObj.ejfls[i].ejflmc + "</option>");
						}
					}
				});
				$("#sjflbm").html("<option value='0'>--请选择--</option>");
				$("#ejflbm").html("<option value='0'>--请选择--</option>");
			}
			
			//当二级分类改变时触发此方法，显示出三级分类供选择（如果有三级分类）
			function sjflRefresh(fl){
				$.post("<%=basePath%>zyzc/ZCQuery_sjflRefresh.do",{
					"zyZc.ejflbm" : $(fl).val()
				},function(returnStr){
					var returnObj = eval('(' + returnStr + ')');
					if(returnObj.sjfls.length>=1){
						for(var i=0; i<returnObj.sjfls.length; i++){
							$("#sjflbm").append("<option value='" + returnObj.sjfls[i].sjflbm + "'>" + returnObj.sjfls[i].sjflmc + "</option>");
						}
					}
				});
				$("#sjflbm").html("<option value='0'>--请选择--</option>");
			}
		
			function getJE(){
				var sl = $("#sl").val();
				var dj = $("#dzyhdj").val();
				$("#dzyhjg").val(sl*dj);
			}
			
			function checkValues(){
				var values = new Array([4]);
				values[0] = $("#yjflbm").val();
				values[1] = $("#ejflbm").val();
				values[2] = $("#sjflbm").val();
				values[3] = $("#zcmc").val();
				values[4] = $("#gg").val();
				values[5] = $("#sl").val();
				values[6] = $("#dzyhdj").val();
				values[7] = $("#dzyhjg").val();
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
			
			function saveBody(){
				alert($("#dzyhdj").val());
				if(checkValues() == true){
					myform.action="<%=basePath%>zyzc/ZCQuery_updateZcInfoToZyZc.do?zcId="+$("#zcId").val();
					myform.submit();
				}
			}
		</script>
	</head>
	<body>
		<s:form name="myform" id="myform">
			<s:hidden name="sheettype" id="sheettype"></s:hidden>
			<s:hidden name="headId" id="headId"></s:hidden>
			<s:hidden name="bodyIds" id="bodyIds"/>
			<s:hidden name="body.sbodyId" id="bodyId"/>
			<s:hidden name="saveSuccess" id="saveSuccess"/>
			<s:hidden name="zyZc.zcId" id="zcId"/>
			<table class="newtable" width="100%" cellpadding="0" cellspacing="0">
				<tr>
					<td class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>一级分类名称：
					</td>
					<td class="td_zxy02">
						<s:select name="zyZc.yjflbm" list="%{#session.yjMap}" id="yjflbm"
						headerKey="0" headerValue="----请选择----"  onchange="ejflRefresh(this)"/>
					</td>
					<td class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>二级分类名称：
					</td>
					<td class="td_zxy02">
						<s:select name="zyZc.ejflbm" list="%{#session.ejMap}" id="ejflbm"
						 headerKey="0" headerValue="----请选择----" onchange="sjflRefresh(this)"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>三级分类名称：
					</td>
					<td class="td_zxy02">
						<s:select name="zyZc.sjflbm" list="%{#session.sjMap}" id="sjflbm"
							headerKey="0" headerValue="----请选择----" />
					</td>
					<td class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>资产名称：
					</td>
					<td class="td_zxy02">
						<s:textfield name="zyZc.zcmc"  cssClass="input" id="zcmc"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>规 格：
					</td>
					<td class="td_zxy02">
						<s:textfield name="zyZc.gg" cssClass="input" id="gg"/>
					</td>
					<td class="td_zxy01">出保日期：</td>
					<td class="td_zxy02">
						<s:textfield name="zyZc.cbrq" id="cbrq" cssClass="input"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">单 位：</td>
					<td class="td_zxy02">
						<s:select name="zyZc.jldw" headerValue=""
							list="#{'本':'本','包':'包','根':'根','打':'打','件':'件','个':'个',
							'台':'台','车':'车','辆':'辆','令':'令','把':'把','张':'张','支':'支','瓶':'瓶',
							'套':'套','只':'只','盒':'盒','桶':'桶','箱':'箱','块':'块','节':'节',
							'组':'组','50个/包':'50个/包','10个/包':'10个/包'}"/>
					</td>
					<td class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>数 量：
					</td>
					<td class="td_zxy02">
						<s:textfield name="zyZc.sl" cssClass="input" id="sl" onblur="getJE()"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>单 价(元)：
					</td>
					<td class="td_zxy02">
						<s:textfield name="zyZc.dzyhdj" cssClass="input" id="dzyhdj" onblur="getJE()"/>
					</td>
					<td class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>金 额(元)：
					</td>
					<td class="td_zxy02">
						<s:textfield name="zyZc.dzyhjg" id="dzyhjg" cssClass="input" onblur="getJE()"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">发动机编号：</td>
					<td class="td_zxy02">
						<s:textfield name="zyZc.fdjbh" cssClass="input" id="fdjbh"/>
					</td>
					<td class="td_zxy01">CPU型号：</td>
					<td class="td_zxy02">
						<s:textfield name="zyZc.cpuxh" id="cpuxh" cssClass="input"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">内存：</td>
					<td class="td_zxy02">
						<s:textfield  name="zyZc.memory" cssClass="input" id="memory"/>
					</td>
					<td class="td_zxy01">硬盘：</td>
					<td class="td_zxy02">
						<s:textfield name="zyZc.disk" id="disk" cssClass="input"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">内置硬盘：</td>
					<td class="td_zxy02">
						<s:textfield  name="zyZc.nzdisk" cssClass="input" id="nzdisk"/>
					</td>
					<td class="td_zxy01">系统显示器：</td>
					<td class="td_zxy02">
						<s:textfield name="zyZc.xtxsq" id="xtxsq" cssClass="input"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">所属账管：</td>
					<td class="td_zxy02">
						<s:textfield  name="zyZc.sszg" cssClass="input" id="sszg"/>
					</td>
					<td class="td_zxy01">&nbsp;</td>
					<td class="td_zxy02">&nbsp;</td>
				</tr>
				<tr>
					<td class="td_zxy01">备注：</td>
					<td class="td_zxy02" colspan="3">
						<r:textarea id="bz" rows="4" cssClass="area" name="zyZc.bz"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy02" colspan="4" class="td_zxy01" style="text-align:right">
						<input type="button" value="保存" onclick="saveBody();"/>
					</td>
				</tr>
			</table>
		</s:form>
	</body>
</html>