<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>资源管理</title>
		<%@ include file="/inc/header-standard.inc"%>
		<script type="text/javascript">
		  function deleteOne(tid){
		     myForm.action="<%=request.getContextPath() %>/funcgroup/funcres_deleteOne.do?resBo.tid="+tid;
		     myForm.submit();
		  }
		  function query(){
		  myForm.action="<%=request.getContextPath() %>/query/query.do?bid=functionGroup";
		  myForm.submit();
		  }
		</script>
	</head>
	<body class='body1'>
		<form action="" method="post" name="myForm">
			<table align="center" class="tabletitle" cellSpacing="1"
				cellPadding="1">
				<tr class="navigation">
					<td class="formtitle">
						<img src="<s:url value="/resource/images/dots1.gif" />">
						当前位置：资源管理
					</td>
				</tr>
				<tr>
					<td valign="top" align="center">
						<table class='table1' cellspacing="1" cellpadding="1" width='95%'>
							<tr>
								<td>
									模块名称
									<input type='text' class='text1' name='moduleName' value=''>
									Action名称
									<input type='text' class='text1' name='actionName' value=''>
									<input type='button' class='button1' value='查询' onclick="query();">
									<input type='button'
										onclick='window.open("<%=request.getContextPath() %>/funcgroup/funcres_findFunctionResList.do","_self")'
										class='button1' value='重置'>
								</td>
							</tr>
						</table>
						<table class='table1' cellspacing="1" cellpadding="1" width='95%'>
							<tr>
								<th width="5%">
									<input type='checkbox'>
								</th>
								<th width="5%">
									序号
								</th>
								<th width="10%">
									模块名称
								</th>
								<th width="10%">
									Action名称
								</th>
								<th>
									Action类
								</th>
								<th width="15%">
									更新时间
								</th>
								<th width="10%">
									操作
								</th>
							</tr>
                            <s:iterator value="functionRes.results" status="st" id="list">
								<s:iterator value="#list" status="ll" id="res">
									<tr>
										<td align="center">
											<input type='checkbox' value="<s:property value="tid" />">
										</td>
										<td align="center">
											<s:property value="#st.count" />
										</td>
										<td align="center">
											<s:property value="#res.moduleName" />
										</td>
										<td align="center">
											<s:property value="#res.actionName" />
										</td>
										<td align="center">
											<s:property value="#res.className" />
										</td>
										<td align="center">
											<s:date name="sysUpdateTime" format="yyyy-MM-dd hh:mm:ss" />
										</td>
										<td align="center">
											<a href='#'
												onclick="deleteOne(<s:property value='#res.tid'/>);">删除</a>
										</td>
									</tr>

								</s:iterator>
							</s:iterator>
							<tr>
								<td colspan='8'>
									<input type='button' value='删除' class='button1'>
								</td>
							</tr>
							<tr>
								<td colspan="8" align="left">
									<div>
										<r:pages pageno="${functionRes.paginator.currentPage}"
											total="${functionRes.paginator.pageCount}" style="table1"
											listname="functionRes" />
									</div>
								</td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>