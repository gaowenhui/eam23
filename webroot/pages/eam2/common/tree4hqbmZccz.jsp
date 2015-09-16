<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%
	String deptType = request.getParameter("deptType");
	String ids = request.getParameter("ids");
	String multi = request.getParameter("multi");
	String option = request.getParameter("option");
	multi = (multi == null || multi.length() == 0) ? "true" : multi;
	String url = "";
	String id = "";
	if("1".equals(deptType)){
		url = "/deptData0.jspa?tid=113&parid=1&include=false&level=2";
		id = "113";
	}else if("0".equals(deptType)){
		if(StringUtils.equals("pgsc",option)){
			url = "/deptData0.jspa?tid=10775&parid=1&include=false&level=2&option=pgsc";
		}else{
			url = "/deptData0.jspa?tid=10775&parid=1&include=false&level=2";
		}
		id= "10775";
	}
%>
<html>
<head>
<title>部门人员信息</title>
<SCRIPT type="text/JavaScript">
	var idArray;
	$(function(){
		hqbmTree.attachEvent("onCheck", function(id,state){
			if(state == 1){
				var index = idArray.indexOf(id);
				if(index == -1){
					idArray.insert(index, id);
				}
			}else if(state == 0){
				idArray.remove(id);
			}
		});
		hqbmTree.attachEvent("onXLE", function(tree,id){
			hqbmTree.openItem("<%=id%>");
			if("<%=ids%>" != "null" && "<%=ids%>" != null && "<%=ids%>".length != 0){
				idArray = "<%=ids%>".split(",");
				for(var i = 0; i < idArray.length; i++){
					hqbmTree.setCheck(idArray[i], 1);
				}
			}else{
				idArray = new Array();
			};
		});
	});
function queding(){
	if('<%=multi%>' == 'false'){
		var idsValue1 = hqbmTree.getSelectedItemId();
		var value1 = hqbmTree.getSelectedItemText();
		window.opener.getCallBack4Tree(idsValue1,value1);
		window.close();	
	}else{
		if(idArray.length != 0){
			var value = "";
			var idsValue = "";
			for(var i = 0; i < idArray.length; i++){
				value += hqbmTree.getItemText(idArray[i]);
				idsValue += idArray[i];
				if(i < idArray.length - 1){
					value += ",";
					idsValue += ",";
				}
			}
			if("<%=deptType%>" == "0"){
				window.opener.getCallBack4Tree(idsValue,value);
			}else if("<%=deptType%>" == "1"){
				window.opener.getCallBack4Tree1(idsValue,value);
			}
			window.close();
		}else{
			if("<%=deptType%>" == "0"){
	            window.opener.getCallBack4Tree("","");
	        }else if("<%=deptType%>" == "1"){
	            window.opener.getCallBack4Tree1("","");
	        }
	        window.close();
		}
	}
}
</SCRIPT>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<table>
		<tr>
			<td>
				<s:submit value="确定" onclick="queding();"></s:submit>
				<s:submit value="取消" onclick="javaScript:window.close()"></s:submit>
			</td>
		</tr>	
		<tr>
			<td valign="top">
				<e:itree imagePath="/resource/js/DHtmlXTree/imgs/csh_dhx_skyblue" width="100%" height="100%" multipe="<%=multi %>" threeState="false" 
					dataUrl="<%=url %>" id="hqbm" skin="csh_dhx_skyblue" style="width:400;height:500"></e:itree>
			</td>
		</tr>

	</table>	
</body>
</html>



