<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>高级查询</title>
<SCRIPT language=JavaScript type=text/JavaScript>
function windowOpen(theURL,winName,features,width,hight,scrollbars,top,left){
	var parameter="top="+top+",left="+left+",width="+width+",height="+hight;
  	if(scrollbars=="no"){
  		parameter+=",scrollbars=no";
  	}else{
  		parameter+=",scrollbars=yes";
  	}
  	window.open(theURL,winName,parameter);
}

<!--  
function exchange(v){  
	elm1=document.getElementsByName("s1")[v];  
	elm2=document.getElementsByName("s1")[1-v];  
	for  (var  i=elm1.length-1;i>-1;i--){  
		op=elm1.options[i];  
		if  (op.selected){  
            elm2.options[elm2.length]=new  Option(op.text,op.value);  
            elm1.options[i]=null;  
		}  
	}  
}  

function down(){  
	elm1=document.getElementsByName("s1")[1];  
	for  (var i=elm1.length-1;i>-1;i--){  
		op=elm1.options[i];  
		if  (op.selected){  
			if (i<elm1.length-1){
				aa=elm1.options[i+1];
				elm1.options[i+1]=new  Option(op.text,op.value);  
				elm1.options[i]= new Option(aa.text,aa.value);
				elm1.options[i+1].selected=true;
				aa=null;
			}else{
				alert("已经是最后一行了");
			}
						
        }  
	}  
}
  
function up(){  
	elm1=document.getElementsByName("s1")[1];  
    for(var i=0;i<=elm1.length-1;i++){  
		op=elm1.options[i];
		if  (op.selected){  
			if (i>0){
				aa=elm1.options[i-1];
				elm1.options[i-1]=new  Option(op.text,op.value);  
				elm1.options[i]= new Option(aa.text,aa.value);
				elm1.options[i-1].selected=true;
				aa=null;
			}else{
				alert("已经是第一行了");
			}
		}  
    }  
}  
//-->  

function openTreeByType(type4Card){//打开树，根据类型打开类型
	var cardType = '<%=request.getParameter("cardType")%>';
	var nodeValue = null;
	if(type4Card =='glbm'||type4Card =='sybm'){
		isSYBMorGLBM = type4Card;
		type4Card = 'department'
	}
	var url = "<%=request.getContextPath()%>/kpgl/cardTree_tree.do?type4Card="+type4Card+"&nodeValue="+nodeValue;
	var _g_privateDialogFeatures = 'height=400, width=200,toolbar=no,scrollbars=yes,location=no,directories=no,menubar=no,resizable=no,left=400,top=200';
	window.open(url,'',_g_privateDialogFeatures);
}
var isSYBMorGLBM = null;//弹出树是否为管理部门或使用部门
function getCallBack4Tree(type4Card,id,value){//弹出树页面的回调方法 departmenthiddenid,departmentvalue
	if(type4Card=='department'){
		type4Card = isSYBMorGLBM;
	}
	document.getElementById(type4Card+"hiddenid").value = id;
	document.getElementById(type4Card+"value").value 	= value;
}

function advancedQuery(){
	window.opener.document.getElementById("cardcode").value = document.getElementById("cardcode").value;
	window.opener.document.getElementById("zcname").value = document.getElementById("zcname").value;
	window.opener.document.getElementById("kplx").value = document.getElementById("kplx").value;
	window.opener.document.getElementById("glbm").value = document.getElementById("glbm").value;
	window.opener.document.getElementById("usepartment").value = document.getElementById("usepartment").value;
	window.opener.document.getElementById("state").value = document.getElementById("state").value;
	
	window.opener.document.getElementById("zcmc").value = document.getElementById("zcmc").value;
	window.opener.document.getElementById("zcbh").value = document.getElementById("zcbh").value;
	window.opener.document.getElementById("firstbranch").value = document.getElementById("firstbranch").value;
	window.opener.document.getElementById("yxtlry").value = document.getElementById("yxtlry").value;
	window.opener.document.getElementById("saveadsress").value = document.getElementById("saveadsress").value;
	window.opener.document.getElementById("sfzy").value = document.getElementById("sfzy").value;
	
	window.opener.document.getElementById("rzkm").value = document.getElementById("rzkm").value;
	window.opener.document.getElementById("ifjc").value = document.getElementById("ifjc").value;
	window.opener.document.getElementById("startQYTime").value = document.getElementById("startQYTime").value;
	window.opener.document.getElementById("endQYTime").value = document.getElementById("endQYTime").value;
	window.opener.document.getElementById("startLRTime").value = document.getElementById("startLRTime").value;
	window.opener.document.getElementById("endLRTime").value = document.getElementById("endLRTime").value;
	
	window.opener.ptQuery();
	window.close();
}

</SCRIPT>  
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  	<tr>
    	<td height="25" align="center" valign="bottom" class="td06">
    		<table width="98%" border="0" cellspacing="3" cellpadding="0">
      			<tr>
        			<td width="15"><img src="../../images/index_32.gif" width="9" height="9"></td>
        			<td valign="middle" class="title">高级查询</td>
      			</tr>
   			</table>
    	</td>
  	</tr>
</table>
<div align="left"><br></div>
<s:form id="myform" method="post">
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  	<tr>
	    <td class="td_form01">卡片编号：</td>
		<td class="td_form02"><s:textfield name="card.cardcode" id="cardcode" /></td>
		<td class="td_form01">卡片名称：</td>
		<td class="td_form02"><s:textfield name="card.zcname" id="zcname" /></td>
		<td class="td_form01">卡片类型：</td>
		<td class="td_form02"><s:textfield name="card.kplx" id="kplx" /></td>
  	</tr>
  	<tr>
		<td class="td_form01">管理部门：</td>
		<td class="td_form02">
			<s:textfield name="glbmvalue" id="glbmvalue" size="30" readonly="true"/>
      		<s:hidden name='card.glbm' id='glbmhiddenid'></s:hidden>
          	<img src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" onclick="openTreeByType('glbm');" width="21" height="20" align="absmiddle">
		</td>
		<td class="td_form01">使用部门：</td>
		<td class="td_form02">
			<s:textfield name="sybmvalue" id="sybmvalue" size="30" readonly="true"/>
      		<s:hidden name='card.usepartment' id='sybmhiddenid'></s:hidden>
          	<img src="<%=request.getContextPath() %>/resource/ProjectImages/search.gif" onclick="openTreeByType('sybm');" width="21" height="20" align="absmiddle">
		</td>
		<td class="td_form01">入账科目：</td>
		<td class="td_form02"><s:textfield name="card.rzkm" id="rzkm" /></td>
  	</tr>
	<tr>
		<td class="td_form01">卡片状态：</td>
		<td class="td_form02"><s:select id="state" list="#{'01':'正在使用','02':'空闲状态','03':'退役'}" name="card.state" /></td>
		<td class="td_form01">资产名称：</td>
		<td class="td_form02"><s:textfield name="zcmc" id="zcmc" /></td>
		<td class="td_form01">资产编号：</td>
		<td class="td_form02"><s:textfield name="zcbh" id="zcbh" /></td>
	</tr>
	<tr>
		<td class="td_form01">一级分行：</td>
		<td class="td_form02"><e:select parRefKey="ENTITY_TRADE" headerKey="" headerValue="" parentId="438" list="#{}" name="card.firstbranch" id="firstbranch"/></td>
		<td class="td_form01">录入人：</td>
		<td class="td_form02"><s:textfield name="card.yxtlry" id="yxtlry" /></td>
		<td class="td_form01">存放位置：</td>
		<td class="td_form02"><s:textfield name="card.saveadsress" id="saveadsress" /></td>
  	</tr>
	<tr>
		<td class="td_form01">是否自用：</td>
		<td class="td_form02"><s:select id="sfzy" list="#{'':'',1:'否',0:'是'}" name="card.sfzy" /></td>		
		<td class="td_form01">是否继承：</td>
		<td class="td_form02"><s:select id="ifjc" list="#{'':'',1:'否',0:'是'}" name="card.ifjc" /></td>	
	</tr>
	<tr>
		<td class="td_form01">
		开始日期： 
		</td>
		<td class="td_form02" colspan="3">
			从<s:textfield name="startQYTime" id="startQYTime" cssClass="easyui-datebox"></s:textfield>
			到<s:textfield name="endQYTime" id="endQYTime" cssClass="easyui-datebox"></s:textfield>
		</td>
	
		<td class="td_form01">录入日期：</td>
		<td class="td_form02" colspan="3">
			从<s:textfield name="startLRTime" id="startLRTime" cssClass="easyui-datebox"></s:textfield>
			到<s:textfield name="endLRTime" id="endLRTime" cssClass="easyui-datebox"></s:textfield>
	  	</td>
	</tr>
	
  	<tr>
		<td class="td_form01" colspan="6">
			<input type="button" class="buttonface" value="查询" onclick="advancedQuery();" >
			<s:reset value="重置" cssClass="buttonface"></s:reset>
			<input type="button" class="buttonface" value="取消" onClick="javascript:window.close();">
			<input name="button" type="submit" class="buttonface" value="导出到Excel "  onClick="">
		</td>
  	</tr>
</table>
</s:form>

<center>
<table width="95%"  border="0" cellpadding="0" cellspacing="0">
    <tr align="left">
      	<td height="24" colspan="3" class="td_form01">&nbsp;&nbsp;结果集展现列</td>
    </tr>
    <tr>
      	<td align="center" valign="top" class="td04">
	  		<select size="14" multiple style="height:150" name=s1>
				<option>入账科目</option>
				<option>规格型号</option>
				<option>开始使用日期</option>
				<option>启用日期</option>
				<option>使用状态</option>
				<option>使用期限</option>
				<option>月折旧率</option>
				<option>累计折旧</option>
				<option>原币原值</option>
				<option>净值</option>
				<option>净额</option>
				<option>净残值</option>
		        <option>一级分行</option>
		        <option>使用部门</option>
				<option>管理部门</option>
				<option>存放位置</option>
				<option>资产名称</option>
				<option>资产编号</option>
      		</select>
      	</td>
      	<td width="100" align="center" class="td04">
      		<input type=button  class="buttonface02" value="  添加  "  onclick="exchange(0)"><br> 
     		<input type=button class="buttonface02"  value="  删除  "  onclick="exchange(1)"><br><br><br>
	  		<INPUT type=button class="buttonface02"  value="  上移  "  onClick="up()"><br>
	  		<INPUT type=button class="buttonface02"  value="  下移  " onClick="down()"><br><br>      
      	</td>
      	<td align="center" class="td04">
	  		<select  size=14  name=s1  style="height:150"  multiple>
			  	<option>卡片编号</option>
		        <option>卡片名称</option>
		        <option>卡片类型</option>
		        <option>卡片状态</option>
        	</select>
        </td>
	</tr>
</table>
</center>

</body>
</html>