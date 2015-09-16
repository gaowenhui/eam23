<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ taglib uri="/eam2-tags" prefix="e"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
<head>
</head>

<body class="easyui-layout">
  <form action="" method="post" name="myForm">
	<table width="95%" border="0" cellpadding="2" cellspacing="0" align="center">
	  <tr>
	    <td class="td_form01" width="11%">原项目：<input name="" value=""/></td>
	    <td class="td_form01" width="11%">新项目：<input name="" value=""/></td>
      </tr>
      <tr>
       <td><input  type="button" value="OK"/><input  type="button" value="关闭" /> </td>
      </tr>
  </table>
</form>
</body>
</html>

