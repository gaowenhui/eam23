<%@page import="java.util.*" %>
<%@ include file="inc.jsp"%>
<%@page import= "com.tansun.rdp4j.common.util.*"%>

<html>
<head>
<%@page contentType="text/html;charset=UTF-8"%>
<link rel="stylesheet" href="<%=request.getContextPath() %>/demo/css/maincss.css" type="text/css">
<script type="text/javascript" src="<%=request.getContextPath() %>/demo/js/validate.js"></script>
</head>
<body class="body1"> 

<table align=center cellspacing="1" cellpadding="1" class=tabletitle>
	<tr height=25>
		<td class=formtitle>&nbsp;<img src=<%=request.getContextPath() %>/resource/images/dots1.gif>&nbsp;增加菜单
		</td>
	</tr>
	<tr>
		<td valign=top align=center>
<form name="form1" method="post" >
        <table class='table1' cellspacing=1 cellpadding=1>	
						<tr>
								<td>
									菜单名称&nbsp;
									<input type="text" name="functionGroup.funcGroupName" value=""
									size="50"class='text1' maxlength="50" vmode='not null'
										vdisp='菜单名称' vtype='string'>
								</td>
							</tr>
							<tr>
								<td>
									上级菜单&nbsp;

									<input type='text' name='functionGroup.parId' class='select1'  size="50"
										value='<%=request.getParameter("pid") %>' size='1' maxlength='10'>

								</td>
							</tr>
							<tr>
								<td>
									菜单地址&nbsp;
									
									<input type='text' size='50' class='text1'  id='url' value='${functionres.moduleName}/${functionres.actionName}/${functionres.methodName}.do'>
									<input type="text" name="functionGroup.functionId" 
									id='functionId' 	class='text1' maxlength="200" vdisp='菜单地址' vtype='string'  vmode='not null' value='0'><input type='button' onclick='window.open("funcgroup_selectfuncres.do","_blank","width=700,height=300")' class='button1' value='选择'>
								</td>
							</tr>
							<tr>
								<td>
									 菜单类型&nbsp;${menutypeselect}
								</td>
							</tr>
							
							<tr>
								<td>
									排序值&nbsp;&nbsp;&nbsp;
										<select name="functionGroup.sortOrder"  >
										<% for(int i=1;i<100;i++){
										out.println("<option value='"+i+"'>"+i+"</option>");
										} %>
										</select>
								</td>
							</tr>
							<tr>
							<td>
							目标框架
							<select name="functionGroup.target"  class='select1'  >                                             
                          <option value='mainFrm' selected>mainFrm</option>    
                          <option value='_blank'>_blank</option>                                                           
                    </select>
							</td>
							</tr>
							<tr>
							<td>
							连接参数
							<input type='text' name='functionGroup.parameter' class='select1'  size="50"
										value='' size='1' >
							</td>
							</tr>
						</table>
            
</form>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
<tr> 
          <td align="center">
          <input  type="button"  name="button1" class="button1"   value="添加"  onclick=doSubmit() > 
           <input  type="button"  name="button1" class="button1"   value="返回"  onclick=history.back() > 
          </td>         
</tr>
</table> 
</TD>
  </TR>
</TABLE>   
</body>
</html>
<SCRIPT language="javascript">   	 	
function doSubmit()
{
      if(doValidate(form1))
      {
         form1.action='funcgroup_addsub.do';
         form1.target='_self';
         form1.submit();
      }	 
}
</SCRIPT>