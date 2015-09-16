<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ page language="java" import="com.tansun.eam2.common.model.orm.bo.*" %>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/kpgl/checkJS.inc" %>
<%	

	//YanPeiLing modify  start 2011-1-8
	String zcmc = request.getParameter("zcmc");
	String zcbh = request.getParameter("zcbh");
	String zczt = request.getParameter("zczt");
	LcCardtemp body = (LcCardtemp)request.getAttribute("body");
	String hiddenZCChoiceButton = request.getParameter("hiddenZCChoiceButton");
	String hiddenButtonFromAction = (String)request.getAttribute("hiddenZCChoiceButton");
	String zcId = request.getParameter("zcId");
	//YanPeiLing modify  end 2011-1-8
	String isModifyBody = (String)(request.getAttribute("isModifyBody")==null?"":request.getAttribute("isModifyBody"));
	String headId   = "";
	String cardType = "";
	String bodyId   = "";
	String sheetType = "";
	String cardId = "";
	String isMModifyBody = "";
	String zcType = "";             //得到卡片所挂接资产的类型
	boolean isMSplitBody = false;	//是否为卡片拆分后表体信息
	boolean isMMergeBody = false;	//是卡片合并里的修改合并后卡片表体信息
	boolean isModify = false;		//是否LcCardTemp新增卡片处理单修改
	boolean isCardModify = false;	//是否为Cardinfo卡片表修改
	boolean isCardInfo = false;
	boolean isAddModify = false;
	isAddModify = "true".equals((String)request.getAttribute("isAddModify"))?true:false;
	if(request.getAttribute("isCardInfo")==null){
		isCardInfo = false;
	}else{
		isCardInfo = (Boolean)request.getAttribute("isCardInfo");
	}
	if(request.getAttribute("zcType")==null){//得到资产类型
		zcType = "jyzc";
	}else{
		zcType = (String)request.getAttribute("zcType");
	}
	if("true".equals(isModifyBody)){
		headId   = (String)request.getAttribute("headId");
		cardType = (String)request.getAttribute("cardType");
		sheetType = (String)request.getAttribute("sheetType");//kplx为卡片类型，根据卡片类型进入不同卡片类型页面修改 ,
		bodyId = (String)request.getAttribute("bodyId");
		isModify = true;
	}else{
		headId   = request.getParameter("headId");
		bodyId = request.getParameter("bodyId");
		cardType = request.getParameter("cardType");
		if(cardType==null||"null".equals(cardType)){
			cardType = (String)request.getAttribute("cardType");
		}
		sheetType = (String)request.getAttribute("sheetType");//kplx为卡片类型，根据卡片类型进入不同卡片类型页面修改 ,
		isMMergeBody  = "true".equals((String)request.getAttribute("isMMergeBody"))?true:false;//是卡片合并里的修改合并后卡片表体信息
		isMModifyBody = (String)request.getAttribute("isMModifyBody");//是卡片修改的修改卡片表体信息
		isMSplitBody = "true".equals((String)request.getAttribute("isMSplitBody"))?true:false;//是否为卡片拆分后表体信息
		if("modify".equals(sheetType)){
			isCardModify = true;
			cardId = (String)request.getAttribute("cardId");
		}
	}
%>
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=isMMergeBody?"卡片合并":(isModify||isCardModify?"卡片修改":"卡片新增") %></title>
<SCRIPT language=JavaScript type=text/JavaScript>

	// 添加新的卡片
	function formSubmit(){
		var zcname = document.getElementById('zcname').value;
		var assetTypevalue = document.getElementById('assetTypevalue').value;
		var userStatusvalue = document.getElementById('userStatusvalue').value;
		var addmethodvalue = document.getElementById('addmethodvalue').value;
		var glbmvalue = document.getElementById('glbmvalue').value;
		var usepartmentValue =document.getElementById('sybmvalue').value;
		var ybyz = document.getElementById('ybyz').value;
		var ifjc = document.getElementById('ifjc').value;
		var ksdate = document.getElementById('ksdate').value;
		if(zcname==''||assetTypevalue==''||userStatusvalue==''||addmethodvalue==''||glbmvalue==''||usepartmentValue==''||ksdate==''||ybyz==''||ifjc==''){
			alert('带红色星号的为必填项，请填写完整后再提交');
			return true;
		}
		if(parseFloat(ybyz)<=parseFloat(0)||String(parseFloat(ybyz))=='NaN'){
			alert("原值输入错误！");
			return true;
		}
		var a  = document.getElementsByTagName("select");
		for(var i=0;i<a.length;i++){
			a[i].disabled = false;
		}
		beforeWorkFlowSubmit();
		var url = "<%=request.getContextPath()%>/kpgl/cardBody_saveBody.do?cardType=<%=cardType%>&headId="+"<%=headId%>&sheetType="+"<%=sheetType%>&zcType=<%=zcType%>";
		myform.action=url;
		window.parent.window.returnValue=1;
		myform.submit();
	}
	
	// 修改提交
	function formModify(){
		var zcname = document.getElementById('zcname').value;
		var assetTypevalue = document.getElementById('assetTypevalue').value;
		var userStatusvalue = document.getElementById('userStatusvalue').value;
		var addmethodvalue = document.getElementById('addmethodvalue').value;
		var glbmvalue = document.getElementById('glbmvalue').value;
		var usepartmentValue =document.getElementById('sybmvalue').value;
		var ybyz = document.getElementById('ybyz').value;
		var ifjc = document.getElementById('ifjc').value;
		var ksdate = document.getElementById('ksdate').value;
		if(zcname==''||assetTypevalue==''||userStatusvalue==''||addmethodvalue==''||glbmvalue==''||usepartmentValue==''||ksdate==''||ybyz==''||ifjc==''){
			alert('带红色星号的为必填项，请填写完整后再提交');
			return true;
		}
		if(parseFloat(ybyz)<=parseFloat(0)||String(parseFloat(ybyz))=='NaN'){
			alert("原值输入错误！");
			return true;
		}
		var a  = document.getElementsByTagName("select");
		for(var i=0;i<a.length;i++){
			a[i].disabled = false;
		}
		beforeWorkFlowSubmit();
		var url = "<%=request.getContextPath()%>/kpgl/cardBody_saveBody.do?cardType=<%=cardType%>&headId=<%=headId%>&bodyId=<%=bodyId%>&cardId=<%=cardId%>&isModifyBody=<%=isAddModify%>&isMMergeBody=<%=isMMergeBody%>&isMSplitBody=<%=isMSplitBody%>&isMModifyBody=<%=isMModifyBody%>&sheetType=<%=sheetType%>";
		myform.action= url;
		window.parent.window.returnValue=1;
		myform.submit();
	}
	
	//打开树，根据类型打开类型
	function openTreeByType(type4Card){
		var cardType = '<%=cardType%>';
		var nodeValue = null;
		if(type4Card =='glbm'||type4Card =='sybm'){
			isSYBMorGLBM = type4Card;
			type4Card = 'department'
		}else if(type4Card =='assetType'){
			if(cardType =='93'){//交通运输设备
				nodeValue='03';
			}else if(cardType =='95'){//土地
				nodeValue='04';
			}else if(cardType =='96'){//在建工程
				nodeValue='05';
			}else if(cardType =='98'){//无形资产
				nodeValue='06';
			}else if(cardType =='21628'){//投资性房屋
				nodeValue='11';
			}else if(cardType =='21629'){//投资性土地
				nodeValue='12';
			}else if(cardType =='94'){//房屋及建筑物
				nodeValue='01';
			}else if(cardType =='97'){//电子设备及其他
				nodeValue='02';
			}else if(cardType =='1668'){//经营租入固定资产改良
				nodeValue='08';
			}else if(cardType =='1669'){//长期待摊
				nodeValue='09';
			}else if(cardType =='1670'){//装修
				nodeValue='10';
			}
		}
		var url = "<%=request.getContextPath()%>/kpgl/cardTree_tree.do?type4Card="+type4Card+"&nodeValue="+nodeValue;
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
	
	// 打开自用资产选择界面
	function findZYZC(){
		window.open('<%=basePath%>zyzc/ZCQuery_init.do?isForCard=true',
			'','height=700, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
	}
	// 自用资产回调方法
	function zyzcinfo(gr){
		document.getElementById('zcid').value = gr;
		var findJYZC ="<%=request.getContextPath()%>/kpgl/cardBody_findZYZCInfoById.do";
		$.post(findJYZC,{zcId:"" + gr + ""}, function(data){
			document.getElementById('getCardInfo').value = data;
			var str = data.split(",");
			document.getElementById('zcbh').value = str[0];
			document.getElementById('zcmc').value = str[1];
			document.getElementById('zczt').value = str[2];
			document.getElementById('state').value = "01";
			document.getElementById('state').disabled = false;
		});
	}
	// 打开经营资产选择界面
	function findJYZC(){
		window.open('<%=basePath%>jygdzc/AssetQuery_init.do?sheettype=query&mulSelect=false&isForCard=true&returnValue=true',
			'','height=700, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
	}
	// 经营资产回调方法
	function jyzcinfo(gr){
		document.getElementById('zcid').value = gr;
		var findJYZC ="<%=request.getContextPath()%>/kpgl/cardBody_findJYZCInfoById.do";
		$.post(findJYZC,{zcId:"" + gr + "",returnValue:"true"}, function(data){
			document.getElementById('getCardInfo').value = data;
			var str = data.split(",");
			document.getElementById('zcbh').value = str[0];
			document.getElementById('zcmc').value = str[1];
			document.getElementById('zczt').value = str[2];
			document.getElementById('state').value = "01";
			document.getElementById('state').disabled = false;
		});
	}
	
	// 日期转换
	$(function(){
		<%
			if(body!=null&&body.getYbyz()!=null&&!"".equals(body.getYbyz())){
		%>	
				$("#ybyz").val(${body.ybyz}.toFixed(2));
		<%	
			}
		%>	
		<%
			if(body!=null&&body.getJzzb()!=null&&!"".equals(body.getJzzb())){
		%>	
				$("#jzzb").val(${body.jzzb}.toFixed(2));
		<%	
			}
		%>	
		$("#ksdate,#qydate").datebox({
			formatter:function(date){
				return formatDate(date);
			}
		});
		$("#lrrq").datebox({
		formatter:function(date){
			return formatDate(date);
		}
	});
		//YanPeiLing modify  start 2011-1-8
		if('<%=hiddenZCChoiceButton%>' == "yes"){
			$("#zcChoice").attr("style","display:none");
		}
		if("<%=hiddenButtonFromAction%>" == "yes"){
			$("#zcChoice").attr("style","display:none");
		}
		if("<%=zcId%>" != null && "<%=zcId%>" != "null"){
			$("#zcid").val("<%=zcId%>");
		}
		if("<%=zcbh%>" != null && "<%=zcbh%>" != "null"){
			$("#zcbh").val("<%=zcbh%>");
		}
		if("<%=zcmc%>" != null && "<%=zcmc%>" != "null"){
			$("#zcmc").val("<%=zcmc%>");
		}
		if("<%=zczt%>" != null && "<%=zczt%>" != "null"){
			$("#zczt").val("<%=zczt%>");
		}
		//YanPeiLing modify  end 2011-1-8
	});
	function beforeWorkFlowSubmit(){
		$("input").removeAttr("disabled");	
		$("textarea").removeAttr("disabled");	
		$("select").removeAttr("disabled");	
		return true;
	}
</SCRIPT>
</head>
<base target="_self"/>
<body>
<s:form action="cardBody_saveBody" name="myform">
<s:hidden name="body.id" id="bodyId"/>
<s:hidden name="body.kpxzid"/>
<s:hidden name="body.kplx"/>
<s:hidden name="body.parentid"/>
<s:hidden name="body.sfzy"/>
<s:hidden name="body.rzkm"/>
<s:hidden name="body.zcid" id="zcid"/>
<s:hidden name="body.cardinfoid"/>
<s:hidden name="body.boxid"/>
<s:hidden name="body.erpassetcode"/>
<s:hidden name="body.childid"/>
<s:hidden id="getCardInfo"/>
  <table width="100%" border="0" cellpadding="2" cellspacing="0"  class="newtable" align="center"  >
    <tr>
      <td colspan="6" class="td_top" align="center" >无形资产卡片信息</td>
    </tr>
    <%if(!isCardInfo){ %>
      	 <tr style="display: block" id="zcChoice">
	      <td class="td_form01">所属资产</td>
	      <td class="td_form02"  align="right" colspan="5">
	        <%if("zyzc".equals(zcType)){ %>
	      	<input type="button" class="buttonface02" onClick="findZYZC();" value="选择自用资产">
	     	<%}else{ %>
	     	<input type="button" class="buttonface02" onclick="findJYZC();" value="选择经营资产">
	     	<%} %>
	     </td>
	    </tr>
      <%} %>
     
    <tr>
      	<%if("zyzc".equals(zcType)&&!isAddModify){ %>
    	<td class="td_form01">自用资产编号</td>
		<td class="td_form02"><s:textfield name="card.zyZc.zcbh" id="zcbh" size="30" disabled="true"/></td>
		<td class="td_form01">自用资产名称</td>
		<td class="td_form02"><s:textfield name="card.zyZc.zcmc" id="zcmc" size="30" disabled="true"/></td>
		<td class="td_form01">自用资产状态</td>
		<td class="td_form02"><s:textfield name="card.zyZc.CZczc" id="zczt" size="30" disabled="true"/></td>
    	<%}else if("zyzc".equals(zcType)&&isAddModify){ %>
    	<td class="td_form01">资产编号</td>
		<td class="td_form02"><s:textfield name="zcbh" id="zcbh" size="30" disabled="true"/></td>
		<td class="td_form01">资产名称</td>
		<td class="td_form02"><s:textfield name="zcmc" id="zcmc" size="30" disabled="true"/></td>
		<td class="td_form01">资产状态</td>
		<td class="td_form02"><s:textfield name="zczt" id="zczt" size="30" disabled="true"/></td>
		<%}else if("jyzc".equals(zcType)&&isAddModify){ %>
    	<td class="td_form01">资产编号</td>
		<td class="td_form02"><s:textfield name="zcbh" id="zcbh" size="30" disabled="true"/></td>
		<td class="td_form01">资产名称</td>
		<td class="td_form02"><s:textfield name="zcmc" id="zcmc" size="30" disabled="true"/></td>
		<td class="td_form01">资产状态</td>
		<td class="td_form02"><e:select parRefKey="ASSET_STATUS" list="#{}" name="zczt" id="zczt" disabled="true" /></td>
    	<%}else{ %>
		<td class="td_form01">经营资产编号</td>
		<td class="td_form02"><s:textfield name="card.jyZc.zcbh" id="zcbh" size="30" disabled="true"/></td>
		<td class="td_form01">经营资产名称</td>
		<td class="td_form02"><s:textfield name="card.jyZc.zcmc" id="zcmc" size="30" disabled="true"/></td>
		<td class="td_form01">经营资产状态</td>
		<td class="td_form02">
		<e:select parRefKey="ASSET_STATUS" list="#{}" name="card.jyZc.CZczc" id="zczt" disabled="true" /></td>
    	<%} %>
    </tr>
    <tr>
      <td class="td_form01"><font color="#FF0000"><strong>*</strong></font>卡片名称</td>
      <td class="td_form02">
      <%if(isCardInfo){ %>
      	<s:textfield name="body.zcname" id="zcname" size="30" disabled="true" />
      <%}else{ %>
      	<s:textfield name="body.zcname" id="zcname" onblur="isString(this);" maxlength="40" size="30"/>
      <%} %>
      </td>
      <td class="td_form01">卡片编号</td>
      <td class="td_form02"><s:textfield name="body.cardcode" size="30" disabled="true"/></td>
      <td class="td_form01">一级分行</td>
      <td class="td_form02" valign="middle">
      <%if(isCardModify||isMMergeBody||isCardInfo||isMSplitBody){%>
      		<e:select parRefKey="ENTITY_TRADE" parentId="438" list="#{}" name="body.firstbranch" disabled="true" id="eventType"/>
      <%}else{ %>
      		<e:select parRefKey="ENTITY_TRADE" parentId="438" list="#{}" name="body.firstbranch" id="eventType"/>
      <%}%>	
      </td>
    </tr>
    <tr>
      <td  class="td_form01"><font color="#FF0000"><strong>*</strong></font>类别名称</td>
      <td class="td_form02">
      <%if(isCardModify||isCardInfo){%>
      		<s:textfield name="bodyValue.typecodeValue" id="assetTypevalue" size="30" disabled="true"/>
      <%}else{ %>
      		<s:textfield name="bodyValue.typecodeValue" id="assetTypevalue" size="30" disabled="true"/>
          	<img src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" onclick="openTreeByType('assetType');" width="21" height="20" >
      <%}%>
      </td>
      <td class="td_form01">类别编号</td>
      <td class="td_form02"><s:textfield name="body.typecode" id='assetTypehiddenid' size="30" disabled="true"/></td>
      <td class="td_form01">规格型号</td>
      <td class="td_form02">
      <%if(isCardInfo){ %>
	  	<s:textfield name="body.ggxh" size="30" disabled="true" />
	  <%}else{ %>
	  	<s:textfield name="body.ggxh" onblur="isString(this);" size="30" />
	  <%} %>
	  </td>
    </tr>
    <tr>
      <td  class="td_form01"><font color="#FF0000"><strong>*</strong></font>使用状况</td>
      <td class="td_form02">
      <%if(isCardModify){%>
      		<s:textfield name="bodyValue.usestateValue" id="userStatusvalue" size="30" disabled="true"/>
      		<s:hidden name='body.usestatus' id='userStatushiddenid'></s:hidden>
      <%}else if(isCardInfo){ %>
      		<s:textfield name="bodyValue.usestateValue" id="userStatusvalue" disabled="true"></s:textfield>
      <%}else{ %>
      		<s:textfield name="bodyValue.usestateValue" id="userStatusvalue" size="30" disabled="true"/>
      		<s:hidden name='body.usestatus' id='userStatushiddenid'></s:hidden>
          	<img src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" onclick="openTreeByType('userStatus');" width="21" height="20" >
      <%}%>		
      </td>
      <td class="td_form01">存放地点</td>
      <td class="td_form02">
      <%if(isCardInfo){%>
      	<s:textfield name="body.saveadsress" size="30" disabled="true"/>
      <%}else{ %>
      	<s:textfield name="body.saveadsress" onblur="isString(this);" size="30"/>
      <%}%>	
      </td>
      <td class="td_form01">卡片状态</td>
      <td class="td_form02">
      <%if(isCardModify || isCardInfo){%>
      		<s:select name="body.state"  id="state" list="#{'01':'正在使用','02':'空闲状态','03':'退役'}" disabled="true"></s:select>
      <%}else if(isMMergeBody||isMSplitBody){ %>
      		<s:select name="body.state"  id="state" list="#{'01':'正在使用','02':'空闲状态','03':'退役'}" disabled="true"></s:select>
      <%}else{ %>
      		<s:select name="body.state" id="state" list="#{'02':'空闲状态','01':'正在使用','03':'退役'}" disabled="true"></s:select>
      <%}%>	
      </td>
    </tr>
    <tr>
      <td class="td_form01"><font color="#FF0000"><strong>*</strong></font>增加方式</td>
      <td class="td_form02">
      <%if(isCardModify){%>
      		<s:textfield name="bodyValue.addtypeValue" id="addmethodvalue" size="30" disabled="true"/>
      		<s:hidden name='body.addtype' id='addmethodhiddenid'></s:hidden>
      <%}else if(isCardInfo){ %>		
      		<s:textfield name="bodyValue.addtypeValue" id="addmethodvalue" size="30" disabled="true"/>
      <%}else{ %>
      		<s:textfield name="bodyValue.addtypeValue" id="addmethodvalue" size="30" disabled="true"/>
      		<s:hidden name='body.addtype' id='addmethodhiddenid'></s:hidden>
          	<img src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" onclick="openTreeByType('addmethod');" width="21" height="20" >
      <%}%>		
      </td>
      <td class="td_form01">摊销方法</td>
      <td class="td_form02">
       <%if(isCardModify || isCardInfo){%>
      		<e:select parRefKey="CARD_DEPRECIATION_METHOD" list="#{}" name="body.zjtype" id="zjtype" disabled="true" />
      <%}else{ %>
      		<e:select parRefKey="CARD_DEPRECIATION_METHOD" list="#{}" name="body.zjtype" id="zjtype" />
      <%}%>	
      </td>
      <td class="td_form01"><font color="#FF0000"><strong>*</strong></font>是否承继</td>
      <td class="td_form02">
      <%if(isCardInfo){ %>
      	<s:select name="body.ifjc" id="ifjc"  list="#{'':'',1:'否',0:'是'}" disabled="true" ></s:select>
      <%}else{ %>
      	<s:select name="body.ifjc" id="ifjc"  list="#{'':'',1:'否',0:'是'}"></s:select>
      <%} %>
      </td>
    </tr>
    <tr>
      <td class="td_form01"><font color="#FF0000"><strong>*</strong></font>管理部门</td>
      <td class="td_form02">
      <%if(isCardInfo){ %>
      	  <s:textfield name="bodyValue.glbmValue" id="glbmvalue" size="30" disabled="true"/>
      <%}else if(isCardModify){ %>	  
   	      <s:textfield name="bodyValue.glbmValue" id="glbmvalue" size="30" disabled="true"/>
      	  <s:hidden name='body.glbm' id='glbmhiddenid'></s:hidden>
      <%}else{ %>
      	  <s:textfield name="bodyValue.glbmValue" id="glbmvalue" size="30" disabled="true"/>
      	  <s:hidden name='body.glbm' id='glbmhiddenid'></s:hidden>
          <img src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" onclick="openTreeByType('glbm');" width="21" height="20" align="absmiddle"/>
      <%} %>
      </td>
      <td class="td_form01"><font color="#FF0000"><strong>*</strong></font>使用部门</td>
      <td class="td_form02">
      <%if(isCardInfo){ %>
      	  <s:textfield name="bodyValue.usepartmentValue" id="sybmvalue" size="30" disabled="true"/>
      <%}else if(isCardModify){ %>
      	  <s:textfield name="bodyValue.usepartmentValue" id="sybmvalue" size="30" disabled="true"/>
      	  <s:hidden name='body.usepartment' id='sybmhiddenid'></s:hidden>
      <%}else{ %>
          <s:textfield name="bodyValue.usepartmentValue" id="sybmvalue" size="30" disabled="true"/>
      	  <s:hidden name='body.usepartment' id='sybmhiddenid'></s:hidden>
          <img src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" onclick="openTreeByType('sybm');" width="21" height="20" align="absmiddle">
      <%} %>
      </td>
      <td class="td_form01">摊销承担部门</td>
      <td class="td_form02">
      <%if(isCardModify || isCardInfo){%>
      		<s:select name="body.zjcdbm" list="#{0:'管理部门',1:'使用部门'}" disabled="true"></s:select>
      <%}else{ %>
      		<s:select name="body.zjcdbm" list="#{0:'管理部门',1:'使用部门'}"></s:select>
      <%}%>	
      </td>
    </tr>
    <tr>
      <td class="td_form01"><font color="#FF0000"><strong>*</strong></font>开始使用日期</td>
      <td class="td_form02">
      <%if(isCardInfo){ %>
    		<s:date name="%{#request.body.ksdate}" format="yyyy-MM-dd" var="draftDate1"/>
	        <s:textfield id="ksdate1" name="body.ksdate" cssClass="input" value="%{#draftDate1}" disabled="true" />
      <%}else{ %>
        	<s:date name="%{#request.body.ksdate}" format="yyyy-MM-dd" var="draftDate1"/>
	        <s:textfield id="ksdate" name="body.ksdate" cssClass="input" value="%{#draftDate1}" readonly="true" />
      <%} %>
      </td>
      <td class="td_form01">启用日期</td>
      <td class="td_form02">
      <%if(isCardInfo){ %>
	        <s:textfield id="qydate1" name="body.qydate" cssClass="input" disabled="true" />
      <%}else{ %>
	        <s:textfield id="qydate" name="body.qydate" cssClass="input"  readonly="true" />
      <%} %>
      </td>
      <td class="td_form01">变动原因</td>
      <td class="td_form02">
      <%if(isCardModify){%>
      		<s:textfield name="body.changereason" value="卡片修改" disabled="true"></s:textfield>
      <%}else if(isMMergeBody){ %>
      		<s:textfield name="body.changereason" value="卡片合并" disabled="true"></s:textfield>
      <%}else if(isMSplitBody){ %>		
      		<s:textfield name="body.changereason" value="卡片拆分" disabled="true"></s:textfield>
      <%}else if(isCardInfo){ %>
      		&nbsp;
      <%}else{ %>
      		<s:textfield name="body.changereason" value="新增卡片" disabled="true"></s:textfield>
      <%}%>
      </td>
    </tr>
    <tr>
      <td class="td_form01">注销日期</td>
      <td class="td_form02">
      <%if(isCardInfo){ %>
          	<s:date name="%{#request.body.zxrq}" format="yyyy-MM-dd" var="draftDate3"/>
	        <s:textfield id="zxrq1" name="body.zxrq" cssClass="input" value="%{#draftDate3}" disabled="true" />
      <%}else{ %>
          	<s:date name="%{#request.body.zxrq}" format="yyyy-MM-dd" var="draftDate3"/>
	        <s:textfield id="zxrq" name="body.zxrq" cssClass="input" value="%{#draftDate3}" disabled="true" />
      <%} %>
      </td>
      <td class="td_form01">&nbsp;</td>
      <td class="td_form02">&nbsp;</td>
      <td class="td_form01">&nbsp;</td>
      <td class="td_form02">&nbsp;</td>
    </tr>
    <tr>
      <td class="td_form01">主要用途</td>
      <td class="td_form02" colspan="5">
      <%if(isCardInfo){ %>
      	<s:textarea name="body.mainyt" cols="150" rows="4" disabled="true"></s:textarea>
      <%}else{ %>
      	<s:textarea name="body.mainyt" onblur="isString(this);" cols="150" rows="4"></s:textarea>
      <%} %>
      </td>
    </tr>
    </table>
    <table width="100%" border="0"  cellpadding="2" cellspacing="0" align="center"   class="newtable" >
	    <tr><td class="td_form02">&nbsp;</td></tr>
    </table>
	  <table width="100%" border="0" cellpadding="2" cellspacing="0" align="center"   class="newtable" >
	    <tr>
	      <td class="td_form01"><font color="#FF0000"><strong>*</strong></font>原币原值</td>
	      <td class="td_form02">
	      <%if(isCardModify||isMMergeBody||isCardInfo||isMSplitBody){%>
      			<s:textfield name="body.ybyz" id="ybyz" maxlength="20" size="30" disabled="true"/>（元）
	      <%}else{ %>
	      		<s:textfield name="body.ybyz" id="ybyz" onblur="checkFloat(this)" maxlength="20" size="30"/>（元）
	      <%}%>
	      </td>
	      <td class="td_form01">减值准备 </td>
	      <td class="td_form02">
	      <%if(isCardModify||isMMergeBody||isCardInfo||isMSplitBody){%>
      			<s:textfield name="body.jzzb" id="jzzb" maxlength="20" size="30" disabled="true"/>（元）
	      <%}else{ %>
	      		<s:textfield name="body.jzzb" id="jzzb" onblur="checkFloat(this)" maxlength="20" size="30"/>（元）
	      <%}%></td>
	      <td class="td_form01"> 摊销年限 </td>
	      <td class="td_form02">
	      <%if(isCardModify||isCardInfo){%>
      			<s:textfield name="body.txnx" maxlength="20" size="30" disabled="true"/>（年）
	      <%}else{ %>
	      		<s:textfield name="body.txnx" onblur="checkFloat(this);"  maxlength="20" size="30"/>（年）
	      <%}%></td>
	    </tr>
	    <tr>
	      <td class="td_form01">摊销月限</td>
	      <td class="td_form02">
	      <%if(isCardModify||isCardInfo){%>
      			<s:textfield name="body.txyx" maxlength="20" size="30" disabled="true"/>（月）
	      <%}else{ %>
	      		<s:textfield name="body.txyx" onblur="checkFloat(this);"  maxlength="20" size="30"/>（月）
	      <%}%></td>
	      <td class="td_form01">月摊销额</td>
	      <td class="td_form02">
	      <%if(isCardModify||isMMergeBody||isCardInfo||isMSplitBody){%>
      			<s:textfield name="body.montxe" maxlength="20" size="30" disabled="true"/>（元）
	      <%}else{ %>
	      		<s:textfield name="body.montxe" onblur="checkFloat(this);" maxlength="20" size="30"/>（元）
	      <%}%></td>
	      <td class="td_form01">已摊销月份</td>
	      <td class="td_form02">
	      <%if(isCardModify||isCardInfo){%>
      			<s:textfield name="body.ytxyf" maxlength="20" size="30" disabled="true"/>（月）
	      <%}else{ %>
	      		<s:textfield name="body.ytxyf" onblur="checkFloat(this);"  maxlength="20" size="30"/>（月）
	      <%}%></td>
	    </tr>
	    <tr>
	      <td class="td_form01">已摊销额</td>
	      <td class="td_form02">
	      <%if(isCardModify||isMMergeBody||isCardInfo||isMSplitBody){%>
      			<s:textfield name="body.ytxe" maxlength="20" size="30" disabled="true"/>（元）
	      <%}else{ %>
	      		<s:textfield name="body.ytxe" onblur="checkFloat(this);" maxlength="20" size="30"/>（元）
	      <%}%></td>
	      <td class="td_form01">未摊销额</td>
	      <td class="td_form02">
	      <%if(isCardModify||isMMergeBody||isCardInfo||isMSplitBody){%>
      			<s:textfield name="body.wtxe" maxlength="20" size="30" disabled="true"/>（元）
	      <%}else{ %>
	      		<s:textfield name="body.wtxe" onblur="checkFloat(this);" maxlength="20" size="30"/>（元）
	      <%}%></td>
	      <td class="td_form01">&nbsp;</td>
      	  <td class="td_form02">&nbsp;</td>
	    </tr>
	</table>
    <table width="100%" border="0"  cellpadding="2" cellspacing="0" align="center"   class="newtable" >
	    <tr><td class="td_form02">&nbsp;</td></tr>
    </table>
    <table width="100%" border="0" cellpadding="2" cellspacing="0" align="center"   class="newtable" >
	    <tr>
	      <td class="td_form01">权属证明</td>
	      <td class="td_form02">
	      <%if(isCardInfo){ %>
	      <s:select name="body.qszm" list="#{'':'',1:'有',0:'无'}" disabled="true"></s:select>
	      <%}else{ %>
	      <s:select name="body.qszm" list="#{'':'',1:'有',0:'无'}"></s:select>
	      <%} %>
	      </td>
	      <td class="td_form01">土地证号码</td>
	      <td class="td_form02">
	      <%if(isCardInfo){ %>
	      <s:textfield name="body.tdzhm" maxlength="20" size="30" disabled="true" />
	      <%}else{ %>
	      <s:textfield name="body.tdzhm" onblur="isString(this);" maxlength="20" size="30"/>
	      <%} %>
	      </td>
	      <td class="td_form01">权证所有者</td>
	      <td class="td_form02">
	      <%if(isCardInfo){ %>
	      <s:textfield name="body.qzsyz" maxlength="20" size="30" disabled="true" />
	      <%}else{ %>
	      <s:textfield name="body.qzsyz" onblur="isString(this);"  maxlength="20" size="30"/>
	      <%} %>
	      </td>
	    </tr>
	    <tr>
	      <td class="td_form01">占地面积</td>
	      <td class="td_form02">
	      <%if(isCardInfo){ %>
	      <s:textfield name="body.zdmj" maxlength="20" size="30" disabled="true" />平方米
	      <%}else{ %>
	      <s:textfield name="body.zdmj" onblur="checkFloat(this);" maxlength="20" size="30"/>平方米
	      <%} %>
	      </td>
	      <td class="td_form01">&nbsp;</td>
	      <td class="td_form02">&nbsp;</td>
	      <td class="td_form01">&nbsp;</td>
	      <td class="td_form02">&nbsp;</td>
	    </tr>
	</table>
    <table width="100%" border="0"  cellpadding="0" cellspacing="0" align="center"   class="newtable" >
	    <tr><td class="td_form02">&nbsp;</td></tr>
    </table>
	  <table width="100%" border="0" cellpadding="2" cellspacing="0" align="center"   class="newtable" >
	    <tr>
	      <td  class="td_form01">旧卡片编号</td>
	      <td class="td_form02">
	      <%if(isCardModify||isCardInfo){%>
      			<s:textfield name="body.oldcode" maxlength="20" size="30" disabled="true"/>
	      <%}else{ %>
	      		<s:textfield name="body.oldcode" onblur="isString(this);" maxlength="20" size="30"/>
	      <%}%>
	      </td>
	      <td class="td_form01">原始取得价值</td>
	      <td class="td_form02">
	      <%if(isCardModify||isCardInfo){%>
      			<s:textfield name="body.ysqdjz" maxlength="20" size="30" disabled="true"/>（元）
	      <%}else{ %>
	      		<s:textfield name="body.ysqdjz" onblur="checkFloat(this);" maxlength="20" size="30"/>（元）
	      <%}%>
	      </td>
	      <td class="td_form01">2004年1月1日原值</td>
	      <td class="td_form02">
	      <%if(isCardInfo){%>
      			 <s:textfield name="body.oldyearyz" maxlength="20" size="30" disabled="true" />（元）
	      <%}else{ %>
	      		 <s:textfield name="body.oldyearyz" onblur="checkFloat(this);" maxlength="20" size="30"/>（元）
	      <%}%>
	      </td>
	    </tr>
	    <tr>
	      <td class="td_form01">2004年1月1日累计折旧</td>
	      <td class="td_form02">
	      <%if(isCardInfo){%>
      			 <s:textfield name="body.oldyearjz" maxlength="20" size="30" disabled="true"/>
	      <%}else{ %>
	      		 <s:textfield name="body.oldyearjz" onblur="checkFloat(this);" maxlength="20" size="30"/>
	      <%}%>
	      </td>
	      <td class="td_form01">2004年1月1日净值</td>
	      <td class="td_form02">
	      <%if(isCardInfo){%>
      			<s:textfield name="body.oldjz" maxlength="20" size="30" disabled="true"/>（元）
	      <%}else{ %>
	      		<s:textfield name="body.oldjz" onblur="checkFloat(this);" maxlength="20" size="30"/>（元）
	      <%}%>
	      </td>
	      <td class="td_form01">录入日期</td>
	      <td class="td_form02">
	      <s:date name="%{#request.body.lrrq}" format="yyyy-MM-dd" var="draftDate6"/>
	      <s:textfield name="body.lrrq" value="%{#draftDate6}" size="30" disabled="true"/></td>
	  </tr>
	</table>
    <table width="100%" border="0"  cellpadding="0" cellspacing="0" align="center"   class="newtable" >
	    <tr><td class="td_form02">&nbsp;</td></tr>
    </table>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center"   class="newtable" >
	    <tr>
	      <td class="td_form01">备注</td>
	      <td class="td_form02" colspan="5">
	      <%if(isCardInfo){%>
      			<s:textarea name="body.bzsm" cols="150" rows="4" disabled="true"></s:textarea>
	      <%}else{ %>
	      		<s:textarea name="body.bzsm" onblur="isString(this);" cols="150" rows="4"></s:textarea>
	      <%}%>
	      </td>
	    </tr>
	</table>
    <table width="100%" border="0"  cellpadding="0" cellspacing="0" align="center"   class="newtable" >
	    <tr><td class="td_form02">&nbsp;</td></tr>
    </table>
    <%if(!isCardInfo){ %>
	<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center"   class="newtable" >
	    <!--
	    <tr>
	      <td nowrap class="td_form01">文档管理</td>
	      <td colspan="5" class="td_form02">
	      	<table width="100%" height="100%" border="0" align="center"cellpadding="5" cellspacing="0" class="table01" id="fileTable">
	          <tr><td colspan="2" align="right" class="td03"><input type="file" name="file" id="file" style="display: none;" onChange="addRow(this,'fileTable')"/>
	                <input type="button" class="buttonface" value="选择文件..." onClick="file.click();" name="optionButton32" />
	    </td></tr></table></td></tr>
	    <tr>
	      <td nowrap class="td_form01">权证管理</td>
	      <td colspan="5" class="td_form02"><table width="100%" height="100%" border="0" align="center"cellpadding="5" cellspacing="0" class="table01" id="fileTable2">
	          <tr><td colspan="2" align="right" class="td03"><input type="file" name="file2" id="file2" style="display: none;" onChange="addRow(this,'fileTable2')"/>
	                <input type="button" class="buttonface" value="选择文件..." onClick="file2.click();" name="optionButton42" />
	          </td></tr>
	      </table></td>
	    </tr> -->
	    <tr>
	      <td align="right" colspan="6">
	      	<input name="Submit2" type="button" class="buttonface02" value="  确定  " <%=isAddModify||isModify||isCardModify||isMMergeBody||isMSplitBody?"onclick='formModify()'":"onclick='formSubmit()'" %>/>
	        <input name="Submit2" type="button" class="buttonface02" value="  取消  " onClick="closewindow()"/>
	      </td>
	    </tr>
	  </table>
	  <%}else{ %>
	  &nbsp;
	  <%} %>
</s:form>
</body>
</html>
<SCRIPT LANGUAGE="JavaScript">
	if('<%=request.getAttribute("message")%>' != "null") {
		var sheetType = '<%=request.getAttribute("sheetType")%>';
		var closewin = '<%=request.getAttribute("closewin")%>';
		alert("<%=request.getAttribute("message")%>！");
		if((sheetType=='modify'||sheetType=='merge')&& closewin=='true'){
			window.opener.reloadJqGrid();
			window.close();
		}else if(sheetType=='modify'){
			window.parent.reloadJqGrid();
			window.close();
		}else{
			window.parent.opener.reloadJqGrid();
			window.parent.close();
		}
	}
	function closewindow(){
		var sheetType = '<%=request.getAttribute("sheetType")%>';
		var closewin = '<%=request.getAttribute("closewin")%>';
		if((sheetType=='modify'||sheetType=='merge')&& closewin=='true'){
			window.close();
		}else if(sheetType=='modify'){
			window.close();
		}else{
			window.parent.close();
		}
	}
</SCRIPT>