<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.tansun.eam2.common.model.orm.bo.CzStcztz"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/inc/word.inc"%>
<%
    CzStcztz myHead = (CzStcztz)request.getAttribute("head");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<base href="<%=basePath%>" />
		<title>人员安置</title>
		<script type="text/javascript">
		var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";
		$(function(){
			jQuery("#blyj_reason_list").setGridWidth($("#conditions").width());
			jQuery("#file_list").setGridWidth($("#conditions").width());
			jQuery("#file_hgsc_endlist").setGridWidth($("#conditions").width());
			$(window).bind('resize', function(){
				jQuery("#blyj_reason_list").setGridWidth($("#conditions").width());
				jQuery("#file_list").setGridWidth($("#conditions").width());
				jQuery("#file_hgsc_endlist").setGridWidth($("#conditions").width());
			});
			//查看处置报告
			var buttonStr_stztcz = '[{"buttonHandler":"qicaoClbg(true)","buttonIcon":"icon-viewFile","buttonText":"查看处置报告"}]';
			addButtons($("#stInfoButton"),buttonStr_stztcz);
										
			//合规性审查
			<%
				if(myHead != null && StringUtils.isNotEmpty(myHead.getScfaxxid())){
			%>
				var expensesStr = '[{"buttonHandler":"viewHistoryYj(&quot;<%=myHead.getScfaxxid() %>&quot;)","buttonIcon":"icon-search","buttonText":"合规性审查"}]';
				appendButtons($("#stInfoButton"),expensesStr);
			<%}%>
			
			$(":checkbox").attr("disabled","disabled");
			$(":radio").attr("disabled","disabled");
			$(":text").attr("readonly","readonly");
			$("textarea").attr("readonly","readonly");
			$("select").attr("disabled","disabled");
		});
					
		function viewHistoryYj(id){
			window.open("<%=basePath %>zccz/bldAction_openAdvice.do?"
				+ "head.id=" + id
				,"",winOpenStr);
		}
		//查看处置报告
		function qicaoClbg(readonly){
       		wordTemplate("bank_Template", document.getElementById("myForm"),readonly,true, "处置报告"); 
       		return false;
		}
		
	</script>
	</head>
	<s:form id="myForm">
	<body>
		<div class="panel-header" style="width: 100%;">
			<div class="panel-title">&nbsp;</div>
			<div class="panel-tool" id="stInfoButton"></div>
		</div>
		<!-- 意见域、 依据和文件上传需要表单id -->
		<s:set name="biaodanid" value="head.Id" />
		<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
		<r:depthidden name="deptid" id="deptid"/>
		<r:userhidden id="userid" name="userid"/>
		<!-- 意见域、 依据和文件上传需要表单id -->
		<br/>
		<div align="center">
			<span class="STYLE7 STYLE1">中国建银投资有限责任公司实体人员安置审批处理单</span>
		</div>
		<hr/>
		<table width="100%" id="conditions" class="newtable" border="0" cellpadding="2" cellspacing="0" align="center">
			<tr>
				<td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>处置项目名称：</td>
				<td class="td_zxy02" colspan="3">
					<r:textfield cssClass="input2" id="czxmmc" name="head.czxmmc" required="true"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>呈送：</td>
				<td colspan="3" class="td_zxy02">
					<r:textfield cssClass="input2" id="chengsong" name="head.chengsong"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">编号：</td>
				<td class="td_zxy02">
					<s:textfield cssClass="input" id="bianhao" name="head.bianhao" readonly="true"/>
				</td>
				<td class="td_zxy01">急缓程度：</td>
				<td class="td_zxy02">
					<r:select id="jhcd" name="head.jhcd" cssClass="input" list="#{'0':'一般','1':'急','2':'特急'}" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">拟稿日期：</td>
				<td class="td_zxy02">
					<s:date name="head.ngrq" format="yyyy-MM-dd" var="draftDate"/>
					<s:textfield cssClass="input" id="ngrq" name="head.ngrq" value="%{#draftDate}" readonly="true"/>
				</td>
				<td class="td_zxy01" width="120">拟稿部门：</td>
				<td class="td_zxy02">
					<s:hidden id="ngbm" name="head.ngbm" />
					<s:textfield cssClass="input" id="ngbmmc" name="head.ngbmmc" readonly="true"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">拟稿人：</td>
				<td class="td_zxy02">
					<s:hidden id="ngr" name="head.ngr"/>
					<s:textfield cssClass="input" id="ngrxm" name="head.ngrxm" readonly="true"/>
				</td>
				<td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>联系电话：</td>
				<td class="td_zxy02">
					<r:textfield cssClass="input" id="lxdh" name="head.lxdh"  />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">是否上会：</td>
				<td class="td_zxy02">
					<r:select id="sfsh" cssClass="input" name="head.sfsh" list="{'是','否'}" />
				</td>
				<td class="td_zxy01">&nbsp;</td>
				<td class="td_zxy02">&nbsp;</td>
			</tr>
			<tr>
				<td class="td_zxy01">会签部门：</td>
			    <td class="td_zxy03" colspan="3" >
			    	<r:textfield name="head.hqbm" id="hqbmvalue" readonly="true" cssClass="input2"/>
			    	<s:hidden  name="head.hqbmid" id="hqbmids"/>
		      	</td>
			</tr>
			<tr>
	    		<td class="td_zxy01">申报日期：</td>
	    		<td class="td_zxy02">
	    			<s:textfield cssClass="input" id="sbrq" name="head.sbrq" readonly="true"/>
	    		</td>
	    		<td class="td_zxy01">受理序号：</td>
	    		<td class="td_zxy02">
	    			<s:textfield id="slxh" cssClass="input" name="head.slxh" readonly="true"/>
	    		</td>
	    	</tr>
		<%@ include file="/inc/according.inc"%>  
		<e:opinion id="test" width="100%">
			<e:opinionPart viewArea="false" biaodanid="%{#request.biaodanid}" id="LEADER" name="LEADER" value="" text="批示意见："></e:opinionPart>
			<e:opinionPart viewArea="false" biaodanid="%{#request.biaodanid}" id="OPERATION_GROUP" name="OPERATION_GROUP" value="" text="业务运营组意见："></e:opinionPart>
			<e:opinionPart viewArea="false" id="MEETING_DEPT" biaodanid="%{#request.biaodanid}"  name="MEETING_DEPT" value="" text="会签部门意见："></e:opinionPart>
			<e:opinionPart viewArea="false" biaodanid="%{#request.biaodanid}" id="DRAFT_DEPT" name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
			<e:opinionPart viewArea="false" id="CHECK" biaodanid="%{#request.biaodanid}"  name="CHECK" value="" text="合规审查意见："></e:opinionPart>
		</e:opinion>
		<%@ include file="/inc/file.inc"%>
			<br>
			<%@ include file="/inc/file_heguishencha_end.inc"%>
			<br>
		<%@ include file="/inc/exportExcel.inc"%>
		</table>
	
	</body>
	</s:form>
</html>
