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
	function turntoCombination(depId){
        myForm.action="<%=request.getContextPath() %>/dept/dept_toCombination.do?dep.parId="+depId;
		if(confirm("确认合并吗?")){
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
  <form name="myForm" action="">
  <input type="hidden" name="depId" value="${depId }"/>
    <table class='tabletitle' cellspacing=1 cellpadding=1>
    <tr height=25>
				<td colspan="3" class=formtitle>
					<img src="<%=request.getContextPath()%>/resource/images/dots1.gif">
					当前位置：部门合并
				</td>
	</tr>
      <tr>
      <td colspan="3" align="center">部门合并${depId}</td>
      </tr> 
      <tr>
      <td>请选择要合并的部门</td>
      <td>部门名称</td>
      <td>部门描述</td>
      </tr>
      <s:iterator value="listDeps">
      <tr>
      <td><input type="checkBox" name="tids" id="tids" value='<s:property value="tid"/>'/></td>
      <td><s:property value="deptName"/></td>
      <td><s:property value="deptDesc"/></td>
      </tr>
      </s:iterator>
       <tr>
        <td colspan="3"><input type="checkBox" name="cheeck" onClick="checkAll(this.checked);"/>
         <input type="button"  class="button1" value="合并成新部门" onClick="turntoCombination(${depId})">
        </td>
      </tr>
    </table>
  </form>
</body>
</html>