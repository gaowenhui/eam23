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
	String userName = (String)session.getAttribute("USERNAME");
%>
<html>
    <head>
    	<base href="<%=basePath %>">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>资产管理系统</title>
        <script>
            function tonClick(itemId){
            	var parid = tree.getParentId(itemId);
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
						**/
				    $(".layout-panel-center").find(".panel-title").html(pathString);
    		   		
    		   		if(parid == '24'){
    		   			var height = window.screen.availHeight;
    		   			var width = window.screen.availWidth;
    		   			window.open('<%=basePath%>'+ url,'','height=' +(height - 60)
    		   				+ ', width=' + (width - 10)+ ', toolbar=no, menubar=no, left=0 , top = 0, scrollbars=yes, resizable=yes,location=no, status=yes');
					}else{
						mainWindow.src = basePathJs + url;
						
					}
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
			
			function removeById(id){
				$("#" + id).hide();
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
        </script>
    </head>
    <body class="easyui-layout">
    	 <div id="appMenuButtonDiv" style="display: none;"></div>
    	<div id="preMenuButtonDiv" style="display: none;"></div>
        <div region="north" title="模块导航" border="false" split="true" style="height:105px;background:#B3DFDA;">
       
           <table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="385" rowspan="3"><img src="resource/ProjectImages/top_r1_c1.jpg" alt="" width="385" height="74" /></td>
              <td width="100%" rowspan="3" background="resource/ProjectImages/top_r1_c3.jpg">&nbsp;</td>
              <td width="61" rowspan="3"><img src="resource/ProjectImages/top_r1_c7.jpg" alt="" width="76" height="74" /></td>
              <td width="385" background="resource/ProjectImages/index_r1_c6.jpg">&nbsp;</td>
              <td width="59"><a href="index.do"><img border="0" src="resource/ProjectImages/index_r1_c21.jpg" alt="" width="59" height="22" /></a></td>
              <td width="74"><a href="auth/auth_logout.do"><img   border="0" src="resource/ProjectImages/index_r1_c24.jpg" alt="" width="73" height="22" /></a></td>
            </tr>
            <tr>
              <td colspan="3"><img src="resource/ProjectImages/index_r2_c6.jpg" alt="" width="517" height="18" /></td>
            </tr>
  			<tr>
              <td colspan="3" width="517" height="34" align="right" style="background:url(resource/ProjectImages/top_font_bg.jpg) left top no-repeat #309293;">
              	<span style="padding-right:10px;"><a href="log/download_downLoadHelp.do">下载用户手册</a>&nbsp;&nbsp;欢迎您：<%=userName %></span>
              </td>
            </tr>
          </table>
    	</div>
        <div id="west" region="west" split="true" title="菜单" style="width:200px;padding:10px;">
        </div>
        <script type="text/javascript">
            tree = new dhtmlXTreeObject("west", "100%", "100%", 0);
            tree.setSkin('dhx_skyblue');
            tree.setImagePath("<%=basePath %>resource/js/DHtmlXTree/imgs/csh_bluefolders/");
            tree.setOnClickHandler(tonClick);
            tree.loadXML("<%=basePath %>menuData.jspa?parid=0");
        </script>
        <div id="sss" align="center" region="center" title="资产管理" scrolling="no">
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
