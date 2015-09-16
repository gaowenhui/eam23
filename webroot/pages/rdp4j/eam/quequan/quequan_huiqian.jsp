<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="org.jbpm.api.ProcessDefinition"%>
<%@ page language="java" import="org.jbpm.api.task.Task"%>
<link rel="stylesheet" 	href="<%=request.getContextPath()%>/resource/css/maincss.css" type="text/css">
<%
HashMap contents = (HashMap)request.getAttribute("contents");
String strTaskID=request.getParameter("taskId");
%>
<body class='body1'>
<TABLE  cellspacing="1" cellpadding="1" class='table1'>
  <TR>
	<th>部门名称</th>
	<th>意见</th>
  </TR>
  <%
      	Iterator it1 = contents.keySet().iterator();
      	while(it1.hasNext()){
      		String key = (String)it1.next();
      		String value = (String)contents.get(key);
      %>
	    <tr> 
	    <td height="63" class="td_form01">处置部x</td>
	    <td> 
	      <textarea  disabled="disabled" name="textarea" cols="60" rows="4" style="background-color:#ffffff"><%=value%></textarea></td>
	  </tr>
      <%
      	}
      %>
      
  </TABLE><br>
  <form name='form1' action='quequan_starthuiqian.do'  >
  
  综合人员编号：
  <input type='text' name='zongheid' value='<%=(request.getParameter("zongheid")==null)?"":request.getParameter("zongheid")%>'>
  <br>
  部门编号　　：
	<input type='text' name='deptid' value='<%=(request.getParameter("deptid")==null)?"":request.getParameter("deptid")%>'>
	<br>
	任务编号　　：
	<input type='text' name='taskId'
		value='<%=request.getParameter("taskId")%>' readonly>
	<br>
	业务单号　　：
	<input type='text' name='tid'
		value='<%=request.getParameter("tid")%>' readonly>
	<br>
	
	<input type='submit' value='开启会签' class='button1'>
	</form>
  <!-- input type='button'  value='选择会签部门' onclick='window.open("quequan_selecthuiqian.do?taskId=<%=strTaskID %>","_blank","width=400,height=300")' -->
</body>