<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<%@ include file="/inc/taglibs.inc" %>
<%@ include file="/inc/ProjectJQuery.inc" %>
<%
	String urlPortal = request.getParameter("urlPortal");
	if(urlPortal == null || urlPortal.length() == 0){
		urlPortal = "";
	} else {
		URLDecoder url = new URLDecoder();
		urlPortal = url.decode(urlPortal, "UTF-8");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>

    <head>
    	<base href="<%=basePath %>"/>

        <title>资产管理系统</title>
        <script>
        	$(function(){
        		tree = new dhtmlXTreeObject("west", "100%", "100%", 0);
	            tree.setSkin('dhx_skyblue');
	            tree.setImagePath("<%=basePath %>resource/js/DHtmlXTree/imgs/csh_bluefolders/");
	            tree.setOnClickHandler(tonClick);
	            tree.loadXML("<%=basePath %>menuData.jspa?parid=131");
        	});
            function tonClick(itemId){
                var mainWindow = document.getElementById("mainWindow");
                var url = tree.getUserData(itemId, "link");
				//取得导航路径
				var pathString = tree.getItemText(itemId);
				//取得主panel
				//var p = $('body').layout('panel', 'center').panel();
				while(tree.getParentId(itemId)!= '0'){
					var itemId = tree.getParentId(itemId);
					pathString = tree.getItemText(itemId) + ">>" + pathString;
				}
				
                if (url != null && url != "") {
                	if(url.indexOf("?")>0){	 // modify by xuecj  2010-11-12 10:20 
						url = url  + "&id=" + new Date();
					}else{
						url = url  + "?id=" + new Date();
					}
					/**
				    p.panel('header').html("\
						<div class='panel-title'>"+ pathString +"</div>\
						<div class='panel-tool'>\
						</div>\
    		   		");
    		   		**/
    		   		$(".layout-panel-center").find(".panel-title").html(pathString);
					mainWindow.src = url;
                }
            }
			
			function clearPanelTool(){
				var panelTools = $(".layout-panel-center").find(".panel-tool");
				$(panelTools).html("");
			}
			
			function addButtonsFromChildren(buttonStr,createDivStr){
				clearPanelTool();
				$(".layout-panel-center ~ div").not(".layout-expand").remove();
				$("body").append(createDivStr);
				var panelTools = $(".layout-panel-center").find(".panel-tool");
				addButtons(panelTools,buttonStr);
			}
			/**
			function addButtonsFromChildren2(buttonStr,createDivStr){
				$("body").append(createDivStr);
				//alert($("body:last-child").html());
				var panel = $('body').layout('panel', 'center').panel();
				var panelHeader = panel.panel('header');
				var panelTools = panelHeader.find(".panel-tool");
				addButtons(panelTools,buttonStr);
			}
			**/
			function removeById(id){
				$("#" + id).hide();
			}
			
			function appendButtonsFromChildren(buttonStr,createDivStr){
				$("#appMenuButtonDiv").html("");
				$("#menuButtonDiv").append(createDivStr);
				var panelTools = $(".layout-panel-center").find(".panel-tool");
				appendButtons(panelTools,buttonStr);
			}
			
			function prependButtonsFromChildren(buttonStr,createDivStr){
				$("#preMenuButtonDiv").html("");
				$("#preMenuButtonDiv").append(createDivStr);
				var panelTools = $(".layout-panel-center").find(".panel-tool");
				prependButtons(panelTools,buttonStr);
			}
			
			function hideObj(searchStr){
				$(searchStr).hide();
			}
			
			function showObj(searchStr){
				$(searchStr).show();
			}
			
			function setClass(searchStr,newClass){
				$(searchStr).attr("class",newClass);
			}
			
			function setHtml(searchStr,newHtml){
				$(searchStr).html(newHtml);
			}
			
			function removeObj(searchStr){
				$(searchStr).remove();
			}
			
			var allButtonHtml = "";
			function delButton(searchStr){
				var panelTools = $(".layout-panel-center").find(".panel-tool");
				allButtonHtml = $(panelTools).html();
				$(searchStr).remove();
			}
			
			function showAllButton(){
				var panelTools = $(".layout-panel-center").find(".panel-tool");
				$(panelTools).html(allButtonHtml);
			}
        </script>
    </head>
    <body class="easyui-layout">
    	<div id="appMenuButtonDiv" style="display: none;"></div>
    	<div id="preMenuButtonDiv" style="display: none;"></div>
        <div id="north" region="north" title="模块导航" split="true" style="height:110px;background:#B3DFDA;">
          <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="385" rowspan="3"><img src="resource/ProjectImages/top_r1_c1.jpg" alt="" width="385" height="74" /></td>
              <td width="100%" rowspan="3" background="resource/ProjectImages/top_r1_c3.jpg">&nbsp;</td>
              <td width="61" rowspan="3"><img src="resource/ProjectImages/top_r1_c7.jpg" alt="" width="76" height="74" /></td>
              <td width="385" background="resource/ProjectImages/index_r1_c6.jpg">&nbsp;</td>
              <td width="59"><a href="index.do"><img border="0" src="resource/ProjectImages/index_r1_c21.jpg" alt="" width="59" height="22" /></a></td>
              <td width="74"><a href="auth/auth_login.do"><img   border="0" src="resource/ProjectImages/index_r1_c24.jpg" alt="" width="73" height="22" /></a></td>
            </tr>
            <tr>
              <td colspan="3"><img src="resource/ProjectImages/index_r2_c6.jpg" alt="" width="517" height="18" /></td>
            </tr>
            <tr>
              <td colspan="3" background="resource/ProjectImages/index_r3_c26.jpg" bgcolor="#2B8585"><img src="resource/ProjectImages/gjtop_r1_c1.jpg" alt="" width="201" height="34" /><img src="resource/ProjectImages/top1.jpg" width="316" height="34" /></td>
            </tr>
          </table>
    	</div>
        <div id="west" region="west" split="true" title="菜单" style="width:200px;padding:10px;">
        </div>
        <div id="sss" align="center" region="center" title="资产处置" scrolling="no">
            <%
        	if(urlPortal == null || urlPortal.length() == 0){
	        %>
	        <iframe id="mainWindow" width=100% style="height:100%;border:none;" src="<s:url value="/workflow/userTask_findMyTodo.do" />">
	            </iframe>
	        <%
	        	} else {
	        %>
			<iframe id="mainWindow" width=100% style="height:100%;border:none;" src="<%=basePath + urlPortal%>">
	            </iframe>
			<%
				}
			%>
        </div>
    </body>
</html>
