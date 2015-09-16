<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
if(isInCounterSign){
%>
<s:set name="biaodanid"  scope="request"><%=counterSign.getTid()%></s:set>
<s:set name="type"  scope="request">huiqian</s:set>
<%@ include file="/inc/file_huiqian.inc"%>
<!-- input type='button' onclick='zhuanhuan()' -->
<%
}
%>