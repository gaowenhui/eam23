<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
<head>
 <script type="text/javascript">
 <link rel="stylesheet" type="text/css" href="<s:url value="/resource/css/style.css" />">
    function saveOrUpdateXmmc(){
    alert("确定删除吗?");
       myForm.action="<%=request.getContextPath() %>/zccz/sczskLsbAction_saveOrUpdateXmmc.do";
       myForm.submit();
       window.close();
       window.opener.call();
    }
   
 </script>
</head>

<body class="easyui-layout">
  <form action="" method="post" name="myForm">
  <input type="hidden" name="czSczskBdxx.bdfs" value="MOVEYD"  id="changeType"/>
  <input type="hidden" name="czSczskBdxx.zskid" value="<s:property value='lsb.zskId'/>">
  <input  type="hidden" name="czSczskBdxx.cldId" value="<s:property value='lsb.cldId'/>" id="cldId">
	<table id="table" class="newtable"  width="100%" border="0" cellspacing="0">
	  <tr> 
	    <td class="td_zxy01">原项目：</td>
	    
	   <td class="td_zxy02"><input name="czSczskBdxx.beforeyd" value="<s:property value='lsb.scyd'/>"/></td>
	  </tr>
      <tr>
       <td align="center"><input  type="button" value="OK" onclick="saveOrUpdateXmmc();"/><input  type="button" value="关闭"  onclick="history.back();" /> </td>
      </tr>
  </table>
</form>
</body>
</html>