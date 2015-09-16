<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.tansun.eam2.common.model.orm.bo.CzStcztz"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/inc/word.inc"%>
<%
	CzStcztz head = (CzStcztz)request.getAttribute("head");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<base href="<%=basePath %>" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<title>实体整体处置</title>
		<script type="text/javascript">
			var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";
			$(function(){
				if($("#CCzfs").val() == '2'){
					$("#jydx,#jydxLable").show();
				}else{
					$("#jydx,#jydxLable").hide();
				}
				if($("#stywyxzc").val() == '有'){
					$("#aaa,#bbb").show();
				}else{
					$("#aaa,#bbb").hide();
				}
				
				jQuery("#blyj_reason_list").setGridWidth($("#widthRule").width());
				jQuery("#file_list").setGridWidth($("#widthRule").width());
				jQuery("#file_hgsc_endlist").setGridWidth($("#widthRule").width());
				$(window).bind('resize', function(){
					jQuery("#blyj_reason_list").setGridWidth($("#widthRule").width());
					jQuery("#file_list").setGridWidth($("#widthRule").width());
					jQuery("#file_hgsc_endlist").setGridWidth($("#widthRule").width());
				});
				
				//查看处置报告
				var buttonStr_stztcz = '[{"buttonHandler":"viewzhengwen","buttonIcon":"icon-viewFile","buttonText":"查看处置报告"}]';
				addButtons($("#stInfoButton"),buttonStr_stztcz);

				<%
					if(head != null && StringUtils.isNotEmpty(head.getScfaxxid())){
				%>
					var expensesStr = '[{"buttonHandler":"viewHistoryYj(&quot;<%=head.getScfaxxid() %>&quot;)","buttonIcon":"icon-search","buttonText":"合规性审查"}]';
					appendButtons($("#stInfoButton"),expensesStr);
				<%}%>
			});
			
			function viewHistoryYj(id){
				window.open("<%=basePath %>zccz/bldAction_openAdvice.do?"
					+ "head.id=" + id
					,"",winOpenStr);
			}
//查看处置报告
			function viewzhengwen(){
				wordTemplate('bank_Template', document.getElementById("myform"),true,false,"资产处置报告"); 
			}
			
			
	//	function qicaoClbg(readonly){
    //   		wordTemplate("bank_Template", document.getElementById("myForm"),readonly,true, "处置报告"); 
    //   		return false;
	//	}
		</script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<s:form id="myForm">
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
		<br/>
		<div align="center">
			<span class="STYLE7 STYLE1">中国建银投资有限责任公司实体整体处置方案审批处理单</span>
		</div>
		<br/>
		<hr color="#6600CC" align="center" width="100%" />
		<table class="newtable" id="widthRule" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>处置项目名称：</td>
				<td class="td_zxy02" colspan="3">
					<r:textfield cssClass="input2" id="czxmmc" name="head.czxmmc" required="true"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01" align="center">编号：</td>
				<td class="td_zxy02">
					<r:textfield cssClass="input" id="bianhao" name="head.bianhao" readonly="true"/>
				</td>
				<td class="td_zxy01">急缓程度：</td>
				<td class="td_zxy02">
					<r:select cssClass="input" id="jhcd" name="head.jhcd" list="#{'0':'一般','1':'急','2':'特急'}" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01" align="center">拟稿日期：</td>
				<td class="td_zxy02">
					<s:date name="head.ngrq" format="yyyy-MM-dd" var="draftDate"/>
					<s:textfield cssClass="input" id="ngrq" name="head.ngrq" value="%{#draftDate}" readonly="true"/>
				</td>
				<td class="td_zxy01" align="center">拟稿部门：</td>
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
					<r:textfield cssClass="input" id="lxdh" name="head.lxdh"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">处置方式：</td>
				<td class="td_zxy02">
					<e:select onchange="changeJydx()" cssClass="input" list="#{}" parRefKey="ENTITY_DISPOSE_METHOD" id="CCzfs" name="head.CCzfs" />
				</td>
				<td class="td_zxy01">
						处置申报方式：
				</td>
				<td class="td_zxy02">
					<r:select cssClass="input" id="czsbfs" name="head.czsbfs" list="#{'0':'首次','1':'重报','2':'变更'}" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">
					<font color="#FF0000"><strong>*</strong></font>有无人员：
				</td>
				<td class="td_zxy02">
					<r:select list="{'有','无'}" name="head.stywry" id="stywry" cssClass="input" />
				</td>
				<td class="td_zxy01">
					<label id="jydxLable"><font color="#FF0000"><strong>*</strong></font>交易对象：</label>
				</td>
				<td class="td_zxy02">
					<r:textfield name="head.jydx" id="jydx" cssClass="input"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">实体有无有效资产：</td>
				<td class="td_zxy02">
					<r:select onchange="stywyxzcChange()" cssClass="input" id="stywyxzc" name="head.stywyxzc" list="{'无','有'}" />
				</td>
				<td class="td_zxy01">是否上会：</td>
				<td class="td_zxy02">
					<r:select id="sfsh" cssClass="input" name="head.sfsh" list="{'是','否'}" />
				</td>
			</tr>
			<tr id="bbb">
				<td class="td_zxy01">资产评估值(万元)：</td>
				<td class="td_zxy02" colspan="3">
					<s:hidden name="head.zcpgz" id="zcpgz" />
					<s:textfield id="zcpgzWY" cssClass="input" value="%{#head.zcpgz/10000}"/>
				</td>
			</tr>
			<tr id="aaa">
				<td class="td_zxy01">实体评估值(万元)：</td>
				<td class="td_zxy02">
					<s:hidden name="head.stpgz" id="stpgz" />
					<s:textfield id="stpgzWY" cssClass="input" value="%{#head.stpgz/10000}" readonly="true"/>
				</td>
				<td class="td_zxy01">评估机构：</td>
				<td class="td_zxy02">
					<r:textfield name="head.pgjg" id="pgjg" cssClass="input" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">重报次数：</td>
				<td class="td_zxy02">
					<r:textfield name="head.cbcs" id="cbcs" cssClass="input" />
				</td>
				<td class="td_zxy01">&nbsp;</td>
				<td class="td_zxy02">&nbsp;</td>
			</tr>
			<tr>
	    		<td class="td_zxy01">申报日期：</td>
	    		<td class="td_zxy02">
	    			<s:textfield cssClass="input" id="sbrq" name="head.sbrq" readonly="true"/>
	    		</td>
	    		<td class="td_zxy01">受理序号：</td>
	    		<td class="td_zxy02">
	    			<s:textfield id="slxh" name="head.slxh" cssClass="input" readonly="true"/>
	    		</td>
	    	</tr>
		
	<%@ include file="/inc/according.inc"%>  
	<e:opinion id="test" width="100%">
		<e:opinionPart viewArea="false" biaodanid="%{#request.biaodanid}" id="LEADER" name="LEADER" value="" text="批示意见："></e:opinionPart>
		<e:opinionPart viewArea="false" biaodanid="%{#request.biaodanid}" id="OPERATION_GROUP" name="OPERATION_GROUP" value="" text="业务运营组意见："></e:opinionPart>
		<e:opinionPart viewArea="false" biaodanid="%{#request.biaodanid}" id="DRAFT_DEPT" name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
		<e:opinionPart viewArea="false" id="CHECK" biaodanid="%{#request.biaodanid}"  name="CHECK" value="" text="合规审查意见："></e:opinionPart>
	</e:opinion>
	<%@ include file="/inc/file.inc"%>
			<%@ include file="/inc/file_heguishencha_end.inc"%>
			<br>
		<%@ include file="/inc/exportExcel.inc"%>
		</table>
	</s:form>
	</body>
</html>