<%@page language="java" pageEncoding="UTF-8"%>
<%@page import="com.tansun.rdp4j.common.util.PageableList"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/header-standard.inc"%>
<%@page import="java.util.*"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@taglib prefix="query" uri="/query"%>
<link rel="stylesheet" href="../resource/css/maincss.css" type="text/css">
<script language="javascript"> 
			function addElement(elementName,elementValue){ 
				var autoAddDiv =document.getElementById("autoAdd"); 
				var newInput = document.createElement("input");  
				newInput.type="hidden";  
				newInput.name=elementName; 
				newInput.value=elementValue; 
				autoAddDiv.appendChild(newInput);
			} 
			function go(){
				var go_input=document.getElementById("goInput").value;
				if(isNaN(go_input) || go_input < 1 || go_input > ${paginator.pageCount}){    
         			alert('请输入1--' + ${paginator.pageCount} + '的整数');  
         			document.getElementById("goInput").value = "";
         			return false;
       			}else{
       				document.getElementById('currentPage').value=go_input;
       				//addElement('paginator.currentPage',go_input);
       				addElement('paginator.sorttye','${paginator.sorttye}');
       				addElement('paginator.sortname','${paginator.sortname}');
       				document.forms[0].submit();
       			} 
			}
			
			
			function gogogo(elementName,elementValue,sorttye,sortname){
				document.getElementById('currentPage').value=elementValue;
				document.getElementById('sorttye').value=sorttye;
				document.getElementById('sortname').value=sortname;
       			document.forms[0].submit();
			}
			
			
			function sort(sorttye,sortname){
				document.getElementById('sorttye').value=sorttye;
				document.getElementById('sortname').value=sortname;
       			document.forms[0].submit();
			}
			function querycallback(){
				var value1=document.form1.idvalues.value;
				/*
				var ids=document.getElementsByName("ids");
				callbackvalue='';
				for(i=0;i<ids.length;i++){
					if(ids[i].checked){
						if(i==0){
							callbackvalue= ids[i].value;
						}else{
							callbackvalue=callbackvalue+","+ids[i].value;
						}
					}	
				}*/
				
				window.opener.querycallback(value1);
				window.close();
			}
			
			
			function checkAll(value){
			
				var value1=document.form1.idvalues.value;//.replace(',,',',');
				var pageids='';
				var ids=document.getElementsByName("ids");
					for(i=0;i<ids.length;i++){
						
						ids[i].checked=value;
						if(value){
							pageids=pageids+","+ids[i].value;
						}else{
							value1 = value1.replace(ids[i].value+',','');
						}
					}
				if(pageids.length>1){
					document.form1.idvalues.value= value1+pageids;
				}else{
					document.form1.idvalues.value= value1.replace(',,',',');
				}
			}
			function submit(){
			var ids=document.getElementsByName("ids");
				callbackvalue='';
				for(i=0;i<ids.length;i++){
					if(ids[i].checked){
						if(i==0){
							callbackvalue = ids[i].value;
						}else{
							callbackvalue = callbackvalue+","+ids[i].value;
						}
					}
				}
				alert(callbackvalue);
				form1.submit();
			}
			
			function clearquery(){
				document.form1.reset();
				document.form1.idvalues.value='';
			}
			</script>
			<body class='body1'>
			<!--  PopCalendar Start (frame name and id must match)--->
		<IFRAME id=popFrame style="BORDER-RIGHT: 2px ridge; BORDER-TOP: 2px ridge; Z-INDEX: 65535; VISIBILITY: hidden; BORDER-LEFT: 2px ridge; BORDER-BOTTOM: 2px ridge; POSITION: absolute"  name=popFrame src="<%=path %>/pages/rdp4j/query/date.html" frameBorder=0 scrolling=no width="162" height="202"></IFRAME>
		<SCRIPT>document.onclick=function() {document.getElementById("popFrame").style.visibility="hidden";}</SCRIPT>
		<!--  PopCalendar End --->
			<table align="center" cellspacing="1" cellpadding="1" class="tabletitle">
	<tr height="25">
		<td class="formtitle">&nbsp;&nbsp;当前位置:选择资产</td>
	</tr>
	<tr>
		<td valign="top" align="center">
<form name='form1' method='post' action='selectzc.do'>
	<query:table name="x" leixing='text' bianhao="xx" actionbeanid="${bid}" />
	<table   width='100%' class='table1' cellspacing='1' cellpadding='1'>
	${headsort}
	
	<s:iterator value='#request.qlist.Results' status='st' id="boxmap">
	<tr>
	<s:iterator value='#boxmap' status='st' id="xxx">
	<td>	<s:property value="#xxx.toString()" escape="false"></s:property></td>
		</s:iterator>
</tr>
	</s:iterator>
	<input type='hidden' value='全选' class='button1' algin=center onclick='checkAll(this.checked)'>
	<input type='button' value='查询' class='button1' algin=’center' onclick='submit()' >
	<input type='button' value='回调函数' class='button1' algin=center onclick='querycallback()'>
	<input type='button' value='清空' class='button1' algin=center  onclick='clearquery()'>
	当前选中值：<input type='text'   name='idvalues' value='${queryids}'>
	</table>
	<c:foreach var="boxmap" items="${requestscope.qlist}">
		<c:foreach var="map" items="${boxmap}">
			<c:foreach var="map_value" items="${map.value}"> ${map_value.boxdagid}</c:foreach>
		</c:foreach>
	</c:foreach>
	<%
		PageableList list = (PageableList) request.getAttribute("qlist");
		List list1 = list.getResults();
	%>
	<table width="96%" border="0" align="center" cellpadding="0" cellspacing="0" class="table1">
		<tr align="left">
			<td align="right">
				第${paginator.currentPage}页&nbsp;&nbsp;
				共${paginator.pageCount}页&nbsp;
				当前显示${paginator.currentStart}-${paginator.currentEnd}条 &nbsp;
				<a href="#"
					onclick="gogogo('paginator.currentPage','1','${paginator.sorttye}','${paginator.sortname}')">首页</a>
				<a href="#"
					onclick="gogogo('paginator.currentPage','${paginator.currentPage-1}','${paginator.sorttye}','${paginator.sortname}')">上一页</a>
				<a href="#"
					onclick="gogogo('paginator.currentPage','${paginator.currentPage+1}','${paginator.sorttye}','${paginator.sortname}')">下一页</a>
				<a href="#"
					onclick="gogogo('paginator.currentPage','${paginator.pageCount}','${paginator.sorttye}','${paginator.sortname}')">末页</a>&nbsp;
			</td>
			<td width="30" align="right">
				<input type="text" class="width20px" size="2" maxlength="10"
					value='${paginator.currentPage}'
					title="请输入 1--${paginator.pageCount} 的整数" name="goInput" />
			</td>
			<td width="10">
				<input name="" type="image" src="../resource/images/go.gif" alt="go"
					align="left" onclick="go();return false;" />
			</td>
		</tr>
	</table>
	<div id="autoAdd">
	<div style='display:none'>
		sql
		<input type='text' name='sql' value="${sql}">
		</br>
		bid
		<input type='text' name='bidx' value="${bid}">
		</br>
		queryFields
		<input type='text' name='queryFields' value="${queryFields}">
		</br>
		当前页码
		<input type='text' name='paginator.currentPage' id='currentPage' value='${paginator.currentPage}'>
		</br>
		总页数
		<input type='text' name='paginator.pageCount'
			value='${paginator.pageCount}'>
		</br>
		每页行数
		<input type='text' name='paginator.pageSize'
			value='${paginator.pageSize}'>
		</br>
		记录总数
		<input type='text' name='paginator.count' value='${paginator.count}'>
		</br>
		排序方式（升序、降序）
		<input type='text' name='paginator.sorttye' id='sorttye' value='${paginator.sorttye}'>
		</br>
		排序字段
		<input type='text' name='paginator.sortname' id='sortname' value='${paginator.sortname}'>
		</br>
		</div>
</form>
</td></tr></table>

<script language="javascript">
var ids1=document.form1.idvalues.value;

//alert(ids1);
var ids=ids1.split(",");
var ids2=document.getElementsByName("ids");
//alert(ids2);
//alert(ids);

				for(i=0;i<ids.length;i++){
					for(j=0;j<ids2.length;j++){
						if(ids[i]==ids2[j].value){
							ids2[j].checked=true;
						}
					}
				}
	function changevalue(idvalue,checked){
		var value1=document.form1.idvalues.value;
		
		if(checked){
			value1 = value1.replace(idvalue+',','');
			document.form1.idvalues.value=idvalue+","+value1;
		}else{
			if(value1.substring(value1.length-1,value1.length)!=','){
				value1 = value1.replace(idvalue,'');
			}else{
				value1 = value1.replace(idvalue+',','');
			}
			
			document.form1.idvalues.value= value1;
		}
		
	}	
	

				
				</script>
</body>