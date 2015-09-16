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
			});
		
			function refresh(data){
				if(data==1){
					document.getElementById("ejflbm").value="";
				}
				myform.action="<%=request.getContextPath()%>/zyzc/ZCManageBody_findFl.do";
				myform.submit();
			}
			
			function saveBody(){
				DateDiff();
				if(checkValues() == true){
					document.myform.submit();
				}
			}
			
			function checkValues(){
				var values = new Array();
				values[0] = $("#yjflbm").val();
				values[1] = $("#ejflbm").val();
				values[2] = $("#sjflbm").val();
				values[5] = $("#sl").val();
				values[6] = $("#sqbmmc").val();
				values[7] = $("#jylyrq").val();
				values[8] = $("#jydqrq").val();
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
						}else if(i==5){
							alert("数量不能为空！");
							return false;
						}else if(i==6){
							alert("借用部门不能为空！");
							return false;
						}else if(i==7){
							alert("借用开始日期不能为空！");
							return false;
						}else if(i==8){
							alert("借用到期日期不能为空！");
							return false;
						}
					}
				}
				return true;
			}
			
			function DateDiff(){ 
				//sDate1和sDate2是2002-12-18格式  
				sDate1 = $("#jydqrq").val();
				sDate2 = $("#jylyrq").val();
			    var aDate, oDate1, oDate2, iDays;    
			    aDate = sDate1.split("-");    
			    oDate1 = new Date(aDate[0],aDate[1]-1,aDate[2]);    
			    aDate = sDate2.split("-");    
			    oDate2 = new Date(aDate[0],aDate[1]-1,aDate[2]);    
			        
			    iDays = parseInt(Math.abs(oDate1 - oDate2) / 1000 / 60 / 60 /24);      
			    if((oDate1 - oDate2)<0){    
			        $("#jyts").val(-iDays);    
			    }else{
			    	$("#jyts").val(iDays); 
			    }   
		   }
		</script>
	</head>

	<body>
		<s:form action="zyzc/ZCManageBody_saveBody.do" name="myform" id="myform">
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
						<s:textfield name="body.yjflmc" id="yjflmc" readonly="true"/>
					</td>
					<td class="td_zxy01">
						二级分类名称：
					</td>
					<td class="td_zxy02">
						<s:textfield name="body.ejflmc" id="ejflmc" readonly="true"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						三级分类名称：
					</td>
					<td class="td_zxy02">
						<s:textfield name="body.sjflmc" id="sjflmc" readonly="true"/>
					</td>
					<td class="td_zxy01">
						数 量：
					</td>
					<td class="td_zxy02">
						<s:textfield name="body.sl" id='sl'  readonly="true"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">单 位：</td>
					<td class="td_zxy02">
							<s:select name="body.jldw" headerValue="" disabled="true" value="%{#request.body.jldw}"
							list="#{'本':'本','包':'包','根':'根','打':'打','件':'件','个':'个',
							'台':'台','车':'车','辆':'辆','令':'令','把':'把','张':'张','支':'支','瓶':'瓶',
							'套':'套','只':'只','盒':'盒','桶':'桶','箱':'箱','块':'块','节':'节',
							'组':'组','50个/包':'50个/包','10个/包':'10个/包'}"/>
					</td>
					<td class="td_zxy01">借用人：</td>
					<td class="td_zxy02">
						<s:textfield name="body.sqrmc" id='sqrmc' readonly="true"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						借用部门：
					</td>
					<td class="td_zxy02">
						<s:textfield name="body.sqbmmc" id="sqbmmc"  readonly="true"/>
					</td>
					<td class="td_zxy01">
						借用开始日期：
					</td>
					<td class="td_zxy02">
						<s:date name="body.jylyrq" var="jyrq" format="yyyy-MM-dd"/>
						<s:textfield name="body.jylyrq" id='jylyrq' value="%{#jyrq}" readonly="true"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						借用到期日期：
					</td>
					<td class="td_zxy02">
						<s:date name="body.jydqrq" var="dqrq" format="yyyy-MM-dd"/>
						<s:textfield name="body.jydqrq" id='jydqrq' value="%{#dqrq}"  readonly="true"/>
					</td>
					<td class="td_zxy01">
						借用天数：
					</td>
					<td class="td_zxy02">
						<s:textfield name="body.jyts" id='jyts' readonly="true"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">备注：</td>
					<td class="td_zxy02" colspan="3">
						<s:textarea id="bz2" rows="1" cssClass="area" name="body.bz2" readonly="true"/>
					</td>
				</tr>
			</table>
		</s:form>
	</body>
</html>