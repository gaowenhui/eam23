<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ taglib uri="/eam2-tags" prefix="e"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
<head>
<base href="<%=basePath%>" />
 <script type="text/javascript">
 $(function(){
		$("#myForm").ajaxForm({
	 		success:function(){
	 			window.opener.reloadGrid();
				window.close();
	 		}
	 	});
 	}) 
    function closeBody(){
      window.close();
    }
 </script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
  <form action="<%=basePath%>zccz/evalKnowBody_saveBody.do"  method="post" id="myForm" >
  <s:hidden name="zskBdxx.id" value="%{#request.zskBdxx.id}"  />
  <s:hidden name="zskBdxx.cldId" value="%{#request.zskBdxx.cldId}"  />
  <s:hidden name="zskBdxx.zskid" value="%{#request.zskBdxx.zskid}"  />
	<table id="table" class="newtable"  width="100%" border="0" cellspacing="0">
	<tr> 
	    <td class="td_zxy01">变动方式：</td>
	     <td class="td_zxy02"><s:textfield name="zskBdxx.bdfs" cssClass="input" readonly="true" value="%{#request.zskBdxx.bdfs}"/></td>
	  </tr>
	  <tr> 
	    <td class="td_zxy01">变动前项目名称：</td>
	     <td class="td_zxy02"><s:textfield name="zskBdxx.beforexm" cssClass="input" readonly="true" value="%{#request.zskBdxx.beforexm}"/></td>
	  </tr>
	  <tr>  
	    <td class="td_zxy01" >变动后项目名称：</td>
	   <td class="td_zxy02"> <s:textfield name="zskBdxx.afterxm" cssClass="input" readonly="true" value="%{#request.zskBdxx.afterxm}"/></td>
      </tr>
      <tr> 
	    <td class="td_zxy01">变动前要点名称：</td>
	     <td class="td_zxy02"><s:textfield name="zskBdxx.beforeyd" cssClass="input" readonly="true" value="%{#request.zskBdxx.beforeyd}"/></td>
	  </tr>
	  <tr> 
	    <td class="td_zxy01">变动后要点名称：</td>
	     <td class="td_zxy02"><s:textfield name="zskBdxx.afteryd" cssClass="input" readonly="true" value="%{#request.zskBdxx.afteryd}"/></td>
	  </tr>
	   <tr> 
	    <td class="td_zxy01">审查意见：</td>
	     <td class="td_zxy02"><s:textfield name="zskBdxx.scyj" cssClass="input" readonly="true" value="%{#request.zskBdxx.scyj}"/></td>
	  </tr>
	  <tr> 
	    <td class="td_zxy01">审批意见：</td>
	     <td class="td_zxy02"><s:select list="#{1:'通过',2:'不通过'}"  name="zskBdxx.spzt"  value="%{#request.zskBdxx.spzt}"/></td>
	  </tr>
      <tr>
  </table>
   <div  align="right">
       <s:submit    value="保存" />
       <s:submit  type="button" onclick="closeBody();return false;"  value="关闭" />
       </div>
</form>
</body>
</html>































































































