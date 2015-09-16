<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>修改物品信息</title>
<script type="text/javascript">
	$(function(){
		var isSaveSuccess = "<%=request.getAttribute("isSaveSuccess")%>";
		if(isSaveSuccess != null && isSaveSuccess != "null" && isSaveSuccess == "success"){
			window.opener.myform.zcId.value = $("#zcId").val();
			window.opener.displayModGoods();
			window.close();
		}
		$("#cbrq").datebox({
	    	formatter:function(date){
	    		return formatDate(date);
	    	}
		});
	});
			
	//当一级分类改变时触发此方法，显示出二级分类供选择
	function ejflRefresh(fl){
		$.post("<%=basePath%>zyzc/ZCQuery_ejflRefresh.do",{
			"zyZc.yjflbm" : $(fl).val()
		},function(returnStr){
			var returnObj = eval('(' + returnStr + ')');
			if(returnObj.ejfls.length>=1){
				for(var i=0; i<returnObj.ejfls.length; i++){
					$("#ejflbm").append("<option value='" + returnObj.ejfls[i].ejflbm + "'>" + returnObj.ejfls[i].ejflmc + "</option>");
				}
			}
		});
		$("#sjflbm").html("<option value='0'>--请选择--</option>");
		$("#ejflbm").html("<option value='0'>--请选择--</option>");
	}
			
	//当二级分类改变时触发此方法，显示出三级分类供选择（如果有三级分类）
	function sjflRefresh(fl){
		$.post("<%=basePath%>zyzc/ZCQuery_sjflRefresh.do",{
			"zyZc.ejflbm" : $(fl).val()
		},function(returnStr){
			var returnObj = eval('(' + returnStr + ')');
			if(returnObj.sjfls.length>=1){
				for(var i=0; i<returnObj.sjfls.length; i++){
					$("#sjflbm").append("<option value='" + returnObj.sjfls[i].sjflbm + "'>" + returnObj.sjfls[i].sjflmc + "</option>");
				}
			}
		});
		$("#sjflbm").html("<option value='0'>--请选择--</option>");
	}
		
	function getJE(){
		var sl = $("#sl").val();
		var dj = $("#dzyhdj").val();
		$("#dzyhjg").val(sl*dj);
	}
	
	function checkValues(){
		var values = new Array([4]);
		values[0] = $("#yjflbm").val();
		values[1] = $("#ejflbm").val();
		values[2] = $("#sjflbm").val();
		values[3] = $("#zcmc").val();
		values[4] = $("#gg").val();
		values[5] = $("#sl").val();
		values[6] = $("#dzyhdj").val();
		values[7] = $("#dzyhjg").val();
		for(var i=0; i < values.length; i++){
			if(values[i]== null || values[i] == "" || values[i] == 0){
				if(i==0){
					alert("一级分类不能为空！");
					return false;
				}else if(i==1){
					alert("二级分类不能为空！");
					return false;
				}else if(i==2){
					alert("三级分类不能为空！");
					return false;
				}else if(i==3){
					alert("资产名称不能为空！");
					return false;
				}else if(i==4){
					alert("规格不能为空！");
					return false;
				}else if(i==5){
					alert("数量不能为空！");
					return false;
				}else if(i==6){
					alert("单价不能为空！");
					return false;
				}else if(i==7){
					alert("金额不能为空！");
					return false;
				}
			}
		}
		return true;
	}
	
	function saveBody(){
		if(checkValues() == true){
			myform.action="<%=basePath%>zyzc/ZCQuery_updZCAndsaveTZ.do?zcId="+$("#zcId").val();
			myform.submit();
		}
	}
	
	// 日期转换
	$(function(){
		$("#cbrq,#rq,#lyrq,#jydqrq,#ghsj").datebox({
			formatter:function(date){
				return formatDate(date);
			}
		});
	});
	
	//打开树，根据类型打开类型
	function openTreeByType(type4Card){
		var nodeValue = null;
		isSYBMorGLBM = type4Card;
		type4Card = 'department'
		var url = "<%=request.getContextPath()%>/kpgl/cardTree_tree.do?type4Card="+type4Card+"&nodeValue="+nodeValue;
		var _g_privateDialogFeatures = 'height=400, width=200,toolbar=no,scrollbars=yes,location=no,directories=no,menubar=no,resizable=no,left=400,top=200';
		window.open(url,'',_g_privateDialogFeatures);
	}
	
	function getCallBack4Tree(type4Card,id,value){
		if(type4Card=='department'){
			type4Card = isSYBMorGLBM;
		}
		document.getElementById(type4Card+"BH").value = id;
		document.getElementById(type4Card+"MC").value = value;
	}
</script>
</head>
<body>
<s:form name="myform" id="myform">
<s:hidden name="sheettype" id="sheettype"></s:hidden>
<s:hidden name="headId" id="headId"></s:hidden>
<s:hidden name="bodyIds" id="bodyIds"/>
<s:hidden name="body.sbodyId" id="bodyId"/>
<s:hidden name="saveSuccess" id="saveSuccess"/>
<s:hidden name="zyZc.zcId" id="zcId"/>
<s:hidden name="tz.zcId"></s:hidden>
<table class="newtable" width="100%" cellpadding="0" cellspacing="0">
	<tr>
		<td class="td_zxy01">
			<font color="#FF0000"><strong>*</strong></font>一级分类名称：
		</td>
		<td class="td_zxy02">
			<s:select name="zyZc.yjflbm" list="%{#session.yjMap}" id="yjflbm"
			headerKey="0" headerValue="----请选择----" onchange="ejflRefresh(this)"/>
		</td>
		<td class="td_zxy01">
			<font color="#FF0000"><strong>*</strong></font>二级分类名称：
		</td>
		<td class="td_zxy02">
			<s:select name="zyZc.ejflbm" list="%{#session.ejMap}" id="ejflbm"
			 headerKey="0" headerValue="----请选择----" onchange="sjflRefresh(this)"/>
		</td>
	</tr>
	<tr>
		<td class="td_zxy01">
			<font color="#FF0000"><strong>*</strong></font>三级分类名称：
		</td>
		<td class="td_zxy02">
			<s:select name="zyZc.sjflbm" list="%{#session.sjMap}" id="sjflbm"
				headerKey="0" headerValue="----请选择----" />
		</td>
		<td class="td_zxy01">
			<font color="#FF0000"><strong>*</strong></font>资产名称：
		</td>
		<td class="td_zxy02">
			<s:textfield name="zyZc.zcmc"  cssClass="input" id="zcmc"/>
		</td>
	</tr>
	<tr>
		<td class="td_zxy01">
			<font color="#FF0000"><strong>*</strong></font>规 格：
		</td>
		<td class="td_zxy02">
			<s:textfield name="zyZc.gg" cssClass="input" id="gg"/>
		</td>
		<td class="td_zxy01">资产状态：</td>
		<td class="td_zxy02">
			<s:select name="zyZc.zczt" cssClass="input" list="{'在库','借用','领用','维修','报废'}"/>
		</td>
	</tr>
	<tr>
		<td class="td_zxy01">单 位：</td>
		<td class="td_zxy02">
			<s:select name="zyZc.jldw" cssClass="input"
				list="#{'本':'本','包':'包','根':'根','打':'打','件':'件','个':'个',
				'台':'台','车':'车','辆':'辆','令':'令','把':'把','张':'张','支':'支','瓶':'瓶',
				'套':'套','只':'只','盒':'盒','桶':'桶','箱':'箱','块':'块','节':'节',
				'组':'组','50个/包':'50个/包','10个/包':'10个/包'}"/>
		</td>
		<td class="td_zxy01">
			<font color="#FF0000"><strong>*</strong></font>数 量：
		</td>
		<td class="td_zxy02">
			<s:textfield name="zyZc.sl" cssClass="input" id="sl" onblur="getJE()"/>
		</td>
	</tr>
	<tr>
		<td class="td_zxy01">
			<font color="#FF0000"><strong>*</strong></font>单 价(元)：
		</td>
		<td class="td_zxy02">
			<s:textfield name="zyZc.dzyhdj" cssClass="input" id="dzyhdj" onblur="getJE()"/>
		</td>
		<td class="td_zxy01">
			<font color="#FF0000"><strong>*</strong></font>金 额(元)：
		</td>
		<td class="td_zxy02">
			<s:textfield name="zyZc.dzyhjg" id="dzyhjg" cssClass="input" onblur="getJE()"/>
		</td>
	</tr>
	<tr>
		<td class="td_zxy01">发动机编号：</td>
		<td class="td_zxy02">
			<s:textfield name="zyZc.fdjbh" cssClass="input" id="fdjbh"/>
		</td>
		<td class="td_zxy01">CPU型号：</td>
		<td class="td_zxy02">
			<s:textfield name="zyZc.cpuxh" id="cpuxh" cssClass="input"/>
		</td>
	</tr>
	<tr>
		<td class="td_zxy01">内存：</td>
		<td class="td_zxy02">
			<s:textfield  name="zyZc.memory" cssClass="input" id="memory"/>
		</td>
		<td class="td_zxy01">硬盘：</td>
		<td class="td_zxy02">
			<s:textfield name="zyZc.disk" id="disk" cssClass="input"/>
		</td>
	</tr>
	<tr>
		<td class="td_zxy01">内置硬盘：</td>
		<td class="td_zxy02">
			<s:textfield  name="zyZc.nzdisk" cssClass="input" id="nzdisk"/>
		</td>
		<td class="td_zxy01">系统显示器：</td>
		<td class="td_zxy02">
			<s:textfield name="zyZc.xtxsq" id="xtxsq" cssClass="input"/>
		</td>
	</tr>
	<tr>
		<td class="td_zxy01">所属账管：</td>
		<td class="td_zxy02">
			<s:textfield  name="zyZc.sszg" cssClass="input" id="sszg"/>
		</td>
		<td class="td_zxy01">出保日期：</td>
		<td class="td_zxy02">
			<s:date name="%{#request.zyZc.cbrq}" format="yyyy-MM-dd" var="draftDate"/>
			<s:textfield name="zyZc.cbrq" id="cbrq" cssClass="input" value="%{#draftDate}"/>
		</td>
	</tr>
	<tr>
		<td class="td_zxy01">入库数量：</td>
		<td class="td_zxy02">
			<s:textfield name="tz.rksl" id="rksl" cssClass="input"/>
		</td>
		<td class="td_zxy01">出库数量：</td>
		<td class="td_zxy02" colspan="3">
			<s:textfield name="tz.cksl" id="cksl" cssClass="input"/>
		</td>
	</tr>
	<tr>
		<td class="td_zxy01">台账录入日期：</td>
		<td class="td_zxy02">
			<s:date name="%{#request.tz.rq}" format="yyyy-MM-dd" var="draftDate"/>
			<s:textfield name="tz.rq" id="rq" cssClass="input" value="%{#draftDate}"/>
		</td>
		<td class="td_zxy01">库存数量：</td>
		<td class="td_zxy02" colspan="3">
			<s:textfield name="tz.kcsl" id="kcsl" cssClass="input"/>
		</td>
	</tr>
	<tr>
		<td class="td_zxy01">领用部门名称：</td>
		<td class="td_zxy02">
			<s:textfield name="tz.lybmmc" id="lybmMC" cssClass="input"/>
			<img src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" onclick="openTreeByType('lybm');" width="21" height="20" align="absmiddle"/>
		</td>
		<td class="td_zxy01">借用部门名称：</td>
		<td class="td_zxy02" colspan="3">
			<s:textfield name="tz.jybmmc" id="jybmMC" cssClass="input"/>
			<img src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" onclick="openTreeByType('jybm');" width="21" height="20" align="absmiddle">
		</td>
	</tr>
	<tr>
		<td class="td_zxy01">领用部门编号：</td>
		<td class="td_zxy02">
			<s:textfield name="tz.lybmbm" id="lybmBH" readonly="true" cssClass="input"/>
		</td>
		<td class="td_zxy01">借用部门编号：</td>
		<td class="td_zxy02" colspan="3">
			<s:textfield name="tz.jybmbm" id="jybmBH" readonly="true" cssClass="input"/>
		</td>
	</tr>
	<tr>
		<td class="td_zxy01">领用借用人：</td>
		<td class="td_zxy02">
			<s:textfield name="tz.lyrmc" id="lyrmc" cssClass="input"/>
		</td>
		<td class="td_zxy01">领用日期：</td>
		<td class="td_zxy02" colspan="3">
			<s:date name="%{#request.tz.lyrq}" format="yyyy-MM-dd" var="draftDate"/>
			<s:textfield name="tz.lyrq" id="lyrq" cssClass="input" value="%{#draftDate}"/>
		</td>
	</tr>
	<tr>
		<td class="td_zxy01">借用到期日期：</td>
		<td class="td_zxy02">
			<s:date name="%{#request.tz.jydqrq}" format="yyyy-MM-dd" var="draftDate"/>
			<s:textfield name="tz.jydqrq" id="jydqrq" cssClass="input" value="%{#draftDate}"/>
		</td>
		<td class="td_zxy01">变动原因：</td>
		<td class="td_zxy02" colspan="3">
			<s:textfield name="tz.bdyy" id="bdyy" cssClass="input"/>
		</td>
	</tr>
	<tr>
		<td class="td_zxy01">领用借用物品归还日期：</td>
		<td class="td_zxy02">
			<s:date name="%{#request.tz.ghsj}" format="yyyy-MM-dd" var="draftDate"/>
			<s:textfield name="tz.ghsj" id="ghsj" cssClass="input" value="%{#draftDate}"/>
		</td>
		<td class="td_zxy01">台账状态：</td>
		<td class="td_zxy02" colspan="3">
			<s:select name="tz.tzzt" cssClass="input" list="{'在库','借用','领用','维修','报废'}"/>
		</td>
	</tr>
	<tr>
		<td class="td_zxy01">是否续借：</td>
		<td class="td_zxy02">
			<s:select name="tz.sfxj" cssClass="input" list="{'是','否'}"/>
		</td>
		<td class="td_zxy01">维修费用：</td>
		<td class="td_zxy02" colspan="3">
			<s:textfield name="tz.wxfy" id="wxfy" cssClass="input"/>
		</td>
	</tr>
	<tr>
		<td class="td_zxy02" colspan="4" class="td_zxy01" style="text-align:right">
			<input type="button" value="保存" onclick="saveBody();"/>
		</td>
	</tr>
</table>
</s:form>
</body>
</html>
<SCRIPT LANGUAGE="JavaScript">
	if("<%=request.getAttribute("ErpMessage")%>" != "null") {
		alert("<%=request.getAttribute("ErpMessage")%>"); 
	}
</SCRIPT>