<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page language="java" import="java.util.*"%>
<%@ page language="java" import="org.jbpm.api.task.Task"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
Set<String> outComes = (Set<String>)request.getAttribute("outComes");
String taskId = (String)request.getAttribute("taskId");
String taskName = (String)request.getAttribute("taskName");
String uperTaskID = (String)request.getAttribute("uperTaskID");
String uperTid = (String)request.getAttribute("uperTid");
String userName = (String)request.getAttribute("userName");
boolean isFork = false;
if(taskName.equals("等待会签结果")
	||taskName.equals("领导会签")
	||taskName.equals("经办会签")
	||taskName.equals("结束会签")){
	isFork = true;
}
HashMap contents = (HashMap)request.getAttribute("contents");
if(contents==null){
	contents = new HashMap();
}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet"
			href="<%=request.getContextPath()%>/resource/css/maincss.css"
			type="text/css">
		<script type="text/javascript"
			src="<%=request.getContextPath()%>/resource/js/validate.js"></script>
			<script type="text/javascript"
			src="<%=request.getContextPath()%>/resource/js/menu.js"></script>
		<title>Insert title here</title>
		<script type="text/javascript">
			var isFork = '';
		<%
			if(!isFork){
		%>
				isFork='false';
		<%
			}
		%>
		function choiceUser(taskId,outCome){
			if(isFork=='false'){
			if(outCome=='会签'){
			document.myForm.action = "/rdp4j/verifyjoin/verifyjoin_getForkParticipations.do";
			document.myForm.outCome.value = outCome;
			document.myForm.submit();
			}else{
			var result = window.showModalDialog("/rdp4j/verifyjoin/verifyjoin_getParticipations.do?taskId="+taskId+"&outCome="+outCome+"&multiple=false","_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:800px;dialogHeight:600px;center:yes");
			//var result = window.open("/rdp4j/verifyjoin/verifyjoin_getParticipations.do?taskId="+taskId+"&outCome="+outCome+"&multiple=false","_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:800px;dialogHeight:600px;center:yes");
			//alert(result);
			if(typeof(result)!='undefined'){
				document.myForm.taskId.value = taskId;
				document.myForm.outCome.value = outCome;
				document.myForm.userId.value = result;
				document.myForm.submit();
			}
			}
			//window.open("/rdp4j/verifyjoin/verifyjoin_getParticipations.do?taskId="+taskId+"&outCome="+outCome,"_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:800px;dialogHeight:600px;center:yes");
			}else{
			document.myForm.action = "/rdp4j/verifyjoin/verifyjoin_completeForkTask.do";
			document.myForm.outCome.value = outCome;
			document.myForm.submit();
			}
		}
	window.onload=function(){
	////////////////test2
	var menu2 = [
		{'txt': '<input type="button" class="button1" value="提交">', 'position': 'down', 'menu': [
	<%	
		boolean first = true;
		for(String outCome : outComes){
			if(first){
				first=false;
			}
			else{%>,<%}%>{'txt': '<a href="javascript:choiceUser(&quot;<%=taskId%>&quot;,&quot;<%=outCome%>&quot;);"><%=outCome%></a>'}
	<%
		}
	%>
		]}
	];
	var container2=["idMenu2"];
	var cs2 = new CascadeMenu(container2, menu2, { Delay: 200, onClass: "on" });
	}
</script>
<style type="text/css">
.container {
	width: 100px;
}

.container div {
	width: 100px;
	background: #CCCCCC;
	line-height: 30px;
	border: 1px solid #000000;
}

.on {
	font-weight: bold;
}

.container2 {
	width: 100px;
	text-align: center;
}

.container2 div {
	width: 100px;
	line-height: 30px;
}

.container2 a {
	text-decoration: none;
	display: block;
	border: 1px solid #d4d4d3;
	background: #e6e6e6;
	color: #000000;
}

.container2 .on a {
	background: #ffebac;
	color: #982e00;
	border-color: #ffb200;
}

#idMenu2 {
	clear: both;
	width: auto;
}

#idMenu2 div {
	float: left;
}

#idMenu2_6 a {
	background-color: red;
	border-color: red;
	color: #ffb200;
}
</style>
	</head>
	<body class="body1">
		<form name="myForm" method="post" action="/rdp4j/verifyjoin/verifyjoin_completeTask.do">
			<input type="hidden" name="taskId" value="<%=taskId%>">
			<input type="hidden" name="outCome" value="">
			<input type="hidden" name="userId" value="">
			<table class='tabletitle' cellspacing=1 cellpadding=1>
				<tr>
					<td></td>
					<!--
					<td align="center">
						<input type="submit" class="button1" value="保存">
						<input type="submit" class="button1" value="传阅">
						<input type="submit" class="button1" value="打印">
					</td>
					-->
					<td align="center"><div id="idMenu2" class="container2"></div></td>
				</tr>
				<tr>
					<td colspan="2">
					<br>
      <br>
      <div align="center">
        <span class="STYLE7 STYLE1">会签办理单</span>
      </div>
      <br>
	  <div align="center"><br />任务编号：<%=taskId%>&nbsp;&nbsp;&nbsp;&nbsp;当前环节：<%=taskName%>&nbsp;&nbsp;&nbsp;&nbsp;处理人：<%=userName%></div>
      <hr color="#6600CC" align="center" width="100%">
					</td>
				</tr>
				<tr><td colspan="2" height="500"><iframe src="/rdp4j/quequan/quequan_next.do?tid=<%=uperTid%>&taskId=<%=uperTaskID%>"
				frameBorder=0 width="100%" height="100%"
				frameborder="0" scrolling="yes" style="visibility: inherit;"></iframe></td></tr>
	<%
      	Iterator it1 = contents.keySet().iterator();
      	while(it1.hasNext()){
      		String key = (String)it1.next();
      		String value = (String)contents.get(key);
      %>
				<tr>
					<td height="63" class="td_form01">
						<%=key%>意见:
					</td>
					<td class="td_form02" colspan="5">
						<textarea name="content" cols="150" rows="4" disabled="disabled"
							style="background-color:#ffffff"><%=value%></textarea>
					</td>
				</tr>
		<%
      	}
      %>
				<tr>
					<td height="63" class="td_form01">
						意见:
					</td>
					<td class="td_form02" colspan="5">
						<textarea name="content" cols="150" rows="4"
							style="background-color: #CCCCCC"></textarea>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>