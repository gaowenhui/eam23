<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resource/js/menu.js"></script>
<script>
	function choiceUser(taskId,outCome){
		var result = window.showModalDialog("<%=request.getContextPath()%>/workflow/userTask_getParticipationList.do?taskId="+taskId+"&outCome="+outCome+"&multiple=false","_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:800px;dialogHeight:600px;center:yes");
		if(typeof(result)!='undefined'){
			document.myForm.taskId.value = taskId;
			document.myForm.outCome.value = outCome;
			document.myForm.userId.value = result;
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
