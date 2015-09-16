<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQueryZSK.inc"%>
<%
	String qyjid = (String)request.getAttribute("yjid");
	String headId = (String)request.getAttribute("headId");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>项目、要点迁移</title>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"><br>
<h4 align="center">请选择具体意见迁移位置</h4>
<table width="80%" border="0" cellpadding="2" cellspacing="0" align="center">
	<tr>
	    <td class="td_form01" height="35"  align="center"><font size="3">审查项目：</font></td>
	    <td class="td_form02" >
    		<s:select id="xm" name="xm" list="XMList" listKey="zskId" listValue="value" headerValue="--请选择--" headerKey="" onchange="YDRefresh(this)" />
	    </td>
	</tr>
	<tr>
		<td class="td_form01" height="35"  align="center"><font size="3">审查要点：</font></td>
		<td class="td_form02">
			<select name="yd" id="yd"></select>
		</td>
	</tr>	
	<tr>
		<td align="center" colspan=2><br>
			<input type="button" class="buttonface" value="确定" onClick="queding()" /> 
      		&nbsp;&nbsp; 
        	<input type="button" class="buttonface" value="关闭" onClick="window.close()" />
      	</td>
	</tr>
</table>
</body>
<script type="text/javascript">
function queding(){
	var xm = document.getElementById("xm");
	var yd = document.getElementById("yd");
	var hxmid = "";
	var hxmtext = "";
	var hydid = "";
	var hydtext = "";
	var qyjid = '<%=qyjid%>';
	var headId = '<%=headId%>';
	for(i=0;i<xm.length;i++){   
		if(xm.options[i].selected){
			hxmid = xm.options[i].value;
			hxmtext = xm.options[i].text;
		}
	}
	for(i=0;i<yd.length;i++){   
		if(yd.options[i].selected){
			hydid = yd.options[i].value;
			hydtext = yd.options[i].text;
		}
	}
	if(hxmid == '' || hxmid == null || hydid == '' || hydid ==null){
		alert('请先选择');
		return false;
	}
	var moveUrl = "<%=basePath%>zccz/knowBody_moveYJ.do";
	$.post(moveUrl,{headId:"" + headId + "",hxmid:"" + hxmid + "",hxmtext:"" + hxmtext + "",
		hydid:"" + hydid + "",hydtext:"" + hydtext + "",qyjid:"" + qyjid + ""},function(data){
		if(data!=null && data!=''){
			alert(data);
			window.opener.reload();
			window.close();
		}
	});
}

function YDRefresh(fl){
	$.post("<%=basePath%>zccz/knowBody_findYDList.do",{
		"pid" : $(fl).val(),
		"headId" : '<%=headId%>'
	},function(returnStr){
		var returnObj = eval('(' + returnStr + ')');
		if(returnObj.yds.length>=1){
			$("#yd").html("<option value='0'>--请选择--</option>");
			for(var i=0; i<returnObj.yds.length; i++){
				$("#yd").append("<option value='" + returnObj.yds[i].ydid + "'>" + returnObj.yds[i].ydtext + "</option>");
			}
		}
	});
}
</script>
</html>