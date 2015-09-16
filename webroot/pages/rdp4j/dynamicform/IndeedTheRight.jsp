<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>资源管理</title>
		<%@ include file="/inc/header-standard.inc"%>
		<script type="text/javascript">
		  function button1(){
		    myForm.action="<s:url value="/itr/itr_switch2wf01.do" />";
		    myForm.submit();
		  }
		    function button2(){
		    myForm.action="<s:url value="/itr/itr_switch2wf02.do" />";
		    myForm.submit();
		  }
		    function button3(){
		    myForm.action="<s:url value="/itr/itr_switch2wf03.do" />";
		    myForm.submit();
		  }
</script>
	</head>

	<body class='body1'>
		<r:controlfile file="/pages/rdp4j/dynamicform/IndeedTheRight.ctl.xml"></r:controlfile>
		<table align="center" class="tabletitle" cellSpacing="1"
			cellPadding="1">
			<tr class="navigation">
				<td class="formtitle">
					<img src="<s:url value="/resource/images/dots1.gif" />">
					当前位置：动态表单
				</td>
			</tr>
			<tr>
				<td>

                    <r:submit type="button" value="button1" cssClass="button1" id="button1" />
                    <r:submit type="button" value="button2" cssClass="button1" id="button2" />
                    <r:submit type="button" value="button3" cssClass="button1" id="button3" />
                    
					<s:form action="/itr/itr_switch2wf01.do" name="myForm">
						<br>
						<br />
						<table class='table1' cellspacing="1" cellpadding="1" width='95%'>
							<tr>
								<td width="20%">
									标题
								</td>
								<td>
									<r:textfield label="标题" name="title" id="title" />
								</td>
							</tr>
							<tr>
								<td>
									申请日期
								</td>
								<td>
									<r:textfield label="申请日期" name="applyDate" id="applyDate" />
								</td>
							</tr>
							<tr>
								<td>
									申请部门
								</td>
								<td>
									<r:textfield label="申请部门" name="applyDept" id="applyDept" />
								</td>
							</tr>

							<tr>
								<td>
									事件类型
								</td>
								<td>
									<r:select name="eventType" list="#{}" id="eventType" parRefKey="040"/>
								</td>
							</tr>
							<tr>
								<td>
									意见
								</td>
								<td>
									<r:textarea label="意见" name="comments" id="comments" />
								</td>
							</tr>
						</table>
                        <s:submit type="button" value="switch2wf01" cssClass="button1" onclick="button1();"></s:submit>
                        <s:submit type="button" value="switch2wf02" cssClass="button1" onclick="button2();"></s:submit>
                        <s:submit type="button" value="switch2wf03" cssClass="button1" onclick="button3();"></s:submit>
					</s:form>
				</td>
			</tr>
		</table>
	</body>
</html>
