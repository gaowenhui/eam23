<%@page language="java" import="java.util.*"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/kpgl/checkJS.inc" %>
<%@page language="java" import="com.tansun.eam2.common.model.orm.bo.JyzcSqsdfyXx"%>
<% 
 String bmbh = (String) request.getAttribute("bmbh");
 String sfsjfy = (String) request.getAttribute("sfsjfy");
 String chakan =(String)request.getAttribute("chakan");
 String isRCModify1 = (String)(request.getAttribute("isRCModify")==null?"":request.getAttribute("isRCModify")); 
 String jbh = (String)(request.getAttribute("jbh")==null?"":request.getAttribute("jbh")); 
 boolean isRCModify = "true".equals(isRCModify1)?true:false; //是否是日常管理的修改功能
 String isAdd = "true".equals(request.getParameter("isAdd"))?"true":"false";
 if("true".equals((String)request.getAttribute("isAdd"))){
	isAdd = "true";
}
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title></title>
		<SCRIPT language=JavaScript type=text/JavaScript>
	$(function(){
	    if(<%=chakan%>!=1){
			var buttonAssetJSonString = '[{"buttonHandler":"chooseZC","buttonIcon":"icon-add","buttonText":"增加资产"}]';
			addButtons(jQuery("#addasset"),buttonAssetJSonString);		    
	   		}else{
	   		document.getElementById("quanding").style.display="none";
			document.getElementById("guanbi").style.display="none";
			document.getElementById("search").style.display="none";
			
	   		}
	   		
		if("bmldsh"!="${sheettype2}"){
			var xx = false;
			$.each($("input[name='data3']"),function(i,n){
				if($(n).val() != "")
					xx = true;
			});
			if(!xx)
				setValue();
		}else{
			var xx = false;
			$.each($("input[name='data3']"),function(i,n){
				if($(n).val() != "")
					xx = true;
			});
			if(!xx)
				setValue();
			$("input[name='data3']").attr("disabled","disabled");
		}
		//alert("<%=jbh%>");
		if("010"=="<%=jbh%>"){
			$("#jbh2hidden").val("总行本级");
			//alert(document.getElementById("jbh2hidden").value);
				//document.getElementById("jbh2").value = "总行本级";
				
		}else{
			document.getElementById("jbh2").value = document.getElementById("jbh2hidden").value
			if(document.getElementById("jbh2").value!=null||document.getElementById("jbh2").value!=""){
				changeJBH();
			}
		}
		
	})	
	
	function setValue(){
		$.each($("input[name='data2']"),function(i,n){
			$(n).next("input[name='data3']").val($(n).val());
		});
	}
	
    function chooseZC(){
       var sheettype=document.getElementById("sheettype").value;
       var bmbh ="<%=bmbh%>";
       bmbh = encodeURI(bmbh);
       var ywlx = "${ywlx}";
       if("else"==ywlx){
       	var vReturnValue=window.showModalDialog('<%=request.getContextPath()%>/jygdzc/AssetQuery_init.do?returnValue=true&mulSelect=false&sheettype='+sheettype+'&isModal=true&bmbh='+bmbh,'_blank','help:no;scroll:yes;resizable:no;status:0;dialogWidth:1050px;dialogHeight:600px;center:yes');
       	if(typeof(vReturnValue)!='undefined'){
       		var url = "<%=basePath%>jygdzc/AssetManageBody_prepareValue1.do"
       		$.post(url,{
       			gr:""+vReturnValue+""},
				function(returnStr){
				assetView(returnStr);
			});
       	}
       	// window.open('<%=request.getContextPath()%>/jygdzc/AssetQuery_init.do?returnValue=true&mulSelect=false&bmbh='+<%=bmbh%>+'&sheettype='+sheettype,'','height=500, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
        }else{
        	var vReturnValue = window.showModalDialog('<%=request.getContextPath()%>/jygdzc/AssetQuery_init.do?ywlx=manage&returnValue=true&isModal=true&mulSelect=false&sheettype='+sheettype+'&bmbh='+bmbh,'_blank','help:no;scroll:yes;resizable:no;status:0;dialogWidth:1050px;dialogHeight:600px;center:yes');
       		// window.open('<%=request.getContextPath()%>/jygdzc/AssetQuery_init.do?ywlx=manage&returnValue=true&mulSelect=false&sheettype='+sheettype,'','height=500, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
    		if(typeof(vReturnValue)!='undefined'){
        		var url = "<%=basePath%>jygdzc/AssetManageBody_prepareValue1.do"
        		$.post(url,{
        			gr:""+vReturnValue+""},
					function(returnStr){
					assetView(returnStr);
				});
        	}
    	}
    }
    function assetView(objString){
		reobj = eval('(' + objString + ')');
			document.getElementById("zcId").value = reobj.rows[0].id == null?"":reobj.rows[0].id;
			document.getElementById("zcbh").value = reobj.rows[0].zcbh == null?"":reobj.rows[0].zcbh;
			document.getElementById("zcmc").value = reobj.rows[0].zcmc == null?"":reobj.rows[0].zcmc;
			document.getElementById("CJyfl").value = reobj.rows[0].CJyfl == null?"":reobj.rows[0].CJyfl;
			document.getElementById("CZczc").value = reobj.rows[0].CZczc == null?"":reobj.rows[0].CZczc;
			document.getElementById("CZcdq").value = reobj.rows[0].CZcdq == null?"":reobj.rows[0].CZcdq;
			document.getElementById("CYt").value = reobj.rows[0].CYt == null?"":reobj.rows[0].CYt;
			document.getElementById("glbm").value = reobj.rows[0].glbm == null?"":reobj.rows[0].glbm;
			document.getElementById("sybm").value = reobj.rows[0].sybm == null?"":reobj.rows[0].sybm;
	}
    function addValue(gr){
   	 	var isAdd = "<%=isAdd%>";
   	 	var isRCModify = "<%=isRCModify1%>";
    	$("#myForm").attr("action","<%=basePath%>jygdzc/AssetManageBody_prepareValue.do?gr="+gr+"&isAdd="+isAdd+"&isRCModify="+isRCModify);
    	$("#myForm").submit();
    	return false;
	}
	function checkXmmc(aaa){
		var aa= aaa.value;
		if(aa==null||""==aa){
			aaa.focus();
			alert("项目名称不能为空");
			
		}
	}
	function checkJE(AAA){
		checkFloat(AAA);
		setValue();
		
	}
	function checkHtml(){
		if("010"!="<%=jbh%>"){
			//var jbh2 = document.getElementById("jbh2").value;
			//if( jbh2 == null|| jbh2==""){
			///	alert("经办行不能为空");
			//	str = false;
			//	return str;
			//}
		}
		var fyzl = document.getElementById("CFyzlvalue").value;
		if("1"==<%=sfsjfy%>){
			if(fyzl == null ||fyzl == "" ){
				alert("费用种类不能为空");
				str = false;
				return str;
			}
		}
		var data1s= document.getElementsByName("data1");
		var data2s= document.getElementsByName("data2");
		var str = true;
		for (var i=1;i<data1s.length;i++){
			var data1=data1s[i].value;
			if(data1==null||data1==""){
				alert("项目名称不能为空");
				str = false;
				return str;
			}
		}
		for (var i=1;i<data2s.length;i++){
			var data2=data2s[i].value;
			if(data2==null||data2==""){
				alert("申请金额不能为空");
				str = false;
				return str;
			}
			//解决发送erp中accsubjId字段为空的问题。如果有申请金额，请添加费用种类。
			if(data2!=null || date2!=""){
				if(fyzl==null ||fyzl ==""){
		    		alert("费用种类不能为空");
					str = false;
					return str;
				}
			}
		}
		var blsm = document.getElementById("blsm").value;
		if(blsm == null || blsm ==""){
			alert("办理说明不能为空");
			str = false;
			return str;
		}
		return str;
	}
	function checkAsset(){
		var isChooseAsset = document.getElementById("isChooseAsset").value;
		if(isChooseAsset !='true'){
			alert("请先选择资产");
		}
	}
	function addFY(){
		if(checkHtml()){
			$("input[name='data3']").attr("disabled",false);
			if("010"!="<%=jbh%>"){
				document.getElementById("jbh2hidden").value = document.getElementById("jbh2").value
			}
			var zcbh = document.getElementById("zcbh").value;
			var isRCModify    = '<%=isRCModify1%>'; //是修改的功能
			var isAdd = "<%=isAdd%>";
			if(zcbh!=null&&""!=zcbh){
				myForm.action="<%=request.getContextPath()%>/jygdzc/AssetManageBody_addFy.do?isRCModify="+isRCModify+"&isAdd="+isAdd;
		    	myForm.submit();
			}else{
				alert("请选择资产");
			}
		}
	}
	function openTreeByType(type4jygdzc){//打开树，根据类型打开类型
		var url = "<%=request.getContextPath()%>/jygdzc/AssetQuery_toTree.do?type4Jygdzc="+type4jygdzc;
		var _g_privateDialogFeatures = 'height=400, width=200,toolbar=no,scrollbars=yes,location=no,directories=no,menubar=no,resizable=no,left=400,top=200';
		window.open(url,'',_g_privateDialogFeatures);
	}
	function getCallBack4Tree(type4jygdzc,id,value){//弹出树页面的回调方法 departmenthiddenid,departmentvalue
		document.getElementById("CFyzlhiddenid").value = id;
		document.getElementById("CFyzlvalue").value 	= value;
	}
	function changeJBH(){					//add by lantianbo 取得经办行
		//var sheng = document.getElementById("jbh").value;
		var sheng ='<%=jbh%>';
		if("010"==sheng){
				document.getElementById("jbh2").value = "总行本级";
				
		}else{
			var url ="<%=request.getContextPath()%>/jygdzc/JBHQuery_jbhQuery.do";
			$.post(url,{sheng:"" + sheng + ""}, function(data){
				var child = document.getElementById("jbh2");
		    	for(var i=0;i<child.options.length;i++){
					child.remove(i);
					i=i-1;
				}
		    	var JSON = eval('(' + data + ')');
		    	var jbh = JSON.jbh;
		    	var option = document.createElement("OPTION");
	       		for(var i = 0;i<jbh.length;i++){
	           		option = document.createElement("OPTION");
	           		option.value=jbh[i].jbhkey;
					option.text= jbh[i].jbhvalue;
					child.add(option);
	           	}
	           	document.getElementById("jbh2").value = document.getElementById("jbh2hidden").value
			});
		}
	}
</SCRIPT>
	</head>
	<body  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" >
		<table id="TableBox1" style="display:none" width="100%" border="0" cellspacing="0" cellpadding="0" align="center"  class="newtable">
			<tr>
			<td nowrap="nowrap">
				<a href="#" onclick="myDeleteRow(this);return false;">&nbsp;x&nbsp;</a><font color="red">*</font>
				项目名称:
				<input type="text" onblur="checkXmmc(this);"  name="data1"/> <font color="red">*</font>
				申请金额:
				<input type="text" onblur="checkJE(this);"  name="data2"/> 
				审定金额：
				<input type="text" onblur="checkFloat(this);" name="data3"/>
			</td>
			</tr>
		</table>
		<s:form id="myForm">
		    <input type="hidden" name="bmbh" value="<%=bmbh%>">
 			<s:hidden name="headId" value="%{#request.headId}" />
			<s:hidden name="ywlx" value="%{#request.ywlx}" />
			<s:hidden name="sheettype2" id="sheettype2" value="%{#request.sheettype2}" />
			<s:hidden name="sheettype" value="%{#request.sheettype}" />
			<s:hidden name="zcId" value="%{#request.assetInfoVO.id}" />
			<s:hidden name="jyzcXx.id"/>
			<s:hidden name="jyzcXxLsb.id"/>
			<s:hidden name="isChooseAsset" value="%{#request.isChooseAsset}"/>
			<div class="panel-header" style="width: 100%;">
				<div class="panel-title">
					资产信息
				</div>
				<div id="addasset" class="panel-tool"></div>
			</div>	
			<table width="100%" border="0" class="newtable" cellpadding="2"  cellspacing="0"
				align="center">
				<s:set name="biaodanid" value="headId" />
				<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
				<tr>
					<td class="td_zxy01">资产编号：</td>
					<td class="td_zxy02"><s:textfield name="assetInfoVO.zcbh" id="zcbh" cssClass="input" disabled="true"></s:textfield></td>
					<td class="td_zxy01">资产名称：</td>
					<td class="td_zxy02"><s:textfield name="assetInfoVO.zcmc" id="zcmc" cssClass="input" disabled="true"></s:textfield></td>
				</tr>
				<tr>
					<td class="td_zxy01">经营分类：</td>
					<td class="td_zxy02"><e:select parRefKey="ASSET_MANAGE_TYPE" headerKey="" headerValue="" list="#{}" name="assetInfoVO.CJyfl" id="CJyfl" cssClass="input" disabled="true"/></td>
					<td class="td_zxy01">资产状态：</td>
					<td class="td_zxy02">
						<e:select parRefKey="ASSET_STATUS" headerKey="" headerValue="" list="#{}" name="assetInfoVO.CZczc" cssClass="input" id="CZczc" disabled="true"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">地区：</td>
					<td class="td_zxy02"><e:select parRefKey="PROVIENCE" headerKey="" headerValue="" id="CZcdq" cssClass="input" list="#{}" name="assetInfoVO.CZcdq"   disabled="true"/></td>
					<td class="td_zxy01">用途：</td>
					<td class="td_zxy02"><e:select parRefKey="ASSET_USE" list="#{}" headerKey=""  headerValue="" name="assetInfoVO.CYt" id="CYt" cssClass="input" disabled="true"/></td>
				</tr>
				<tr>
					<td class="td_zxy01">管理部门：</td>
					<td class="td_zxy02"><s:textfield name="assetInfoVO.glbm" size="30" id="glbm" readonly="true" cssClass="input"  disabled="true"/></td>
					<td class="td_zxy01">使用部门：</td>
					<td class="td_zxy02"><s:textfield name="assetInfoVO.sybm" size="25" id="sybm" readonly="true" cssClass="input" disabled="true"/></td>
				</tr>
				<tr>
					<td class="td_zxy01">经办行：</td>
					<td class="td_zxy02" >
					<%if("010".equals(request.getAttribute("jbh"))){ %>
						<s:select name='jyzcXxLsb.CEjfhbh' list="#{'110000000':'总行本级'}"  id='jbh2hidden'/>
					<%}else{ %>
					 	<s:select style='display:none' hidden='true' name='jyzcXxLsb.CJbhbh' id='jbh' onchange="changeJBH()" 
							list ="jbhList" listKey ="jbhkey" listValue ="jbhvalue"/> 
						<s:select  id='jbh2' headerKey="" headerValue="" list="#{}"  />
						<s:hidden name='jyzcXxLsb.CEjfhbh'  id='jbh2hidden'/>
					<%} %>
					</td>
					<td class="td_zxy01">
					<% if("1".equals(request.getAttribute("sfsjfy"))){%>
							<font color="red">*</font>费用种类：
							
					<% 	}else{%>
							费用种类：
					<%} %>
					</td>
					<td class="td_zxy02"   >
						<s:textfield name="assetInfoVO.CFyzlValue" id="CFyzlvalue"  cssClass="input" readonly="true"/>
      					<s:hidden name='jyzcXxLsb.CFyzl' id='CFyzlhiddenid'></s:hidden>
          				<img src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" id="search" onclick="openTreeByType('feiyong');" width="21" height="20" >
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">币种：</td>
					<td class="td_zxy02"><e:select parRefKey="CURRENCY"   id="CBz" cssClass="input" list="#{}" name="jyzcXxLsb.CBz" /></td>
					<td class="td_zxy01">结算方式：</td>
					<td class="td_zxy02"><e:select parRefKey="SETTLEMENT_METHOD" list="#{}"  name="jyzcXxLsb.CJsfs" id="CJsfs" cssClass="input" /></td>
				</tr>
				<tr>
					<td class="td_zxy01">金额：</td>
					<td class="td_zxy02" colspan="3">
						<table width="100%" class="td_zxy02">
							<tr>
							<td >
								<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" class="newtable">
										<tr>
											<td >
												<a href="#" onclick="AddTable_base();return false;">&nbsp;+ &nbsp;</a>增加金额明细 
											</td>
										</tr>
								</table>
								<table id="TableBox" width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
									<s:iterator var="sqsd"  value="%{#request.sqsdfyxxs}" >
										<tr>
										<td nowrap="nowrap">
											<a href="#" onclick="myDeleteRow(this);return false;">&nbsp;x&nbsp;</a><font color="red">*</font>
											项目名称:
											<s:textfield type="text" name="data1" onblur="checkXmmc(this);"  value="%{#sqsd.xmmc}"/><font color="red">*</font> 
											申请金额:
											<s:textfield type="text" name="data2" onblur="checkJE(this);" value="%{#sqsd.sqje}"/> 
											审定金额：
											<s:textfield type="text" name="data3" onblur="checkFloat(this);" value="%{#sqsd.sdje}"/>
										</td>
										</tr>
									</s:iterator>
								</table>
							</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01"><font color="red">*</font>办理说明(小于650字)：</td>
					<td class="td_form02" colspan="5">
						<s:textarea name="jyzcXxLsb.blsm" id = "blsm" style="width:94%;" rows="4"  />
					</td>
				</tr>
			</table>
			<table width="100%" border="0" class="newtable" cellpadding="2"  cellspacing="0"
				align="center" >
				<tr>
					<td colspan="4" align="right">
						<input type="button" value="确定" id="quanding" onclick="addFY();" />
						&nbsp;&nbsp;
						<input type="button" value="关闭" id="guanbi"
							onclick="closeBody();" />
					</td>
				</tr>
			</table>
		</s:form>
	</body>
</html>
<SCRIPT language=JavaScript type=text/JavaScript>
	function closeBody(){
		if(confirm("是否保存已修改？")){
			addFY();
			window.close();
		}else{
			 window.close();
		}
	}
	var xxx;
	$(function(){
		xxx =  $("#TableBox1").html();
	});
	function myDeleteRow(hrefObj){
		var rowObj = hrefObj.parentElement.parentElement;
		$(rowObj).remove();
	}
	function AddTable_base(){
		$("#TableBox").append(xxx);
	}
</SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
	if('<%=request.getAttribute("message")%>' != "null") {
		window.opener.setdisabled();
		window.opener.reloadJqGrid1();
		window.opener.reloadJqGrid2();
		alert("<%=request.getAttribute("message")%>！"); 
		window.close();
	}
</SCRIPT>

