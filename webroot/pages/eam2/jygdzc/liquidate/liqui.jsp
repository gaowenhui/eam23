<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>第三方清算</title>
<SCRIPT language=JavaScript type=text/JavaScript>
</Script>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="refreshlist()">
<table id="gridTable"  width="100%" border="0" align="center" cellspacing="0">
 <tr>
   
    <td>合同编号：</td> <td><input  type="text"/></td>
    <td>清算开始时间：</td> <td><input  type="text"/></td>
    <td>清算结束时间：</td> <td><input  type="text"/></td>
   
 </tr>
</table>
</body>

