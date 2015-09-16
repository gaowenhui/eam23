<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
  function immidetely(){
	 parent.contentLeft.location.href="<%=request.getContextPath()%>/dept/dept_toTreeDept.do";
	}
</script>
</head>
<body onload="immidetely();">
 <h1>操作成功！</h1>
</body>
</html>