<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/kpgl/checkJS.inc" %>
<html>
	<head>
		<base href="<%=basePath%>">
		<title>经营租赁</title>
<SCRIPT language=JavaScript type=text/JavaScript>
	var x = false;
	$(function(){
		if(x)return;
		x = true;
		var alldesable = "${alldesable}";
	 	var ywlx = "${ywlx}";
		if(alldesable){
			$("input,select,textarea").attr("disabled","disabled");
			document.getElementById("addasset").style.display="none";
			document.getElementById("addtenancy").style.display="none";
		}else{
			var buttonAssetJSonString = '[{"buttonHandler":"assetQuery","buttonIcon":"icon-add","buttonText":"增加资产"}\
											]';
			addButtons(jQuery("#addasset"),buttonAssetJSonString);
			if(ywlx!="rent"){
				var buttonTenancyJSonString = '[{"buttonHandler":"tenancyQuery","buttonIcon":"icon-add","buttonText":"合同信息"}\
												]';
				addButtons(jQuery("#addtenancy"),buttonTenancyJSonString);
			}
			if($("#id").val()!=null&&""!=$("#id").val()){
				window.opener.reloadGrid();
			}
		}
		if(ywlx=="rent"){
			document.getElementById("rent").style.display="block";
			//document.getElementById("addtenancy").style.display="none";
			document.getElementById("change").style.display="none";
			document.getElementById("quit").style.display="none";
			
		}else if(ywlx=="change"){ 
			document.getElementById("rent").style.display="none";
			document.getElementById("change").style.display="block";
			document.getElementById("quit").style.display="none";
			document.getElementById("contractView").style.display="block";
			
		}else if(ywlx=="quit"){
			document.getElementById("rent").style.display="none";
			document.getElementById("change").style.display="none";
			document.getElementById("quit").style.display="block";
			document.getElementById("contractView").style.display="block";
			document.getElementById("tenancyView").style.display="none";
		}
		if('<%=request.getAttribute("message")%>' != "null") {
			alert("<%=request.getAttribute("message")%>！"); 
			window.close();
		}
		$("#zlqsrq,#tzrq,#zldqrq").datebox({
			formatter:function(date){
			return formatDate(date);
			}
		});
	});
	// 检验float （金额）
	function checkczsl(thisFloat){
		var theFloat =thisFloat.value;
		var flag = isFloat(theFloat);
		if(flag==false){
			alert('请输入正确的数量');
			thisFloat.focus();
		}
		for(var i = 0; i < theFloat.length;i++){
			var ch=theFloat.charAt(i);
			if(ch=='.'){
				if(theFloat.length - i > 3){
					alert('小数点后面最多只能有两位');
					thisFloat.focus();
				}
			}
		}
	}
	function AddTable(){
		var td = TableBox.insertRow().insertCell();
		td.className = 'td_zxy02';
		td.colSpan = '9';
		td.innerHTML="<a href='#' onclick='javascript:DeleteRow(this);return false;'>&nbsp;x&nbsp;</a>&nbsp;变更事项：<input name='jyzcZlBgmx.bgsx'/>&nbsp;变更后内容：<input name='jyzcZlBgmx.bghnr'/>";
	}
	function DeleteRow(hrefObj){
		var rowObj = hrefObj.parentElement.parentElement;
		$(rowObj).remove();
	}
	function assetQuery(){
	    var bmbh = document.getElementById("bmbh").value;
	    bmbh = encodeURI(bmbh);
  		var vReturnValue=window.showModalDialog('<%=basePath%>jygdzc/AssetQuery_init.do?ywlx=tenancy&sheettype=assetQuery&returnValue=true&mulSelect=false&isModal=true&bmbh='+bmbh,'_blank','help:no;scroll:yes;resizable:no;status:0;dialogWidth:1050px;dialogHeight:500px;center:yes');
  		if(typeof(vReturnValue)!='undefined'){
  			addValue(vReturnValue);
		}
  	// window.open('<%=basePath%>jygdzc/AssetQuery_init.do?ywlx=tenancy&sheettype=assetQuery&returnValue=true&mulSelect=false','','height=500, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
	}
	function tenancyQuery(){
		var zcId =document.getElementById("zcId").value;
		var ywlx = document.getElementById("ywlx").value;
  	 	//window.open('<%=basePath%>zltb/IntentionManageBody_newBody.do?sheettype=tenancyList&zcId=' + zcId + '&headId=${headId}','','height=400, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
		var vReturnValue=window.showModalDialog('<%=basePath%>zltb/IntentionManageBody_newBody.do?sheettype=tenancyList&headId=${headId}&zcId=' + zcId,'_blank','help:no;scroll:yes;resizable:no;status:0;dialogWidth:1050px;dialogHeight:500px;center:yes');	
		if(typeof(vReturnValue)!='undefined'){
			addtenancy(vReturnValue);
		}
	}
	
	function addValue(gr){
		var delblyjurl ="<%=basePath%>zltb/IntentionManageBody_assetView.do";
		$.post(delblyjurl,
			{zcId:"" + gr },
			function(returnStr){
			assetView(returnStr);
		});
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
			document.getElementById("jzmj").value = reobj.rows[0].jzmj == null?"":reobj.rows[0].jzmj;
			document.getElementById("tdmj").value = reobj.rows[0].tdmj == null?"":reobj.rows[0].tdmj;
			document.getElementById("yzmj").value = reobj.rows[0].yzmj == null?"":reobj.rows[0].yzmj;
			
	}
	function addtenancy(gr){
		document.getElementById("aaaa").value=gr;
		var delblyjurl ="<%=basePath%>zltb/IntentionManageBody_contractView.do";
		$.post(delblyjurl,{htId:"" + gr + ""},function(ojb){
			tenancyView(ojb);
		});
	}
	function tenancyView(objString){
		reobj = eval('(' + objString + ')');   
		document.getElementById("htjydx").value = reobj.rows[0].jydx == null?"":reobj.rows[0].jydx;
		document.getElementById("htczr").value = reobj.rows[0].CJbhsf == null?"":reobj.rows[0].CJbhsf;
		document.getElementById("htqsrq").value = reobj.rows[0].htqsrq == null?"":reobj.rows[0].htqsrq;
		document.getElementById("htdqrq").value = reobj.rows[0].htdqrq == null?"":reobj.rows[0].htdqrq;
		document.getElementById("zlyt").value = reobj.rows[0].zlyt == null?"":reobj.rows[0].zlyt;
		//document.getElementById("czr").value = reobj.rows[0].czr == null?"":reobj.rows[0].czr;
		//document.getElementById("yxzjzje").value = reobj.rows[0].yxzjzje == null?"":reobj.rows[0].yxzjzje;
		//document.getElementById("yxzlmj").value = reobj.rows[0].yxzlmj == null?"":reobj.rows[0].yxzlmj;
		//document.getElementById("yxzq").value = reobj.rows[0].yxzq == null?"":reobj.rows[0].yxzq;
		//document.getElementById("czyt").value = reobj.rows[0].czyt == null?"":reobj.rows[0].czyt;
		//document.getElementById("zlsm").value = reobj.rows[0].zlsm == null?"":reobj.rows[0].zlsm;
		//document.getElementById("aaaa").value = reobj.rows[0].jyzlId == null?"":reobj.rows[0].jyzlId;
		var ywlx = "${ywlx}";
		if(ywlx=="change"){
			document.getElementById("jydx").value = reobj.rows[0].jydx == null?"":reobj.rows[0].jydx;
			document.getElementById("czr").value = reobj.rows[0].CJbhsf == null?"":reobj.rows[0].CJbhsf;
			document.getElementById("zlqsrq").value = reobj.rows[0].htqsrq == null?"":reobj.rows[0].htqsrq;
			document.getElementById("zldqrq").value = reobj.rows[0].htdqrq == null?"":reobj.rows[0].htdqrq;
			document.getElementById("czyt").value = reobj.rows[0].zlyt == null?"":reobj.rows[0].zlyt;
			document.getElementById("aaaa").value = reobj.rows[0].id == null?"":reobj.rows[0].id;
			url ="<%=basePath%>zltb/IntentionManageBody_delete.do";
			$.post(url,{"zllsbId":$("#id").val(),"headId":"${headId}"},
				function(str){
				if("成功"==str){
					jQuery("#change_list").trigger("reloadGrid") ;
				}else{
					alert("删除变动信息失败");
				}
			});
		}
	}
	function checkHtml(){
		var zcbh= document.getElementById("zcbh").value;
		if(zcbh==null||zcbh==""){
			alert("请选择资产");
			return false;
		}
		var ywlx = "${ywlx}";
		if(ywlx!="quit"){
			if(ywlx=="change"){
				var aaaa= document.getElementById("aaaa").value;
				if(aaaa==null||aaaa==""){
					alert("请添加合同信息");
					return false;
				}
			}
			var jydx= document.getElementById("jydx").value;
			if(jydx==null||jydx==""){
				alert("交易对象不能为空");
				return false;
			}
			//var CJbhsf= document.getElementById("CJbhsf").value;
			//if(CJbhsf==null||CJbhsf==""){
			//	alert("经办行省份不能为空");
			//	return false;
			//}       
			var CEjjbh= document.getElementById("CEjjbh").value;
			if(CEjjbh==null||CEjjbh==""){
				alert("一级经办行不能为空");
				return false;
			}
			var zlqsrq= document.getElementById("zlqsrq").value;
			if(zlqsrq==null||zlqsrq==""){
				alert("租赁起始日期不能为空");
				return false;
			}
			var zldqrq= document.getElementById("zldqrq").value;
			if(zldqrq==null||zldqrq==""){
				alert("租赁到期日期不能为空");
				return false;
			}
			var czr= document.getElementById("czr").value;
			if(czr==null||czr==""){
				alert("承租人不能为空");
				return false;
			}
			var yxzjzje= document.getElementById("yxzjzje").value;
			if(yxzjzje==null||yxzjzje==""){
				alert("意向租金总金额不能为空");
				return false;
			}
			var yxzlmj= document.getElementById("yxzlmj").value;
			if(yxzlmj==null||yxzlmj==""){
				alert("意向租赁数量不能为空");
				return false;
			}
			var dldw= document.getElementById("dldw").value;
			if(dldw==null||dldw==""){
				alert("度量单位不能为空");
				return false;
			}
			var yxzq= document.getElementById("yxzq").value;
			if(yxzq==null||yxzq==""){
				alert("意向租期不能为空");
				return false;
			}
			var sd = document.getElementById('zlqsrq').value;
			var ed = document.getElementById('zldqrq').value;
			var flags = true;
			var flage = true;
			if(sd!=''&&sd!=null){
				flags = isDate(sd);
			}
			if(ed!=''&&ed!=null){
				flage = isDate(ed);
			}
			if(flags==false||flage==false){
				alert('请输入正确的日期格式，例如：2010-01-01');
				return false;
			}
			if(sd!='' && ed!='' && sd > ed){
				alert("开始日期不应该大于结束日期，请重新输入！");
				return false;
			}
		}else{
			var aaaa= document.getElementById("aaaa").value;
			if(aaaa==null||aaaa==""){
				alert("请添加合同信息");
				return false;
			}
			var tzrq= document.getElementById("tzrq").value;
			if(tzrq==null||tzrq==""){
				alert("退租日期不能为空");
				return false;
			}
			var tzblsm= document.getElementById("tzblsm").value;
			if(tzblsm==null||tzblsm==""){
				alert("退租办理说明不能为空");
				return false;
			}
		}
		return true;
		
	}
	function saveBody(){
		if(checkHtml()){
			$("select,input").attr("disabled",false);
			myform.action="<%=basePath%>zltb/IntentionManageBody_saveBody.do?zcId=${jyzcXxVO.id}&handle=amend";
			myform.submit();
		}
	}
	function closeBody(){
			 window.close();
	}
</SCRIPT>

	</head>

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<s:form action="/zltb/IntentionManageBody_saveBody.do" id="myform"
			method="post">
			<input type="hidden" name="bmbh" id="bmbh" value="${bmbh}" />
			<s:hidden name="headId" value="%{#request.headId}" />
			<s:hidden name="zllsbId" id ="bbb" value="%{#request.zllsbId}" />
			<s:hidden name="zlXxId"  value="%{#request.jyzcJyzlLsbVO.jyzlId}" />
			<s:hidden name="jyzcJyzlLsbVO.htId" id="aaaa"  value="%{#request.jyzcJyzlLsbVO.htId}" />
			<s:hidden name="ywlx" id="ywlx" value="%{#request.ywlx}" />
			<s:hidden name="sheettype"  value="%{#request.sheettype}" />
			<s:hidden name="jyzcJyzlLsbVO.cldId" value="%{#request.headId}" />
			<s:hidden name="jyzcJyzlLsbVO.id" id="id" value="%{#request.jyzcJyzlLsbVO.id}" />
			<s:hidden name="jyzcJyzlLsbVO.zcId" id="zcId" value="%{#request.jyzcXxVO.id}" />
				
		<div class="panel-header" style="width: 100%;">
				<div class="panel-title">
					资产信息
				</div>
				<div id="addasset" class="panel-tool"></div>
		</div>		
			<table class="newtable" width="100%" id="table" border="0"
				cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td class="td_zxy01">
						资产编号：
					</td>
					<td class="td_zxy02">
						<s:textfield name="jyzcXxVO.zcbh" id="zcbh" disabled="true"
							cssClass="input"  value="%{#request.jyzcXxVO.zcbh}" />
					</td>
					<td class="td_zxy01">
						资产名称：
					</td>
					<td class="td_zxy02">
						<s:textfield name="jyzcXxVO.zcmc" disabled="true" id="zcmc"
							cssClass="input" value="%{#request.jyzcXxVO.zcmc}" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						经营分类：
					</td>
					<td class="td_zxy02">
						<s:textfield name="jyzcXxVO.CJyfl" disabled="true" id="CJyfl"
							cssClass="input" value="%{#request.jyzcXxVO.CJyfl}" />
					</td>
					<td class="td_zxy01">
						资产状态：
					</td>
					<td class="td_zxy02">
						<s:textfield name="jyzcXxVO.CZczc" disabled="true" id="CZczc"
							cssClass="input" value="%{#request.jyzcXxVO.CZczc}" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						地区：
					</td>
					<td class="td_zxy02">
						<s:textfield name="jyzcXxVO.CZcdq" disabled="true" id="CZcdq"
							cssClass="input" value="%{#request.jyzcXxVO.CZcdq}" />
					</td>
					<td class="td_zxy01">
						用途：
					</td>
					<td class="td_zxy02">
						<s:textfield name="jyzcXxVO.CYt" id="CYt" disabled="true"
							cssClass="input" value="%{#request.jyzcXxVO.CYt}" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						管理部门：
					</td>
					<td class="td_zxy02">
						<s:textfield name="jyzcXxVO.glbm" id="glbm" disabled="true"
							cssClass="input" value="%{#request.jyzcXxVO.glbm}" />
					</td>
					<td class="td_zxy01">
						使用部门：
					</td>
					<td class="td_zxy02">
						<s:textfield name="jyzcXxVO.sybm" id="sybm" disabled="true"
							cssClass="input" value="%{#request.jyzcXxVO.sybm}" />
					</td>
				</tr>
			</table>
			<div id="contractView" style="display: none">
				<div class="panel-header" style="width: 100%;">
					<div class="panel-title">
							合同信息
					</div>
					<div id="addtenancy" class="panel-tool"></div>
				</div>	
				<table class="newtable" width="100%"  border="0"
				cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td class="td_zxy01">
						交易对象：
					</td>
					<td class="td_zxy02" >
						<s:select list="#{'0':'','1':'建行',2:'非建行'}" name="jyzcJyzlLsbVO.htjydx" id="htjydx"
						disabled="true"	value="%{#request.jyzcJyzlLsbVO.htjydx}" />
					</td>
					<td class="td_zxy01">
						资产承租人： 
					</td>
					<td class="td_zxy02"> 
						<s:textfield name="jyzcJyzlLsbVO.htczr" id="htczr" cssClass="input"
						disabled="true"	value="%{#request.jyzcJyzlLsbVO.htczr}" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						合同起始日期：
					</td>
					<td class="td_zxy02"> 
						<s:date name="%{#request.jyzcJyzlLsbVO.htqsrq}" format="yyyy-MM-dd"
							var="draftDate9" />
						<s:textfield name="jyzcJyzlLsbVO.htqsrq" id="htqsrq" readonly="true"
						disabled="true"	cssClass="input" value="%{#draftDate9}" />
					</td>
					<td class="td_zxy01">
						合同到期日期：
					</td>
					<td class="td_zxy02">
						<s:date name="%{#request.jyzcJyzlLsbVO.htdqrq}" format="yyyy-MM-dd"
							var="draftDate41" />
						<s:textfield name="jyzcJyzlLsbVO.htdqrq" id="htdqrq" readonly="true"
						disabled="true"	cssClass="input" value="%{#draftDate41}" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						出租用途：
					</td>
					<td class="td_zxy02" >
						<s:textfield name="jyzcJyzlLsbVO.htzlyt" id="zlyt" cssClass="input"
						disabled="true"	value="%{#request.jyzcJyzlLsbVO.htzlyt}" />
					</td>
					<td class="td_zxy01">
						&nbsp;
					</td>
					<td class="td_zxy02" colspan="3">
						&nbsp;
					</td>
				</tr>
			</table>
			</div>
			<div id="tenancyView" style="display: block">
			<div class="panel-header" style="width: 100%;">
				<div class="panel-title">
						租赁信息
				</div>
				
				<div id="addtenancy1" class="panel-tool"></div>
			</div>	
			<table class="newtable" width="100%"  border="0"
				cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td class="td_zxy01"><font color="red">*</font>
						交易对象：
					</td>
					<td class="td_zxy02">
						<s:select list="#{'1':'建行',2:'非建行'}" name="jyzcJyzlLsbVO.jydx" id="jydx"
							value="%{#request.jyzcJyzlLsbVO.jydx}" />
					</td>
				<!-- </tr>
					<tr>
						<td class="td_zxy01"><font color="red">*</font>
							经办行省份：
						</td>
						<td class="td_zxy02">
							<e:select parRefKey="PROVIENCE" headerKey="" headerValue=""
							 list="#{}"name="jyzcJyzlLsbVO.CJbhsf" id="CJbhsf"
								value="%{#request.jyzcJyzlLsbVO.CJbhsf}"/>	
						</td>
					 -->
					<td class="td_zxy01"><font color="red">*</font> 
						一级经办行：
					</td>
					<td class="td_zxy02">
						<e:select parRefKey="department" headerKey="" headerValue=""
							parentId="438" list="#{}" name="jyzcJyzlLsbVO.CEjjbh" id="CEjjbh"
							value="%{#request.jyzcJyzlLsbVO.CEjjbh}"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01"><font color="red">*</font>
						预估租赁起始日期：
					</td>
					<td class="td_zxy02"> 
						<s:date name="%{#request.jyzcJyzlLsbVO.zlqsrq}" format="yyyy-MM-dd"
							var="draftDate3" />
						<s:textfield name="jyzcJyzlLsbVO.zlqsrq" id="zlqsrq" readonly="true"
							cssClass="input" value="%{#draftDate3}" />
					</td>
					<td class="td_zxy01"><font color="red">*</font>
						预估租赁到期日期：
					</td>
					<td class="td_zxy02">
						<s:date name="%{#request.jyzcJyzlLsbVO.zldqrq}" format="yyyy-MM-dd"
							var="draftDate4" />
						<s:textfield name="jyzcJyzlLsbVO.zldqrq" id="zldqrq" readonly="true"
							cssClass="input" value="%{#draftDate4}" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01"><font color="red">*</font>
						资产承租（承办）人： 
					</td>
					<td class="td_zxy02"> 
						<s:textfield name="jyzcJyzlLsbVO.czr" id="czr" cssClass="input"
							value="%{#request.jyzcJyzlLsbVO.czr}" />
					</td>
					<td class="td_zxy01"><font color="red">*</font>
						意向租金总金额（元）：
					</td>
					<td class="td_zxy02">
						<s:textfield name="jyzcJyzlLsbVO.yxzjzje" onblur="checkFloat(this);" id="yxzjzje"
							cssClass="input" value="%{#request.jyzcJyzlLsbVO.yxzjzje}" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						占地面积：
					</td>
					<td class="td_zxy02" valign="middle"> 
						<s:textfield name="jyzcXxVO.tdmj" id="tdmj" disabled="true"
							cssClass="input" value="%{#request.jyzcXxVO.tdmj}" />
					</td>
					<td class="td_zxy01">
						总面积：
					</td>
					<td class="td_zxy02" valign="middle">
						<s:textfield name="jyzcXxVO.jzmj" id="jzmj" disabled="true"
							cssClass="input" value="%{#request.jyzcXxVO.jzmj}" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						已租面积：
					</td>
					<td class="td_zxy02" valign="middle">
						<s:textfield name="jyzcXxVO.yzmj" id="yzmj" cssClass="input" disabled="true"
							value="" />
					</td>
					<td class="td_zxy01">&nbsp;</td>
					<td class="td_zxy02">&nbsp;</td>
				</tr>
				<tr>
					<td class="td_zxy01"><font color="red">*</font>
						预估意向租赁数量：
					</td>
					<td class="td_zxy02">
						<s:textfield name="jyzcJyzlLsbVO.yxzlmj" id="yxzlmj" onblur="checkczsl(this);" 
							cssClass="input" value="%{#request.jyzcJyzlLsbVO.yxzlmj}" />
					</td>
					<td class="td_zxy01"><font color="red">*</font>
						度量单位：
					</td>
					<td class="td_zxy02">
						<s:textfield name="jyzcJyzlLsbVO.dldw" id="dldw"
							cssClass="input" value="%{#request.jyzcJyzlLsbVO.dldw}" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01"><font color="red">*</font>
						意向租期（月）：
					</td>
					<td class="td_zxy02"> 
						<s:textfield name="jyzcJyzlLsbVO.yxzq" id="yxzq" cssClass="input"
							value="%{#request.jyzcJyzlLsbVO.yxzq}" />
					</td>
					<td class="td_zxy01">
						出租用途：
					</td>
					<td class="td_zxy02">
						<s:textfield name="jyzcJyzlLsbVO.czyt" id="czyt" cssClass="input"
							value="%{#request.jyzcJyzlLsbVO.czyt}" />
					</td>
				</tr>
			</table>
			</div>
			<div id="rent">
				<table class="newtable" width="100%" onclick="choose()" border="0"
					cellspacing="0" cellpadding="0" align="center">
					<tr>
						<td class="td_zxy01">
							租赁说明：
						</td>
						<td class="td_zxy03" colspan="5">
							<s:textarea name="jyzcJyzlLsbVO.zlsm" id="zlsm"  style="width:94%;" rows="4" cssClass="area" />
						</td>
					</tr>
				</table>
			</div>	
			<div id="change" style="display: block">
				<table class="newtable" width="100%"  border="0"
					cellspacing="0" cellpadding="0" align="center">
					<tr>
						<td class="td_zxy01">
							变更说明：
						</td>
						<td class="td_zxy03" colspan="3">
							<s:textarea name="jyzcJyzlLsbVO.bgsm" cssClass="area"  style="width:94%;" rows="4"/>
					</tr>
					<tr>
						<td colspan="4" align="right">
							<table id="change_list"></table>
							<div id="pgtoolbar1"></div>
						</td>
					</tr>
				</table>
			</div>
			<div id="quit" style="display: none">
				<table class="newtable" width="100%"  border="0"
					cellspacing="0" cellpadding="0" align="center">
					<tr>
						<td class="td_zxy01">
							退租日期：
						</td>
						<td class="td_zxy02">
							<s:date name="%{#request.jyzcJyzlLsbVO.tzrq}" format="yyyy-MM-dd"
								var="draftDate2" />
							  <s:textfield  name="jyzcJyzlLsbVO.tzrq" id="tzrq" readonly="true"  cssClass="input" value="%{#draftDate2}"/> 
						</td>
						<td class="td_zxy01">
							&nbsp;
						</td>
						<td class="td_zxy02">
							&nbsp;
						</td>
					</tr>
					<tr>
						<td class="td_zxy01">
							退租办理说明：
						</td>
						<td class="td_zxy03" colspan="3">
							<s:textarea name="jyzcJyzlLsbVO.tzblsm" id="tzblsm" style="width:94%;" rows="4" />
						</td>
					</tr>
				</table>
			</div>
		<table class="newtable" width="100%"  border="0"
					cellspacing="2" cellpadding="0" align="center">
				<tr>
					<td align="right" colspan="4">
						<input type="button" onclick="saveBody();" value="保存" />
						<input type="button" onclick="closeBody()" value="关闭" />
					</td>
				</tr>
			</table>
		</s:form>
	</body>
</html>
<script type="text/javascript">
                                        jQuery("#change_list").jqGrid({   
                                            url:"<%=basePath%>zltb/IntentionManageBody_query4View.do?pkId=${headId}&zllsbId=${jyzcJyzlLsbVO.id}",//zlXxId 业务操作更改 已经改为htId的值 
											datatype: "json",
											mtype:"POST",    
                                            colNames: ['id','变动事项', '变动前值','变动后值', '变动人姓名','变动日期'],
                                            colModel: [
                                            	{name:'id',index:'id',editable:true,hidden:true},
												{name:'name',index:'name',editable:true},
												{name:'before',index:'before',editable:true},
										   		{name:'after',index:'after',editable:true},
										   		{name:'changeperson',changeperson:'Czclx',editable:true},
												{name:'changedate',index:'changedate',editable:true}
										   	],
										   	pager:'pgtoolbar1',
										   	rownumbers:true,
										    height: 'auto',
                                            autowidth: true,
                                            rowNum:10,
											prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
										  	rowList:[10,20,30],
                                            caption: '变动明细表',
											viewrecords:true,
											jsonReader : {
												root:"rows",
												page: "page",
												total: "total",
												records: "records",
												repeatitems: false,
												id: "0"
											}
			                              });
							              jQuery("#change_list").setGridWidth($("#table").width());
									 	  $(window).bind('resize', function(){
												jQuery("#change_list").setGridWidth($("#table").width());
									       });
									       $("#change").css("display","none");
                             </script>

