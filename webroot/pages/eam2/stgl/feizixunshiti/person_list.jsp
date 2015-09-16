<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
String sheadId = request.getParameter("sheadId");

String id = (String) request.getAttribute("id");
String leixing = request.getParameter("leixing");
String stid = request.getParameter("stid");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>实体人员信息</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<script type="text/javascript">
			function refresh(){

//				document.getElementById("sheadId").value = <%=sheadId%>;
//				document.myform.sheadId.value='<%=sheadId%>';
				document.forms[0].sheadId.value ='<%=sheadId%>';

				$("#myform").attr("action","<%=basePath%>stgl/outStorageBody_addBody.do");
				$("#myform").submit();

			}
			
			function onload(){
//				document.myform.sheadId.value = <%=sheadId%>;
			}
			
		function save(){
			alert(123789);
			$("#myform").attr("action","<%=basePath%>stgl/weihu_saveStFsxx.do");
	    	$("#myform").submit();
		}
		$(function(){
			$("#myform").ajaxForm({
			   	success: function(responseText){
			   		alert(234234);
			   		window.opener.reloadGrid();
			   		window.close();
			   	}
		   });
		});
		</script>
	</head>
	<base target="_self"/>
	<body onload="onload()">
<s:form action="stgl/weihu_saveStFsxx.do" method="post" id="myform">
<s:hidden name="sf.id" id="id"></s:hidden>
<s:hidden name="st.id" id="stid"></s:hidden>
<s:hidden name="sf.leixing" id="leixing"></s:hidden>
<table id="tableWidth" class="newtable" align="center" width="100%" cellspacing="0" cellpadding="0">
            <tr>
              <td class="td_zxy01">人员编号： </td>
              <td class="td_zxy02"><s:textfield name="sf.frybh" id="frybh" /><input type="submit"  value="生成编号"></td>
              <td class="td_zxy01">姓名：</td>
              <td class="td_zxy02"><s:textfield name="sf.fxingming" id="fxingming" /></td>
            </tr>
            <tr>
              <td class="td_zxy01">性别：</td>
              <td class="td_zxy02"><s:radio list="{'男','女'}" value="男" id="fxingbie" name="sf.fxingbie"></s:radio></td>
              <td class="td_zxy01">年龄：</td>
              <td class="td_zxy02"><s:textfield name="sf.fnianling" id="fnianling" /></td>
            </tr>
            <tr>
              <td class="td_zxy01">身份证号：</td>
              <td class="td_zxy02"><s:textfield name="sf.fsfzh" id="fsfzh" /></td>
              <td class="td_zxy01">婚姻状况：</td>
              <td class="td_zxy02"><s:radio list="{'已婚','未婚'}" name="sf.fcHyzk" id="fcHyzk"></s:radio></td>
            </tr>
            <tr>
              <td class="td_zxy01">民族：</td>
              <td class="td_zxy02"><s:textfield name="sf.fminzu" id="fminzu" /></td>
              <td class="td_zxy01">籍贯：</td>
              <td class="td_zxy02"><s:textfield name="sf.fjiguan" id="fjiguan" /></td>
            </tr>
            <tr>
              <td class="td_zxy01">出生年月：</td>
              <td class="td_zxy02"><s:textfield name="" id="fcsny" /></td>
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
              <td class="td_zxy02"><s:textfield name="" id="frzsj" /></td>
              <td class="td_zxy01">离职时间：</td>
              <td class="td_zxy02"><s:textfield name="" id="flzsj" /></td>
            </tr>
            <tr>
              <td class="td_zxy01">收入：</td>
              <td class="td_zxy02"><s:textfield name="sf.fshouru" id="fshouru" /></td>
              <td class="td_zxy01">工资发放单位：</td>
              <td class="td_zxy02"><s:textfield name="sf.fgzffdw" id="fgzffdw" /></td>
            </tr>
            <tr>
              <td class="td_zxy01">人员类型：</td>
              <td class="td_zxy02"><s:select list="{' ','建行员工','社会招聘人员'}" name="sf.fcRylx" id="fcRylx"></s:select>
			  </td>
              <td class="td_zxy01">档案存放单位：</td>
              <td class="td_zxy02"><s:textfield name="sf.fdacfdw" id="fdacfdw" /></td>
            </tr>
	        <tr>
	          <td class="td_zxy01">简历：</td>
			  <td class="td_zxy02" colspan="3">
			  <div align="right">
				<table width="100%" height="100%" border="0" align="right" cellpadding="5" cellspacing="0" class="table01" id="fileTable8">
					<tr>
					    <td colspan="2" align="right">
						 <input type="file" name="file" id="file8" style="display: none;" onChange="addRow(this,'fileTable8')"/>
						 <input type="button" class="buttonface" value="选择文件..." onClick="file8.click();"   />					 </td>
					</tr>
			      </table>	  	
				</div>
				</td>
	        </tr>
	        <tr>
              <td class="td_zxy01">执业资格情况： </td>
			  <td class="td_zxy02" colspan="3">
			  <table width="100%" height="18"   border="0" cellpadding="0" cellspacing="0"   >
                             <tr>
                               <td ><a href="#"  onclick="AddTable()">&nbsp;+ &nbsp;</a>执业资格明细 </td>
                             </tr>
                           </table>
                             <table id="TableBox1"  width="100%"  border="0" cellspacing="0" cellpadding="0"  >
                               <tr>
                                 <td ><a href="#" onclick='DeleteTr()'>&nbsp;x&nbsp;</a>证书名称:
                                   <input name="Input"  style='width:90' />
                                   发证时间:
                                   <input name="Input"  style='width:90' />
                                   发证机关:
                                   <input name="Input"  style='width:90' />
                                   证书编号:
                                   <input name="Input"  style='width:90' />
                                 </td>
                               </tr>
                			</table>
             	 </td>
            </tr>
			<tr>
	             <td class="td_zxy02" colspan="4" align="right">
	             <div align="right">
				     <input name="dsgsdf" type="button" value="确定" onClick="save(); return false;"/>
	                 <input name="reset" type="reset" value="重置" />
	             </div>    
				 </td>
            </tr>
    </table>
			<input type="button" value="提交" onclick="parentPage()"/>
			<s:reset label="重置"></s:reset>
		</s:form>

	</body>
</html>
<SCRIPT LANGUAGE="JavaScript">

 	if('<%=request.getAttribute("msg")%>' !="null"){
		alert('<%=request.getAttribute("msg")%>');
		window.close();
 	}
 
</SCRIPT>
