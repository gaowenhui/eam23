<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<%@ include file="/inc/ProjectJQuery.inc"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>

<title>例子页面</title>
<SCRIPT type=text/JavaScript>
		    
</SCRIPT>

</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
    <s:set name="biaodanid" var="8a81895c2c9ac27e012c9ac3b9d20003" />
	<e:opinion id="test" width="98%">
		<e:opinionPart id="ERP_RESULT" width="800" biaodanid="%{#request.biaodanid}" name="ERP_RESULT" value="" text="ERP处理结果："></e:opinionPart>
		<e:opinionPart id="LEADER" name="LEADER" biaodanid="%{#request.biaodanid}"  value="" text="批示意见："></e:opinionPart>
		<e:opinionPart id="OPERATION_GROUP" biaodanid="%{#request.biaodanid}"  name="OPERATION_GROUP" value="" text="业务运营组意见："></e:opinionPart>
		<e:opinionPart id="HANDLE_DEPT" biaodanid="%{#request.biaodanid}"  name="HANDLE_DEPT" value="" text="承办部门意见："></e:opinionPart>
		<e:opinionPart id="MEETING_DEPT" biaodanid="%{#request.biaodanid}"  name="MEETING_DEPT" value="" text="会签部门意见：">
		  dfddf
		</e:opinionPart>
        <e:opinionPart id="AGENT_MEETING_DEPT" biaodanid="%{#request.biaodanid}"  name="AGENT_MEETING_DEPT" value="" text="委托管理机构内部会签意见："/>
		<e:opinionPart id="DRAFT_DEPT" biaodanid="%{#request.biaodanid}"  name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
		<e:opinionPart id="CHECK_DEPT" biaodanid="%{#request.biaodanid}"  name="CHECK_DEPT" value="" text="审核部门意见："></e:opinionPart>
		<e:opinionPart id="ACCOUNT_DEPT" biaodanid="%{#request.biaodanid}"  name="ACCOUNT_DEPT" value="" text="财务会计部意见："></e:opinionPart>
		<e:opinionPart id="WORK_DEPT" biaodanid="%{#request.biaodanid}"  name="WORK_DEPT" value="" text="业务部门意见："></e:opinionPart>
		<e:opinionPart id="AGENT_DEPT" biaodanid="%{#request.biaodanid}"  name="AGENT_DEPT" value="" text="代理机构意见："></e:opinionPart>
		<e:opinionPart id="WORK_MANAGE_DEPT" biaodanid="%{#request.biaodanid}"  name="WORK_MANAGE_DEPT" value="" text="业务管理部门意见："></e:opinionPart>
		<e:opinionPart id="AGENT_MANAGE_DEPT" biaodanid="%{#request.biaodanid}"  name="AGENT_MANAGE_DEPT" value="" text="委托管理机构意见："></e:opinionPart>
		<e:opinionPart id="COMPERE" biaodanid="%{#request.biaodanid}"  name="COMPERE" value="" text="主持人意见："></e:opinionPart>
		<e:opinionPart id="SECRATARY" biaodanid="%{#request.biaodanid}"  name="SECRATARY" value="" text="承继业务投资审批委员会秘书处意见："></e:opinionPart>
		<e:opinionPart id="SUMMARY_SUGGEST" biaodanid="%{#request.biaodanid}"  name="SUMMARY_SUGGEST" value="" text="汇总意见和建议："></e:opinionPart>
		<e:opinionPart id="APPROVEMENT" biaodanid="%{#request.biaodanid}"  name="APPROVEMENT" value="" text="汇总意见审核意见："></e:opinionPart>
		<e:opinionPart id="CHECK" biaodanid="%{#request.biaodanid}"  name="CHECK" value="" text="合规审查意见："></e:opinionPart>
		<e:opinionPart id="CHECK_DEPT_MODIFY" biaodanid="%{#request.biaodanid}"  name="CHECK_DEPT_MODIFY" value="" text="审查意见："></e:opinionPart>
		<e:opinionPart id="HQZZ" biaodanid="%{#request.biaodanid}"  name="HQZZ" value="" text="最终意见："></e:opinionPart>
		<e:opinionPart id="HQTH" biaodanid="%{#request.biaodanid}"  name="HQTH" value="" text="退回意见："></e:opinionPart>
		<e:opinionPart id="MEETING" biaodanid="%{#request.biaodanid}"  name="MEETING" value="" text="过程意见："></e:opinionPart>
		<e:opinionPart id="DEPT_LEADER" biaodanid="%{#request.biaodanid}"  name="DEPT_LEADER" value="" text="部门领导意见："></e:opinionPart>
		<e:opinionPart id="BLYJ_ZZYJ" biaodanid="%{#request.biaodanid}"  name="BLYJ_ZZYJ" value="" text="办理部门最终意见："></e:opinionPart>
		<e:opinionPart id="BLYJ_GCYJ" biaodanid="%{#request.biaodanid}"  name="BLYJ_GCYJ" value="" text="办理部门过程意见："></e:opinionPart>
		<e:opinionPart id="BLYJ_THYJ" biaodanid="%{#request.biaodanid}"  name="BLYJ_THYJ" value="" text="办理部门退回意见："></e:opinionPart>
		<e:opinionPart id="REMARK" biaodanid="%{#request.biaodanid}"  name="REMARK" value="" text="备注："></e:opinionPart>
	</e:opinion>
</body>
</html>



