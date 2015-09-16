<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ page import="com.tansun.rdp4j.workflow.task.vo.WorkflowSvgComponentVO"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>

<title>流程跟踪图</title>
<SCRIPT type=text/JavaScript>
 
</SCRIPT>

</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

		<table"testsvgTable" >
			<tr>
				<td valign="top">
					<table class="newTable" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td class="panel-header" align="center">
								环节名称
							</td>
							<td class="panel-header" align="center">
								提交人
							</td>
							<td class="panel-header" align="center">
								提交部门
							</td>
							<td class="panel-header" align="center">
								提交时间
							</td>
							<td class="panel-header" align="center">
								状态
							</td>
						</tr>
						<%
						List list = (List)request.getAttribute("list");
						if(list!=null&&list.size()>0){
							for(int i=0;i<list.size();i++){
								WorkflowSvgComponentVO vo = (WorkflowSvgComponentVO)list.get(i);
						%>
							<tr>
							<td class="panel-header" align="center">
								<%="".equals(vo.getHjmc())?"&nbsp;":vo.getHjmc() %>
							</td>
							<td class="panel-header" align="center">
								<%="".equals(vo.getTjr())?"&nbsp;":vo.getTjr() %>
							</td>
							<td class="panel-header" align="center">
								<%="".equals(vo.getTjbm())?"&nbsp;":vo.getTjbm() %>
							</td>
							<td class="panel-header" align="center">
								<%="".equals(vo.getTjsj())?"&nbsp;":vo.getTjsj() %>
							</td>
							<td class="panel-header" align="center">
								<%="".equals(vo.getZt())?"&nbsp;":vo.getZt() %>
							</td>
						</tr>
						<%
							}
						}
						%>
					</table>
				</td>
			</tr>
		</table>

	</body>

</html>