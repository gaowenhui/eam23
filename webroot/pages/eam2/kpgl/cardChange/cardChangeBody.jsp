<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/kpgl/checkJS.inc" %>
<%
	String sheetType = (String)request.getAttribute("sheetType");
	String headId = (String)request.getAttribute("headId");
	String isBatch = (String)request.getAttribute("isBatch");
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>卡片变动</title>
<SCRIPT language=JavaScript type=text/JavaScript>
function formSubmit(){
	myform.action = '<%=basePath%>kpgl/cardBody_saveBody.do?sheetType=sheetType'+<%=sheetType%>;
	myform.submit();
	window.opener.reloadJqGrid();
	window.close();
}
function reloadJqGrid(){
	window.opener.reloadJqGrid();
	window.close();
}
function choose(){
	window.open('<%=request.getContextPath()%>/kpgl/cardQuery_init.do');
	return false;
}
var changeway =  {"total" :[{"type":"1" ,"changewayId":"1299"},//原值增加  对应code表变动方式和Individualtree表的变动方式 changewayId为code表的CODE_KEY和Individualtree的CATEGORYID
							{"type":"2" ,"changewayId":"1300"},//原值减少
							{"type":"3" ,"changewayId":"1301"},//管理部门转移
							{"type":"4" ,"changewayId":"1302"},//使用部门转移
							{"type":"5" ,"changewayId":"1303"},//使用状况调整
							{"type":"6" ,"changewayId":"1304"},//折旧方法调整
							{"type":"7" ,"changewayId":"1305"},//使用月限调整
							{"type":"9" ,"changewayId":"1306"},//净残值调整
							{"type":"10","changewayId":"1307"},//累计折旧调整
							{"type":"11","changewayId":"1308"},//资产类别调整
							{"type":"12","changewayId":"1309"},//增加方式调整
							{"type":"13","changewayId":"1310"},//折旧承担部门调整
							{"type":"14","changewayId":"1311"},//使用人调整
							{"type":"15","changewayId":"1312"},//已摊销额调整
							{"type":"16","changewayId":"1313"}, //摊销方法调整
							{"type":"17","changewayId":"1314"} //摊销年限/月限调整
							]};
function changewaycard(){
	var isBatch = "<%=isBatch%>";
	
	var obj = document.getElementById("changeway");
	var optionSelected = obj.options[obj.selectedIndex].value;
	var total = changeway.total;
	for(var i=0;i<total.length;i++){
		if(optionSelected==total[i].changewayId){
			document.getElementById(total[i].type).style.display="block";
		}else{
			document.getElementById(total[i].type).style.display="none";
		}
		if(optionSelected==""){
			document.getElementById(total[0].type).style.display="block";
		}
	}
	//if(isBatch == 'true'&&optionSelected==total[9].changewayId){
	//	alert("卡片类别不能批量变动！");
	//	obj.value = "";
	//	return false;
	//}
	<% if(!"true".equals(isBatch)) {%> 
		if(optionSelected!=""){
			var nodeValue = document.getElementById('changeway').value;
			window.open('<%=request.getContextPath()%>/kpgl/cardQuery_change.do?nodeValue='+nodeValue);
			return false;
		}else{
			document.getElementById('changereason').disabled = true;
		}
	<%} %>
	
}
							
// 从卡片选择页面的回调方法
function getBodyInfo(cardId){
	var sheetType = '<%=sheetType%>';
	var headId = '<%=headId%>';
	document.getElementById("changereason").disabled = false;
	var obj = document.getElementById("changeway");
	var optionSelected = obj.options[obj.selectedIndex].value;
	document.getElementById("cardId").value = cardId;//将cardId放入隐含域
	
	var url ="<%=request.getContextPath()%>/kpgl/cardBody_queryCardType.do";
			$.post(url,{cardId:"" + cardId + "",sheetType:"" + sheetType + "",id:"" + new Date() + ""}, function(data){
				document.getElementById("cardType").value = data;
			});
}
function submitChange4Batch(){
	var bodyIds = document.getElementById("bodyIds").value;
	var changeway1   = document.getElementById("changeway").value;
	var total1 = changeway.total;
	var type = "";
	for(var i=0;i<total1.length;i++){
		if(changeway1==total1[i].changewayId){
			type = total1[i].type;
		}
	}
	var changereason = document.getElementById("changereason").value;
	var cardId 		 = document.getElementById("cardId").value;
	var changeValue  = document.getElementById("changeValue"+type).value;
	var isProportion = "false";
	if(type=="1"||type=='2'){//是否为按比列变动
		var isProportion = document.getElementById("isProportion"+type).value;
		if(isProportion=='1'){
			changeValue = document.getElementById("isProportionValue"+type).value;
			document.getElementById("changeValue"+type).value = changeValue;
			isProportion = "true";
		}
	}
	var url = "<%=request.getContextPath()%>/kpgl/cardBatch_operateChanageBatch.do?headId=<%=headId%>&changeway="+changeway1
				+"&changereason="+changereason+"&changeValue="+changeValue+"&bodyIds="+bodyIds+"&isProportion="+isProportion;
	var be = beforeSubmit();
	if(be ==false)return false;
	myform.action= url;
	myform.submit();
}
function beforeSubmit(){
	if(document.getElementById("changeway").value==""){
		alert("请选择变动方式!");
		return false;
	}
	if(document.getElementById("changereason").value==""){
		alert("请选择变动原因!");
		return false;
	}
	var obj = document.getElementById("changeway");
	var optionSelected = obj.options[obj.selectedIndex].value;
	var total = changeway.total;
	for(var i=0;i<total.length;i++){
		if(optionSelected==total[i].changewayId){
			var svalue = document.getElementById("changeValue"+total[i].type).value;
			if(svalue==''){
				alert("变动后内容不能为空！");
				return false;
			}
		}
	}
}
//打开树，根据类型打开类型
	function openTreeByType(type4Card){
		var nodeValue = null;
		var cardType = document.getElementById("cardType").value;
		if(type4Card =='glbm'||type4Card =='sybm'){
			isSYBMorGLBM = type4Card;
			type4Card = 'department'
		}
		var url = "<%=request.getContextPath()%>/kpgl/cardTree_tree.do?type4Card="+type4Card+"&nodeValue="+nodeValue+"&isCardType4Change=true";
		var _g_privateDialogFeatures = 'height=400, width=200,toolbar=no,scrollbars=yes,location=no,directories=no,menubar=no,resizable=no,left=400,top=200';
		window.open(url,'',_g_privateDialogFeatures);
	}
	var isSYBMorGLBM = null;//弹出树是否为管理部门或使用部门
	//弹出树页面的回调方法 departmenthiddenid,departmentvalue
	function getCallBack4Tree(type4Card,id,value){
		if(type4Card=='department'){
			type4Card = isSYBMorGLBM;
		}
		document.getElementById(type4Card+"hiddenid").value = id;
		document.getElementById(type4Card+"value").value 	= value;
	}
	function isProportionChoose(obj){
		var id = String(obj.id);
		var value = String(obj.value);
		if(value == '1'){
			document.getElementById(id+"choose"+'1').style.display = "block";
			document.getElementById(id+"choose"+'0').style.display = "none";
		}else{
			document.getElementById(id+"choose"+'1').style.display = "none";
			document.getElementById(id+"choose"+'0').style.display = "block";
		}
		
	}
function submitChange(){
	
	var changeway1   = document.getElementById("changeway").value;
	var total1 = changeway.total;
	var type = "1";//设置默认为原值增加
	for(var i=0;i<total1.length;i++){
		if(changeway1==total1[i].changewayId){
			type = total1[i].type;
		}
	}
	var changereason = document.getElementById("changereason").value;
	var cardId 		 = document.getElementById("cardId").value;
	var changeValue  = document.getElementById("changeValue"+type).value;
	var isProportion = "false";
	if(type=="1"||type=='2'){//是否为按比列变动
		var isProportion = document.getElementById("isProportion"+type).value;
		if(isProportion=='1'){
			changeValue = document.getElementById("isProportionValue"+type).value;
			document.getElementById("changeValue"+type).value = changeValue;
			isProportion = "true";
		}
	}
	var url = "<%=request.getContextPath()%>/kpgl/cardBody_saveBody.do?sheetType=<%=sheetType%>&headId=<%=headId%>&changeway="
					+changeway1+"&changereason="+changereason+"&cardId="+cardId+"&changeValue="+changeValue+"&isProportion="+isProportion;
	
	var be = beforeSubmit();
	if(be ==false)return false;
	myform.action= url;
	myform.submit();
}
</SCRIPT>
</head>
<body>
<table width="100%" border="0" cellpadding="2" cellspacing="0"  class="newtable" align="center"  >
<s:hidden name="cardType" id="cardType" value=""/>
<s:hidden name="bodyIds" id="bodyIds" value="%{#request.bodyIds}"/>
<s:form action="cardBody_saveBody" name="myform">
<s:hidden name="cardId" id="cardId"/>
	<tr>
      	<td class="td_top" align="center" colspan="2">卡片变动</td>
    </tr>
    <tr>
      	<td class="td_form01">变动方式</td>
		<td class="td_form02">
			<e:select parRefKey="CARD_CHANGE_WAY" list="#{}"  onchange="changewaycard()" name="changeway" headerKey="" headerValue ="" id="changeway"/>
      	</td>
    </tr>
    <tr>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="30" class="F01">
          	<img src="<%=request.getContextPath() %>/resource/ProjectImages/index_35.gif" width="12" height="16" align="absmiddle"/>
          	<strong>请选择卡片变动原因和变动后内容</strong>
          </td>
        </tr>
 		<tr>
			<td class="td_form01">变动原因</td>
	        <td class="td_form02">
		        <% if("true".equals(isBatch)) {%> 
					<e:select parRefKey="CARD_REDUCE_REASON" list="#{}" name="changereason" headerKey="" headerValue ="" id="changereason" value=""/>
				<%} else{ %>
					<e:select parRefKey="CARD_REDUCE_REASON" list="#{}" disabled="true" name="changereason" headerKey="" headerValue ="" id="changereason" value=""/>
				<%} %>
	   	 		
			</td>
			<td class="td_page" >变动值：</td>
			<td class="td_form02" id="1" style="display:block" nowrap="nowrap"><!-- 原币增加 -->
				<s:select name="isProportion1" id="isProportion1" onchange="isProportionChoose(this)" list="#{0:'否',1:'是'}">按比例增加</s:select>
				<tt id="isProportion1choose0" style="display:block">
					<s:textfield name="changeValue1" id="changeValue1" onblur="checkFloat(this);"  maxlength="15" size="30" />（元）</tt>
				<tt id="isProportion1choose1" style="display:none">
					<s:textfield name="isProportionValue1" id="isProportionValue1" onblur="checkFloat(this);"  maxlength="15" size="30" />（%）</tt>
			</td>
			<td class="td_form02" id="2"  style="display:none"><!-- 原币减少 -->
				<s:select name="isProportion2" id="isProportion2" onchange="isProportionChoose(this)" list="#{0:'否',1:'是'}">按比例减少</s:select>
				<tt id="isProportion2choose0" style="display:block">
					<s:textfield name="changeValue2" id="changeValue2" onblur="checkFloat(this);"  maxlength="15" size="30" />（元）</tt>
				<tt id="isProportion2choose1" style="display:none">
					<s:textfield name="isProportionValue2" id="isProportionValue2" onblur="checkFloat(this);"  maxlength="15" size="30" />（%）</tt>
				
			</td>
			<td class="td_form02" id="3" style="display:none"><!-- 管理部门 -->
				<s:textfield name="glbmvalue" id="glbmvalue" size="30" readonly="true"/>
      	 	 	<s:hidden name='changeValue3' id='glbmhiddenid'></s:hidden>
         	 	<img src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" onclick="openTreeByType('glbm');" width="21" height="20" align="absmiddle">
			</td>
			<td class="td_form02" id="4" style="display:none"><!-- 使用部门 -->
				<s:textfield name="sybmvalue" id="sybmvalue" size="30" readonly="true"/>
      	 		<s:hidden name='changeValue4' id='sybmhiddenid'></s:hidden>
          		<img src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" onclick="openTreeByType('sybm');" width="21" height="20" align="absmiddle">
			</td>
			<td class="td_form02" id="5" style="display:none"><!-- 使用状况 -->
				<s:textfield name="userStatusvalue" id="userStatusvalue" size="30" readonly="true"/>
	      		<s:hidden name='changeValue5' id='userStatushiddenid'></s:hidden>
	          	<img src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" onclick="openTreeByType('userStatus');" width="21" height="20" >
			</td>
			<td class="td_form02" id="6" style="display:none"><!-- 折旧方式 -->
				<e:select parRefKey="CARD_DEPRECIATION_METHOD" list="#{}" name="changeValue6" id="changeValue6" />
			</td>
			<td class="td_form02" id="7" style="display:none"><!-- 使用月限 -->
				<s:textfield name="changeValue7" id="changeValue7" onblur="checkNumber(this);" maxlength="5" size="30"/>（月）
			</td>
			<td class="td_form02" id="9" style="display:none"><!-- 净残值 -->
				<s:textfield name="changeValue9" id="changeValue9" onblur="checkFloat(this);" maxlength="20" size="30"/>（元）
			</td>
			<td class="td_form02" id="10" style="display:none"><!-- 累计折旧 -->
				<s:textfield name="changeValue10" id="changeValue10" onblur="checkFloat(this);" maxlength="15" size="30"/>（元）
			</td>
			<td class="td_form02" id="11" style="display:none"><!-- 卡片类别 -->
				<s:textfield name="assetTypevalue" id="assetTypevalue" size="30" readonly="true"/>
      			<s:hidden name="changeValue11" id='assetTypehiddenid'/>
      			<img src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" onclick="openTreeByType('assetType');" width="21" height="20" >
			</td>
			<td class="td_form02" id="12" style="display:none"><!-- 增加方式 -->
				<s:textfield name="addmethodvalue" id="addmethodvalue" size="30" readonly="true"/>
	      		<s:hidden name='changeValue12' id='addmethodhiddenid'></s:hidden>
	          	<img src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" onclick="openTreeByType('addmethod');" width="21" height="20" >
			</td>
			<td class="td_form02" id="13" style="display:none"><!-- 折旧承担部门 -->
				<s:select name="changeValue13" id="changeValue13" list="#{'':'',0:'管理部门',1:'使用部门'}"></s:select>
			</td>
			<td class="td_form02" id="14" style="display:none"><!-- 使用人 -->
				<s:textfield name="changeValue14" id="changeValue14" onblur="isString(this);" maxlength="20" size="30"></s:textfield>
			</td>
			<td class="td_form02" id="15" style="display:none"><!-- 已摊销额调整 -->
				<s:textfield name="changeValue15" id="changeValue15" onblur="checkFloat(this);" maxlength="15" size="30"/>（元）
			</td>
			<td class="td_form02" id="16" style="display:none"><!-- 摊销方法调整 -->
				<e:select parRefKey="CARD_DEPRECIATION_METHOD" list="#{}" name="changeValue16" id="changeValue16" />
			</td>
			<td class="td_form02" id="17" style="display:none"><!-- 摊销年限/月限调整 -->
				<s:textfield name="changeValue17" id="changeValue17" onblur="checkNumber(this);" maxlength="5" size="30"/>（月）
			</td>
		</tr>
	  <tr align="right">
	    <td align="right" colspan="7">
		  <input name="Submit" type="button" class="buttonface02" value="  确定  " 
		  <%=("true".equals(isBatch))?"onClick='submitChange4Batch()'":"onClick='submitChange()'" %>  >		
		  &nbsp;&nbsp;&nbsp;&nbsp;
		  <input name="Submit" type="button" class="buttonface02" value="  取消  " onClick="javascript:window.close();">		
		  &nbsp;&nbsp;	
	    </td>
	  </tr>		
      </table>
    		</tr>
  </s:form>
</table>
</body>
</html>
<SCRIPT LANGUAGE="JavaScript">
	if('<%=request.getAttribute("message")%>' != "null") {
		alert("<%=request.getAttribute("message")%>！"); 
		window.opener.reloadJqGrid();
		window.close();
	}
	
</SCRIPT>