<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc" %>
<%@ include file="/inc/ProjectJQuery.inc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<base href="<%=basePath %>"/>
<title>处置跟踪</title>
<script type="text/javascript">
	function saveBody(){
		myForm.action="<%=basePath %>wnb/wnbList_save.do?";
		window.close();
		window.opener.parent.afreshPage();
	}
	function closeBody(){
		window.close();
	}
</script>
</head>
<body>
<s:form id="myForm" method="post">
<s:hidden name="zcId" value="%{#request.zcId}"/>
<s:hidden  name="xmId" value="%{#request.xmId}"/>
<s:hidden  name="zcCode" value="%{#request.zcCode}"/>
<s:hidden  name="wnbId" value="%{#request.wnbId}"/>
<s:hidden  name="czWnb.wnbId" value="%{#request.wnbId}"/>
<s:hidden  name="czWnb.zcId" value="%{#request.zcId}"/>
<s:hidden  name="czWnb.xmId" value="%{#request.xmId}"/>
<s:hidden  name="czWnb.zcCode" value="%{#request.zcCode}"/>
<s:set name="biaodanid" value="czWnb.wnbId" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<s:hidden name="deptid" value="11318" />

<Table width="60%" align="center" border="1" class="newtable" >
<%
		String 	col = (String)request.getAttribute("col");
		String	wnb = (String)request.getAttribute("wnb");
		String[] cols = col.split("\t");
		if(wnb!=null){
			String[] wnbs = wnb.split("\t");
			for(int i=0;i<cols.length;i++){
				String colname = "czWnb.col"+(i+1);
			%>			
				<tr >
					<td class="td_zxy01" >
							<%=cols[i] %>：</td>
					<td class="td_zxy02"> 
							<input type="text" name='<%=colname %>' class="input" value='<%=wnbs[i] %>' />
					</td>
				</tr>
					
		<% }} else{
			for(int i=0;i<cols.length;i++){
				String colname = "czWnb.col"+(i+1);
			%>			
				<tr >
					<td class="td_zxy01" >
							<%=cols[i] %>：</td>
					<td class="td_zxy02">
							<input type="text" name='<%=colname %>' class="input" value="" />
					</td>
				</tr>
		<%} }%>
		 </Table>
		 <table width="60%" align="center" border="1" class="newtable">
		 <%@ include file="/inc/file.inc"%>
		 </table>
<s:submit  onclick="saveBody();" value="保存"/>	 
		

</s:form> 
</body>

</html>
