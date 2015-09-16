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
String stockId = (String)request.getAttribute("stockId");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>实体人员信息</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<script type="text/javascript">
			
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
	
 	function addYearValue(yearsort){
 		var windowYear = 'height=200, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no';
 		if(yearsort == '1'){
 			window.open('maintain_popPage.do?yearData='+1+'&stockId='+'<%=stockId%>','',windowYear);
 		}else{
 			window.open('maintain_popPage.do?yearData='+2+'&stockId='+'<%=stockId%>','',windowYear);
 		}
 	}	
 	
 	function setValue(nf){
 		$.post("<%=basePath%>stock/maintain_returnJsonString.do",{
 		 'stockId':''+'<%=stockId%>',
 		 'nf':''+ nf
 		},function(returnStr){
 			var returnObj = eval('('+ returnStr + ')');
 			$("#zqmz").val(returnObj.zqmz);
 			$("#zqmz2").val(returnObj.zqmz2);
 			$("#tzjczb").val(returnObj.tzjczb);
 			$("#tzjczb2").val(returnObj.tzjczb2);
 			$("#zqtzje").val(returnObj.zqtzje);
 			$("#zqtzje2").val(returnObj.zqtzje2);
 			$("#yslx").val(returnObj.yslx);
 			$("#yslx2").val(returnObj.yslx2);
 			$("#yslxhzzb").val(returnObj.yslxhzzb);
 			$("#yslxhzzb2").val(returnObj.yslxhzzb2);
 			$("#yslxje").val(returnObj.yslxje);
 			$("#yslxje2").val(returnObj.yslxje2);
 			$("#tzsync").val(returnObj.tzsync);
 			$("#tzsynm").val(returnObj.tzsynm);
 		});
 	}
 	
 	function refersh(){
 		$("#myform").attr("action","<%=basePath%>stock/maintain_detailInfo.do");
 		$("#myform").submit();
 	}
</script>
</head>
<base target="_self"/>
<body >
<s:form action="stock/maintain_saveStFsxx.do" method="post" id="weihu_saveStFsxxform">
<s:hidden name="sinfo.id" id="id" ></s:hidden>

<table id="filter_information" class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
             <tr>
              <td class="td_zxy01">行名： </td>
              <td class="td_zxy02"><s:textfield name="sinfo.jhfhmc" id="jhfhmc" readonly="true" style="width: 60%;"/></td>
              <td class="td_zxy01">债券面值核算科目：</td>
              <td class="td_zxy02"><s:textfield name="sinfo.zqmzhskm" id="zqmzhskm" readonly="true" style="width: 60%;"/></td>
            </tr>
            <tr>
              <td class="td_zxy01">债券名称：</td>
              <td class="td_zxy02"><s:textfield name="sinfo.zqmc" id="zqmc" readonly="true" style="width: 60%;"/></td>
              <td class="td_zxy01">金额(元)：</td>
              <td class="td_zxy02"><s:textfield name="sinfo.je1" id="je1" readonly="true" style="width: 60%;"/></td>
            </tr>
            <tr>
              <td class="td_zxy01">债券种类：</td>
              <td class="td_zxy02"><s:textfield name="sinfo.zqzlmc" id="zqzlmc" readonly="true" style="width: 60%;"/></td>
              <td class="td_zxy01">应收利息核算科目：</td>
              <td class="td_zxy02"><s:textfield name="sinfo.yslxhskm" id="yslxhskm" readonly="true" style="width: 60%;"/></td>
            </tr>
            <tr>
              <td class="td_zxy01">到期日：</td>
              <td class="td_zxy02"><s:textfield name="sinfo.dqr" id="dqr" readonly="true" style="width: 60%;"/></td>
              <td class="td_zxy01">金额(元)：</td>
              <td class="td_zxy02"><s:textfield name="sinfo.je2" id="je2" readonly="true" style="width: 60%;"/></td>
            </tr>
			<tr>
              <td class="td_zxy01">备注：</td>
              <td colspan="3" class="td_zxy02"><s:textarea name="sinfo.bz" id="bz" rows="3" style="width: 85%;" readonly="true"></s:textarea></td>
            </tr>
 
   </table> 	
</s:form>
	</body>
</html>

