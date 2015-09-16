<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/css/maincss.css" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/validate.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
  function checkAll(val){
		var arr = document.getElementsByName("tids");
		for (i=0;i<arr.length;i++){
			arr(i).checked = val;
		}
	}
	function turnDelete(){
        myForm.action="<%=request.getContextPath() %>/dept/dept_delete.do";
		if(confirm("确认删除吗?")){
			var flag=false;
			var arr=document.getElementsByName("tids");
			for(i=0;i<arr.length;i++){
				if(arr(i).checked){
					flag=true;
					break;
				}
			}
				if(!flag){
					alert("至少选择一个");
				}else{
						myForm.submit();		
				}
		}
	}
</script>
</head>
<body class="body1">
<form id="myForm" name="myForm" method="post" action="">
   <table class='tabletitle' cellspacing=1 cellpadding=1>
   <tr height=25>
				<td colspan="5" class=formtitle>
					<img src="<%=request.getContextPath()%>/resource/images/dots1.gif">
					当前位置：所属子机构列表
				</td>
	</tr>
     <tr><td colspan="5" align="center">所属子机构列表</td></tr>
	     <tr>
	     <th align="center" >&nbsp;</th>
	     <th align="center">组织机构名称</th>
	     <th align="center">组织结构描述</th>
	    </tr>
      <s:iterator value="listDeps">
         <tr>
         <td><input type="checkBox" name="tids" value='<s:property value="tid"/>'/></td>
		 <td><a href="<%=request.getContextPath() %>/dept/dept_getSelf.do?dep.tid=<s:property value='tid'/>" style="text-decoration:none"><s:property value='deptName'/></a></td>
		 <td><s:property value="deptDesc"/></td>
		 </tr>
      </s:iterator>
      <tr>
        <td colspan="3"><input type="checkbox" name="cheeck" onclick="checkAll(this.checked);"/>
        <!-- 
         <input type="button" class="button1" value="添加" onClick="window.navigate('<%=request.getContextPath() %>/dept/dept_toAdd.do');">
          -->
         <input type="button" class="button1" value="删除" onClick="turnDelete();">
        </td>
      </tr>
  </table>
</form>
</body>
</html>