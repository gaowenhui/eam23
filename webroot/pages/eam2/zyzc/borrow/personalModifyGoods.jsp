<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String zksl = (String)request.getAttribute("zksl");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>个人申请物品属性更改</title>
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
				
				$("#jylyrq").datebox({
			    	formatter:function(date){
			    		return formatDate(date);
			    	}
				});
				
				$("#jydqrq").datebox({
			    	formatter:function(date){
			    		return formatDate(date);
			    	},
			    	onSelect:DateDiff
				});
			});
		
			function refresh(data){
				if(data==1){
					document.getElementById("ejflbm").value="";
				}
				myform.action="<%=request.getContextPath()%>/zyzc/ZCManageBody_findFl.do";
				myform.submit();
			}
			
			function checkSl(){
				var sl = $("#sl").val();
				if(parseInt($("#sl").val()) > parseInt("<%=zksl%>")){
					alert("您要借用的物品数量为："+sl+",物品的可被领用数量为："+"<%=zksl%>"+",请您修改您领用物品的数量");
					document.getElementById("sl").focus();
					return false;
				}
				return true;
			}
			
			function saveBody(){
				if(checkValues() == true){
					DateDiff();
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
			      alert("借用结束时间不能小于借用结束时间！");   
			      return;
			    }else{
			       if(iDays > 90){
			       		alert("借用时间不能大于3个月,请修改借用到期日期!");
			       		 return;
			       }else{
			       		$("#jyts").val(iDays); 
			       }
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
						<s:select name="body.yjflbm" list="%{#session.yjMap}" id="yjflbm"
						 disabled="true" value="%{#request.body.yjflbm}" onchange="refresh(1)"/>
					</td>
					<td class="td_zxy01">
						二级分类名称：
					</td>
					<td class="td_zxy02">
						<s:select name="body.ejflbm" list="%{#session.ejMap}"id="ejflbm"
						 disabled="true" value="%{#request.body.ejflbm}" onchange="refresh(2)"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						三级分类名称：
					</td>
					<td class="td_zxy02">
						<s:select name="body.sjflbm" list="%{#session.sjMap}" id="sjflbm"
						 disabled="true" value="%{#request.body.sjflbm}"/>
					</td>
					<td class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>数 量：
					</td>
					<td class="td_zxy02">
						<s:textfield name="body.sl" id='sl' />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">单 位：</td>
					<td class="td_zxy02">
							<s:select name="body.jldw" headerValue="" value="%{#request.body.jldw}"
							list="#{'本':'本','包':'包','根':'根','打':'打','件':'件','个':'个',
							'台':'台','车':'车','辆':'辆','令':'令','把':'把','张':'张','支':'支','瓶':'瓶',
							'套':'套','只':'只','盒':'盒','桶':'桶','箱':'箱','块':'块','节':'节',
							'组':'组','50个/包':'50个/包','10个/包':'10个/包'}"/>
					</td>
					<td class="td_zxy01">借用人：</td>
					<td class="td_zxy02">
						<s:textfield name="body.sqrmc" id='sqrmc'/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>借用部门：
					</td>
					<td class="td_zxy02">
						<s:textfield name="body.sqbmmc" id="sqbmmc"/>
					</td>
					<td class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>借用开始日期：
					</td>
					<td class="td_zxy02">
						<s:date name="body.jylyrq" var="jyrq" format="yyyy-MM-dd"/>
						<s:textfield name="body.jylyrq" id='jylyrq' value="%{#jyrq}"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>借用到期日期：
					</td>
					<td class="td_zxy02">
						<s:date name="body.jydqrq" var="dqrq" format="yyyy-MM-dd"/>
						<s:textfield name="body.jydqrq" id='jydqrq' value="%{#dqrq}"/>
					</td>
					<td class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>借用天数：
					</td>
					<td class="td_zxy02">
						<s:textfield name="body.jyts" id='jyts' readonly="true"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">备注：</td>
					<td class="td_zxy02" colspan="3">
						<s:textarea id="bz2" rows="1" cssClass="area" name="body.bz2"/>
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