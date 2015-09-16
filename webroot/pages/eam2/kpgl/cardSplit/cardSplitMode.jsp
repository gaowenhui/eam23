<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/kpgl/checkJS.inc" %>
<%
String headId = (String)request.getAttribute("headId");
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>按比例拆分</title>
<link href="../../css/style.css" rel="stylesheet" type="text/css" />
<script language=JavaScript type=text/JavaScript>
var baifenArray = new Array();
	var yzArray = new Array();
function gongyong(row,obj){
	var checkNum = checkNum1(row);
	if (checkNum==false||row<=1){
		alert("请输入正确的拆分份数!");
		obj.value = "";
		obj.focus(); 
		return false;
	}
	var total = 0;
	var yzTotal = 0;
	var ybyz = parseFloat(document.getElementById("ybyz").value);
	for(var a=0;a<row;a++){
		if(a==row-1){
			baifenArray[a]=((((parseFloat(1)-parseFloat(total))).toFixed(4))*100).toFixed(2);
			yzArray[a] = (ybyz-yzTotal).toFixed(2);
			break;
		}
		var baifenbi1 = (parseFloat(1)/parseFloat(row)).toFixed(4); 
		total = parseFloat(total)+parseFloat(baifenbi1);
		baifenArray[a] = (parseFloat(baifenbi1)*parseFloat(100)).toFixed(2);
		yzArray[a] = (ybyz*baifenArray[a]/parseFloat(100)).toFixed(2);
		yzTotal = parseFloat(yzTotal)+parseFloat(yzArray[a]);
	}
}
function addRow(){
	var row=document.getElementById("number").value;
	var s = gongyong(row,document.getElementById("number"));
	if(s==false){
		return false;
	}
	mybody=document.getElementsByTagName("body")[0];
	table=document.getElementById("mytable");
	mytablebody=document.getElementById("mytbody");
	var rowNum = table.rows.length;

	if(rowNum > 1){
		for(var i = table.rows.length -1; i>0;i--){
			var tableRow = table.rows.length;
			table.deleteRow(i);  		
		}
	}
	for(var j = 0; j < row; j++) {
		current_row = document.createElement("tr");
		current_cell = document.createElement("td"); 
		currenttext = document.createTextNode("请输入百分比");
		current_cell.appendChild(currenttext);
		current_row.appendChild(current_cell);
		current_cell2 = document.createElement("td"); 
		current_cell2.innerHTML="<input type='text' id='baifen_"+j+"' name='baifen' onblur='jisuan2("+(j)+");' value='"+baifenArray[j]+"'/>%"; 
		current_cell3 = document.createElement("td"); 
		current_cell3.innerHTML="<input type='button' onclick='tiaozheng("+(j)+");' value='调整'/>"; 
		current_row.appendChild(current_cell2);
		current_row.appendChild(current_cell3);
	   current_cell3 = document.createElement("td"); 
	   currenttext3 = document.createTextNode("拆分后原值");
	   current_cell3.appendChild(currenttext3);
	   current_row.appendChild(current_cell3);
	   current_cell4 = document.createElement("td"); 
	   current_cell4.innerHTML="<input type='text' id='yuanzhi_"+j+"' name='yuanzhi' disabled='true' value='"+yzArray[j]+"' />"; 
       current_row.appendChild(current_cell4);
	   mytablebody.appendChild(current_row);
	}
	current_rowa = document.createElement("tr");
	current_cella = document.createElement("td"); 
	currenttexta = document.createTextNode("剩余百分比");
	current_cella.appendChild(currenttexta);
	current_rowa.appendChild(current_cella);
	current_cell2a = document.createElement("td"); 
	current_cell2a.innerHTML="<input type='text' id='baifen_shengyu' disabled='true' value='0'/>%"; 
	current_rowa.appendChild(current_cell2a);
	mytablebody.appendChild(current_rowa);
	mytable.appendChild(mytablebody);
}
function tiaozheng(index){
	var i = String(index);
	var shengyu = parseFloat(document.getElementById("baifen_shengyu").value);
	document.getElementById("baifen_shengyu").value='0';
	var baifen = (shengyu +parseFloat(document.getElementById("baifen_"+i).value)).toFixed(2);
	document.getElementById("baifen_"+i).value = baifen;
	var ybyz = document.getElementById('ybyz').value;
	var row=document.getElementById("number").value;
	var total = 0;
	for(var j=0;j<row;j++){
		if(index !=j){
			var yuanzhi = document.getElementById('yuanzhi_'+j).value;
			total = parseFloat(total)+parseFloat(yuanzhi);
		}
	}
	document.getElementById('yuanzhi_'+i).value = (parseFloat(ybyz)-total).toFixed(2);
}
function tiaozheng1(index){
	var i = String(index);
	var shengyu = parseFloat(document.getElementById("yuanzhi_shengyu").value);
	document.getElementById("yuanzhi_shengyu").value='0';
	var yuanzhi = (shengyu +parseFloat(document.getElementById("yuanzhi_"+i).value)).toFixed(2);
	document.getElementById("yuanzhi_"+i).value = yuanzhi;
	var ybyz = document.getElementById('ybyz').value;
	var row=document.getElementById("number2").value;
	var total = 0;
	for(var j=0;j<row;j++){
		if(index !=j){
			var baifenbi = document.getElementById('baifen_'+j).value;
			total = parseFloat(total)+parseFloat(baifenbi);
		}
	}
	document.getElementById('baifen_'+i).value = (parseFloat(100)-total).toFixed(2);
}
function jisuan2(index){
	var i = String(index);
	var baifen = document.getElementById('baifen_'+i).value;
	var checkNum = checkFloat1(baifen);
	if (checkNum==false){
		alert("请输入正确的百分比!");
		document.getElementById('baifen_'+i).value = baifenArray[index];
		document.getElementById('yuanzhi_'+i).value = yzArray[index];
		shengyubaifenbi();
		return false;
	}
	if(parseFloat(baifen)>100){
		alert('百分比不能大于100');
		document.getElementById('baifen_'+i).value = baifenArray[index];
		document.getElementById('yuanzhi_'+i).value = yzArray[index];
		shengyubaifenbi();
		return false;
	}
	document.getElementById('baifen_'+i).value=parseFloat(baifen).toFixed(2);
	var ybyz = document.getElementById('ybyz').value;
	document.getElementById('yuanzhi_'+i).value = (parseFloat(ybyz)*parseFloat(baifen)/parseFloat(100)).toFixed(2);
	shengyubaifenbi();
}
function shengyubaifenbi(){
	var row=document.getElementById("number").value;
	var total = 0;
	for(var i=0;i<row;i++){
		total = total + parseFloat(document.getElementById('baifen_'+i).value);
	}
	document.getElementById("baifen_shengyu").value = (100-total).toFixed(2);
}
function checkFloat1(value){
	var shuliang = 0;
	if(value!=""){
		for(var i=0;i<value.length;i++){
			if(num == '.'){
				shuliang = shuliang+1;
				if(shuliang>1){
					return false;
				}
			}
		}
		for(var i=0;i<String(value).replace('.','').length;i++){
			var num = String(value).replace('.','').charAt(i);
			if(num<'0' || num>'9'){
				return false;
			}
		}
		return true;
	}
}
function addRow1(){
	var row=document.getElementById("number2").value;
	var s = gongyong(row,document.getElementById("number2"));
	if(s==false){
		return false;
	}
	mybody=document.getElementsByTagName("body")[0];
	table=document.getElementById("mytable");
	mytablebody=document.getElementById("mytbody");
	var rowNum = table.rows.length;

	if(rowNum > 1){
		for(var i = table.rows.length -1; i>0;i--){
			var tableRow = table.rows.length;
			table.deleteRow(i);  		
		}
	}
	for(var j = 0; j < row; j++) {
		current_row = document.createElement("tr");
		current_cell = document.createElement("td"); 
		currenttext = document.createTextNode("请输入百分比");
		current_cell.appendChild(currenttext);
		current_row.appendChild(current_cell);
		current_cell2 = document.createElement("td"); 
		current_cell2.innerHTML="<input type='text' id='baifen_"+j+"' name='baifen' disabled='true' value='"+baifenArray[j]+"'/>%"; 
		current_row.appendChild(current_cell2);
	   current_cell3 = document.createElement("td"); 
	   currenttext3 = document.createTextNode("拆分后原值");
	   current_cell3.appendChild(currenttext3);
	   current_row.appendChild(current_cell3);
	   current_cell4 = document.createElement("td"); 
	   current_cell4.innerHTML="<input type='text' id='yuanzhi_"+j+"' name='yuanzhi' onblur='jisuan3("+(j)+");' value='"+yzArray[j]+"' />"; 
	   current_cell5 = document.createElement("td"); 
		current_cell5.innerHTML="<input type='button' onclick='tiaozheng1("+(j)+");' value='调整'/>"; 
       current_row.appendChild(current_cell4);
       current_row.appendChild(current_cell5);
	   mytablebody.appendChild(current_row);
	}
	current_rowa = document.createElement("tr");
	current_cella = document.createElement("td"); 
	currenttexta = document.createTextNode("");
	current_cella.appendChild(currenttexta);
	current_rowa.appendChild(current_cella);
	current_cell2a = document.createElement("td"); 
	currenttexta1 = document.createTextNode("");
	current_cell2a.appendChild(currenttexta1);
	current_rowa.appendChild(current_cell2a);
	mytablebody.appendChild(current_rowa);
	current_cella = document.createElement("td"); 
	currenttexta = document.createTextNode("剩余原值");
	current_cella.appendChild(currenttexta);
	current_rowa.appendChild(current_cella);
	current_cell2a = document.createElement("td"); 
	current_cell2a.innerHTML="<input type='text' id='yuanzhi_shengyu' disabled='true' value='0'/>"; 
	current_rowa.appendChild(current_cell2a);
	mytablebody.appendChild(current_rowa);
	mytable.appendChild(mytablebody);
}
function shengyuyuanzhi(){
	var row=document.getElementById("number2").value;
	var ybyz = document.getElementById('ybyz').value;
	var total = 0;
	for(var i=0;i<row;i++){
		total = total + parseFloat(document.getElementById('yuanzhi_'+i).value);
	}
	document.getElementById("yuanzhi_shengyu").value = (parseFloat(ybyz)-total).toFixed(2);
}
function jisuan3(index){
	var i = String(index);
	var yuanzhi = document.getElementById('yuanzhi_'+i).value;
	var checkNum = checkFloat1(yuanzhi);
	if (checkNum==false){
		alert("请输入正确的原值!");
		document.getElementById('baifen_'+i).value = baifenArray[index];
		document.getElementById('yuanzhi_'+i).value = yzArray[index];
		shengyuyuanzhi();
		return false;
	}
	document.getElementById('yuanzhi_'+i).value=parseFloat(yuanzhi).toFixed(2);
	var ybyz = document.getElementById('ybyz').value;
	document.getElementById('baifen_'+i).value = (parseFloat(yuanzhi)/parseFloat(ybyz)*parseFloat(100)).toFixed(2);
	shengyuyuanzhi();
}
function jisuan(){
	var zongshu = 0;
	for(var i = 0; i< (table.rows.length -1); i++){
		var baifen = document.getElementById('baifen_'+i).value;
		var yuanzhi = document.getElementById('yuanzhi_'+i).value;
		zongshu = parseFloat(zongshu) + parseFloat(document.getElementById('baifen_'+i).value);
		if(baifen == '' || baifen==null){
			alert('百分比不能为空');
			return false;
		}else if(baifen<=0){
			alert('输入的百分数必须大于0');
			return false;
		}
	}
	if(parseFloat(zongshu).toFixed(2) != parseFloat(100).toFixed(2)){
		alert('输入的百分数总数必须为100!');
		return false;
	}else{
		for(var i = 0; i< (table.rows.length -1); i++){
			var baifen = document.getElementById('baifen_'+i).value;
			//var yuanzhi = document.getElementById('yuanzhi_'+i).value;
			var ybyz = document.getElementById('ybyz').value;
			document.getElementById('yuanzhi_'+i).value = (parseFloat(ybyz)*parseFloat(baifen)/parseFloat(100)).toFixed(2);
		}
	}
}
function checkNum1(value){
	if(value!=""){
		for(var i=0;i<value.length;i++){
			var num = value.charAt(i);
			if(num<'0' || num>'9'){
				return false;
			}
		}
		return true;
	}
}
function check(){
	var checkNumber = document.getElementById("number").value;
	var checkNum = checkNum1(checkNumber);
	if (checkNum==false||checkNumber<=1){
		alert("请输入正确的拆分份数!");
		return false;
	}
	if(checkNumber!=""){
		var zongshu = 0;
		for(var i = 0; i< (table.rows.length -2); i++){
			var baifen = document.getElementById('baifen_'+i).value;
			var yuanzhi = document.getElementById('yuanzhi_'+i).value;
			zongshu = parseFloat(zongshu) + parseFloat(document.getElementById('baifen_'+i).value);
			if(baifen == '' || baifen==null){
				alert('百分比不能为空');
				return false;
			}else if(baifen<=0){
				alert('输入的百分数必须大于0');
				return false;
			}
		}
		if(parseFloat(zongshu).toFixed(2) != parseFloat(100).toFixed(2)){
			alert('输入的百分数总数必须为100');
			return false;
		}else{
			var every = '';
			for(var i = 0; i< (table.rows.length -2); i++){
				var baifen = document.getElementById('baifen_'+i).value;
				every = every+baifen+",";
			}
			beforeWorkFlowSubmit();
			var num = document.getElementById('number').value;
			myform.action = "<%=basePath%>kpgl/cardBody_splitCard.do?num="+num+"&every="+every+"&headId=${headId}";
			myform.submit();
		}
	}else{alert("请输入拆分的份数！");}
	
}
function check1(){
	var checkNumber = document.getElementById("number2").value;
	var checkNum = checkNum1(checkNumber);
	if (checkNum==false||checkNumber<=1){
		alert("请输入正确的拆分份数!");
		return false;
	}
	if(checkNumber!=""){
		var zongshu = 0;
		for(var i = 0; i< (table.rows.length -2); i++){
			var baifen = document.getElementById('baifen_'+i).value;
			var yuanzhi = document.getElementById('yuanzhi_'+i).value;
			zongshu = parseFloat(zongshu) + parseFloat(document.getElementById('yuanzhi_'+i).value);
			if(yuanzhi == '' || yuanzhi==null){
				alert('原值不能为空');
				return false;
			}else if(yuanzhi<=0){
				alert('输入的原值必须大于0');
				return false;
			}
		}
		var ybyz = document.getElementById('ybyz').value;
		if(parseFloat(zongshu).toFixed(2) != parseFloat(ybyz).toFixed(2)){
			alert('输入的原值总数必须等于原值');
			return false;
		}else{
			var every = '';
			for(var i = 0; i< (table.rows.length -2); i++){
				var baifen = document.getElementById('baifen_'+i).value;
				every = every+baifen+",";
			}
			beforeWorkFlowSubmit();
			var num = document.getElementById('number2').value;
			myform.action = "<%=basePath%>kpgl/cardBody_splitCard.do?num="+num+"&every="+every+"&headId=${headId}&isYz=true";
			myform.submit();
		}
	}else{alert("请输入拆分的份数！");}
}
function cffs1(){
	var fs = document.getElementById("cffs").value;
	if(fs=="0"){
		ablcf.style.display = "block";
		afscf.style.display = "none";
		document.getElementById("queding1").style.display = "block";  
		document.getElementById("queding2").style.display = "none"; 
	} else {
		ablcf.style.display = "none";
		afscf.style.display = "block";
		document.getElementById("queding1").style.display = "none";  
		document.getElementById("queding2").style.display = "block"; 
	}
}
function beforeWorkFlowSubmit(){
		$("input").removeAttr("disabled");	
		$("textarea").removeAttr("disabled");	
		$("select").removeAttr("disabled");	
		return true;
	}
</script>
<style>
table {font-size:9pt}
body {font-size:9pt}
</style>
<style>
<!--
img{cursor:hand;}

dd{
	font-family:Arial;
	font-size:9pt;
	margin-left:15
}
//-->
</style>
</head>

<body topmargin="0" leftmargin="0"  bgcolor="#CEEBFF" STYLE="scrollbar-face-color:#31CFF0;" >

<s:form id="myform">
<s:hidden name="body.id" id="id"></s:hidden>
<s:hidden name="body.ljzj"></s:hidden>
<s:hidden name="body.jzzb"></s:hidden>
<s:hidden name="body.jevalue"></s:hidden>
<table width="100%" border="0"  align="center" cellpadding="0" cellspacing="0" >
  	<tr>
    	<td align="center" valign="top" class="td03"><br>
<table width="100%" border="0" >
	<tr>
	  <td height="25" colspan="6" class="F01"><strong>按比例拆分卡片</strong></td>
	</tr>
	<tr>
		<td class="td_page"  width="150">卡片原值(元)：
			<s:textfield name="body.ybyz" id="ybyz" disabled="true"></s:textfield>
		</td>
		<td class="td_page"  width="150">拆分方式：
			<s:select list="#{'0':'按比例拆分','1':'按原值拆分'}" id="cffs" onchange="cffs1();"></s:select>
		</td>
		<td class="td_page" id="ablcf" style="display:block" >拆分份数：
			<input id="number" name="number" type="text" maxlength="4" value="" size="10" class="input_bg"  onBlur="addRow();"/>
		</td>
		<td class="td_page" id="afscf" style="display:none" >拆分份数：
			<input id="number2" name="number2" type="text" maxlength="4" value="" size="10" class="input_bg" onBlur="addRow1();"/>
		</td>
	</tr>
	<tr>
		<table   width="100%"   height="100%" border="0" cellpadding="2" cellspacing="0"   id="mytable">
			<tbody id="mytbody">
			<tr>
				<td colspan="5" class="td_top" align="center">各卡片所占百分比</td>
			</tr>
			</tbody>
		</table>
	</tr>
	<tr align="right">
		<td align="right" colspan="6">
		  	<input type="button" class="buttonface02" value="确定" id="queding1" style="display:block" onclick="check();" />		
		  	<input type="button" class="buttonface02" value="确定" id="queding2" style="display:none" onclick="check1();" />		  
	 	 	<input type="button" class="buttonface02" value="取消" onClick="javascript:window.close();"/>		
		</td>
 	</tr>
</table>

		</td>
	</tr>
</table>
</s:form>
</body>
</html> 
<SCRIPT LANGUAGE="JavaScript">
var message = '<%=request.getAttribute("message")%>';
if(message != "" && message!="null") {
		alert("<%=request.getAttribute("message")%>！");
		window.opener.reloadSplitGrid();
			window.close();
	}

</SCRIPT>