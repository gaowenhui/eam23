<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQueryZSK.inc"%>
<%
	String headId = (String)request.getAttribute("headId");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>知识库维护</title>
</head>
<body>
<input type="hidden" id="beforeLevel" />
<table id="conditions" width="90%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
    <tr>
    	<td>
<table align="center" class="newTable">
    <tr>
        <td class="td_form01" colspan="2">
        	<div align="left">
            <input type="button" class="buttonface" value="添加项目" onclick="addParent();">&nbsp;
            <input type="button" class="buttonface" value="添加要点" onclick="addChild();">&nbsp;
            <input type="button" class="buttonface" value="删除节点" onclick="deleteTreeNode();">&nbsp;
            <input type="button" class="buttonface" value="迁移" onclick="qianyi();">&nbsp;
            </div>
        </td>
    </tr>
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
tree = new dhtmlXTreeObject("treeboxbox_tree", "100%", "100%", 0);   //新建一个tree在div  treeboxbox_tree里面
tree.setSkin('dhx_skyblue'); //设置皮肤颜色
tree.setImagePath(basePathJs + "resource/js/DHtmlXTree/imgs/csh_yellowbooks/");   //设置图标
tree.enableDragAndDrop(true);  //是否可以拖拉
tree.enableItemEditor(true);  // 是否可以修改
tree.enableMultiselection(1, 1);
tree.enableSmartXMLParsing(true);
tree.setDragBehavior("complex");
tree.Nh(updateTree);
tree.attachEvent("onSelect", beforeMove); // 拖动前
tree.attachEvent("onDrop", moveTree); // 拖动中
//tree.attachEvent("onDragIn", validateMove);
tree.loadXML(basePathJs + "zccz/knowQuery_getLSBTree.do?headId="+'<%=headId%>');

var valueBefore = ''; 
// 修改节点
// state： 0 修改前 1修改中 2修改后 
function updateTree(state,itemId,tree,value){
	var level = tree.sS(itemId);
	if(level == 3){
		return false;
	}
	if(state==0){
		valueBefore = value;
	}
	if((state==2)&&(value==""))
		return false;
	if(state==2){
		if(value == valueBefore) {
			return false;
		}
		var headId = '<%=headId%>';
		var delurl = '<%=basePath%>zccz/knowBody_updateLSB.do';
		$.post(delurl,{headId:"" + headId + "",itemId:"" + itemId + "",value:"" + value + "",level:"" + level + ""}, 
		function(data){
			if(data!=null && data!=''){
				alert(data);
				window.opener.reload();
			}
		});
	}
	return true;
};

// 删除节点
function deleteTreeNode(){
	if(confirm("确认删除？")){
		var itemId = tree.ah();
		var level = tree.sS(itemId);
		var headId = '<%=headId%>';
		var delurl = '<%=basePath%>zccz/knowBody_deleteLSB.do';
		$.post(delurl,{headId:"" + headId + "",itemId:"" + itemId + "",level:"" + level + ""}, function(data){
			if(data!=null && data!=''){
				alert(data);
				tree.deleteItem(tree.ah());
				window.opener.reload();
			}
		});
	}		
}
var moveids;
var isAlert;
var isValid;
var nextids ='';
// 迁移前
function beforeMove(sId){
	//beforeLevel = tree.sS(sId);
	moveids = sId.split(',');
	nextids = '';
	var id = moveids[0];
	isAlert = false;
	isValid = true;
	document.getElementById('beforeLevel').value = tree.sS(id);
	document.getElementById('neirong').value = tree.getItemText(id);
}

function validateMove(dId,lId,sObject,tObject){
	return false;
}
// 迁移
function moveTree(sId,tId,id,sObject,tObject){
	var afterLevel = tree.sS(sId);
	var beforeLevel = document.getElementById('beforeLevel').value;
	if( afterLevel != beforeLevel && !isAlert){
		alert('只能在同一级别下拖动！');
		isAlert = true;
		isValid = false;
		window.location.reload();
	}else if(beforeLevel == 1 || beforeLevel == 2 && !isAlert){
		alert('只能迁移具体意见');
		isAlert = true;
		isValid = false;
		window.location.reload();
	}else if(isValid){
		var index = moveids.indexOf(sId);
		nextids += id;
		if(index < moveids.length - 1){
			nextids += ",";
		}
		if(index == moveids.length - 1){
			var moveurl = '<%=basePath%>zccz/knowBody_moveLSB.do';
			var headId = '<%=headId%>';
			$.post(moveurl,{moveIds:"" + moveids + "",parentId:"" + tId + "",nextId:"" + nextids + "",headId:"" +headId +""}, 
			function(data){
				if(data!=null && data!=''){
					alert(data);
					window.opener.reload();
				}
			});	
		}	
	}
}

// 添加根节点
function addParent(){
	var itemId = tree.ah();
	if(itemId=='' || item==null){
		alert('请先点中一条项目');
		return false;
	}
	var level = tree.sS(itemId);
	var headId = '<%=headId%>';
	if(level == 3){
		alert('不能添加意见');		
		return false;
	}
	if(level == 2){
		alert('请先点中一条项目');
		return false;
	}
	var addurl = "<%=basePath%>zccz/knowBody_addLSBParent.do";
	$.post(addurl,{headId:"" + headId + "",level:"" + level + "",itemId:"" + itemId + ""},
	function(data){
		if(data!=null && data!=''){
			alert(data);
			window.location.reload();
			window.opener.reload();
		}
	});
}

// 添加要点
function addChild(){
	var itemId = tree.ah();
	var itemText = tree.getItemText(itemId);
	if(itemId==''||itemId==null){
		alert('请选择一个项目');
		return false;
	}
	var headId = '<%=headId%>';
	var level = tree.sS(itemId);
	if(level == 2 || level == 3){
		alert('不能添加意见');		
		return false;
	}
	var addurl = "<%=basePath%>zccz/knowBody_addLSBChild.do";
	$.post(addurl,{headId:"" + headId + "",itemId:"" + itemId + "",level:"" + level + "",itemText:"" + itemText + ""}, function(data){
		if(data!=null && data!=''){
			alert(data);
			window.location.reload();
			window.opener.reload();
		}
	});
}

// 点击按钮迁移
function qianyi(){
	var YJId = tree.ah();  // 意见id
	var headId = '<%=headId%>'; // 表头id
	var ids = YJId.split(',');
	var id = ids[0];
	var level = tree.sS(id); // 等级
	if(level == 1 || level == 2){
		alert('只能迁移具体意见！');
		return false;
	}else if(level == 3){
		var type = 'height=230, width=480,toolbar=yes,scrollbars=yes,menubar=yes,resizable=yes,left=100,top=0';
		var url = '<%=basePath%>zccz/knowBody_openMove.do?YJId='+YJId+'&headId='+headId;
		window.open(url,'知识库意见迁移',type);
	}
}

// 刷新页面
function reload(){
	window.opener.reload();
	window.location.reload();
}
</script>
</html>