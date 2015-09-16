<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="com.tansun.eam2.common.model.orm.bo.CzCztzfaXx"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<r:controlfile file="/pages/eam2/zccz/dealTrace1/zcczCld.ctl.xml"></r:controlfile>
<%
	CzCztzfaXx disposeHead = (CzCztzfaXx)request.getAttribute("disposeHead");    
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<base href="<%=basePath %>" />
		<title>资产处置处理单</title>
	</head>
	<body>
<s:form id="myform" name="myform">
		<br /><br />
		<div align="center">
			<span class="STYLE7 STYLE1">中国建银投资有限责任公司资产处置方案审批处理单</span>
		</div>
			<hr/>
			<table width="99%" border="0" cellspacing="0" cellpadding="0" id="form">
				<tr>
					<td class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>处置项目名称：</td>
					<td class="td_form02" colspan="3">
						<s:textfield name="disposeHead.cztzxmmc" size="126" cssClass="input" readonly="true"/></td>						
				</tr>
				<tr>
				  <td height="24"  class="td_zxy01" align="center">编号：</td>
				  <td class="td_form02"><s:textfield name="disposeHead.bianhao" size="35" cssClass="input" readonly="true"/></td>
				  <td class="td_zxy01"> 急缓程度：</td>
				  <td class="td_form02"><s:select list="{'一般','急','特急'}" name="disposeHead.jhcd" disabled="true"/></td>
			  	</tr>
				<tr>
					<td height="24" class="td_zxy01" align="center">
						<font color="#FF0000"><strong>*</strong></font>拟稿日期：</td>
					<td class="td_form02">
						<s:date name="disposeHead.ngrq" format="yyyy-MM-dd" var="ngrq"/>
						<s:textfield name="disposeHead.ngrq" value="%{#ngrq}" size="35" id="ngrq" cssClass="input" readonly="true"/></td>
					<td  align="center" class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>拟稿部门：</td>
					<td  class="td_form02">
						<s:hidden name="disposeHead.ngbm" />
						<s:textfield name="disposeHead.ngbmmc" size="35" id="ngbmmc" cssClass="input" readonly="true"/></td>
				</tr>
				<tr>
					<td height="24" class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>拟稿人：</td>
					<td class="td_form02">
						<s:hidden name="disposeHead.ngr"/>
						<s:textfield name="disposeHead.ngrxm" size="35" id="ngrxm"  readonly="true" cssClass="input" readonly="true"/>
					</td>
					<td class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>联系电话：</td>
					<td class="td_form02">
						<s:textfield name="disposeHead.lxdh" id="lxdh"  size="35" cssClass="input" readonly="true"/></td>
				</tr>
				<tr>
					<td class="td_zxy01">
						<font color="#FF0000"><strong>*</strong></font>资产所在位置：</td>
					<td colspan="3"  class="td_form02">
						<s:textfield name="disposeHead.zcszwz" id="zcszwz"  size="126" cssClass="input" readonly="true"/></td>
				</tr>
				<tr>
					<td class="td_zxy01" height="24">资产权属：</td>
				    <td class="td_form02"><s:textfield name="disposeHead.zcqs" id="zcqs"  size="35" cssClass="input" readonly="true"/></td>  
					<td class="td_zxy01">
					<font color="#FF0000"><strong>*</strong></font>处置资产类别：</td>
				    <td class="td_form02">
				    <s:select list="#{0:'经营性固产',1:'实体内资产',2:'委贷抵债物'}" name="disposeHead.zclb" id="zclb" disabled="true"></s:select></td>
				</tr>
				<tr>
					<td class="td_zxy01" height="24">评估机构名称：</td>
				    <td class="td_form02" colspan="3"><s:textfield name="disposeHead.pgjgmc"  id="pgjgmc" size="126" cssClass="input" readonly="true"/></td>  
				</tr>	
				<tr>
					<td class="td_zxy01" height="24">处置方式：</td>
				    <td class="td_form02">
				    	<s:select headerValue="--请选择--" headerKey="0" list="#{}" parRefKey="ASSET_DISPOSE_METHOD" name="disposeHead.CCzfs" disabled="true"/></td> 
					<td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>建议处置回收金额（万元）：</td>
				    <td class="td_form02"><s:textfield name="disposeHead.yjczhsje" size="35" cssClass="input" readonly="true"/></td>
				</tr>	
				<tr>
					<td class="td_zxy01" height="24"><font color="#FF0000"><strong>*</strong></font>预计处置费用（元）：</td>
				    <td class="td_form02"><s:textfield name="disposeHead.yjczfy" id="yjczfy"  size="35" readonly="true" cssClass="input"><span id="expensesDetail" style="align:center;"></span></s:textfield>
				    </td>  
					<td class="td_zxy01" height="24"><font color="#FF0000"><strong>*</strong></font>预计损失金额（万元）：</td>
				    <td class="td_form02">
				    	<s:hidden name="disposeHead.yjssje" var="loseValue"/>
				    	<s:textfield name="disposeHead.yjssje" size="35"  cssClass="input" id="yjssje" value="%{#loseValue}" readonly="true"/>
				    </td>  	
				</tr>	
				<tr>
					<td class="td_zxy01">预计损失率：</td>
				    <td class="td_form02">
				    	<s:textfield name="disposeHead.yjssl" size="35"  readonly="true" cssClass="input" id="yjssl"/>
				    </td>
				    <td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>处置申报方式：</td>
		            <td class="td_form02"><s:select list="#{'':'--请选择--',0:'首次',1:'变更',2:'重报'}" name="disposeHead.czsbfs" id="czsbfs" disabled="true"></s:select></td>
				</tr>	
				<tr>
					<td class="td_zxy01" height="24">是否经过评估审查：</td>
				    <td class="td_form02">
				    <s:radio name="disposeHead.sfjpgsc"  list="#{0:'否',1:'是'}" id="sfjpgsc" disabled="true"></s:radio>
				    </td>  
					<td class="td_zxy01">评估报告失效期截止日期：</td>
			        <td class="td_form02">
			        	<s:date name="disposeHead.pgbgsxqjzrq" format="yyyy-MM-dd" var="reportDeadline"/>
						<s:textfield name="disposeHead.pgbgsxqjzrq" value="%{#reportDeadline}" id="reportDeadline" cssClass="input" readonly="true"/>
			        </td>
				</tr>	
				<tr>
				 <td class="td_zxy01" height="24">
				  <font color="#FF0000"><strong>*</strong></font>申报材料清单：</td>
				    <td colspan="3" class="td_form02">  
				     <table>
		               <tbody>					  
		                  <tr>   
		                     <td><s:checkbox name="disposeHead.sfysbd" id="sfysbd"  disabled="true"/>资产处置申报单</td>
		                     <td><s:checkbox name="disposeHead.sfyczfa" id="sfyczfa"  disabled="true"/>资产处置方案</td>
		                     <td><s:checkbox name="disposeHead.sfysjqk" id="sfysjqk"  disabled="true"/>财务审计情况</td>
		                     <td><s:checkbox name="disposeHead.sfypgbg" id="sfypgbg"  disabled="true"/>资产评估报告</td>
		                  </tr>   
		            	</tbody>
				     </table>
				    </td>
			    </tr> 
			    <tr> 
				   <td class="td_zxy01">其他申报材料：</td>
				   <td class="td_form02" colspan="3"><s:textfield name="disposeHead.qtsbcl" id="qtsbcl"  cssClass="input" readonly="true"/></td>
				</tr>	
			</table>
			<%@ include file="/inc/according.inc"%>  
		    <e:opinion id="test" width="99%">
		        <e:opinionPart id="LEADER" name="LEADER" value="" text="批示意见：" biaodanid="%{#request.disposeHead.id}"></e:opinionPart>
				<e:opinionPart id="OPERATION_GROUP" name="OPERATION_GROUP" value="" text="业务运营组意见：" biaodanid="%{#request.disposeHead.id}"></e:opinionPart>
		        <e:opinionPart cols="100" leftTdStyle="td_zxy01" id="DRAFT_DEPT" name="DRAFT_DEPT" value="" text="拟稿部门意见：" biaodanid="%{#request.disposeHead.id}"></e:opinionPart>
		    </e:opinion>
	        <table class="newtable" width="99%" border="0" cellpadding="0" cellspacing="0">
	        	<tr>
	        		<td colspan="4" class="td_zxy01" id="blButtons"></td>
	        	</tr>
	        	<tr>
	        		<td class="td_zxy01">申报日期：</td>
	        		<td class="td_zxy02">
	        			<s:textfield cssClass="input" id="sbrq" name="disposeHead.sbrq" readonly="true"/>
	        		</td>
	        		<td class="td_zxy01">受理序号：</td>
	        		<td class="td_zxy02">
	        			<s:textfield cssClass="input" id="slxh" name="disposeHead.slxh" readonly="true"/>
	        		</td>
	        	</tr> 
	        </table>
	        <e:opinion id="test2">
		        <e:opinionPart id="CHECK" biaodanid="%{#request.disposeHead.id}"  name="CHECK" value="" text="合规审查意见："></e:opinionPart>
	 		</e:opinion>       
	        <%@ include file="/inc/file.inc"%>
        </s:form>
	</body>
</html>

