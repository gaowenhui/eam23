<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resource/js/dtreeCheck/dtree.css" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/resource/js/validate.js"></script>
<title>组织机构</title>
<%@include file="dtreeCheck.jsp" %> 
</head>
<body>
<div class="dtree">
<script language="javascript">
 	  function showDepDetail(depId,name){
		//myForm.action="";
		//myForm.submit();
	} 
	var d = new dTree('d','.','testForm');	
	d.add('1','-1','组织机构',"showDepDetail('1','');");
	${buffer};
	document.write(d);
</script>
 
          	      <SCRIPT LANGUAGE="JavaScript">
             	      // document.write(d);
		             </SCRIPT>     

	<script type="text/javascript">
		function submitForm(){
			var ids = "";
			var form = document.getElementById("testForm");
			for (var i=0; i<form.elements.length; i++) {
				var element = form.elements[i];
				if (element.name == "id" && element.type=='checkbox'){
					if( element.checked == true ){
						ids = ids + element.value + ",";
					}
				}
			}		
			alert("ids = " + ids);
	
		}
	</script>
	<input type="button" value="提 交" onClick="submitForm()"/>

</div>
</body>

</html>
   