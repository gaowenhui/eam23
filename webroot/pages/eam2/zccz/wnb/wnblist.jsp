<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.util.*" %>
<%@ include file="/inc/taglibs.inc" %>
<%@ include file="/inc/ProjectJQuery.inc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<script type="text/javascript">
	function init(){
		var zcId = "${zcId}";
		var xmId = "${xmId}";
		var zcCode = "${zcCode}";
		var url ="<%=basePath%>/wnb/wnbList_init.do";  
		//$.post(url,{zcId:"0",xmId:"0",zcCode:"PMGG"});
		window.open('<%=basePath%>/wnb/wnbList_add.do?zcId='+zcId+'&xmId='+xmId+'&zcCode='+ zcCode + '','','height=600, width=1000, top=100, left=100, resizable=yes');
	}
	function modify(id){
		var zcCode = "${zcCode}";
		var zcId = "${zcId}";
		var xmId = "${zcId}";
		var url ="<%=basePath%>/wnb/wnbList_init.do";  
		//$.post(url,{zcId:"0",xmId:"0",zcCode:"PMGG"});
		window.open('<%=basePath%>/wnb/wnbList_modify.do?zcId='+zcId+'&xmId='+xmId+'&wnbId='+id+'&zcCode='+ zcCode + '','','height=600, width=1000, top=100, left=100, resizable=yes');
	}
	function deleteWnb(id){
		var url ="<%=basePath%>/wnb/wnbList_delete.do";  
		$.post(url,{wnbId:"" + id + ""});
		alert("删除成功");
		afreshPage();
	}
	function afreshPage(){
		window.location.reload();
	}
</script>
</head>
<body eftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<Table width="95%" border="1" align="center">
<tr><td align="right" colspan="20"><input type="button" onclick ="init()" value="添加"/></td></tr>
<%
	List dataList = (List)request.getAttribute("datalist");
	int i;
	for(i=0;i<dataList.size();i++){
		String s1 = (String)dataList.get(i);
		System.out.println("s1="+s1);
		String sdata[] = s1.split("\t");
		%>			
			<tr >
 				<%  for(int j=0;j<sdata.length;j++){  
					if(i ==0){
						if(j==0){
				%>
						<td style="display: none"><%=sdata[0] %></td>
						<%}else{ %>
							<td class="td_top"><%=sdata[j] %></td>
						<% }
						if(j==sdata.length-1){%>
						<td class="td_top">操作</td>
						<%} %>
					<% 	
					}else{
						if(j==0){
							%>
						<td style="display: none"><%=sdata[0] %></td>
						<%}else{ %>
						<td class="td07"><%=sdata[j] %></td>
						<% }
						if(j==sdata.length-1){%>
						<td class="td07">&nbsp;&nbsp;<a href="#" onclick="modify('<%=sdata[0] %>');return false;" >编辑</a>&nbsp;&nbsp;<a href="#" onclick="deleteWnb('<%=sdata[0] %>');return false;" >删除</a></td>
					<% }}} %>
			</tr>	 	
 		<% } %>
 </Table>
 
</body>

</html>
