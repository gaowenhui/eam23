<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@page import="java.net.URLDecoder"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String urlPortal = request.getParameter("urlPortal");
	if(urlPortal == null || urlPortal.length() == 0){
		urlPortal = "";
	} else {
		URLDecoder url = new URLDecoder();
		urlPortal = url.decode(urlPortal, "UTF-8");
	}
%>
<html>
	<head>
		<base href="<%=basePath %>">
		<meta http-equiv="Content-Type" content="text/html; charset=GBK">
		<title>资产管理系统</title>
		<script>
            $(function(){
                var p = $('body').layout('panel', 'center').panel();
                //alert(p.panel('header').html());
                p.panel('header').html("\
					<div class='panel-title'>诉讼管理</div>\
					<div class='layout-tool'>\
						<div style='padding:0px;width:300px;height:15px;'>\
							\
						</div>\
					</div>\
            				");

                $('#mb1').menubutton({
                    menu: '#mm1',
                    duration: 9999999999
                   // plain: false
                });
				$('#mb2').menubutton({
                    menu: '#mm2',
                    duration: 9999999999

                });
				$('#mb3').menubutton({
                    menu: '#mm3',
                    duration: 9999999999
                });
              });
            
            function tonClick(itemId){
                var mainWindow = document.getElementById("mainWindow");
                var url = tree.getUserData(itemId, "link");
				var pathString = tree.getItemText(itemId);
				//取得主panel
				var p = $('body').layout('panel', 'center').panel();
				while(tree.getParentId(itemId)!= '0'){
					var itemId = tree.getParentId(itemId);
					pathString = tree.getItemText(itemId) + ">>" + pathString;
				}
                if (url != null && url != "") {
               		if(url.indexOf("?")>0){	 // add by xuechongjie  2010-12-5 
						url = url  + "&dateid=" + new Date();
					}else{
						url = url  + "?dateid=" + new Date();
					}
                    mainWindow.src = url;
					  p.panel('header').html("\
						<div class='panel-title'>"+ pathString +"</div>\
						<div class='layout-tool'>\
						<div style='padding:0px;width:200px;'>\
						\
				    	\
						</div>\
						</div>\
				 ");
				  $('#mb1').menubutton({
                    menu: '#mm1',
                    duration: 9999999999
                   // plain: false
                });
				$('#mb2').menubutton({
                    menu: '#mm2',
                    duration: 9999999999
                });
                }
            }
        </script>
	</head>
	<body class="easyui-layout">
		<div region="north" title="模块导航" split="true"
			style="height: 110px; background: #B3DFDA;">
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
		<div id="west" region="west" split="true" title="  菜单"
			style="width: 200px; padding: 10px;">
		</div>
		<script type="text/javascript">
            tree = new dhtmlXTreeObject("west", "100%", "100%", 0);
            tree.setSkin('dhx_skyblue');
            tree.setImagePath("<%=basePath%>resource/js/DHtmlXTree/imgs/csh_bluefolders/");
            tree.setOnClickHandler(tonClick);
            tree.loadXML("<%=basePath %>menuData.jspa?parid=96");
        </script>
		<div align="center" region="center" title="诉讼管理" scrollg="no">
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
		<!-- muneButton数据源 -->
	</body>
</html>
