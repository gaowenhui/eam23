<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="org.jbpm.api.task.*"%>
<%@ page language="java" import="com.tansun.rdp4j.common.model.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
List<PTUserBO> users = (List<PTUserBO>)request.getAttribute("users");
String taskId = (String)request.getAttribute("taskId");
String outCome = (String)request.getAttribute("outCome");
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title></title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script>
		function sub(){
			//window.opener.name="mainFrm"; 
			//f1.target = "mainFrm";
			//f1.submit();
			//var parentWin=window.dialogArguments;
			//alert(parentWin);
			//parentWin.location = "/rdp4j/verifyjoin/verifyjoin_completeTask.do?taskId=<%=taskId%>&outCome=<%=outCome%>&userId="+f1.userId.value;
			//alert(document.f1.userId.length);
			if(document.f1.userId.length == undefined){
				window.returnValue=document.f1.userId.value;
				window.close();
			}else{
			checkList = document.f1.userId;
			for(i=0;i<checkList.length;i++){
				check = checkList[i];
				if(check.checked){
					window.returnValue=check.value;
					window.close();
				}
			}
			}
		}
		function selchk(chk)  //chk 为 checkbox控件，   前台每个checkbox控件都需加上这方法
        {
            for(var i=0;i<document.f1.elements.length;i++)
            {
                var e = document.f1.elements[i];
                if(e.type!=null && e.type=="checkbox") //表格里的所有checkbox是否全部选种
                {
                    if(e.checked)
                    {
                        e.checked = false;
                        chk.checked = true;
                    }
                }
            }
        }
	</script>
  </head>
  
  <body>
  <form name="f1" action="/rdp4j/verifyjoin/verifyjoin_completeTask.do">
  	<input type="hidden" name="taskId" value="<%=taskId%>"/>
  	<input type="hidden" name="outCome" value="<%=outCome%>"/>
  	<table border="1" width="100%">
      <caption>选择处理人</caption>
      <thead>
        <%
    		for(PTUserBO user : users){
    	%>
    	<tr>
    		<td align="center"><input name="userId" type="checkbox" value="<%=user.getTid()%>" onclick="selchk(this)"/></td>
    		<td><%=user.getUsername()%></td>
    	</tr>
    	<%
    		}
    	%>
    	<tr><td colspan="2" align="center"><input type="button" value="确定" onclick="sub()"/></td></tr>
      </thead>
    </table>
   </form>
  </body>
</html>
