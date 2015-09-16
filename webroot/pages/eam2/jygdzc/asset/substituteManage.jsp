<%@page language="java" import="java.util.*"
	contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@page language="java" import="com.tansun.eam2.common.model.orm.bo.JyzcSqsdfyXx"%>
<% String isRCModify1 = (String)(request.getAttribute("isRCModify")==null?"":request.getAttribute("isRCModify")); 
boolean isRCModify = "true".equals(isRCModify1)?true:false; //是否是日常管理的修改功能
String isAdd = "true".equals(request.getParameter("isAdd"))?"true":"false";
if("true".equals((String)request.getAttribute("isAdd"))){
	isAdd = "true";
}
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>更新改造</title>
		<SCRIPT language=JavaScript type=text/JavaScript>
    function chooseZC(){
        var sheettype=document.getElementById("sheettype").value;
        window.open('<%=request.getContextPath()%>/jygdzc/AssetQuery_init.do?sheettype='+sheettype);
    }
    function addValue(gr){
   	 	var isAdd = "<%=isAdd%>";
   	 	var isRCModify = "<%=isRCModify1%>";
    	$("#myForm").attr("action","<%=basePath%>jygdzc/AssetManageBody_prepareValue.do?gr="+gr+"&isAdd="+isAdd+"&isRCModify="+isRCModify);
    	$("#myForm").submit();
	}
	function addFY(){
		var isChooseAsset = document.getElementById("isChooseAsset").value;
		var isRCModify    = '<%=isRCModify1%>'; //是修改的功能
		var isAdd = "<%=isAdd%>";
		if(isChooseAsset =='true'){
			myForm.action="<%=request.getContextPath()%>/jygdzc/AssetManageBody_addFy.do?isRCModify="+isRCModify+"&isAdd="+isAdd;
	    	myForm.submit();
		}else{
			alert("请选择资产");
		}
	}
	
</SCRIPT>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<s:form id="myForm">
			<s:hidden name="headId" value="%{#request.headId}" />
			<s:hidden name="sheettype" value="%{#request.sheettype}" />
			<s:hidden name="jyzcXx.id"/>
			<s:hidden name="jyzcXxLsb.id"/>
			<s:hidden name="isChooseAsset" value="%{#request.isChooseAsset}"/>
			<table width="100%" border="0" cellpadding="2" cellspacing="0"
				align="center">
				<s:set name="biaodanid" value="headId" />
				<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
				<tr>
					<td colspan="4" class="td_form02">
						<input type="button" onclick="chooseZC();" value="选择资产" />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						资产编号：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxLsb.zcbh" id="zcbh"></s:textfield>
					</td>
					<td class="td_form01">
						资产名称：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxLsb.zcmc" id="zcmc"></s:textfield>
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						经营分类：
					</td>
					<td class="td_form02">
						<e:select parRefKey="ASSET_MANAGE_TYPE" list="#{}" name="jyzcXx.CJyfl" id="jyzcXxLsb.zcfl" />
					</td>
					<td class="td_form01">
						资产状态：
					</td>
					<td class="td_form02">
						<e:select parRefKey="ASSET_STATUS" list="#{}" name="jyzcXx.CZczc" id="jyzcXxLsb.zczt"/>
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						地区：
					</td>
					<td class="td_form02">
						<e:select parRefKey="ENTITY_TRADE" headerKey="" headerValue="" parentId="438" list="#{}" name="jyzcXxLsb.ejdq"/>
					</td>
					<td class="td_form01">
						用途：
					</td>
					<td class="td_form02">
						<s:select list="#{'0':'办公营业','1':'宿舍','2':'其他'}" name="jyzcXxLsb.CYt" id="CYt" />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						管理部门：
					</td>
					<td class="td_form02">
						<s:textfield name="cardVO.glbm" size="30" readonly="true"/>
					      
					</td>
					<td class="td_form01">
						使用部门：
					</td>
					<td class="td_form02">
						<s:textfield name="cardVO.usepartment" size="25" readonly="true"/>
					</td>
				</tr>

				<tr>
					<td class="td_form01">
						经办行：
					</td>
					<td class="td_form02" valign="middle">
						<e:select parRefKey="ENTITY_TRADE" headerKey="" headerValue="" parentId="438" list="#{}" name="jyzcXxLsb.CJbhbh"/>	
					</td>
					<td class="td_form01">
						费用种类：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxLsb.CFyzl" id="Csybm" cssClass="input" />
					</td>
				</tr>
				<tr>

					<td class="td_form01">
						金额：
					</td>
					<td class="td_form02" colspan="3">
						<table width="100%" class="td_form02">
							<tr>
								<td>
									<table width="100%" border="0" cellspacing="0" cellpadding="0">
										<tr>
											<td>
												<a href="#"
													onclick="return creatElementByAddDetail('table','','','')">&nbsp;+
													&nbsp;</a>增加金额明细
											</td>
										</tr>
									</table>
									<table id="TableBox1" width="100%" border="0" cellspacing="0"
										cellpadding="0">
										<tbody id="table">
											<%if(isRCModify){ 
												List list = (List)request.getAttribute("sqsdfyxxs");
												if(list!=null&&list.size()>0){
													for(int i=0;i<list.size();i++){
														JyzcSqsdfyXx data = (JyzcSqsdfyXx)list.get(i);
											%>
													<tr id="exist<%=i %>">
														<td>
															<span onclick="removeCell('exist<%=i %>')">x</span>
															项目名称<input id="data1" name="data1" type="text" value="<%=data.getXmmc() %>"/>
															申请金额<input id="data2" name="data2" type="text" value="<%=data.getSqje() %>"/>元
															审定金额<input id="data3" name="data3" type="text" value="<%=data.getSdje() %>"/>元
														</td>
													</tr>
											<%}}}%>
										</tbody>
									</table>
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						办理说明：
					</td>
					<td class="td_form02" colspan="5">
						<s:textarea name="jyzcXxLsb.blsm" cssClass="area" />
					</td>
				</tr>

				<tr>
					<td colspan="4" align="right">
						<input type="button" value="确定" onclick="addFY();" />
						&nbsp;&nbsp;
						<input type="button" value="关闭"
							onclick="javascript:window.close()" />
					</td>
				</tr>
			</table>
		</s:form>
	</body>
</html>
<SCRIPT language=JavaScript type=text/JavaScript>
	function removeCell(row_startDate){
	    if(row_startDate!=null){
	    	var tr_Item = document.getElementById(row_startDate);
	    	var tbody   = document.getElementById("table");
	    	tbody.removeChild(tr_Item);
	    	return false;
	    }
	}
	var flag = 0;
	function creatElementByAddDetail(name,parm1,parm2，parm3){
    	flag +=1;
		var row_startDate = "row_startDate_"+flag;
		var col_startDate = "col_startDate_"+flag;
		var row  = document.createElement("tr");  
		row.setAttribute("id",row_startDate);
		var cell = document.createElement("td");  
		cell.setAttribute("height","22");
	 
		var font = document.createElement("font");
		font.appendChild(document.createTextNode('项目名称'));

		var span  = document.createElement("span");
		span.onclick = function(){
	    if(row_startDate!=null){
	    	var tr_Item = document.getElementById(row_startDate);
	    	var tbody   = document.getElementById(name);
	    	tbody.removeChild(tr_Item);
	    	return false;
	    }
	}
	var font2 = document.createElement("font");
	font2.setAttribute("color","red");
	font2.appendChild(document.createTextNode('\u00d7'));
	span.appendChild(font2);
	cell.appendChild(span);
	cell.appendChild(font);
	var input =document.createElement("input");
	input.className = "input_bg";
	input.setAttribute("id","data1");
	input.setAttribute("name","data1");
	input.setAttribute("type","text");
	cell.appendChild(input);
	row.appendChild(cell);
	//申请金额
	var cell2 = document.createElement("td");  
	cell2.setAttribute("height","22");
	var font2 = document.createElement("font");
	font2.appendChild(document.createTextNode('申请金额'));
	cell2.appendChild(font2);
	var input2 =document.createElement("input");
	input2.className = "input_bg";
	input2.setAttribute("id","data2");
	input2.setAttribute("name","data2");
	input2.setAttribute("type","text");
	var font3 = document.createElement("font");
	font3.appendChild(document.createTextNode('元'));
	cell2.appendChild(input2);
	cell2.appendChild(font3);
	row.appendChild(cell2);
	//审定金额
	var cell3 = document.createElement("td");  
	cell3.setAttribute("height","22");
	var font3 = document.createElement("font");
	font3.appendChild(document.createTextNode('审定金额'));
	cell3.appendChild(font3);
	var input3 =document.createElement("input");
	input3.className = "input_bg";
	input3.setAttribute("id","data3");
	input3.setAttribute("name","data3");
	input3.setAttribute("type","text");
	var font4 = document.createElement("font");
	font4.appendChild(document.createTextNode('元'));
	cell3.appendChild(input3);
	cell3.appendChild(font4);
	row.appendChild(cell3);

	document.getElementById(name).appendChild(row);
	return false;
}
</SCRIPT>
<SCRIPT LANGUAGE="JavaScript">
	if('<%=request.getAttribute("message")%>' != "null") {
		alert("<%=request.getAttribute("message")%>！"); 
		window.opener.reloadJqGrid1();
		window.opener.reloadJqGrid2();
		window.close();
	}
</SCRIPT>

