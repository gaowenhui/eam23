<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/header-standard.inc"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<title>rolelist.html</title>
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="this is my page">
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<script language='javascript'>
function checkAll(value){
var roleids=document.getElementsByName("roleids");
for(i=0;i<roleids.length;i++){
roleids[i].checked=value;
}
}
function delAll(){
form1.action='role_delAll.do';
form1.submit();
}
</script>
	<body class='body1'>
		
	<form name='form1' id='from1' action='role_query.do'>

			<table align="center" cellspacing="1" cellpadding="1"
				class="tabletitle">
				<tr height="25">
					<td class="formtitle">
						&nbsp;
						<img src="../resource/images/dots1.gif">
						&nbsp;当前位置：角色列表
					</td>
				</tr>
				<tr>
					<td valign="top" align="center">
						<table cellpadding=1 cellspacing=1 class="table1" align=center>
							<tr>
								<td width='25%' colspan=2>
									角色名称或描述
									<input type='text' name='roleVo.roleName' size='20'
										value='${roleVo.roleName}' maxlength='25' class='text1'
										vmode='not null' vdisp='角色名称' vtype='string'>
									<input type=submit value='查询' class=button1>
									<input type=button value='重置' class=button1
										onclick='window.location.href="role_list.do"'>
								</td>
							</tr>
						</table>
						<table cellpadding=1 cellspacing=1 class="table1" align=center>
						</table>
						<table class='table1' cellspacing="1" cellpadding="1">
							<tr>
								<th>
								<input type='checkbox' name='checktids' onclick='checkAll(this.checked)'>
									全选
								</th>
								<th>
								<a href="#" onclick="gosort('${pagebleListName}.paginator.currentPage','${roleList.paginator.currentPage}','DESC','roleName')"><img src='../resource/images/arrow-down.gif' border='0' /></a>
角色名称
<a href="#" onclick="gosort('${pagebleListName}.paginator.currentPage','${roleList.paginator.currentPage}','ASC','roleName')"><img src='../resource/images/arrow-up.gif' border='0'  /></a>

								</th>
								<th>
		<a href="#" onclick="gosort('${pagebleListName}.paginator.currentPage','${roleList.paginator.currentPage}','DESC','roleDesc')"><img src='../resource/images/arrow-down.gif' border='0' /></a>
			角色描述
		<a href="#" onclick="gosort('${pagebleListName}.paginator.currentPage','${roleList.paginator.currentPage}','ASC','roleDesc')"><img src='../resource/images/arrow-up.gif' border='0'  /></a>
								</th>
								<th>
									操作
								</th>

							</tr>
							<s:iterator value="roleList.results" status="st" id="list">
								<s:iterator value="#list" status="ll" id="role">
									<tr>
										<td align="center">
											<input type='checkbox' name='roleids' value='<s:property value="#role.tid" />' >
										</td>
										<td align="center">
											<s:property value="#role.roleName" />
										</td>
										<td align="center">
											<s:property value="#role.roleDesc" />
										</td>
										<td align="center"> 
											<a href="<%=request.getContextPath() %>/priv/role_edit.do?tid=<s:property value="#role.tid" />"
												target='_self'>编辑</a>
											<a href="<%=request.getContextPath() %>/priv/role_listUser.do?tid=<s:property value="#role.tid" />"
												target='_self'>查看用户</a>
											<a href="<%=request.getContextPath() %>/priv/role_deleterole.do?tid=<s:property value="#role.tid" />"
												target='_blank' >删除</a>
										</td>
									</tr>
								</s:iterator>
							</s:iterator>
							<tr>
								<td colspan=5>
									<input type='button' class='button1' value='删除' name="del"
										onclick='delAll()'>
									<input type='button' value='新增' class='button1'
										onclick='window.location.href="role_add.do"'>
								</td>
							</tr>
						</table>
						<r:pages pageno="${roleList.paginator.currentPage}"
							total="${roleList.paginator.pageCount}" style="table1" 
							  listname="roleList" />
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>