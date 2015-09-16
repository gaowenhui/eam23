<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQueryZSK.inc"%>
<%@ include file="/inc/exportExcel.inc"%>
<%
	String xmlStr = (String)request.getAttribute("xmlStr");
	String xmid = (String)request.getAttribute("xmid");
	String ydid = (String)request.getAttribute("ydid");
	String option = (String)request.getAttribute("option");
	String xm = "";
	String yd = "";
	if(!"".equals(xmid) && xmid!=null){
		xm = xmid;
	}
	if(!"".equals(ydid) && ydid!=null){
		yd = ydid;
	}
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
<title>审查知识库</title>
<script type="text/javascript" language="JavaScript">


	$(function(){
		var xm = '<%=xm%>';
		var yd = '<%=yd%>';
		tree = new dhtmlXTreeObject("treeboxbox_tree", "100%", "100%", 0);   //新建一个tree在div  treeboxbox_tree里面
		tree.setSkin('dhx_skyblue'); //设置皮肤颜色
		tree.setImagePath("<%=request.getContextPath()%>/resource/js/DHtmlXTree/imgs/csh_yellowbooks/");   //设置图标
		tree.enableDragAndDrop(false);  //是否可以拖拉
		tree.enableItemEditor(false);  // 是否可以修改
		tree.attachEvent("onSelect", beforeMove); // 拖动前
		tree.loadXML("<%=request.getContextPath()%>/zccz/knowQuery_getTreeNew.do?xmid="+xm+"&ydid="+yd);
		
		if(window.parent.clearPanelTool){
			window.parent.clearPanelTool();
		}
		<%
		if(xmid != null){
		%>
			var xmId = "<%=xmid%>";
			document.getElementById("xm").value = xmId;
			$.ajaxSetup({
				async : false
			});
			YDRefresh(document.getElementById("xm"));
			<%
			if(ydid != null){
			%>	
				var ydidValue = "<%=ydid%>";
				$("#yd option[value='" + ydidValue + "']").attr("selected",true);
			<%
			}
			%>
			$.ajaxSetup({
				async : true
			});
		<%
		}
		%>
	});
</script>
</head>
<body>
<s:hidden name ="option" id ="option"></s:hidden>
<s:hidden name="fstree" id="fstree" value="%{#request.fstree}" ></s:hidden>
<s:hidden name="sedtree" id="sedtree" value="%{#request.sedtree}" ></s:hidden>
<s:hidden name="threetree" id="threetree" value="%{#request.threetree}" ></s:hidden>
<s:form id="myform">
<table id="conditions" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
	<tr>
		<td class="td_zxy01">审查项目：</td>
		<td class="td_zxy02">
			<s:select id="xm" name="xm" list="XMList" listKey="id" listValue="value" headerValue="--请选择--" headerKey="" onchange="YDRefresh(this)" />
		</td>
	</tr>
	<tr>	
		<td class="td_zxy01">审查要点：</td>
		<td class="td_zxy02">
			<select name="yd" id="yd"><option></option></select>
		</td>
	</tr>
	<tr>
		<td class="td_form01" colspan="6">
			<input type="button" value="查询" class="buttonface" onclick="query();">&nbsp;&nbsp;
			<input type="reset" value="重置" class="buttonface"/>
			<%if(StringUtils.equals("czpgsc",option)){ %>
        	    <input type="button" class="buttonface" value="确定" onclick="callBackGet();">&nbsp;&nbsp;
   			<%} %>
   			 <input type="button" value="导出" class="buttonface" onclick="daochu();">
		</td>
	</tr> 
</table>

<table  id="conditions" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newtable">
    <tr>
        <td align="center" valign="top">
            <div id="treeboxbox_tree" style="width:350px; height:500px;background-color:#f5f5f5;border :1px solid Silver;; overflow:auto;"></div>
        </td>
        <td align="center" valign="top">
       		<textarea id="neirong" style="width:350px; height:500px;background-color:#f5f5f5;border :1px solid Silver;; overflow:auto;" readonly="readonly"></textarea>
        </td>
    </tr>
</table>
</s:form>
<table id="purchase_list" style="display:none" bgcolor="000000">
</table>
</body>
<script type="text/javascript">
function YDRefresh(fl){
	var url = "<%=request.getContextPath()%>/zccz/knowQuery_findYDList.do";
	$.post(url,{"pid" : fl.value},function(returnStr){
		var returnObj = eval('(' + returnStr + ')');
		if(returnObj.yds.length>=1){
			$("#yd").html("<option>--请选择--</option>");
			for(var i=0; i<returnObj.yds.length; i++){
				$("#yd").append("<option value='" + returnObj.yds[i].ydid + "'>" + returnObj.yds[i].ydtext + "</option>");
			}
		}
	});
}

// 查询
function query(){
	var xmid = document.getElementById("xm").value;
	var ydid = document.getElementById("yd").value;
	//var option = document.getElementById("option").value;
	var option = '<%=option%>';
	myform.action = '<%=basePath%>zccz/knowQuery_queryNew.do?xmid='+xmid+'&ydid='+ydid+'&option='+option;
	myform.submit();
}

function doLog(str) {
    var log = document.getElementById("logarea");
    log.innerHTML = log.innerHTML + str + "</br>";
    log.scrollTop = log.scrollHeight;
}

function beforeMove(sId){
	document.getElementById('neirong').value = tree.getItemText(sId);
}
	
// 选择一条记录并点击确定
function callBackGet(){
	var YJId = tree.ah();  // 意见id
	var level = tree.sS(YJId);  // 节点等级
	var XMId="",XMText="",YJText="",YDId="",YDText="";
	if(YJId == null || YJId == ''){
		alert('请先选择一条记录');
		return false;
	}
	<%if(StringUtils.equals("czpgsc",option)){ %>//评估审查（不一定非要选择3级节点）
		if(level == 1){
			XMId = tree.ah(); // 项目id
			XMText = tree.getItemText(XMId); // 项目text
		}else if(level == 2){
			YDId = tree.ah(); // 要点id
			YDText = tree.getItemText(YDId); // 要点text
			XMId = tree.getParentId(YDId); // 项目id
			XMText = tree.getItemText(XMId); // 项目text
		}else{
			YJText = tree.getItemText(YJId);  // 意见text
			YDId = tree.getParentId(YJId); // 要点id
			YDText = tree.getItemText(YDId); // 要点text
			XMId = tree.getParentId(YDId); // 项目id
			XMText = tree.getItemText(XMId); // 项目text
		}
		window.opener.getYJValue(XMId,XMText,YDId,YDText,YJId,YJText);
		alert("添加意见成功!");
	<%}else{%>
		if(level == 2 || level == 1){
			alert('请选择意见即三级节点');
			return false;
		}
		YJText = tree.getItemText(YJId);  // 意见text
		YDId = tree.getParentId(YJId); // 要点id
		YDText = tree.getItemText(YDId); // 要点text
		XMId = tree.getParentId(YDId); // 项目id
		XMText = tree.getItemText(XMId); // 项目text
		window.opener.getYJValue(XMId,XMText,YDId,YDText,YJId,YJText);
		window.close();
	<%}%>
}


</script>
<script type="text/javascript">
//导出Excel
function daochu(){
    var strUrl="com.tansun.eam2.zccz.action.KnowQueryAction&com.tansun.eam2.zccz.vo.PgsczckBO";
    var fstree = document.getElementById("fstree").value;
    var sedtree = document.getElementById("sedtree").value;
    var threetree = document.getElementById("threetree").value;
    var cp = jQuery("#purchase_list").getGridParam('page');
    var ps = jQuery("#purchase_list").getGridParam('rowNum');
    var params = "{\"pgsczckBO.firsttree\":\"" + fstree + "\",";
        params += "\"pgsczckBO.sceondtree\":\"" + sedtree + "\",";
		params += "\"pgsczckBO.threetree\":\"" + threetree + "\",";
		params += "\"paginator.currentPage\":\"" + 1 + "\",";
		params += "\"paginator.pageSize\":\"" + 10000000 + "\"}";
    exportExcel("purchase_list",strUrl,params,'评估审查知识库','rn,cb');
}

function queryExcel(){
     idStr = new Array();
    var fstree = document.getElementById("fstree").value;
    var sedtree = document.getElementById("sedtree").value;
    var threetree = document.getElementById("threetree").value;
    jQuery("#purchase_list").setGridParam({
	    postData:{
	    'pgsczckBO.firsttree':fstree,
	    'pgsczckBO.sceondtree':sedtree,
	    'pgsczckBO.threetree':threetree
	    },
	    url:"<%=basePath%>zccz/knowQuery_queryNew.do"
	    }).trigger("reloadGrid");
}


jQuery("#purchase_list").jqGrid({
		url:"<%=basePath %>zccz/knowQuery_queryNew.do",
		datatype:"json",
		colNames:['审查项目','审查要点','审查意见'],
		colModel:[
		    {name:'firsttree',index:'firsttree',align:"center"},
			{name:'sceondtree',index:'sceondtree',align:"center"},
			{name:'threetree',index:'threetree',align:"center"}
		],
		loadComplete:function(data){
			if(data && data.rows.length>0){
				jQuery("#purchase_list").setGridHeight(data.rows.length * 22 + 18);
			}else{
				jQuery("#purchase_list").setGridHeight(0);
			}
		},
		shrinkToFit:false,
		multiselect:false,
		rownumbers:true,
		autowidth:true,
		height:1,
		
		viewrecords:false,
		rowNum:3,
		prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
	  	rowList:[10],
	  	ondblClickRow:function(gr){
			lookAsset(gr);
		},
		onSelectRow: function(rowid, status){
			if(status){
				idStr.insert(idStr.length, rowid);
			}else{
				idStr.remove(rowid);
			}
		},
		onSelectAll:function(ids, status){
			if(status){
				for(var i = 0; i < ids.length; i++){
					if(ids[i] != null && ids[i].length != 0){
						var index = idStr.indexOf(ids[i]);
						if(index == -1){
							idStr.insert(idStr.length, ids[i]);
						}
					}
				}
			}else{
				for(var i = 0; i < ids.length; i++){
					if(ids[i] != null && ids[i].length != 0){
						var index = idStr.indexOf(ids[i]);
						if(index != -1){
							idStr.removeAt(index);
						}
					}
				}
			}
		},
		gridComplete:function(){
			var allIds = jQuery("#purchase_list").jqGrid('getDataIDs');
			for(var i = 0; i < allIds.length; i++){
				var index = idStr.indexOf(allIds[i]);
				if(index != -1){
					idStr.removeAt(index);
					jQuery("#purchase_list").setSelection(allIds[i]);
				}
			}
		},
		jsonReader:{
			root:"rows",
			page:"page",
			total:"total",
			records:"records",
			repeatitems:false,
			id:"0"
		}
	});  
</script>
</html>