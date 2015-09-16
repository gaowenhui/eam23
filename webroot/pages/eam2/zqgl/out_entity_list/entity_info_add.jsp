<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/stgl/checkJS.inc" %>
<%
	String sheadId = request.getParameter("sheadId");
	String look = (String)request.getAttribute("look");
	String id = (String) request.getAttribute("id");
	String leixing = request.getParameter("leixing");
	String stid = request.getParameter("stid");
	String yearData = request.getParameter("yearData");
	String newAdd = (String)request.getAttribute("newAdd");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>外部实体信息维护</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript">
		$(document).ready(function(){
			if('1' != '<%=look%>'){
				var buttonFileJSonString = '[{"buttonHandler":"addFileAss","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"delFileAss","buttonIcon":"icon-remove","buttonText":"删除"}\
				]';
				addButtons(jQuery("#gview_file_list > .ui-jqgrid-titlebar"),buttonFileJSonString);
			}
			
			jQuery("#file_list").setGridWidth($("#common_tableWidth").width());
			$(window).bind('resize', function(){
				jQuery("#file_list").setGridWidth($("#common_tableWidth").width());
			});
			
			if('1' == '<%=look%>'){
			  var a  = document.getElementsByTagName("input");
			  var b  = document.getElementsByTagName("select");
			  var c  = document.getElementsByTagName("textarea");
				for(var i=0;i<a.length;i++){
					a[i].disabled = "true";
				}
				for(var i=0;i<b.length;i++){
					b[i].disabled = "true";
				}
				for(var i=0;i<c.length;i++){
					c[i].disabled = "true";
				}				
			}
			$("#myform").ajaxForm({
			   	success: function(responseText){
//			   		window.opener.location.reload();
					window.opener.reloadGrid();
			   		alert("保存成功!");
			   		window.close();
			   	}
		   });
		});
		
		
		function checkPageInput(){
			var stzwmc = document.getElementById("stzwmc");
			if(stzwmc.value == null || stzwmc.value.length == 0){
				alert("实体名称不能为空!");
				stzwmc.focus();
		      return false;
		    }
		    return true;
		}
		
		
		function save(){
			if(checkPageInput()){
				if(1 == '<%=newAdd%>' ){
				$("#myform").attr("action","<%=basePath%>zqgl/outEntity_saveEntity.do?newAdd="+1);
		    	}else{
		    	$("#myform").attr("action","<%=basePath%>zqgl/outEntity_saveEntity.do");
		    	}
		    	$("#myform").submit();
			}
		}
		
		

		</script>
	</head>
	<base target="_self"/>
	<body>
<s:form action="" method="post" id="myform">
<s:hidden name="st.id" id="sinfoid" ></s:hidden>
<s:set name="biaodanid" value="st.id" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<table id="common_tableWidth" class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
            <tr>
              <td class="td_zxy01">实体编号：</td>
              <td class="td_zxy02"><s:textfield name="st.zcbh" id="zcbh" disabled="true" style="width: 60%;"/></td>
              <td class="td_zxy01">
              <font color="#FF0000"><strong>*</strong></font>  
             	 实体名称：</td>
              <td class="td_zxy02"><s:textfield name="st.stzwmc" id="stzwmc"style="width: 60%;" /></td>
            </tr>	
            <tr>
              <td class="td_zxy01">法人代表：</td>
              <td class="td_zxy02"><s:textfield name="st.frdb" id="frdb" style="width: 60%;"/></td>
              <td class="td_zxy01">办公地址：</td>
              <td class="td_zxy02">
              <s:textfield name="st.bgdz" id="bgdz" style="width: 60%;"/>
              </td>
            </tr>
            <tr>	
              <td class="td_zxy01">联系人：</td>
              <td class="td_zxy02">
              <s:textfield name="st.lxr" id="lxr" style="width: 60%;"/>
              </td>
             <td class="td_zxy01">实体性质：</td>
              <td class="td_zxy02">
               <s:textfield name="st.stxz" id="stxz" style="width: 60%;"/>
              </td>
            </tr>
             <tr>
              <td class="td_zxy01">联系电话：</td>
              <td class="td_zxy02">
              <s:textfield name="st.lxdh" id="lxdh" style="width: 60%;"  onblur="checkPhone(this);"/>
              </td>
             <td class="td_zxy01">注册资金(万元)：</td>
              <td class="td_zxy02">
              <s:textfield name="st.zczj" id="zczj" style="width: 60%;" onblur="checkFloat(this);"/>
              </td>
             </tr>
             <tr>
              <td class="td_zxy01">总经理：</td>
              <td class="td_zxy02">
              <s:textfield name="st.zjl" id="zjl" style="width: 60%;"/>
              </td>
              <td class="td_zxy01">经济性质：</td>
              <td class="td_zxy02"><s:textfield name="st.jjxz" id="jjxz" style="width: 60%;"/></td>
             </tr>
              <tr>
             	  <td height="26" align="center" nowrap class="td_zxy01">备注：</td>
                  <td colspan="3" valign="top" class="td_zxy02" id="CHeadAdviseId">
                      <s:textarea id="beizhu" style="width: 85%;" class="input3" rows="4" name="st.beizhu"/>
                  </td>
             </tr>
             <tr>
              <td class="td_zxy01">资产权属：</td>
              <td class="td_zxy02">
              <e:select parRefKey="ASSET_OWNERSHIP" list="#{}" headerKey=""  headerValue=""  name="st.CZcqs" id="CZcqs"  value="%{#request.st.CZcqs}"/>
              </td>
             <td class="td_zxy01">委托人：</td>
              <td class="td_zxy02">
              <s:textfield name="st.wtrmc" id="wtrmc" style="width: 60%;"/>
              </td>
             </tr>
               <tr>
                  <td class="td_zxy01" height="25" colspan="4">实体资料（附件）：</td>
		     </tr>
             </table> 	
					<%@ include file="/inc/file.inc"%>
		    <table id="TableBox" width="100%"  border="0" cellspacing="0" cellpadding="0"  >
             <tr>
              <td class="td_zxy02" colspan="4">
              <%if(!"1".equals(look)) {%>
              <div align="right">
			     <input name="sdfg" type="button" value="确定" onClick="save();"/>
                 <input name="reset" type="reset" value="重置" />
                 <%} %>
              </div>   
			  </td>
            </tr>
</table> 	
</s:form>

	</body>
</html>
