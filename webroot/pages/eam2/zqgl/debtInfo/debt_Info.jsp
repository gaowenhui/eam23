<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
String saveSign = request.getParameter("saveSign");
String look = (String)request.getAttribute("look");
String newAdd = (String)request.getAttribute("newAdd");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>债权信息</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript">
		$(document).ready(function(){
			//实体信息按钮
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
			
			
			$("#myform").ajaxForm({
			   	success: function(responseText){
					window.opener.reloadGrid();
			   		alert("保存成功!");
			   		window.close();
			   	}
		   })	
		   
		  
		   $("#cbrq,#htqsrq,#htzzrq").datebox({
				formatter:function(date){
					return formatDate(date);

				}
			});
				
			
			if('1' == '<%=look%>'){
			  var a  = document.getElementsByTagName("input");
			  var b  = document.getElementsByTagName("select");
			  var c  = document.getElementsByTagName("textarea");
				for(var i=0;i<a.length;i++){
					a[i].disabled = "true";
				}
				document.getElementById("lookdetail").disabled=false;
				for(var i=0;i<b.length;i++){
					b[i].disabled = "true";
				}
				for(var i=0;i<c.length;i++){
					c[i].disabled = "true";
				}
								
			}
		});
			
	    function save(){
		    if(checkPageInput()){
				if(1 == '<%=newAdd%>' ){
					$("#myform").attr("action","<%=basePath%>zqgl/debt_saveDebtInfo.do?newAdd="+1);
		    	}else{
			    	$("#myform").attr("action","<%=basePath%>zqgl/debt_saveDebtInfo.do");
			    }
			    $("#myform").submit();
			}
		}
		

	//-----------------选择外部实体------------
		var winVar = "height=500, width=800, top=100, left=100,toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no, directories=no ,center=yes";
		function outEntity(){
			window.open('zqgl/outEntity_outEntityList.do?debtSign='+1,'',winVar);
			return false;
		}
		
		function reloadGrid(gr){
			$.post("<%=basePath%>zqgl/debt_returnJson.do",{
	 		 'stid':''+gr
	 		},function(returnStr){
	 			var returnObj = eval('('+ returnStr + ')');
	 			$("#zwrmc").val(returnObj.stzwmc);
	 			$("#zwrbh").val(returnObj.zcbh);
	 			$("#zwrid").val(returnObj.id);
	 			$("#glstlx").val(returnObj.stlx);
	 		});
		}
//----------------选择内部实体-------------------------
		function selfTransactEntity(){
			window.open('<%=request.getContextPath()%>/stgl/weihu_listEntities.do?debtSign='+1+'&zixunType='+1,'',winVar);
			return false;
		}
//----------------选择内部实体-------------------------
		function selfTransactEntity0(){
			window.open('<%=request.getContextPath()%>/stgl/weihu_listEntities.do?debtSign='+1+'&zixunType='+0,'',winVar);
			return false;
		}
		function selfTransactEntity3(){
			window.open('<%=request.getContextPath()%>/stgl/weihu_listEntities.do?debtSign='+1+'&zixunType='+3,'',winVar);
			return false;
		}
		function selfTransactEntity1(){
			window.open('<%=request.getContextPath()%>/stgl/weihu_listEntities.do?debtSign='+1+'&zixunType='+1,'',winVar);
			return false;
		}
		
		function getEntity(gr){
			$.post("<%=basePath%>zqgl/debt_returnJson.do",{
	 		 'stid':''+gr
	 		},function(returnStr){
	 			var returnObj = eval('('+ returnStr + ')');
	 			$("#zwrmc").val(returnObj.stzwmc);
	 			$("#zwrbh").val(returnObj.zcbh);
	 			$("#zwrid").val(returnObj.id);
	 			$("#glstlx").val(returnObj.stlx);
	 			alert($("#zwrbh").val());
	 		});
		}
		
		
		function checkPageInput(){
			var zwrmc = document.getElementById("zwrmc");
			if(zwrmc.value == null || zwrmc.value.length == 0){
				alert("债务人名称不能为空，请选择关联实体!");
				zwrmc.focus();
		      return false;
		    }
		    var sd = document.getElementById('htqsrq').value;
			var ed = document.getElementById('htzzrq').value;
			if(sd > ed && ed !=''){
				alert("开始日期不应该大于结束日期，请重新输入！");
				return false;
			}
		    return true;
		}
		
		
		function dateValidate(){

			return true;
		}
		
		/**
		合计
		**/
		function dddd(){
			if($("input[name='di.bj']").val() == null){
				$("input[name='di.bj']").val(0.0);
			}else if($("input[name='di.lx']").val() == null){
				$("input[name='di.lx']").val(0.0);
			}
			$("input[name='di.hj']").val(Number($("input[name='di.bj']").val()) + Number($("input[name='di.lx']").val()) );
		}
		
		
		/**
		是否诉讼
		**/
		function ifLitigation(){
			if(document.getElementById('sfss').value == 0){
				document.getElementById('ssfy').disabled=true;
				document.getElementById('sfysxflws').disabled=true;
				document.getElementById('zhtsfss').disabled=true;
				document.getElementById('dbhtsfss').disabled=true;
				document.getElementById('ssfy').value='';
				document.getElementById('sfysxflws').value='';
				document.getElementById('zhtsfss').value='';
				document.getElementById('dbhtsfss').value='';
			}
			else {
				document.getElementById('ssfy').disabled=false;
				document.getElementById('sfysxflws').disabled=false;
				document.getElementById('zhtsfss').disabled=false;
				document.getElementById('dbhtsfss').disabled=false;
			}
		}
		
		
		/**
		查看债务人详细信息
		**/
		function lookDebtDetail(){
			var gr = document.getElementById('zwrid').value;
			if(gr.length == 0 ){
				alert("请先关联相关实体");
			}else{
				if(document.getElementById('glstlx').value == 1){
					window.open('<%=request.getContextPath()%>/stgl/weihu_newNonEntity.do?stid='+gr+'&stlx='+1+'&look='+1);
				}else{
					window.open('<%=request.getContextPath()%>/zqgl/outEntity_newEntity.do?stid='+gr+'&stlx='+10+'&look='+1);
				}
				return false;
			}
		}
		
		
		function cv(){
		  var kk = document.getElementById("glst").value;
		  if(1==kk){
		    selfTransactEntity0();
		  }else if(2==kk){
		    selfTransactEntity1();
		  }else if(3==kk){
		    selfTransactEntity3();
		  }else if(0==kk){
		    outEntity();
		  }
	  
	}
		</script>
	</head>
	<base target="_self"/>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<s:form action="" method="post" id="myform">
<s:hidden name="sw.stockid" id="stockId"></s:hidden>
<s:hidden name="di.id" id="diid"></s:hidden>
<s:set name="biaodanid" value="di.id" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />

         <table id="common_tableWidth" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="newTable">
             <tr>
                 <td height="24" nowrap class="td_zxy01">债权人名称：</td>
                 <td class="td_zxy02" id="applyNo">
                 <s:hidden name="di.zqrid" value="10775"></s:hidden>
                 <s:textfield name="di.zqrmc" id="zqrmc" value="中国建投" readonly="true" style="width: 60%;"/></td>
                 <td colspan="2" class="td03">合同情况</td>
             </tr>
             <tr>
                 <td nowrap class="td_zxy01" height="24">省份： </td>
                 <td class="td_zxy02" id="applyPersonTd"><e:select parRefKey="PROVIENCE" name="di.shengfen" list="#{}" id="shengfen" value="%{#request.di.shengfen }" /></td>
                 <td nowrap class="td_zxy01">合同/档案编号：</td>
                 <td class="td_zxy02" id="applyNo">
                     <s:textfield name="di.htbh" id="htbh" style="width: 60%;"/></td>
             </tr>
            
             <tr>
                 <td nowrap class="td_zxy01" height="24">
                 <font color="#FF0000"><strong>*</strong></font>  
                 债务人名称：</td>
               <td class="td_zxy02"><s:textfield name="di.zwrmc" id="zwrmc" readonly="true" style="width: 60%;"/>  <input type="button" id="lookdetail" class="buttonface" value="查看债务人详细信息" onClick="lookDebtDetail();"/></td>
                  <s:hidden name="di.zwrbh" id="zwrbh" />
                  <s:hidden name="di.zwrid" id="zwrid" />
                  <!--  s:hidden name="di.glstlx" id="glstlx" /-->
                 <td class="td_zxy01">
                     合同金额 币种：</td>
                 <td class="td_zxy02" id="applyDateTd">
					<s:select list="#{'':'请选择',0:'人民币',1:'美元',2:'港元',3:'欧元'}"  name="di.bzbm"  id="bzbm" ></s:select>
				</td>
             </tr>
             <tr>
               <td class="td_zxy01" >关联实体：</td>
               <td class="td_zxy02"><s:select name="di.glstlx" id="glst" list="#{'':'请选择','0':'外部实体','1':'咨询类实体','2':'非咨询处置类实体','3':'非咨询持续经营类实体'}" value="%{#request.di.glstlx}" onChange="cv();"/></td>
                 <td class="td_zxy01">合同金额 原币金额：</td>
                 <td class="td_zxy02" id="purchaseDateTd9">
                     <s:textfield name="di.htje" id="htje" style="width: 60%;"/></td>
             </tr>
             <tr>
                <td height="24" colspan="2" nowrap class="td03">截止日债权金额</td>
                 <td class="td_zxy01">合同起始日期：</td>
                 <td class="td_zxy02" id="purchaseDateTd8">
                    <s:textfield name="di.htqsrq" id="htqsrq" style="width: 60%;"/></td>
             </tr>
             <tr>
               <td nowrap class="td_zxy01" height="24"> 购入债余额(元)：</td>
               <td class="td_zxy02" id="applyPersonTd"><s:textfield name="di.grzye" id="grzye" style="width: 60%;"/></td>
               <td class="td_zxy01">合同终止日期：</td>
                 <td class="td_zxy02" id="purchaseDateTd7"><s:textfield name="di.htzzrq" id="htzzrq" style="width: 60%;"/></td>
             </tr>
             <tr>
               <td nowrap class="td_zxy01" height="24"> 本金(元)：</td>
               <td  class="td_zxy02" id="telTd8"><s:textfield name="di.bj" id="bj" onblur="dddd()" style="width: 60%;"/></td>
               <td colspan="2" class="td03">涉及法律程序情况</td>
             </tr>
             <tr>
               <td nowrap class="td_zxy01" height="24"> 利息(元)：</td>
               <td  class="td_zxy02" id="telTd7"><s:textfield name="di.lx" id="lx" onblur="dddd()" style="width: 60%;"/></td>
                 <td class="td_zxy01">是否诉讼：</td>
                 <td class="td_zxy02" id="purchaseDateTd4"><s:select name="di.sfss" id="sfss" list="#{'':'请选择',1:'是',0:'否'}" value="%{#request.di.sfss}" onChange="ifLitigation();"/></td>
             </tr>
             <tr>
               <td nowrap class="td_zxy01" height="24"> 合计(元)：</td>
               <td  class="td_zxy02" id="telTd6"><s:textfield name="di.hj" id="hj" readonly="true" style="width: 60%;"/></td>
                 <td class="td_zxy01">诉讼费用(元)：</td>
                 <td class="td_zxy02" id="purchaseDateTd3"><s:textfield name="di.ssfy" id="ssfy" style="width: 60%;"/></td>
             </tr>
             <tr>
                  <td height="24" colspan="2" nowrap class="td03">担保情况</td>
                 <td class="td_zxy01">是否有生效法律文书：</td>
                 <td class="td_zxy02" id="purchaseDateTd2"><s:select name="di.sfysxflws" id="sfysxflws" list="#{'':'请选择',1:'是',0:'否'}"/></td>
             </tr>
             <tr>
               <td nowrap class="td_zxy01" height="24"> 担保类型：</td>
               <td  class="td_zxy02" id="telTd4"><s:textfield name="di.dblxmc" id="dblxmc" style="width: 60%;"/></td>
                 <td class="td_zxy01" id="telTd5">
                     主合同是否胜诉：</td>
                 <td class="td_zxy02" id="telTd5"><s:select name="di.zhtsfss" id="zhtsfss" list="#{'':'请选择',1:'是',0:'否'}" value="%{#request.di.zhtsfss}"/></td>
             </tr>
             <tr>
               <td nowrap class="td_zxy01" height="24"> 担保合同编号：</td>
               <td class="td_zxy02" id="telTd3"><s:textfield name="di.dbhtbh" id="dbhtbh" style="width: 60%;"/></td>
                 <td class="td_zxy01" id="telTd10">担保合同是否胜诉：</td>
                 <td class="td_zxy02" id="telTd10"><s:select name="di.dbhtsfss" id="dbhtsfss" list="#{'':'请选择',1:'是',0:'否'}" value="%{#request.di.dbhtsfss}"/></td>
             </tr>
             <tr>
               <td nowrap class="td_zxy01" height="24">担保合同金额(元)：</td>
               <td  class="td_zxy02" id="telTd2"><s:textfield name="di.dbhtje" id="dbhtje" style="width: 60%;"/></td>
                 <td  class="td03" colspan="2" id="telTd10">其他信息</td>
             </tr>
             <tr>
               <td nowrap class="td_zxy01" height="24">抵押物质类别：</td>
               <td  class="td_zxy02" id="telTd"><s:textfield name="di.dbwzlbmc" id="dbwzlbmc" style="width: 60%;"/></td>
                 <td class="td_zxy01" id="telTd">是否核销：</td>
                 <td class="td_zxy02" id="telTd"><s:select name="di.fshx" id="fshx" list="#{'':'请选择','是':'是','否':'否'}" value="%{#request.di.fshx}"/></td>
             </tr>
             <tr>
               <td height="24" nowrap class="td_zxy01">保证人名称：</td>
               <td height="24"  class="td_zxy02"><s:textfield name="di.bzrmc" id="bzrmc" style="width: 60%;"/></td>
               <td class="td_zxy01">是否转让：</td>
               <td class="td_zxy02"><s:select name="di.djzr" id="djzr" list="#{'':'请选择',1:'是',0:'否'}"/></td>
             </tr>
             <tr>
               <td height="24" nowrap class="td_zxy01">债权种类：</td>
               <td height="24"  class="td_zxy02"><s:select name="di.zqzl" id="zqzl"  list="#{'':'请选择','0':'全部',1:'信达转让',2:'建银转让',3:'其他'}" value="%{#request.di.zqzl}"/></td>
               <td class="td_zxy01">转让对价金额(元)：</td>
               <td class="td_zxy02"><s:textfield name="di.djzrje" id="djzrje" style="width: 60%;"/></td>
             </tr>
             <tr>
                 <td height="26" align="center" nowrap class="td_zxy01">备注 ：</td>
                 <td colspan="3" valign="top" class="td_zxy02" id="CHeadAdviseId">
                     <s:textarea id="beizhu" style="width: 85%;" class="input3" rows="4" name="di.beizhu"></s:textarea></td>
             </tr>

           </table>
            <table class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	           <tr>
		            <table class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
	     				<td class="td_zxy01" colspan="4"  height="25">合同/档案 附件：</td>
	     				<%@ include file="/inc/file.inc"%>
		     		</table>			
				</tr>
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
