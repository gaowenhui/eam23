<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQueryZSK.inc"%>
<%
	String xmlStr = (String)request.getAttribute("xmlStr");
	String option = request.getParameter("option");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table id="conditions" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
	<tr>
		<td>
<table align="center">
	<%if(StringUtils.equals("czpgsc",option)){ %>
   	<tr>
        <td class="td_form01" colspan="2"><input type="button" class="buttonface" value="确定" onclick="callBackGet();"></td>
    </tr>
    <%} %>
    <tr>
        <td align="center" class="td_zxy02" valign="top">
            <div id="treeboxbox_tree" style="width:350px; height:500px;background-color:#f5f5f5;border :1px solid Silver;; overflow:auto;"></div>
        </td>
        <td valign="top"  align="center">
       		<textarea rows="12" cols="70" id="neirong" style="width:350px; height:500px;background-color:#f5f5f5;border :1px solid Silver;; overflow:auto;" readonly="readonly"></textarea>
        </td>
    </tr>
</table>
		</td>
	</tr>
</table>
</body>
<script>
	function doLog(str) {
	    var log = document.getElementById("logarea");
	    log.innerHTML = log.innerHTML + str + "</br>";
	    log.scrollTop = log.scrollHeight;
	}
	var xmlStr = '<%=xmlStr%>';
	tree = new dhtmlXTreeObject("treeboxbox_tree", "100%", "100%", 0);   //新建一个tree在div  treeboxbox_tree里面
	tree.setSkin('dhx_skyblue'); //设置皮肤颜色
	tree.setImagePath(basePathJs + "resource/js/DHtmlXTree/imgs/csh_yellowbooks/");   //设置图标
	tree.enableDragAndDrop(false);  //是否可以拖拉
	tree.enableItemEditor(false);  // 是否可以修改
	tree.attachEvent("onSelect", beforeMove); // 拖动前
	tree.loadXML(basePathJs + "zccz/knowQuery_getTree.do");
	
	function beforeMove(sId){
		document.getElementById('neirong').value = tree.getItemText(sId);
	}
	
	// 选择一条记录并点击确定
	function callBackGet(){
		var YJId = tree.ah();  // 意见id
		var level = tree.sS(YJId);  // 节点等级
		if(YJId == null || YJId == ''){
			alert('请先选择一条记录');
			return false;
		}
		if(level == 2 || level == 1){
			alert('请选择意见即三级节点');
			return false;
		}
		var YJText = tree.getItemText(YJId);  // 意见text
		var YDId = tree.getParentId(YJId); // 要点id
		var YDText = tree.getItemText(YDId); // 要点text
		var XMId = tree.getParentId(YDId); // 项目id
		var XMText = tree.getItemText(XMId); // 项目text
		window.opener.getYJValue(XMId,XMText,YDId,YDText,YJId,YJText);
		window.close();
	}
</script>
</html>