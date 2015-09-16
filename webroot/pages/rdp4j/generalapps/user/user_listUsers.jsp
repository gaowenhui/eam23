<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/css/maincss.css" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/validate.js"></script>
<title>用户列表</title>
<script type="text/javascript">
  function checkAll(val){
		var arr = document.getElementsByName("tids");
		for (i=0;i<arr.length;i++){
			arr(i).checked = val;
		}
	}
	function turnDelete(){
        alert("aacc");
        myForm.action="<%=request.getContextPath() %>/users/user_delete.do";
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
				<td colspan="3" class=formtitle>
				&nbsp;
					<img src="<%=request.getContextPath()%>/resource/images/dots1.gif">
					&nbsp;当前位置：部门合并
				</td>
	</tr>
   <tr>
        <td colspan="3" align="right">
        根据姓名查询：<input type="text">
        <input type="button" class="button1" value="查询"/>
        <input type="button" class="button1" value="清除结果"/>
        </td>
      </tr>
     <tr><td colspan="5" align="center">人员姓名</td></tr>
	     <tr>
	     <td align="center" >选择</td>
	     <td align="center">姓名</td>
	    </tr>
      <s:iterator value="listUsers">
         <tr>
         <td align="center"><input type="checkBox" name="tids" value="<s:property value="tid"/>"/></td>
		 <td align="center"><s:property value="username"/></td>
		 </tr>
      </s:iterator>
      <tr>
        <td colspan="3"><input type="checkbox" name="cheeck" onclick="checkAll(this.checked);"/>
         <input type="button" class="button1" value="添加" onClick="window.navigate('<%=request.getContextPath() %>/users/user_toAdd.do');">
          <input type="button" class="button1" value="删除" onClick="window.navigate('<%=request.getContextPath() %>users/user_toAdd.do');">
        </td>
      </tr>
  </table>
</form>
</body>
</html>