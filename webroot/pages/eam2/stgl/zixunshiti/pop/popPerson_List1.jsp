<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
String sheadId = request.getParameter("sheadId");
String id = (String) request.getAttribute("id");
String leixing = request.getParameter("leixing");
String stid = request.getParameter("stid");
String pop = request.getParameter("pop");
String newAdd = request.getParameter("newAdd");
String zyzgqk = (String)request.getAttribute("zyzgqk");
String look = (String)request.getAttribute("look");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>实体人员信息</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<script type="text/javascript">
		
	$(document).ready(function(){
		if('1' != '<%=look%>'){
			var buttonFileJSonString = '[{"buttonHandler":"addFileAss","buttonIcon":"icon-add","buttonText":"增加"},\
										{"buttonHandler":"delFileAss","buttonIcon":"icon-cut","buttonText":"删除"}\
			]';
		}
		addButtons(jQuery("#gview_file_list > .ui-jqgrid-titlebar"),buttonFileJSonString);
		jQuery("#file_list").setGridWidth($("#common_tableWidth").width());
		$(window).bind('resize', function(){
			jQuery("#file_list").setGridWidth($("#common_tableWidth").width());
		});
	});
	
	function checkPageInput(){
		var fxingming = document.getElementById("sf.fxingming");
		if(fxingming.value == null || fxingming.value.length == 0){
			alert("姓名不能为空！");
			fxingming.focus();
	      return false;
	    }
	    return true;
	}
			
	function save(){
		if(checkPageInput()){
			$("input").removeAttr("disabled"); 
			$("textarea").removeAttr("disabled"); 
			$("select").removeAttr("disabled"); 
			$("#weihu_saveStFsxxform").attr("action","<%=basePath%>stgl/weihu_saveStFsxx.do?newAdd=<%=newAdd%>");
	    	$("#weihu_saveStFsxxform").submit();
		}
	}
		var addStr;
		$(function(){
			$("input[name='fzsj']").datebox({
		    	formatter:function(date){
		    		return formatDate(date);
		    	}
		});
	    addStr = $("#TableBox").html();
		if("1" != "<%=newAdd %>"){
			if($.trim("<%=zyzgqk%>") !="" && "<%=zyzgqk %>" != null){
				$("#TableBox").html("<%=zyzgqk %>");
			}
		};
	   $("#weihu_saveStFsxxform").ajaxForm({
			   	success: function(responseText){
			   		window.opener.reloadGrid();
			   		alert("保存成功!"); 
		   			window.close();
			   	}
		   });
			$("#frzsj,#flzsj,#fcsny").datebox({
				formatter:function(date){
					return formatDate(date);				
				}
			});
	});

	function AddEntityTable(tableId){
		$("#TableBox").append(addStr);
		$("input[name='fzsj']").datebox({
	    	formatter:function(date){
	    		return formatDate(date);
	    	}
	    });
	}	
	
	function myDeleteRow(hrefObj){
		var rowObj = hrefObj.parentElement.parentElement;
		var nextRow = $(rowObj).next();
		$(rowObj).remove();
		$(nextRow).remove();
	}
		function vewDisabled(){
			if('1' == '<%=look%>'){
			  var a  = document.getElementsByTagName("input");
			  var b  = document.getElementsByTagName("select");
				for(var i=0;i<a.length;i++){
					a[i].disabled = "true";
				}
				for(var i=0;i<b.length;i++){
					b[i].disabled = "true";
				}
			  document.getElementById("uploadbt_single").style.display="none";
			  document.getElementById("deletefilebutton").style.display="none";
			}	
		}
		

</script>
</head>
<base target="_self"/>
<body onload="vewDisabled();">
<s:form action="stgl/weihu_saveStFsxx.do" method="post" id="weihu_saveStFsxxform">
<s:hidden name="sf.id" id="id"></s:hidden>
<s:hidden name="sf.stid" id="st.id"></s:hidden>
<s:set name="biaodanid" value="sf.id" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<s:hidden name="sf.leixing" id="leixing"></s:hidden>
<s:hidden name="sf.stnzcfl" value="1" id="pop"></s:hidden>
<s:hidden name="sf.fazzt" id="fazzt" value="0"></s:hidden>
<table id="common_tableWidth" class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
             <tr>
              <td class="td_zxy01">人员编号(自动生成)：</td>
              <td class="td_zxy02"><s:textfield name="sf.frybh" id="frybh" disabled="true"/></td>
              <td class="td_zxy01">
                <font color="#FF0000"><strong>*</strong></font>
              	姓名：</td>
              <td class="td_zxy02"><s:textfield name="sf.fxingming" id="fxingming" /></td>
            </tr>
            <tr>
              <td class="td_zxy01">性别：</td>
              <td class="td_zxy02"><r:select list="#{'0':'','1':'男','2':'女'}" id="fxingbie" name="sf.fxingbie"/></td>
              <td class="td_zxy01">年龄：</td>
              <td class="td_zxy02"><s:textfield name="sf.fnianling" id="fnianling" /></td>
            </tr>
            <tr>
              <td class="td_zxy01">身份证号：</td>
              <td class="td_zxy02"><s:textfield name="sf.fsfzh" id="fsfzh" /></td>
              <td class="td_zxy01">婚姻状况：</td>
              <td class="td_zxy02"><r:select list="#{'0':'','1':'未婚','2':'已婚'}" name="sf.fcHyzk" id="fcHyzk"/></td>
            </tr>
            <tr>
              <td class="td_zxy01">民族：</td>
              <td class="td_zxy02"><s:textfield name="sf.fminzu" id="fminzu" /></td>
              <td class="td_zxy01">籍贯：</td>
              <td class="td_zxy02"><s:textfield name="sf.fjiguan" id="fjiguan" /></td>
            </tr>
            <tr>
              <td class="td_zxy01">出生年月：</td>
              <td class="td_zxy02"><s:textfield name="sf.fcsny" id="fcsny"  readonly="true"/></td>
              <td class="td_zxy01">职务：</td>
              <td class="td_zxy02"><s:textfield name="sf.fcZhiwu" id="fcZhiwu" /></td>
            </tr>
            <tr>
              <td class="td_zxy01">毕业学校：</td>
              <td class="td_zxy02"><s:textfield name="sf.fbyxx" id="fbyxx" /></td>
              <td class="td_zxy01">专业：</td>
              <td class="td_zxy02"><s:textfield name="sf.fzhuanye" id="fzhuanye" /></td>
            </tr>
            <tr>
              <td class="td_zxy01">学历：</td>
              <td class="td_zxy02"><s:textfield name="sf.fcXueli" id="fcXueli" /></td>
              <td class="td_zxy01">手机：</td>
              <td class="td_zxy02"><s:textfield name="sf.fshouji" id="fshouji" /></td>
            </tr>
            <tr>
              <td class="td_zxy01">家庭住址：</td>
              <td class="td_zxy02"><s:textfield name="sf.fjtzz" id="fjtzz" /></td>
              <td class="td_zxy01">邮政编码：</td>
              <td class="td_zxy02"><s:textfield name="sf.fyzbm" id="fyzbm" /></td>
            </tr>
            <tr>
              <td class="td_zxy01">单位电话：</td>
              <td class="td_zxy02"><s:textfield name="sf.fdianhua" id="fdianhua" /></td>
              <td class="td_zxy01">电子邮箱：</td>
              <td class="td_zxy02"><s:textfield name="sf.fdzyx" id="fdzyx" /></td>
            </tr>
            <tr>
              <td class="td_zxy01">任职时间：</td>
              <td class="td_zxy02"><s:textfield name="sf.frzsj" id="frzsj" readonly="true"/></td>
              <td class="td_zxy01">离职时间：</td>
              <td class="td_zxy02"><s:textfield name="sf.flzsj" id="flzsj" readonly="true"/></td>
            </tr>
            <tr>
              <td class="td_zxy01">收入：</td>
              <td class="td_zxy02"><s:textfield name="sf.fshouru" id="fshouru" /></td>
              <td class="td_zxy01">工资发放单位：</td>
              <td class="td_zxy02"><s:textfield name="sf.fgzffdw" id="fgzffdw" /></td>
            </tr>
            <tr>
              <td class="td_zxy01">人员类型：</td>
              <td class="td_zxy02">
              <e:select parRefKey="CONSULT_ENTITY_PERSON_TYPE" list="#{}" name="sf.fcRylx" id="fcRylx" value="%{#request.sf.fcRylx }"/>
			  </td>
              <td class="td_zxy01">档案存放单位：</td>
              <td class="td_zxy02"><s:textfield name="sf.fdacfdw" id="fdacfdw" /></td>
            </tr>
            <tr>
              <td class="td_zxy01">是否法人代表：</td>
              <td class="td_zxy02">
              <s:select list="#{0:'否',1:'是'}" name="sf.fsffr" id="fsffr"></s:select>			  </td>
              <td class="td_zxy01">&nbsp</td>
              <td class="td_zxy02">&nbsp</td>
            </tr> 
	        <tr>
              <td class="td_zxy01">执业资格情况： </td>
			  <td class="td_zxy02" colspan="3">
			  <table width="100%" height="18" border="0" cellpadding="0" cellspacing="0"   >
                   <tr>
                     <td >
                      <%if(!"1".equals(look)) {%>
                     <a href="javascript:AddEntityTable()">&nbsp;+ &nbsp;</a>
                  <%} %>   
                     执业资格明细 </td>
                   </tr>
               </table>
               <table id="TableBox" width="100%"  border="0" cellspacing="0" cellpadding="0"  >
                 <tr>
                   <td >
                   <%if(!"1".equals(look)) {%>
                   <a href="#" onClick="myDeleteRow(this);return false;">&nbsp;x&nbsp;</a>
                   <%} %>
                   证书编号:</td>
                    <td><s:textfield name="zsbh"/></td>
                    <td>证书名称:</td>
                    <td><s:textfield name="zsmc"/></td>
                 </tr>
                 <tr>
                   <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发证时间:</td>
                    <td><s:textfield name="fzsj" readonly="true"/></td>
                    <td>发证机关:</td>
                    <td><s:textfield name="fzjg"/></td>
	              </tr>
	  			</table>
             </td>
            </tr>
	        <tr>
				<td class="td_zxy01">简历：</td>
				<td class="td_form02"  colspan="3"><e:filebutton fjlx="single" biaodanId="%{#request.biaodanid}" isview="Y" /></td>
			</tr>
			 
</table> 	

 <table id="TableBox" width="100%"  border="0" cellspacing="0" cellpadding="0"  >
			<tr>
	             <td class="td_zxy02" colspan="4" align="right">
	             <div align="right">
	             <%if(!"1".equals(look)){ %>
				     <input name="dsgsdf" type="button" value="确定" onClick="save(); return false;"   />
	                 <input name="reset" type="reset" value="重置" />
	             <%} %>
	             </div>    
				 </td>
            </tr>
</table>
</s:form>

	</body>
</html>

