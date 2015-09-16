<%@ page language="java" pageEncoding="UTF-8"%>
<#escape x as ((x!)?html)!> <#include "../../common/paginator.html"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>roleedit.html</title>
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="this is my page">
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="../resource/css/maincss.css"	type="text/css">
	</head>
	<body>
		<table align="center" cellspacing="1" cellpadding="1" 	class="tabletitle">
			<tr height="25">
				<td class="formtitle">
					&nbsp;
					<img src="../resource/images/dots1.gif">
					&nbsp;当前位置：编辑角色
				</td>
			</tr>
			<tr>
				<td valign="top" align="center">

					<form action="role_editSub.do" method="post"  name='form1' onsubmit="p_roleinfoFrm.form1.submit()">
						<table cellPadding=0 cellSpacing=1  
							class="table1" >
							<tr>
								<td width="33%" valign="top" colspan=4 height=400px>
									角色名称
									<input type="text" name="oldRole.roleName"
										value="${roleVo.roleName!}" /><br>
									角色描述
									<input type="text" name="oldRole.description"
										value="${roleVo.description!}" />
									<input type="hidden" name="oldRole.tid" value="#{roleVo.tid!}" />
									<br>
<input type="button" name="button" value="修改" class='button1' onclick='submitforms()' />
<input type=button value=删除 class=button1 onclick="if(confirm('确定要进行删除操作吗？')){doAction('delete')}">  
<input type=button value=返回 class=button1 onclick="history.go(-1)">  
 

			
									<br>
								</td>
								<td width='200px'>
								
								<iframe frameBorder="0" id="p_roleinfoFrm" name="p_roleinfoFrm"
			scrolling="auto" src="../funcgroup/funcgroup_checkboxtree.do?tid=#{roleVo.tid!}"
			style="HEIGHT: 100%; VISIBILITY: inherit; WIDTH: 100%; Z-INDEX: 1" align=center></iframe>
								
								</td>
								
								<td width='400px'>
								
								<iframe frameBorder="0" id="p_roleuserFrm" name="p_roleuserFrm"
			scrolling="auto" src="../funcgroup/funcgroup_usercheckboxtree.do?tid=#{roleVo.tid!}"
			style="HEIGHT: 100%; VISIBILITY: inherit; WIDTH: 100%; Z-INDEX: 1" align=center></iframe>
								
								</td>
							</tr>
						</table>
						</form>
						
<script type="text/javascript"> 



function submitforms(){
p_roleinfoFrm.document.getElementById("form1").submit();
p_roleuserFrm.document.getElementById("form1").submit();
}
</script>
	</body>
</html>
</#escape>