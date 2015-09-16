<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ page import="com.tansun.eam2.jygdzc.vo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
String isModify = (String)request.getAttribute("isModify");
String isLook = (String)request.getAttribute("isLook");
String edit = (String)request.getAttribute("edit");
boolean isLook1 = "view".equals(edit);
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>合同</title>
<script type=text/JavaScript>
$(document).ready(function(){
		jQuery("#xglc_list").setGridWidth($("#mytable").width());
	    $(window).bind('resize', function(){
			jQuery("#xglc_list").setGridWidth($("#mytable").width());
       });
    var buttonBlyjJSonString = '[{"buttonHandler":"addblyjAss","buttonIcon":"icon-add","buttonText":"增加"},\
								{"buttonHandler":"delblyjAss","buttonIcon":"icon-remove","buttonText":"删除"}\
	]';
	addButtons(jQuery("#gview_xglc_list > .ui-jqgrid-titlebar"),buttonBlyjJSonString);
   
});
	// 日期转换
	$(function(){
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
			//document.getElementById('yszj'+i).value = parseFloat(document.getElementById('yszj'+i).value).toFixed(2);
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
	
	function queding(){
		var url = "<%=basePath%>htqs/ContractQuery_updateInfoToBody1.do?headId=${headId}";
		myform.action = url;
		myform.submit();
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
<body  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<input type="hidden" id="chooseDate"/>
<form action=""  id="myform" method="post">
<input type="hidden" id="headId" value="<%=(String)request.getAttribute("headId") %>"/>
<input type="hidden" id="qspc" value="<%=(String)request.getAttribute("qspc") %>"/>
<table id="mytable"  border="0" align="center" cellpadding="0" class="newtable" cellspacing="0">
	<tr>
      <td colspan="18" class="td_top" align="center" >租赁合同清算信息</td>
    </tr>
	<tr>
		<td height=20px width=80px class="td_form01" align="center">序号</td>
		<td class="td_form01" align="center" width=120px>合同编号</td>
		<td class="td_form01" align="center" width=100px>资产名称</td>
		<td class="td_form01" align="center" width=120px>资产编码</td>
		<td class="td_form01" align="center" width=80px>承租人</td>
		<td class="td_form01" align="center" width=80px>月租金</td>
		<td class="td_form01" align="center" width=80px>免租期</td>
		<td class="td_form01" align="center" width=80px>清算起始日期</td>
		<td class="td_form01" align="center" width=80px>清算截止日期</td>
		<td class="td_form01" align="center" width=80px>合同到期日期</td>
		<td class="td_form01" align="center" width=80px>应收租金</td>
		<td class="td_form01" align="center" width=80px>调整金额</td>
		<td class="td_form01" align="center" width=80px>调整后应收</td>
		<td class="td_form01" align="center" width=80px>调整原因</td>
		<td class="td_form01" align="center" width=80px>实收租金</td>
		<td class="td_form01" align="center" width=80px>本次变动金额</td>
		<td class="td_form01" align="center" width=80px>上次变动金额</td>
		<td class="td_form01" align="center" width=80px>本次变动原因</td>
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
				<input type="hidden" id='<%="bodyId"+(i+1) %>' name="bodyId" value="<%="".equals(vo.getBodyId())?"&nbsp;":vo.getBodyId() %>"/>
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
					<%="".equals(vo.getQsjzrq())?"&nbsp;":vo.getQsjzrq() %> 
				</td>	
				<td class="td_form02" align="center"><%="".equals(vo.getHtdqrq())?"&nbsp;":vo.getHtdqrq() %></td>	
				<td class="td_form02" align="center">
					<%=("".equals(vo.getYszj())||vo.getYszj()==null)?"&nbsp;":vo.getYszj() %>
				</td>	
				<td class="td_form02" align="center">
					<%=("".equals(vo.getQstzje())||vo.getQstzje()==null)?"&nbsp;":vo.getQstzje() %>
				</td>
				<td class="td_form02" align="center">
					<%=("".equals(vo.getXghyszj())||vo.getXghyszj()==null)?"0.0":vo.getXghyszj() %>
					<input type="hidden" size="8" id='<%="xghyszj"+(i+1) %>' name="xghyszj" 
						value="<%="".equals(vo.getXghyszj())?"0.0":vo.getXghyszj() %>"/>
				</td>
				<td class="td_form02" align="center">
					<%=("".equals(vo.getYsxgyy())||vo.getYsxgyy()==null)?"&nbsp;":vo.getYsxgyy() %>
				</td>
				<td class="td_form02" align="center">
					<% if(!isLook1){%>
						<input type="text" size="12" id='<%="sszj"+(i+1) %>' name="sszj" onblur="changesszj('<%=i+1 %>')"
						value="<%=("".equals(vo.getSszj())||vo.getSszj()==null)?"0.0":vo.getSszj() %>"/>
					<%}else{ %>
						<%=("".equals(vo.getSszj())||vo.getSszj()==null)?"0.0":vo.getSszj() %>
					<%} %>
				</td>
				<td class="td_form02" align="center">
					<% if(!isLook1){%>
						<input type="text" size="12" id='<%="bcbdje"+(i+1) %>' name="bcbdje"  onblur="changebdje('<%=i+1 %>')"
						value="<%=("".equals(vo.getBcbdje())||vo.getBcbdje()==null)?"0.0":vo.getBcbdje() %>"/>
					<%}else{ %>
						<%=("".equals(vo.getBcbdje())||vo.getBcbdje()==null)?"0.0":vo.getBcbdje() %>
					<%} %>
					
				</td>
				<td class="td_form02" align="center">
					<% if(!isLook1){%>
						<%=("".equals(vo.getScbdje())||vo.getScbdje()==null)?"0.0":vo.getScbdje() %>
						<input type="hidden" size="8" id='<%="scbdje"+(i+1) %>' name="scbdje" 
							value="<%="".equals(vo.getScbdje())?"0.0":vo.getScbdje() %>"/>
					<%}else{ %>
						<%=("".equals(vo.getScbdje())||vo.getScbdje()==null)?"0.0":vo.getScbdje() %>
					<%} %>
					
				</td>
				<td class="td_form02" align="center">
					<% if(!isLook1){%>
						<input type="text" size="12" id='<%="bdyy"+(i+1) %>' name="bdyy"
						value="<%=("".equals(vo.getBdyy())||vo.getBdyy()==null)?"&nbsp;":vo.getBdyy() %>"/>
					<%}else{ %>
						<%=("".equals(vo.getBdyy())||vo.getBdyy()==null)?"&nbsp;":vo.getBdyy() %>
					<%} %>
					
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
			<% if(!isLook1){%>
				<input type="button" value="确定" onclick="queding();"/>
				<input type="button" value="取消" onclick="javaScript:window.close()"/>
			<%} %>
			
		</td>
	</tr>
</table>
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
					<tr>
						<td align="right">
							<table id="xglc_list"> </table>
						</td>
					</tr>
				</table>
</form>
</body>
<script type="text/javascript">
				jQuery("#xglc_list").jqGrid({				
					url:"<%=basePath%>qs/liquidateQuery_xglc.do?headId=${headId}",
					datatype: "json",
				   	colNames:['id','表单id','编号','标题','拟稿人','拟稿日期','提交人','流程名称', '来源'],
				   	colModel:[
				   		{name:'id',index:'id',editable:true,hidden:true},
				   		{name:'bdid',index:'bdid',editable:true,hidden:true},
				   		{name:'bh',index:'bh',editable:true, align:'center'},
				   		{name:'bt',index:'bt',editable:true},
						{name:'ngrName',index:'ngr',editable:true, align:'center'},
				   		{name:'ngrq',index:'ngrq',editable:true, align:'center'},
						{name:'tjrName',index:'ngr',editable:true, align:'center'},
				   		{name:'lcmc',index:'lcmc', align:"right",editable:true, align:'center'},
				   		{name:'source',index:'source', align:"right",editable:true, align:'center'}
				   	],
					multiselect:true,
					rownumbers:true,
					autowidth:true,
					height:'auto',
                    rowNum:0,
					caption: '相关流程',
					jsonReader : {
						root:"rows",
						repeatitems: false,
						id: "0"
					}
				});
				
			
			function delblyjAss(){
				var gr = jQuery("#xglc_list").jqGrid('getGridParam','selarrrow');
				if(gr == ''){
					alert("请选择要删除的记录!"); 		
				}else if(confirm("确认删除！")){
					var delblyjurl ="<%=basePath %>blyj/according_delAccording.do";
					$.post(delblyjurl,{yjids:"" + gr + ""}, function(data){
						jQuery("#xglc_list").trigger("reloadGrid");
					});
				}
			}
			function addblyjAss(){
				var rdBasicWidth = "700px";
				var rdBasicHeight = "400px";
				//
				var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
				var x=(screen.width-800)/2; 
            	var y=(screen.height-400)/2;
            	var qspc = document.getElementById("qspc").value;
				window.open('<%=basePath%>blyj/according_openAccordingView.do?bdid='+qspc,'','height=400, width=800, top=' + y + ', left=' + x + ', toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
			}
			function reloadblyjJqGrid(){
				jQuery("#xglc_list").trigger("reloadGrid");
			}
			
		</script>
<script type=text/JavaScript>
	function changesszj(num){
		var xghyszj = document.getElementById("xghyszj"+num).value;	
		var scbdje = document.getElementById("scbdje"+num).value;
		var sszj = document.getElementById("sszj"+num).value;
		document.getElementById("bcbdje"+num).value = parseFloat(sszj==""?"0":sszj)-parseFloat(xghyszj==""?"0":xghyszj)+parseFloat(scbdje==""?"0":scbdje);
	}
	function changebdje(num){
		var xghyszj = document.getElementById("xghyszj"+num).value;	
		var scbdje = document.getElementById("scbdje"+num).value;
		var bcbdje = document.getElementById("bcbdje"+num).value;
		document.getElementById("sszj"+num).value = parseFloat(xghyszj==""?"0":xghyszj)+parseFloat(bcbdje==""?"0":bcbdje)-parseFloat(scbdje==""?"0":scbdje);
	}
	function chooseDate(id){
		document.getElementById("chooseDate").value = id;
	}
	if('<%=request.getAttribute("message")%>' != "null"&&'<%=request.getAttribute("message")%>' != "") {
		alert("<%=request.getAttribute("message")%>！"); 
		window.opener.reloadJqGrid();
		window.close();
	}
</script>
