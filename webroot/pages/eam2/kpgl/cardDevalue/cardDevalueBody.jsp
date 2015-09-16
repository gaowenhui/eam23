<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/kpgl/checkJS.inc" %>
<%
	String sheetType = (String)request.getAttribute("sheetType");
	String headId = (String)request.getAttribute("headId");
	String isModifyBody = (String)request.getAttribute("isModifyBody");
	String zcType = (String)request.getAttribute("zcType");
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>卡片新增</title>
</head>
<body>
<s:form id="myform">
<s:hidden name="body.zcid"></s:hidden>
<s:hidden name="body.kpxzid"></s:hidden>
<s:hidden name="body.id"></s:hidden>
<s:hidden name="body.cardinfoid"></s:hidden>
<s:hidden name="body.parentid"></s:hidden>
<s:hidden name="body.sfzy"></s:hidden>
<table width="95%" border="0" cellpadding="2" cellspacing="0"  class="newtable" align="center"  >
	<tr>
      	<td colspan="6" class="td_top" align="center" >卡片减值信息</td>
    </tr>
    <tr>
      	<td colspan="6" class="td_form01" align="center" >
      		<input type="button" class="buttonface" value="选择卡片" onclick="choose();">
      	</td>
    </tr>
   	<tr>
    	<%if("zyzc".equals(zcType)){ %>
    	<td class="td_form01">自用资产编号</td>
		<td class="td_form02"><s:textfield name="card.zyZc.zcbh" id="zcbh" size="30" readonly="true"/></td>
		<td class="td_form01">自用资产名称</td>
		<td class="td_form02"><s:textfield name="card.zyZc.zcmc" id="zcmc" size="30" readonly="true"/></td>
		<td class="td_form01">自用资产状态</td>
		<td class="td_form02"><s:textfield name="card.zyZc.CZczc" id="zczt" size="30" readonly="true"/></td>
    	<%}else{ %>
		<td class="td_form01">经营资产编号</td>
		<td class="td_form02"><s:textfield name="card.jyZc.zcbh" id="zcbh" size="30"/></td>
		<td class="td_form01">经营资产名称</td>
		<td class="td_form02"><s:textfield name="card.jyZc.zcmc" id="zcmc" size="30"/></td>
		<td class="td_form01">经营资产状态</td>
		<td class="td_form02"><s:textfield name="card.jyZc.CZczc" id="zczt" size="30"/></td>
    	<%} %>
    </tr>
    <tr>
		<td class="td_form01">卡片名称</td>
		<td class="td_form02"><s:textfield name="body.zcname" id="zcname" size="30" readonly="true"/></td>
		<td class="td_form01">卡片编号</td>
		<td class="td_form02"><s:textfield name="body.cardcode" id="cardcode" size="30" readonly="true"/></td>
		<td class="td_form01">一级分行</td>
		<td class="td_form02"><s:textfield name="body.firstbranch" id="firstbranch" size="30" readonly="true"/></td>
    </tr>
    <tr>
		<td  class="td_form01">类别名称</td>
		<td class="td_form02"><s:textfield name="bodyValue.typecodeValue" id="typecodeValue" size="30" readonly="true"/></td>
		<td class="td_form01">类别编号</td>
		<td class="td_form02"><s:textfield name="body.typecode" id="typecode" size="30" readonly="true"/></td>
		<td class="td_form01">规格型号</td>
		<td class="td_form02"><s:textfield name="body.ggxh" id="ggxh" size="30" readonly="true"/></td>
    </tr>
    <tr>
		<td  class="td_form01">使用状况</td>
		<td class="td_form02"><s:textfield name="bodyValue.usestateValue" id="usestateValue" size="30" readonly="true"/></td>
		<s:hidden name="body.usestatus" id="usestatus" />
		<td class="td_form01">存放地点</td>
		<td class="td_form02"><s:textfield name="body.saveadsress" id="saveadsress" size="30" readonly="true"/></td>
		<td class="td_form01">卡片状态</td>
		<td class="td_form02"><s:select name="body.state" list="#{'01':'正在使用','02':'空闲状态','03':'退役'}" disabled="true"></s:select></td>
    </tr>
    <tr>
		<td class="td_form01">增加方式</td>
		<td class="td_form02"><s:textfield name="bodyValue.addtypeValue" id="addtypeValue" size="30" readonly="true"/></td>
		<s:hidden name="body.addtype" id="addtype" />
		<td class="td_form01">折旧方法</td>
		<td class="td_form02"><e:select parRefKey="CARD_DEPRECIATION_METHOD" list="#{}" name="body.zjtype" id="zjtype" disabled="true" /></td>
		<td class="td_form01">是否承继</td>
		<td class="td_form02"><s:select name="body.ifjc" list="#{'':'',0:'是',1:'否'}" disabled="true"></s:select></td>
    </tr>
    <tr>
		<td class="td_form01">管理部门</td>
		<td class="td_form02"><s:textfield name="bodyValue.glbmValue" id="glbmValue" size="30" readonly="true"/></td>
		<s:hidden name="body.glbm" id="glbm"/>
		<td class="td_form01">使用部门</td>
		<td class="td_form02"><s:textfield name="bodyValue.usepartmentValue" id="usepartmentValue" size="30" readonly="true" /></td>
		<s:hidden name="body.usepartment" id="usepartment" />
		<td class="td_form01">折旧承担部门</td>
		<td class="td_form02"><s:select name="body.zjcdbm" list="#{'':'',0:'管理部门',1:'使用部门'}" disabled="true"></s:select></td>
    </tr>
    <tr>
		<td class="td_form01">开始使用日期</td>
		<td class="td_form02">			
			<s:date name="%{#request.body.ksdate}" format="yyyy-MM-dd" var="draftDate"/>
	        <s:textfield id="ksdate" name="body.ksdate" cssClass="input" value="%{#draftDate}" readonly="true" />
		</td>
		<td class="td_form01">启用日期</td>
		<td class="td_form02">
			<s:date name="%{#request.body.qydate}" format="yyyy-MM-dd" var="draftDate"/>
	        <s:textfield id="qydate" name="body.qydate" cssClass="input" value="%{#draftDate}" readonly="true" />
		</td>
		<td class="td_form01">注销日期</td>
		<td class="td_form02">
			<s:date name="%{#request.body.zxrq}" format="yyyy-MM-dd" var="draftDate"/>
	        <s:textfield id="zxrq" name="body.zxrq" cssClass="input" value="%{#draftDate}" readonly="true" />
		</td>
    </tr>
    <tr>
		<td class="td_form01">主要用途</td>
		<td class="td_form02" colspan="5"><s:textarea name="body.mainyt" id="mainyt" cols="150" rows="4"></s:textarea></td>
    </tr>
</table>

<table width="95%" border="0" cellpadding="2" cellspacing="0" align="center"   class="newtable" >
	<tr>
	    <td class="td_form01"> 原币原值</td>
	    <td class="td_form02"><s:textfield name="body.ybyz" id="ybyz" maxlength="20" size="30" readonly="true" />（元）</td>
	    <td class="td_form01"> 减值准备 </td>
	    <td class="td_form02"><s:textfield name="body.jzzb" onblur="checkFloat(this);" id="jzzb" maxlength="20" size="30"/>（元）</td>
	    <td class="td_form01"> 使用年限 </td>
	    <td class="td_form02"><s:textfield name="body.synx" id="synx" maxlength="20" size="30" readonly="true"/>（年）</td>
    </tr>
    <tr>
	    <td class="td_form01">使用月限</td>
	    <td class="td_form02"><s:textfield name="body.syyx" id="syyx" maxlength="20" size="30" readonly="true"/>（月）</td>
	    <td class="td_form01">月折旧额</td>
	    <td class="td_form02"><s:textfield name="body.yzje" id="yzje" maxlength="20" size="30" readonly="true"/>（元）</td>
	    <td class="td_form01">已计提月份</td>
	    <td class="td_form02"><s:textfield name="body.yjtyf" id="yjtyf" maxlength="20" size="30" readonly="true"/>（月）</td>
    </tr>
    <tr>
	    <td class="td_form01">累计折旧</td>
	    <td class="td_form02"><s:textfield name="body.ljzj" id="ljzj" maxlength="20" size="30" readonly="true"/>（元）</td>
	    <td class="td_form01">净值</td>
	    <td class="td_form02"><s:textfield name="body.jvalue" id="jvalue" maxlength="20" size="30" readonly="true"/>（月）</td>
	    <td class="td_form01">净额</td>
	    <td class="td_form02"><s:textfield name="body.jevalue" readonly="true" id="jevalue" maxlength="20" size="30"/>（元）</td>
    </tr>
    <tr>
	    <td class="td_form01">净残值</td>
	    <td class="td_form02"><s:textfield name="body.jcz" id="jcz" maxlength="24" size="30" readonly="true" readonly="true"/>（元）</td>
	    <td class="td_form01">净残值率</td>
	    <td class="td_form02"><s:textfield name="body.jczl" id="jczl" maxlength="22" size="30" readonly="true" readonly="true"/>（%）</td>
	    <td class="td_form01">月折旧率</td>
	    <td class="td_form02"><s:textfield name="body.yzjl" id="yzjl" maxlength="20" size="30" readonly="true" readonly="true"/>（%）</td>
    </tr>
    <tr>
	    <td class="td_form01">本次计提</td>
	    <td class="td_form02"><s:textfield name="body.bcjt" id="bcjt" maxlength="24" size="30" onblur="checkjiti();" />（元）</td>
	    <td class="td_form01">&nbsp;&nbsp;</td>
	    <td class="td_form02">&nbsp;&nbsp;</td>
	    <td class="td_form01">&nbsp;&nbsp;</td>
	    <td class="td_form02">&nbsp;&nbsp;</td>
    </tr>
</table>

<table>
	<tr>
      	<td align="right" colspan="6">
      		<%
      			if(isModifyBody!=null){
      		 %>
      	  	<input name="Submit2" type="button" class="buttonface02" value="确定" onClick="updateBody();"/>
      	  	<%}else{ %>
      	  	<input name="Submit2" type="button" class="buttonface02" value="确定" onClick="saveBody();"/>
      	  	<%} %>
          	<input name="Submit2" type="button" class="buttonface02" value="取消" onClick="javascript:window.close()"/>
      	</td>
    </tr>
    <input type="reset" id="chongzhi" />
</table>
</s:form>
<s:hidden id="jzzbbeiyong"/>
</body>
</html>
<SCRIPT LANGUAGE="JavaScript">

// 提交保存body
function saveBody(){
if(document.getElementById("cardcode").value==""){
	alert("请选择卡片！");
	return false;
}
	var a  = document.getElementsByTagName("select");
	for(var i=0;i<a.length;i++){
		a[i].disabled = false;
	}
	myform.action = '<%=basePath%>kpgl/cardBody_saveBody.do?sheetType=devalue&isModifyBody=false';
	myform.submit();
}

// 提交修改body
function updateBody(){
	var a  = document.getElementsByTagName("select");
	for(var i=0;i<a.length;i++){
		a[i].disabled = false;
	}
	myform.action='<%=basePath%>kpgl/cardBody_saveBody.do?sheetType=devalue&isModifyBody=true';
	myform.submit();
}

// 打开卡片查询页面
function choose(){
	window.open('<%=basePath%>kpgl/cardQuery_init.do', '减值卡片选择','height=600, width=1211,toolbar=yes,scrollbars=yes,menubar=yes,resizable=yes,left=100,top=0');
	return false;
}

// 卡片查询页面关闭时回调
function getBodyInfo(id){
	var sheetType = '<%=sheetType%>';
	var headId = '<%=headId%>';
	myform.action = "<%=basePath%>kpgl/cardBody_getBodyInfo.do?cardId="+id+"&sheetType="+sheetType+"&headId="+headId;
	myform.submit();
}
document.getElementById("jzzbbeiyong").value = document.getElementById('jzzb').value;

// 输入本次计提后判断
function checkjiti(){
	//document.getElementById('chongzhi').click();
	var ybyz  = parseFloat(document.getElementById('ybyz').value);
	var ljzj  = parseFloat(document.getElementById('ljzj').value);
	var bcjt  = parseFloat(document.getElementById('bcjt').value);
	var jzzb1 = parseFloat(document.getElementById('jzzb').value);
	var jcz = document.getElementById('jcz').value;
	if(bcjt>(ybyz-ljzj)){
		alert('当本次计提为正数时，该值应该小于原币原值与累计折旧的差');
		document.getElementById('bcjt').value = '';
		return false;
	}else{
		document.getElementById('jzzb').value = parseFloat(document.getElementById("jzzbbeiyong").value) + parseFloat(bcjt);
		var jzzb2 = document.getElementById('jzzb').value;
		document.getElementById('jevalue').value = parseFloat(ybyz)-parseFloat(ljzj)-parseFloat(jzzb2); 
	}
}
if('<%=request.getAttribute("message")%>' != "null") {
	if('<%=request.getAttribute("reduceCheck")%>'!="null" && '<%=request.getAttribute("reduceCheck")%>'!=""){
		alert("<%=request.getAttribute("reduceCheck")%>！");
	}else{
		alert("<%=request.getAttribute("message")%>！");
		window.opener.reloadJqGrid(); 
		window.close();
	}
}
</SCRIPT>