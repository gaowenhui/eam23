<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/header-standard.inc"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
</script>
</head>
<body class="body1">
   <form action="" name="myForm" method="post">
     <table cellpadding=1 cellspacing=1 class="table1" align=center>
        <tr>
          <th><input type="checkbox" name="tids" >全选</th>
          <th>父节点编码</th>
          <th>字典名称</th>
          <th>顺序号</th>
          <th>字典状态</th>
        </tr>
     <s:iterator  value="referenceList.results" status="st" id="list">
		<s:iterator value="#list" status="ll" id="reference">
			<tr>
				<td align="center">
				<input type="checkbox" name="tids">
				</td>
				<td align="center">
				<s:property value="#reference.refCode" />
				</td>
				<td align="center">
				<s:property value="#reference.parRefCode" />
				</td>
				<td align="center">
				<s:property value="#reference.refName" />
				</td>
				<td align="center">
				<s:property value="#reference.sortOrder" />
				</td>
	        </tr>
	  </s:iterator>
	 </s:iterator>		
	 
	 <tr>
								<td colspan="6">
									<input type="button" class="button1" value="添加"
										onClick="window.navigate('<%=request.getContextPath()%>/reference/reference_toAdd.do');">
									<input type="button" class="button1" value="删除"
										onClick="turnDelete();">
								</td>
							</tr>
							<tr>
								<td colspan="6" align="left">
									<div>
		                          <r:pages pageno="${referenceList.paginator.currentPage}" total="${referenceList.paginator.pageCount}" style="table1"  listname="referenceList"/>
									</div>
								</td>
							</tr>					
     </table>
   </form>
</body>
</html>