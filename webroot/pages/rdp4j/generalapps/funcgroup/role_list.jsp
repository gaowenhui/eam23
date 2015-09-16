<%@page contentType="text/html;charset=UTF-8"%>
<%@page import="java.util.*"%>
<link rel="stylesheet" href="../resource/css/maincss.css" 	type="text/css">
<html>
	<head>
	</head>

	<body class='body1'>
		<form action='funcgroup_subrole.do'>
			<input type='hidden' name='tid' id='tid'
				value='<%=request.getParameter("tid") %>'>


			<%
				response.setHeader("Pragma", "No-cache");
				response.setHeader("Cache-Control", "no-cache");
				response.setDateHeader("Expires", 0);

				List list = new ArrayList();

				list = (List) request.getAttribute("rolelist");
			%>
			<table align="center" cellspacing="1" cellpadding="1"
				class="tabletitle">
				<tr height="25">
					<td class="formtitle">
						&nbsp;
						<img src="../resource/images/dots1.gif">
						&nbsp;当前菜单ID<%=request.getParameter("tid")%>
						<input type='submit' value='确定' class='button1' onsubmit='alert("权限已经分配给该角色!");window.close()'>
						<input type='button' value='关闭' class='button1' onclick='window.close()'>							
					</td>
				</tr>
				<tr>
					<td valign="top" align="center">
						<table class='table1' cellspacing="1" cellpadding="1" width='95%'>
							<tr>
								<th>
									<input type="checkbox" name="cheeck"
										onclick="checkAll(this.checked);" />
									全选
								</th>
								<th>
									TID
								</th>
								<th>
									角色名称
								</th>
								<th>
									角色描述
								</th>
							</tr>
							<%
								for (int i = 0; i < list.size(); i++) {
									HashMap hash = new HashMap();
									hash = (HashMap) list.get(i);
							%>
							<%
								out
											.println("  <tr><td>	<input type='checkbox' name='roleids' id='node"
													+ hash.get("TID")
													+ "' value='"
													+ hash.get("TID")
													+ "' value='"
													+ hash.get("TID")
													+ "' ></td><td>"
													+ hash.get("TID") + "</td>");
									out.println("<td>" + hash.get("ROLE_NAME") + "</td>");
									out.println("<td>" + hash.get("ROLE_DESC") + "</td></tr>");
								}
							%>
						</table>
					</td>
				</tr>
			</table>
		</form>

		<script>
	
function checkAll(value){
			var roleids=document.getElementsByName("roleids");
			for(i=0;i<roleids.length;i++){
				roleids[i].checked=value;
			}
}
	${strjschecktree}
	</script>
	</body>
</html>