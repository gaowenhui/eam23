<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ page import="com.tansun.eam2.jygdzc.vo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
String isModify = (String)request.getAttribute("isModify");
String isLook = (String)request.getAttribute("isLook");
String htlx = (String)request.getAttribute("htlx");
boolean isWght = "1".equals(htlx); //1是委管合同，2是租赁合同
 %><%
		List list1 = (List)request.getAttribute("list");
		int size = 0;
		if(list1!=null && list1.size()>0){
			size = list1.size();
		}
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>合同</title>
<script type=text/JavaScript>
	// 日期转换
	$(function(){
		if("true"=="<%=isLook%>"){
			$("input").attr("disabled","disabled");
		}
		$(".ss").datebox({
			formatter:function(date){
				return formatDate(date);
			},
			onSelect:function(){
				var xuhao = document.getElementById("chooseDate").value;
				changeDate(xuhao);
			}
		});
		var tbody = document.getElementById("mytable");
		var shuliang = tbody.rows.length;
		for(var i = 1;i<=shuliang-2;i++){
			document.getElementById('yszj'+i).value = parseFloat(document.getElementById('yszj'+i).value).toFixed(2);
		}
	});
	function changeDate(id){
		var htbh = document.getElementById("htbh"+id).value;
		//var bodyId = document.getElementById("bodyId"+id).value;
		var qsjzrq = document.getElementById("qsjzrq"+id).value;
		$.post("<%=basePath%>htqs/ContractQuery_getSszj.do",{ 
			"headId":"123",
			//"bodyId":bodyId,
			"htbh":htbh,
			"qsjzrq":qsjzrq
		},function(data){
			var id = String(document.getElementById("chooseDate").value);
			document.getElementById("yszj"+id).value = parseFloat(data).toFixed(2);
			var val = document.getElementById("qstzje"+id).value;
			document.getElementById("xghyszj"+id).value = (parseFloat(val==""?"0":val) + parseFloat(data)).toFixed(2);
		});
	}
	function checkTiaozhengyuanyin(){
		var size = document.getElementById("size").value;
		for(var i = 1;i<=size;i++){
			var tiaozhengjine = document.getElementById('qstzje'+i).value;
			if(tiaozhengjine!=""){
				if(document.getElementById("tzyy"+i).value==""){
					alert("调整金额输入后，调整原因不能为空！");
					return false;
				}
			}
		}
		return true;
	}
	function queding(){
		var lskdjf = checkTiaozhengyuanyin();
		if(!lskdjf){
			return false;
		}
		var url = "<%=basePath%>htqs/ContractQuery_updateInfoToBody.do?headId=${headId}";
		myform.action = url;
		myform.submit();
	}
	
	function window.onbeforeunload(){
		//window.opener.refreshlist();
		window.returnValue="refresh11111111111111111";//不需要刷列表 modify by lantianbo 
		
	}
	
	function getJE(num){
		var yszjStr = "yszj"+num;
		var qstzjeStr = "qstzje"+num;
		var xghyszjStr = "xghyszj"+num;
		var yszj = $("#"+yszjStr).val();
		var qstzje = $("#"+qstzjeStr).val();
		$("#"+xghyszjStr).val(yszj*1+1*qstzje);
	}
	function changeYszj(num){
		getJE(num);
	}
</script>
</head>
<base target="_self"/>
<body  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<input type="hidden" id="size" value="<%=size %>"/>
<input type="hidden" id="chooseDate"/>
<form action=""  id="myform" method="post">
<input type="hidden" id="headId" value="<%=(String)request.getAttribute("headId") %>"/>
<br>
<table id="mytable" width="100%" border="0" align="center" cellpadding="0" class="newtable" cellspacing="0">
	<tr>
      <td colspan="14" class="td_top" align="center" >清算信息</td>
    </tr>
	<tr>
		<td height=20px class="td_form01"  align="center">序号</td>
		<td class="td_form01" align="center">合同编号</td>
		<td class="td_form01" align="center">资产名称</td>
		<td class="td_form01" align="center">资产编码</td>
		<td class="td_form01" align="center">承租人</td>
		<td class="td_form01" align="center">月租金</td>
		<td class="td_form01" align="center">免租期</td>
		<td class="td_form01" align="center">清算起始日期</td>
		<td class="td_form01" align="center">清算截止日期</td>
		<td class="td_form01" align="center">合同到期日期</td>
		<td class="td_form01" align="center">应<%=isWght?"付":"收" %>租金</td>
		<td class="td_form01" align="center">调整金额</td>
		<td class="td_form01" align="center">调整后应<%=isWght?"付":"收" %></td>
		<td class="td_form01" align="center">调整原因</td>
	</tr>
	<tbody id="interval_row_id">
	<%
		List list = (List)request.getAttribute("list");
		if(list!=null && list.size()>0){
			ClearQueryVO vo = new ClearQueryVO ();
			for(int i = 0;i<list.size();i++){
				vo = (ClearQueryVO)list.get(i);
	%>
	<tr>
				<td class="td_form02" align="center"><%=i+1 %></td>	
				<td class="td_form02" align="center"><%="".equals(vo.getHtbh())?"&nbsp;":vo.getHtbh() %>
				<input type="hidden" id='<%="htbh"+(i+1) %>' name="htbh" value="<%="".equals(vo.getHtbh())?"&nbsp;":vo.getHtbh() %>"/>
				<input type="hidden" id='<%="bodyId"+(i+1) %>' name="bodyId" value="<%="".equals(vo.getId())?"&nbsp;":vo.getId() %>"/>
				</td>	
				<td class="td_form02" align="center"><%="".equals(vo.getZcmc())?"&nbsp;":vo.getZcmc() %></td>	
				<td class="td_form02" align="center"><%="".equals(vo.getZcbh())?"&nbsp;":vo.getZcbh() %></td>	
				<td class="td_form02" align="center"><%="".equals(vo.getCzr())?"&nbsp;":vo.getCzr() %></td>	
				<td class="td_form02" align="center"><%="".equals(vo.getYzj())?"&nbsp;":vo.getYzj() %></td>	
				<td class="td_form02" align="center"><%="".equals(vo.getMzq())?"&nbsp;":vo.getMzq() %></td>	
				<input type="hidden" size="8" id='<%="mzq"+(i+1) %>' name="mzq" readonly="readonly"
						value="<%="".equals(vo.getMzq())?"&nbsp;":vo.getMzq() %>"/>
				<td class="td_form02" align="center"><%="".equals(vo.getQsksrq())?"&nbsp;":vo.getQsksrq() %>
					<input type="hidden" size="8" id='<%="qsksrq"+(i+1) %>' name="qsksrq" readonly="readonly"
						value="<%="".equals(vo.getQsksrq())?"&nbsp;":vo.getQsksrq() %>"/>
				</td>	
				<td class="td_form02" align="center">
					<% if(!"true".equals(isLook)){%>
						<s:date name="qsjzrq" format="yyyy-MM-dd" var="draftDate"/>
					<%} %>
					<input type="text" name="qsjzrq" id='<%="qsjzrq"+(i+1) %>' class="input ss"  readonly="readonly"
						onclick="chooseDate('<%=i+1 %>')" value="<%="".equals(vo.getQsjzrq())?"&nbsp;":vo.getQsjzrq() %>" />
				</td>	
				<td class="td_form02" align="center"><%="".equals(vo.getHtdqrq())?"&nbsp;":vo.getHtdqrq() %></td>	
				<td class="td_form02" align="center">
					<input  type="text" size="8" readonly="readonly" id='<%="yszj"+(i+1) %>' name="yszj" 
					value="<%=("null".equals(vo.getYszj())||vo.getYszj()==null)?"&nbsp;":vo.getYszj() %>" onblur="getJE(<%=(i+1)%>)"/>
				</td>	
				<td class="td_form02" align="center">
					<input type="text" size="8" id='<%="qstzje"+(i+1) %>' name="qstzje" onblur="getJE(<%=(i+1)%>)"
					value="<%=("null".equals(vo.getQstzje())||vo.getQstzje()==null)?"":vo.getQstzje() %>"/>
				</td>
				<td class="td_form02" align="center">
					<input type="text" size="8" readonly="readonly" id='<%="xghyszj"+(i+1) %>' name="xghyszj" onblur="getJE(<%=(i+1)%>)"
					value="<%=("null".equals(vo.getXghyszj())||vo.getXghyszj()==null)?"":vo.getXghyszj() %>"/>
				</td>
				<td class="td_form02" align="center">
					<input type="text" size="12" id='<%="tzyy"+(i+1) %>' name="tzyy"
					value="<%=("null".equals(vo.getYsxgyy())||vo.getYsxgyy()==null)?"":vo.getYsxgyy() %>"/>
				</td>	
	</tr>
	<%			
			}
		}
	%>
	</tbody>
</table>  
<table>
<tr>
		<td>
			<% if(!"true".equals(isLook)){%>
				<input type="button" value="确定" onclick="queding();"/>
				<input type="button" value="取消" onclick="javaScript:window.close()"/>
			<%} %>
			
		</td>
	</tr>
</table>
</form>
</body>
<script type=text/JavaScript>
	function chooseDate(id){
		document.getElementById("chooseDate").value = id;
	}
	if('<%=request.getAttribute("message")%>' != "null") {
		window.returnValue="refresh11111111111";//modify lantianbo 因为这个不需要刷新合同列表
		if(String(window.opener)=='undefined'){
			window.parent.dialogArguments.refreshlist();
		}else{
			window.opener.refreshlist();		
		}
		alert("<%=request.getAttribute("message")%>！"); 
		
		window.close();
	}
</script>
