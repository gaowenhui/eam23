<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>功能管理</title>
		<%@ include file="/inc/header-standard.inc"%>
		<SCRIPT language="javascript">
		function doSubmit(){
		         form1.action='funcgroup/funcgroup_editsub.do?tid=${functionGroup.tid}';
		         form1.target='_self';
		         form1.submit();  
		}       
		
		function selectRole(){
		         form1.action='../pages/rdp4j/common/menu/p_menurole.jsp';
		         form1.target='_self';
		         form1.submit();
		}		
		
		function doDelete(id){
			if(confirm("确定删除?")){
			if(confirm("确定删除?")){
			if(confirm("确定删除?")){
			
			
		         form1.action='funcgroup/funcgroup_del.do?tid='+id;
		         form1.target='_self';
		         form1.submit();
		    }
		    }
		    }
		    
		}

		<%
		if(request.getParameter("UpperID")==null){
		%>
        window.parent.contentLeft.location.reload();
		<%
		}
		%>
</SCRIPT>

	</head>
	<body class="body1">
		<table align="center" cellspacing="1" cellpadding="1"
			class="tabletitle">
			<tr class="navigation">
				<td class=formtitle>
					<img src="<%=request.getContextPath()%>/resource/images/dots1.gif">
					功能修改
				</td>
			</tr>
			<tr>
				<td valign=top align=center>
					<form name="form1" method="post">
						<table class='table1' cellspacing=1 cellpadding=1>
							<tr>
								<td>
									功能编号
								</td>
								<td>
									<input type="text" name="functionGroup.tid"
										value="${functionGroup.tid}" size="50" class='text1' readOnly>
								</td>
							</tr>
							<tr>
								<td>
									功能名称
								</td>
								<td>
									<input type="text" name="functionGroup.funcGroupName"
										value="${functionGroup.funcGroupName}" size="50" class='text1'
										maxlength="50" vmode='not null' vdisp='菜单名称' vtype='string'>
								</td>
							</tr>
							<tr>
								<td>
									上级节点
								</td>
								<td>
									<input type='text' name='functionGroup.parId' class='select1'
										size="50" value='${functionGroup.parId}' size='1'
										maxlength='10'>
								</td>
							</tr>
							<tr>
								<td>
									功能类型
								</td>
								<td>
									${menutypeselect}
								</td>
							</tr>
							<tr>
								<td>
									功能地址
								</td>
								<td>
									<input type='text' size='50' class='text1' id='url' 	value='${functionres.moduleName}/${functionres.actionName}.do'>
									<input type="text" name="functionGroup.functionId"
										value="${functionGroup.functionId}" size="10" id='functionId'
										class='text1' maxlength="200" vdisp='菜单地址' vtype='string'>
									<input type='button' vmode='not null'
										onclick='window.open("funcgroup_selectfuncres.do","_blank","width=800,height=400")'
										class='button1' value='选择'>
								</td>
							</tr>
							<tr>
								<td>
									链接参数
								</td>
								<td>
									<input type='text' name='functionGroup.parameter'
										class='select1' size="50" value='${functionGroup.parameter}'
										size='1'>
								</td>
							</tr>
							<tr>
								<td>
									排序值
									<!-- <input type="text" name="functionGroup.sortOrder" value="${functionGroup.sortOrder}"
										size="50"  class='text1' vdisp='排序值' vtype='int'
										vmode='not null'> -->
								</td>
								<td>
									<select name="functionGroup.sortOrder">
										<option value='${functionGroup.sortOrder}'>
											${functionGroup.sortOrder}
										</option>
										<%
											for (int i = 1; i < 100; i++) {
												out.println("<option value='" + i + "'>" + i + "</option>");
											}
										%>
									</select>
								</td>
							</tr>
							<tr>
								<td>
									目标框架
								</td>
								<td>
									<select name="functionGroup.target" class='select1'>
										<option value='${functionGroup.target}' selected>
											${functionGroup.target}[当前]
										</option>
										<option value='mainFrm'>
											mainFrm[主框架]
										</option>
										<option value='_blank'>
											_blank[新窗口]
										</option>
									</select>
								</td>
							</tr>
							<tr>
								<td colspan="2">
									<input type=button class=button1 value='添加' onclick="window.open('funcgroup_add.do?pid=${functionGroup.tid}','_self')">
									<input type=button class=button1 value='删除' onclick=doDelete('${functionGroup.tid}')>
									<input type=button class=button1 value=保存 onclick="doSubmit();">
									<input type=button class=button1 value=返回 onclick=history.back()>
									<input type=button class=button1 value='分配角色'
										onclick='window.open("funcgroup_rolelist.do?tid=${functionGroup.tid}","_blank","width=400,height=400,scrollbars=yes")'>
								</td>
							</tr>
						</table>
					</form>
				</td>
			</tr>
		</table>
	</body>
</html>