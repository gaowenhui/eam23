<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@page import="com.tansun.eam2.common.model.orm.bo.StGlbt"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/stgl/checkJS.inc" %>
<%
	 String look = (String)request.getParameter("look");
	 String zyzgqk = (String)request.getAttribute("zyzgqk");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<base href="<%=basePath %>"/>
<title>法人代表信息</title>

</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<s:form  name="myform" method="post" id="myform"   action="" >
<s:hidden name="stGlbt.stId"  id="stId"  value="%{#request.stGlbt.stId}" />
<s:hidden name="stGlbt.cldId"  id="cldId"  value="%{#request.stGlbt.cldId}"/>
<s:hidden name="stGlbt.id"  id="id"  value="%{#request.stGlbt.id}"/>
<s:set name="biaodanid" value="stGlbt.id" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
	<table width="100%"  border="0" cellspacing="2" cellpadding="0" align="center" >
		  <tr>
		    <td colspan="6" align="center" class="td_top"><strong>法人代表信息</strong></td>
		  </tr>  
		</table>
	  <table width="100%" height="442"align="center" class="docTable1">
	  <tr>
	    <td width="11%" class="td_zxy01"> <font color="#FF0000"><strong>*</strong></font>姓名：</td>
	    <td width="39%" class="td_zxy02"><s:textfield name="stGlbt.xingming" id="stGlbt.xingming"    label=""   cssClass="input"/> </td>
	    <td width="11%" class="td_zxy01">性别：</td>
	    <td width="39%" class="td_zxy02">
	    <s:radio name="stGlbt.CXingbie"  list="#{1:'男',2:'女'}"   ></s:radio>
	    </td>
	 </tr>
	 <tr>
	    <td width="11%" class="td_zxy01">手机：</td>
	    <td width="39%" class="td_zxy02"><s:textfield name="stGlbt.shouji"  cssClass="input" label=""  onblur="checkPhone(this);"/> </td>
	
	    <td width="11%" class="td_zxy01">年龄：</td>
	    <td width="39%" class="td_zxy02"><s:textfield name="stGlbt.nianling"  cssClass="input" label=""/> </td>    
	  </tr>
	  <tr>
	    <td width="11%" class="td_zxy01">身份证号：</td>
	    <td width="39%" class="td_zxy02"><s:textfield name="stGlbt.sfzh"  cssClass="input" label=""/> </td>  
	    <td width="11%" class="td_zxy01">婚姻状况：</td>
	    <td width="39%" class="td_zxy02"><s:radio  name="stGlbt.CHyzk" list="#{1:'未婚',2:'已婚'}"   ></s:radio></td>
	  </tr>
	  <tr>
	    <td width="11%" class="td_zxy01">民族：</td>
	    <td width="39%" class="td_zxy02"><s:textfield name="stGlbt.minzu" cssClass="input" label=""/> </td>
	    <td width="11%" class="td_zxy01">籍贯：</td>
	    <td width="39%" class="td_zxy02"><s:textfield name="stGlbt.jiguan" cssClass="input" label=""/> </td>
	  </tr>
	  <tr>
	    <td width="11%" class="td_zxy01">出生年月：</td>
	    <td width="39%" class="td_zxy02"><s:textfield name="stGlbt.csny"  id="csny" cssClass="input"  readonly="true"  onblur="checkDate(this);"  label=""/>  </td>
	    <td width="11%" class="td_zxy01">职务：</td>
	    <td class="td_zxy02"><s:textfield name="stGlbt.CZhiwu" cssClass="input" label=""/> </td>
	  </tr>
	  <tr>
	    <td width="11%" class="td_zxy01">毕业学校：</td>
	    <td width="39%" class="td_zxy02"><s:textfield name="stGlbt.byxx" cssClass="input"  label=""/> </td>
	    <td width="11%" class="td_zxy01">专业：</td>
	    <td width="39%" class="td_zxy02"><s:textfield name="stGlbt.zhuanye" cssClass="input"  label=""/> </td>
	  </tr>
	  <tr>
	    <td width="11%" class="td_zxy01">学历：</td>
	    <td width="39%" class="td_zxy02"><e:select parRefKey="EDUCATION_BACKGROUND" list="#{}" headerKey="" headerValue="" name="stGlbt.CXueli" id="xl"/></td>
	    <td class="td_zxy01">毕业时间：</td>
	    <td class="td_zxy02"><s:textfield name="stGlbt.bysj"  id="bysj"  cssClass="input"  readonly="true"  onblur="checkDate(this);"  label=""/></td>
	  </tr>
	  <tr>
	    <td width="11%" class="td_zxy01">家庭住址：</td>
	    <td width="39%" class="td_zxy02"><s:textfield name="stGlbt.jtzz" cssClass="input"  label=""/> </td>
	    <td width="11%" class="td_zxy01">邮政编码：</td>
	    <td width="39%" class="td_zxy02"><s:textfield name="stGlbt.yzbm"  cssClass="input" label="" onblur="isPostCode(this);"/></td>
	  </tr>
	  <tr>
	    <td width="11%" class="td_zxy01">电话：</td>
	    <td width="39%" class="td_zxy02"><s:textfield name="stGlbt.dianhua" cssClass="input"  label="" onblur="checkPhone(this);"/></td>
	    <td width="11%" class="td_zxy01">电子邮箱：</td>
	    <td width="39%" class="td_zxy02"><s:textfield name="stGlbt.dzyx"  label=""  cssClass="input"/></td>
	  </tr>
	  <tr>
	    <td width="11%" class="td_zxy01">薪资(元)：</td>
	    <td width="39%" class="td_zxy02"><s:textfield name="stGlbt.xinzi"  label="" onblur="checkFloat(this);" cssClass="input"/></td>
	    <td width="11%" class="td_zxy01">雇用期限：</td>
	    <td width="39%" class="td_zxy02"><s:textfield name="stGlbt.gyqx"  label=""  cssClass="input"/></td>
	  </tr>
	  <tr>   
	    <td width="11%" class="td_zxy01">人员类型</td>
	    <td width="39%" class="td_zxy02"><s:select theme="simple" list="{'建行员工','社会招聘员工'}" name="stGlbt.rylx" cssClass="input" /></td>
		
		<td width="11%" class="td_zxy01">档案存放单位：</td>
		 <td width="39%" class="td_zxy02"><s:textfield name="stGlbt.dacfdw"  label=""  cssClass="input"/></td>
	  </tr>
		<tr>
		   	<td width="11%" class="td_zxy01">雇佣说明：</td>	
		   	<td width="39%" colspan="3" class="td_zxy02"><s:textarea  name="stGlbt.gysm"  rows="3" cssClass="input"/></td>
		</tr>
		
		<tr>
              <td class="td_zxy01">执业资格情况： </td>
			  <td class="td_zxy02" colspan="3">
			  <table width="100%" height="18" border="0" cellpadding="0" cellspacing="0"   >
                   <tr>
                     <td >
                     <%if(!"1".equals(look)) {%>
                    	 <a href="javascript:AddEntityTable()">&nbsp;+ &nbsp;</a><%} %>
                     执业资格明细 </td>
                   </tr>
               </table>
               <table id="TableBox" width="100%"  border="0" cellspacing="0" cellpadding="0"  >
              <%if(!"1".equals(look)) {%>
                 <tr>
                   <td >
                   <a href="#" onClick="myDeleteRow(this);return false;">&nbsp;x&nbsp;</a>
                   	证书编号:</td>
                    <td><s:textfield name="zsbh"/></td>
                    <td>证书名称:</td>
                    <td><s:textfield name="zsmc"/></td>
                 </tr>
                 <tr>
                   <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发证时间:</td>
                    <td><s:textfield name="fzsj" readonly="true" /></td>
                    <td>发证机关:</td>
                    <td><s:textfield name="fzjg"/></td>
	              </tr>
	  			 <%} %>  
	  			</table>
             </td>
        </tr>
        
		<tr>
			<td class="td_zxy01">个人简历：</td>
			<td class="td_zxy02"  colspan="3"><e:filebutton fjlx="single"   biaodanId="%{#request.biaodanid}" isview="Y" /></td>
		</tr>
	</table>
	<div id="queding">
		<input name="assure"   type="button"  value="确定" onclick="dddd();"/>
		<input name="reset"     type="reset"   value="重置" /> 
	</div>
	<div  id="guanbi"  >
		<input name="guanbi" type="button" id="buttonguanbi"  value="关闭"   onclick="window.close();"/> 
	</div>
</s:form>
</body>
</html>

<script type="text/javascript">
	$(document).ready(function(){
		$("input[name='fzsj']").datebox({
	    	formatter:function(date){
	    		return formatDate(date);
	    	}
	    });	
	});		
	var addStr;
	if("1" == "<%=look %>"){
		if($.trim("<%=zyzgqk%>") !="" && "<%=zyzgqk %>" != null){
			$("#TableBox").html("<%=zyzgqk %>");
		}
	};
	function myDeleteRow(hrefObj){
		var rowObj = hrefObj.parentElement.parentElement;
		var nextRow = $(rowObj).next();
		$(rowObj).remove();
		$(nextRow).remove();
	}
	addStr = $("#TableBox").html();
	function AddEntityTable(tableId){
		$("#TableBox").append(addStr);
		$("input[name='fzsj']").datebox({
	    	formatter:function(date){
	    		return formatDate(date);
	    	}
	    });
	}	
	function dddd(){
		var ti = document.getElementById("stGlbt.xingming");
	  	var b  = document.getElementsByName("zsmc");
	    var isNullZsmc = true;
		for(var i=0;i<b.length;i++){
			if(b[i].value==null || b[i].value.length == 0){
				isNullZsmc = false;
			};
		}
	if(ti.value == null || ti.value.length == 0){
		alert("姓名不能为空！");
		ti.focus();
		return false;
    }else{
		document.getElementById("myform").action ="<%=request.getContextPath()%>/stgl/farenBody_saveChangeRep.do"; 
		$("#myform").submit();
		alert("保存成功！");
		window.opener.reloadJqGrid();
		window.close();
		}
	}
	
	$(function(){
		$("#csny").datebox({
	    	formatter:function(date){
	    		return formatDate(date);
	    	}
	    });
	    $("#bysj").datebox({
	    	formatter:function(date){
	    		return formatDate(date);
	    	}
	});
		//根据参数look判断页面显示
	   	if('1' == '<%=look%>'){
	   	  document.getElementById("queding").style.display="none";
		  document.getElementById("guanbi").style.display="block";
		  var a  = document.getElementsByTagName("select");
		  var b  = document.getElementsByTagName("textarea");
		  var c  = document.getElementsByTagName("input");
		  var d  = document.getElementsByTagName("radio");
			for(var i=0;i<a.length;i++){
				a[i].disabled = "true";
			}
			for(var i=0;i<b.length;i++){
				b[i].disabled = "true";
			}
			for(var i=0;i<c.length;i++){
			    if(c[i].type!="button"){
					c[i].disabled = "true";
				}
			}
			for(var i=0;i<d.length;i++){
				d[i].disabled = "true";
			}
		  document.getElementById("uploadbt_single").style.display="none";
		  document.getElementById("deletefilebutton").style.display="none";
		  
		}else if('0' == '<%=look%>'){
		  document.getElementById("queding").style.display="block";
		  document.getElementById("guanbi").style.display="none";
		  var a  = document.getElementsByTagName("select");
		  var b  = document.getElementsByTagName("textarea");
		  var c  = document.getElementsByTagName("textfield");
		  var d  = document.getElementsByTagName("radio");
		}   
	 });
</script>
