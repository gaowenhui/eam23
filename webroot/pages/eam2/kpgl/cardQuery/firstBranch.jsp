<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
<tr>
<input type="button" value="选择" onclick="checkselect('firstBranch')">
</tr>
</table>
<table>
<tr>
<s:select id="firstBranch" name="firstBranch" list="firstBranchList"  size="40" listKey="nodevalue" listValue="categoryname" multiple="true" ></s:select>
</tr>	
</table>
</body>
<script type="text/javascript">
	function checkselect(objname){
		var	o = document.getElementById(objname);
		var text="";
		var intvalue="";
		for(i=0;i<o.length;i++){   
			if(o.options[i].selected){
				intvalue+=o.options[i].value+",";
				text+=o.options[i].text+","
			}
		}
		intvalue=intvalue.substr(0,intvalue.length-1);
		text = text.substr(0,text.length-1);
		window.opener.fuzhi(intvalue,text);
		window.close();
	}
	
</script>
</html>