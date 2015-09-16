<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String source = (String) request.getAttribute("source");
	String idName = (String) request.getAttribute("idName");
	String idValue = (String) request.getAttribute("idValue");
	
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/resource/css/maincss.css" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/validate.js"></script>
<title>组织机构</title>
<%@include file="dtreeCheck.jsp" %>   
  <script type="text/javascript">
   function confirmAdd(){
       myForm.action="<%=request.getContextPath()%>/dept/dept_getCheckBoxValue.do";
       myForm.submit();
    }
    function checkAll(val){
		var arr = document.getElementsByName("tids");
		for (i=0;i<arr.length;i++){
			arr(i).checked = val;
		}
	}
	function returnValue(){
		var idName = "<%=idName%>";
		var idValue = "<%=idValue%>";
		var depIds = "";
		var deptname = "";
		var checkIdObj = document.getElementsByName("tids");
		for (var i = 0; i < checkIdObj.length; i++) {
			if (checkIdObj(i).checked) {
				var values = checkIdObj(i).value;
				var ids = values.substring(0, values.lastIndexOf("&"));
				var names = values.substring(values.lastIndexOf("&") + 1,
						values.length);
				depIds = depIds + "," + ids;
				deptname = deptname + "," + names;
			}
		}
		  opener.document.getElementById(idName).value = depIds.substring(1);
		  opener.document.getElementById(idValue).value = deptname.substring(1);		
		  window.close();
	}
	
	function turnDelete(){
	var depIds = "";
	var deptname = "";
	
	var checkIdObj = document.getElementsByName("tids");
	for (var i = 0; i < checkIdObj.length; i++) {
		if (checkIdObj(i).checked) {
			var values = checkIdObj(i).value;
			var ids = values.substring(0, values.lastIndexOf("&"));
			var names = values.substring(values.lastIndexOf("&") + 1,
					values.length);
			depIds = depIds + "," + ids;
			deptname = deptname + "," + names;
		}
	}
	  opener.document.getElementById("depIds").value = depIds.substring(1);
	  opener.document.getElementById("deptname").value = deptname.substring(1);
	
        myForm.action="<%=request.getContextPath() %>/users/users_getCheckBoxValue.do";
		if(confirm("确认添加吗?")){
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
		
		window.close();
	}
	function judgeEqual(){
	      var m=document.getElementById("checkDepId").value;
	       var checkIdObj = document.getElementsByName("tids");
              var h=m.split(",");
             for(var i=0;i<h.length;i++){
             var depId=h[i];
              for (var j= 0; j < checkIdObj.length; j++) {
			var values = checkIdObj(j).value;
			var ids = values.substring(0, values.lastIndexOf("&"));
			if(ids==depId){
			  document.getElementById(ids).checked=true;
			  }
             }
          }
	   }
  </script>
</head>
<body onload="judgeEqual();" class="body1">
<form action="" method="post" name="myForm">
<input type="hidden" name="checkDepId" id='checkDepId' value="${checkDepId}"/>
<script type="text/javascript">
	function showDepDetail(depTid,name){
	 //top.window.main.window.document.all("mainFrame").src="<%=request.getContextPath() %>/dept/dept_getSelf.do?dep.tid="+depTid;
	}
	var d = new dTree('d');	
	d.add('1','-1','组织机构',"showDepDetail('1','');");
	${buffer};
	d.draw();
	</script>
	<table align="left" class='tabletitle' cellspacing=1 cellpadding=1 width="20pt">
	 <tr align="left" >
	   <td align="left">
	   	<%
	   		if("jyxgdzc".equals(source)){
	   	%>
	   		<input type="button" value="确定" class="button1" onclick="returnValue();" />
	   	<%
	   		} else {
	   	%>
	   		<input type="button" value="确定" class="button1" onclick="turnDelete();" />
	   	<%
	   		}
	   	%>	   	
	     <input type="button" value="取消" class="button1" onclick="window.close();" />
	   </td>
	 </tr>
	</table>
</form>
</body>
</html>