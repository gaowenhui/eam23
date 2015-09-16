<%@ page language="java" import="com.tansun.eam2.jygdzc.vo.*" %>
<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
AssetBodyVO  assetBodyVO = (AssetBodyVO)request.getAttribute("assetBodyVO");
String zcId = (String)request.getAttribute("zcId");
zcId = zcId==null?"":zcId;
boolean isdisable = false;
isdisable = "true".equals((String) request
		.getAttribute("isdisable")) ? true : false;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01head Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>Insert title here</title>
<base href="<%=basePath%>" />
<script type="text/javascript">
	$(function(){
		window.parent.opener.reloadGrid();
		$("#kssyrq").datebox({
			formatter:function(date){
			return formatDate(date);
			}
		});
		if("true"=="<%=isdisable%>"){
			$("select,input,img").attr("disabled","disabled");
		}
		if($("#zcId").val()!=null&&$("#zcId").val()!=""){
			$("#CZclx,#CZcdq,#zcbh").attr("disabled","true");
			$("#scbh").css("display","none");
			
		}
		var sheettype2 = "${sheettype2}";
		if(sheettype2!=null&&sheettype2!=""){
			$("#CZcdq").attr("disabled","true");
			$("#scbh").attr("disabled","true");
			$("#zcbh").attr("disabled","true");
			$("#CZczc").attr("disabled","true");
		}
		window.parent.initVar($("#zcId").val(), $("#CZclx").val());
		document.getElementById("zcId").value = '<%=zcId%>';
		if('<%=request.getAttribute("message")%>' != "null") {
			alert("<%=request.getAttribute("message")%>！"); 
		}
		<%
			if(assetBodyVO!=null&&assetBodyVO.getYbyz()!=null&&!"".equals(assetBodyVO.getYbyz())){
		%>	
				$("#ybyz").val(${assetBodyVO.ybyz}.toFixed(2));
		<%	
			}
		%>	
		<%
			if(assetBodyVO!=null&&assetBodyVO.getJzzb()!=null&&!"".equals(assetBodyVO.getJzzb())){
		%>	
				$("#jzzb").val(${assetBodyVO.jzzb}.toFixed(2));
		<%	
			}
		%>	
		<%
			if(assetBodyVO!=null&&assetBodyVO.getYzje()!=null&&!"".equals(assetBodyVO.getYzje())){
		%>	
				$("#yzje").val(${assetBodyVO.yzje}.toFixed(2));
		<%	
			}
		%>		
		<%
			if(assetBodyVO!=null&&assetBodyVO.getLjzj()!=null&&!"".equals(assetBodyVO.getLjzj())){
		%>	
				$("#ljzj").val(${assetBodyVO.ljzj}.toFixed(2));
		<%	
			}
		%>	
		<%
			if(assetBodyVO!=null&&assetBodyVO.getJvalue()!=null&&!"".equals(assetBodyVO.getJvalue())){
		%>	
				$("#jvalue").val(${assetBodyVO.jvalue}.toFixed(2));
		<%	
			}
		%>	
		<%
			if(assetBodyVO!=null&&assetBodyVO.getJevalue()!=null&&!"".equals(assetBodyVO.getJevalue())){
		%>	
				$("#jevalue").val(${assetBodyVO.jevalue}.toFixed(2));
		<%	
			}
		%>	
		<%
			if(assetBodyVO!=null&&assetBodyVO.getJcz()!=null&&!"".equals(assetBodyVO.getJcz())){
		%>	
				$("#jcz").val(${assetBodyVO.jcz}.toFixed(2));
		<%	
			}
		%>	
	});
	
	//一级委托管理机构，二级委托管理机构
	function openOrgiTree(idName,idValue){
 			window.open("<%=request.getContextPath()%>/dept/dept_toTree.do?source=jyxgdzc&idName="+idName+"&idValue="+idValue,'','top=60,left=150,width=700,height=450,fullscreen=no,statusbar=no,titlebar=no,resizable=no,scrollbars=yes');
	}	
	function openTreeByType(type4jygdzc){//打开树，根据类型打开类型  
		if(type4jygdzc =='glbm'||type4jygdzc =='sybm'||type4jygdzc =='yjwtgljg'||type4jygdzc =='ejwtgljg'){
			isSYBMorGLBM = type4jygdzc;
			type4jygdzc = 'department';
		}
		var nodeValue = "";
		if(type4jygdzc=="asset"){
			nodeValue = document.getElementById("CZclx").value;
		}
		var url = "<%=request.getContextPath()%>/jygdzc/AssetQuery_toTree.do?type4Jygdzc="+type4jygdzc+"&nodeValue="+nodeValue;
		var _g_privateDialogFeatures = 'height=400, width=200,toolbar=no,scrollbars=yes,location=no,directories=no,menubar=no,resizable=no,left=400,top=200';
		window.open(url,'',_g_privateDialogFeatures);
	   }
	var isSYBMorGLBM = null;//弹出树
	function getCallBack4Tree(type4Jygdzc,id,value){//弹出树页面的回调方法 departmenthiddenid,departmentvalue
		if(type4Jygdzc=="asset"){
			document.getElementById("CZczlbm").value = value;
			return true;
		}
		if(type4Jygdzc=='department'){
			type4Jygdzc = isSYBMorGLBM;
		}
		document.getElementById(type4Jygdzc+"hiddenid").value = id;
		document.getElementById(type4Jygdzc+"value").value 	= value;
	}
	
	function savebody(){
		var jiaoyan = checkEAMFormJSMethod();
		 if(jiaoyan){
			$("select,input").attr("disabled",false);
			$("#main").attr("action","<%=basePath%>jygdzc/AssetManageBody_saveBody.do?index=main");
			$("#main").submit();
			
		 }
	}
	function closebody(){
		window.parent.close();
	}
	<!-- 必填项控制  -->

	function changeType(){
		document.getElementById("CZczlbm").value = "";
	}
	     //生成编号
	var generatorBianhaoButtonStr = $("#scbh").parent("td").html();
	
	function createBianhao(){
		var shengfen=document.getElementById("CZcdq").value;
		if(shengfen==null||""==shengfen){
			alert("请先选择地区");
			return false;
		}
		if(document.getElementById("zcbh").value!=""){
			alert("已生成编号！");
			return false;
		}
		$.post("<%=basePath %>jygdzc/AssetManageBody_createNum.do",{
			"code":"zcbh",
			"PROVINCE":shengfen
		},function(data){
			document.getElementById("zcbh").value = data;
			window.parent.setCode(data);
			$("#scbh").css("display","none");
			$("#CZcdq").attr("disabled","true");
		});
	}	
	//作废编号
	function resetZcbh(Identifier){
			var zcbh = document.getElementById("zcbh").value ;
			if(""!=zcbh&&zcbh!=null&&"null"!=zcbh){
				$.post("<%=basePath %>jygdzc/AssetManageBody_regainNum.do",{
					"headId":"${headId}",
					"zcbh":zcbh,
					"Identifier":Identifier
				},function(str){
					if("成功"==str){
						document.getElementById("zcbh").value ="";
						$("#scbh").css("display","block");
					}
				})
			}
	}
	 function checkEAMFormJSMethod(){
    		var zcbh = document.getElementById("zcbh");
			if(zcbh.value == null || zcbh.value.length == 0){
				alert("资产编号不能为空！");
				zcbh.focus();
		      return false;
		    }
			var zcmc = document.getElementById("zcmc");
			if(zcmc.value == null || zcmc.value.length == 0){
				alert("资产名称不能为空！");
				zcmc.focus();
		      return false;
		    }
		    var CJyfl = document.getElementById("CJyfl");
			if(CJyfl.value == null || CJyfl.value.length == 0){
				alert("经营分类不能为空！");
				CJyfl.focus();
		      return false;
		    }
		    var CZcqs = document.getElementById("CZcqs");
			if(CZcqs.value == null || CZcqs.value.length == 0){
				alert("资产权属不能为空！");
				CZcqs.focus();
		      return false;
		    }
		    
		    return true;
		}
		
		function checkPhone(thisPhone){
			var thePhone = thisPhone.value;
			var flag = isPhone(thePhone);
			if(flag == false){
				thisPhone.focus();
			}
		}
</script>
</head>
<body>
<s:form  method="post" id ="main">
<s:hidden name="zcId" id ="zcId"  value="%{#request.zcId}"/>
<s:hidden name="headId"  value="%{#request.headId}"/>
<s:hidden name="jyzcXxMain.cldId" value="%{#request.headId }"/>
<s:hidden name="jyzcXxMain.id"  value="%{#request.zcId}"/>
<s:hidden name="sheettype2" value="%{#request.sheettype2}"/>
<s:hidden name="sheettype" value="%{#request.sheettype}"/>
<div id="ruler" width="100%"></div>
  <table width="100%" border="0" class="newtable" cellpadding="2" cellspacing="0" align="center">
				<div class="panel-header" style="width: 100%;">
						<div class="panel-title">
						资产信息
						</div>
						<div id="addasset" class="panel-tool"></div>
				</div>
				<tr>
					  <td class="td_zxy01" >资产类型：</td>
					  <td class="td_zxy02">
						<e:select parRefKey="ASSET_TYPE"  onchange="changeType();"  list="#{}" name="jyzcXxMain.CZclx" id="CZclx"  value="%{#request.jyzcXxMain.CZclx}"/>
					 </td>
					  <td class="td_zxy01"><font color="red">*</font>地区：</td>
					  <td class="td_zxy02" >
					 <e:select parRefKey="PROVIENCE" headerKey="" headerValue=""   id="CZcdq" onchange="resetZcbh('no');" list="#{}" name="jyzcXxMain.CZcdq" value="%{#request.jyzcXxMain.CZcdq}"/>
					  </td>
				</tr>
				<tr>
					  <td class="td_zxy01">资产种类：</td>
					  <td   class="td_zxy02"><s:textfield name="jyzcXxMain.CZczlbm" id="CZczlbm" cssClass="input"  readonly="true" value="%{#request.jyzcXxMain.CZczlbm}"/>
					  <img src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" onclick="openTreeByType('asset');" width="21" height="20" align="absmiddle"/></td>
					  <td  width="120" class="td_zxy01">&nbsp;</td>
					  <td  class="td_zxy02">&nbsp;</td>
				</tr>
				<tr>
					  <td class="td_zxy01"><font color="red">*</font>资产编号：</td>
					  <td class="td_zxy02" nowrap="nowrap" >
					  <table width="100%" border="0" cellpadding="0" cellspacing="0">
						  <tr>
							  <td width="80%">
							 		<s:textfield name="jyzcXxMain.zcbh" id="zcbh" readonly="true" cssClass="input3" value="%{#request.jyzcXxMain.zcbh}"/>
							  </td>
							  <td>
							 		<input type="button" value="生成" id = "scbh"   onclick="createBianhao();"/>
							   </td>
						   </tr>
					  </table>
					  </td>
					  <td class="td_zxy01"><font color="red">*</font>资产名称：</td>
				 	 <td class="td_zxy02"><s:textfield name="jyzcXxMain.zcmc" id="zcmc" cssClass="input" value="%{#request.jyzcXxMain.zcmc}"/></td>
				</tr>
				<tr>
				  <td class="td_zxy01"><font color="red">*</font>经营分类：</td> 
				  <td class="td_zxy02"><e:select parRefKey="ASSET_MANAGE_TYPE" list="#{}" headerKey="" headerValue=""  name="jyzcXxMain.CJyfl" id="CJyfl" value="%{#request.jyzcXxMain.CJyfl}" />
				  </td>
				  <td class="td_zxy01">用途：</td>
				  <td class="td_zxy02"><e:select parRefKey="ASSET_USE" list="#{}" headerKey=""  headerValue=""  name="jyzcXxMain.CYt" id="CYt" value="%{#request.jyzcXxMain.CYt}" />
				  </td>
				 </tr>
				<tr>
				  <td class="td_zxy01"> 资产详细地址：</td>
				  <td class="td_zxy02"  colspan="3"><s:textfield name="jyzcXxMain.xxdz" id="xxdz" cssClass="input" value="%{#request.jyzcXxMain.xxdz}"/></td>
				</tr>
				<tr>
				  <td class="td_zxy01">经办单位：</td>
				  <td class="td_zxy02"><s:textfield name="jyzcXxMain.jbdw" id="jbdw" cssClass="input" value="%{#request.jyzcXxMain.jbdw}"/></td>
				    <td width="153" class="td_zxy01">增加方式：</td>
					<td class="td_zxy02"><s:select list="{'','购置','建行股份转入','其他增加','自行购置','报批购置','建行承继','公司投资','其他','置换'}" name="jyzcXxMain.CZjfs" id="CZjfs" value="%{#request.jyzcXxMain.CZjfs}" />
				  </td>
				 </tr>
				 <tr>
				  <td class="td_zxy01"><font color="red">*</font>资产权属：</td>
				  <td class="td_zxy02" ><e:select parRefKey="ASSET_OWNERSHIP" list="#{}" headerKey=""  headerValue=""  name="jyzcXxMain.CZcqs" id="CZcqs" value="%{#request.jyzcXxMain.CZcqs}"/></td>
				  <td class="td_zxy01">委托人：</td>
				  <td class="td_zxy02"><s:textfield name="jyzcXxMain.wtrmc" id="wtrmc" cssClass="input" value="%{#request.jyzcXxMain.wtrmc}"/></td>
				</tr>
				<tr>
				  <td class="td_zxy01">权属情况：</td>
				  <td class="td_zxy02" ><s:textfield name="jyzcXxMain.qsqk" id="qsqk" cssClass="input" value="%{#request.jyzcXxMain.qsqk}"/></td>
				  <td class="td_zxy01">周围环境：</td>
				  <td class="td_zxy02"><s:textfield name="jyzcXxMain.zwhj" id="zwhj" cssClass="input" value="%{#request.jyzcXxMain.zwhj}"/></td>
				</tr>
				<tr>
				  <td class="td_zxy01"> 资产状态：</td>
				  <td class="td_zxy02"> <e:select parRefKey="ASSET_STATUS"    list="#{}"   name="jyzcXxMain.CZczc" id="CZczc" value="%{#request.jyzcXxMain.CZczc}" />
				  </td>
				  <td class="td_zxy01">开始使用日期：</td>
				  <td class="td_zxy02">
				  <s:date name="%{#request.jyzcXxMain.kssyrq}" format="yyyy-MM-dd"
							var="draftDate1" />
				   <s:textfield name="jyzcXxMain.kssyrq" id="kssyrq" cssClass="input" readonly="true" value="%{#draftDate1}"/>
				  </td>
				</tr>
				<tr>
				  <td width="153" class="td_zxy01">一级分行：</td>
				  <td class="td_zxy02"><e:select  parRefKey="department" headerKey="" headerValue="" parentId="438" list="#{}" name="jyzcXxMain.ejdq" value="%{#request.jyzcXxMain.ejdq}"/></td>
				  <td class="td_zxy01">一级委托管理机构：</td>
				  <td class="td_zxy02"><s:textfield name="jyzcXxMain.yjwtgljgvalue" id="yjwtgljgvalue" cssClass="input"   readonly="true"/>
                  <s:hidden name='jyzcXxMain.CYjwtjg' id='yjwtgljghiddenid' value="%{#request.jyzcXxMain.CYjwtjg}"></s:hidden> 
                 <img src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" onclick="openOrgiTree('yjwtgljghiddenid','yjwtgljgvalue');" width="21" height="20" align="absmiddle"/></td>
				
				</tr>
				<tr>
					 <td class="td_zxy01">二级委托管理机构：</td>
				  <td class="td_zxy02">
					<s:textfield name="jyzcXxMain.ejwtgljgvalue" id="ejwtgljgvalue" cssClass="input"  readonly="true"/>
                  <s:hidden name='jyzcXxMain.CErwtjg' id='ejwtgljghiddenid' value="%{#request.jyzcXxMain.CErwtjg}" ></s:hidden> 
                 <img src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" onclick="openOrgiTree('ejwtgljghiddenid','ejwtgljgvalue');" width="21" height="20" align="absmiddle"/></td>
				  <td class="td_zxy01">所属卡片数量：</td>
				  <td class="td_zxy02">
				  <s:textfield  name="assetBodyVO.gjkpsl"id="gjkpsl" cssClass="input"  disabled="true" value="%{#request.assetBodyVO.gjkpsl}"/>
				  </td>
				</tr>
				<tr>
				  <td class="td_zxy01">录入日期：</td>
				  <td class="td_zxy02">
				 <s:date name="%{#request.jyzcXxMain.lrrq}" format="yyyy-MM-dd" var="draftDate"/>
		         <s:textfield id="lrrq" name="jyzcXxMain.lrrq" cssClass="input" value="%{#draftDate}"  disabled="true" />
				  </td>						
				  <td class="td_zxy01">录入人：</td>
				  <td class="td_zxy02"><s:textfield name="jyzcXxMain.lrr" id="lrr" cssClass="input"   disabled="true" value="%{#request.jyzcXxMain.lrr}"/></td>
				</tr>
				<tr>
				  <td class="td_zxy02" colspan="4">
				  <div class="panel-header" style="width: 100%;">
						<div class="panel-title">
						主卡片信息
						</div>
						<div id="addasset" class="panel-tool"></div>
				  </div>
				  </td>
				</tr>
				<tr>
				  <td class="td_zxy01">管理部门：</td>
				  <td class="td_zxy02">
				  <s:textfield name="assetBodyVO.glbm" id="glbm"  cssClass="input"  value="%{#request.assetBodyVO.glbm}"   disabled="true"/>
                 
                 </td>
				  <td class="td_zxy01">使用部门：</td>
				 <td class="td_zxy02"> 
				 <s:textfield name="assetBodyVO.sybm" id="sybm"  cssClass="input"  value="%{#request.assetBodyVO.sybm}"   disabled="true"/>
                 </td>
				</tr>
				<tr>
				  <td class="td_zxy01">存放地点：</td>
				  <td class="td_zxy02"><s:textfield name="assetBodyVO.saveadsress" id="saveadsress"  disabled="true"  value="%{#request.assetBodyVO.saveadsress}" cssClass="input" /></td>
				  <td class="td_zxy01">&nbsp;</td>
				  <td class="td_zxy02">&nbsp;</td>
				 
				</tr>
				<tr>
				  <td class="td_zxy02" colspan="4">
				  <div class="panel-header" style="width: 100%;">
						<div class="panel-title">
						卡片价值信息
						</div>
						<div id="addasset" class="panel-tool"></div>
				  </div>
				  </td>
				</tr>
				<tr>
				  <td width="153" class="td_zxy01">原币原值(元)：</td>
				  <td class="td_zxy02"><s:textfield name="assetBodyVO.ybyz" id="ybyz"  value="%{#request.assetBodyVO.ybyz}"  cssClass="input"   disabled="true"/></td>
				  <td class="td_zxy01">减值准备(元)：</td>
				  <td class="td_zxy02"><s:textfield name="assetBodyVO.jzzb" id="jzzb"  value="%{#request.assetBodyVO.jzzb}"  cssClass="input"   disabled="true"/></td>
				</tr>
				<tr>
				  <td width="163" class="td_zxy01">月折旧额(元)：</td>
				  <td class="td_zxy02"><s:textfield name="assetBodyVO.yzje" id="yzje" value="%{#request.assetBodyVO.yzje}" cssClass="input"  disabled="true"/></td>
				  <td class="td_zxy01">累计折旧(元)：</td>
				  <td class="td_zxy02"><s:textfield name="assetBodyVO.ljzj" id="ljzj"  value="%{#request.assetBodyVO.ljzj}" cssClass="input"  disabled="true"/></td>
				</tr>
				<tr>
				  <td width="163" class="td_zxy01">净值(元)：</td>
				  <td class="td_zxy02"><s:textfield   name="assetBodyVO.jvalue" id="jvalue" cssClass="input"  value="%{#request.assetBodyVO.jvalue}"  disabled="true"/></td>
				  <td class="td_zxy01">净残值(元)：</td>
				  <td class="td_form02"><s:textfield   name="assetBodyVO.jcz" id="jcz" cssClass="input"   value="%{#request.assetBodyVO.jcz}"  disabled="true"/></td>
				</tr>
				<tr>
				  <td class="td_zxy01">净额(元)：</td>
				  <td class="td_zxy02" ><s:textfield   name="assetBodyVO.jevalue" id="jevalue"  value="%{#request.assetBodyVO.jevalue}" cssClass="input" disabled="true" /></td>
				  <td class="td_zxy01">&nbsp;</td>
				  <td class="td_zxy02">&nbsp;</td>
				</tr>
			</table>
			<table  align="right">
				<tr>
					<td  colspan="6" >
						<input type="button"   value="保存" onclick="savebody();return false;"/>
						<input type="button"   value="关闭"  onclick="closebody();return false;"/>
					</td>
				</tr>
			</table>
</s:form>
</body>
</html>
		