<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String id = (String) request.getAttribute("sspro_id");
	String ssjdid=(String)request.getAttribute("type");
	String look = (String)request.getAttribute("look");
%>

<html>
	<head>
	<script type="text/javascript">
	
		$(function(){
		$("#cpsxsj").datebox({
	    	formatter:function(date){
	    		return formatDate(date);
	    	}
	    });
	    	if('1' == '<%=look%>'){
			  var a  = document.getElementsByTagName("input");
			  var b  = document.getElementsByTagName("select");
			  var c  = document.getElementsByTagName("textarea");
				for(var i=0;i<a.length;i++){
					a[i].disabled = "true";
				}
				for(var i=0;i<b.length;i++){
					b[i].disabled = "true";
				}
				for(var i=0;i<c.length;i++){
					c[i].disabled = "true";
				}				
			}
	    addStr = $("#TableBox").html();
	});
	</script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<form action='pro_savepro.do' method='post' name='form1'>
		
			<input type='hidden' name='id' id="id" value='${id}'  size='40'/>
			<div style='display:none'>
	附属信息ID<s:textfield name="ssproc.id" value="%{#request.id}"  size="100" ></s:textfield><br>
	基本信息ID<s:textfield type='text' name='ssproc.ssjbxxId' id='ssjbxxId'  size="100"/><br>
	诉讼阶段信息ID	<s:textfield type='text' name='ssproc.ssjdid' id='ssjdid'  size="100" /><br>
	</div>
		<table width="100%" border="0" class="newtable" cellpadding="2"
				cellspacing="0" align="center">
				<tr>
					<td colspan="6" class="td_top" align="left">
						诉讼过程信息 [ <%=("1".equals(request.getAttribute("type")))?"一审":("2".equals(request.getAttribute("type")))?"二审":("3".equals(request.getAttribute("type")))?"执行":"再审" %> ]
					</td>
				</tr>
				<tr>
					<td class="td_form01" width="120">
						诉讼阶段描述：
					</td>
					<td class="td_form02" colspan="5">
						<s:textfield name="ssproc.ssjdms" type="text" id="ssjdms" size="100" style="width:100%"/>
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						管辖/法院/仲裁庭：
					</td>
					<td class="td_form02">
						<s:textfield name="ssproc.zct"  id="zct" size="26" />
					</td>
					<td class="td_form01">
						裁判生效日期：
					</td>
					<td class="td_form02">
						<s:textfield name="ssproc.cpsxsj"  id="cpsxsj" size="26" />
						
					</td>
					<td class="td_form01">
						生效判决结果：
					</td>
					<td class="td_form02">
						<s:textfield name="ssproc.sxpjjg"   id="sxpjjg" size="26"/>
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						案程要述：
					</td>
					<td class="td_form02" colspan="5">
						<s:textarea name="ssproc.acys" id="acys"  cols="50"  rows="3"  style="width:100%"></s:textarea>
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						备注：
					</td>
					<td class="td_form02" colspan="5" >
						<s:textarea name='ssproc.bz'  id='bz' style="width:100%" rows='3'/>
					</td>
				</tr>
				
				
			   <tr>
					<td class="td_form02" colspan="6" >
						<div align="right">
							<input type='button' onclick='form1.submit()' value='保存过程信息' >
						</div>
					</td>
				</tr>
				
			</table>
		</form>
	</body>
</html>