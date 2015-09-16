<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<html>
	<head>
		<base href="<%=basePath %>">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>新增资产</title>
		<script type="text/javascript">
		var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";
			//往rowsTable中加行
			var row = '<tr>' + 
						'<td>' + 
							'<a href="javascript:void(0);" onclick="delRow(this);return false;">x</a>' + 
							'项目名称<input class="FormElement" name="xmMc" type="text" width="25%" value=""/>' + 
							'申请金额<input class="FormElement" name="sqJe" type="text" width="25%" value=""/>元' + 
							'审定金额<input class="FormElement" name="sdJe" type="text" width="25%" value=""/>元' +
						'</td>' +
					'</tr>'
			
			function addRow(){
				$("#rowsTable").append(row);
			}
			function delRow(obj){
				$(obj).parent("td").parent("tr").remove();
			}
			function openTreeByType(type4jygdzc){//打开树，根据类型打开类型
				var url = "<%=request.getContextPath()%>/jygdzc/AssetQuery_toTree.do?type4Jygdzc="+type4jygdzc;
				var _g_privateDialogFeatures = 'height=400, width=200,toolbar=no,scrollbars=yes,location=no,directories=no,menubar=no,resizable=no,left=400,top=200';
				window.open(url,'',_g_privateDialogFeatures);
			}
			function getCallBack4Tree(type4jygdzc,id,value){//弹出树页面的回调方法 departmenthiddenid,departmentvalue
				$("#acFyzl").val(id);
				$("#afymc").val(value);
			}
			
			function changeJBH(){
				$.post("<%=basePath %>cjtz/CzZcXxAction_returnEjfhJsonString.do",{
					"czZcXx.acJbhbh" : '' + $("#acJbhbh").val()
				},function(returnStr){
					$("#acEjfhbh").html("");
					var returnObj = eval('(' + returnStr + ')');
					$(returnObj).each(function(i,obj){
						$("#acEjfhbh").append('<option value="' + obj.CODE + '">' + obj.NAME + '</option>');
					});
				});
			}
			
			function showAssetWindow(){
				window.open("<%=basePath %>jygdzc/AssetQuery_init.do?returnValue=true&mulSelect=false&sheettype=query&option=cjtz",'',winOpenStr);
			}
			
			function addValue(gr){
		    	$("#myForm").attr("action","<%=basePath%>cjtz/CzZcXxAction_getCzZcXxJson.do?headId=${headId}&zcIds="+gr);
		    	$("#myForm").submit();
		    	return false;
			}
			$(function(){
				document.getElementById('acJbhbh').value = "${czZcXx.acJbhbh}";
				$.post("<%=basePath %>cjtz/CzZcXxAction_returnEjfhJsonString.do",{
					"czZcXx.acJbhbh" : '' + $("#acJbhbh").val()
				},function(returnStr){
					if(returnStr!=""){
						$("#acEjfhbh").html("");
						var returnObj = eval('(' + returnStr + ')');
						$(returnObj).each(function(i,obj){
							$("#acEjfhbh").append('<option value="' + obj.CODE + '">' + obj.NAME + '</option>');
							document.getElementById('acEjfhbh').value = "${czZcXx.acEjfhbh}";
						});
					}
				});
			});
			function choose(){
				var aa= document.getElementById("azcbh").value;
				if(aa==null||aa==""){
					alert("请选择资产");
				}
			}
		</script>
	</head>
	<body  leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		 <table id="TableBox1" style="display:none" width="100%" border="0" cellspacing="0" cellpadding="0" align="center" class="newtable">
			<tr>
			<td nowrap="nowrap">
				<a href="#" onclick="myDeleteRow(this);return false;">&nbsp;x&nbsp;</a>
				项目名称:
				<input type="text" name="xmmc"/> 
				申请金额(元):
				<input type="text" name="sqje"/> 
				审定金额(元)：
				<input type="text" name="sdje"/>
			</td>
			</tr>
		</table>
		<s:form id="myForm">
			<s:hidden id="id" name="czZcXx.id" />
			<s:hidden id="azcid" name="czZcXx.azcid" />
			<s:hidden  name="czZcXx.cldId" />
			<table class="newtable" width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
				<tr>
					<td colspan="4" class="td_zxy02">
						<input type="button" onclick="showAssetWindow();" value="选择资产" />
					</td>
				</tr>
			</table>
			<table class="newtable"  onclick="choose()" width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
				<tr>
					<td class="td_zxy01">资产编号：</td>
					<td class="td_zxy02">
						<s:textfield name="czZcXx.azcbh" id="azcbh" cssClass="input"/>
					</td>
					<td class="td_zxy01">资产名称：</td>
					<td class="td_zxy02">
						<s:textfield name="czZcXx.azcmc" id="azcmc" cssClass="input"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">经营分类：</td>
					<td class="td_zxy02">
						<e:select parRefKey="ASSET_MANAGE_TYPE" list="#{}" name="czZcXx.acJyfl" id="acJyfl" />
					</td>
					<td class="td_zxy01">资产状态：</td>
					<td class="td_zxy02">
						<e:select parRefKey="ASSET_STATUS" list="#{}" name="czZcXx.acZczc" id="acZczc"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">地区：</td>
					<td class="td_zxy02">
						<e:select parRefKey="ENTITY_TRADE" parentId="438" list="#{}" id="acZcdq" name="czZcXx.acZcdq"/>
					</td>
					<td class="td_zxy01">用途：</td>
					<td class="td_zxy02">
						<s:select list="#{'0':'办公营业','1':'宿舍','2':'其他'}" name="czZcXx.acYt" id="acYt" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">管理部门：</td>
					<td class="td_zxy02">
						<s:hidden name="czZcXx.zcglbm" id="zcglbm"/>
						<s:textfield id="zcglbmmc" name="czZcXx.zcglbmmc" cssClass="input" />
					</td>
					<td class="td_zxy01">使用部门：</td>
					<td class="td_zxy02">
						<s:hidden id="zcsybm" name="czZcXx.zcsybm" />
						<s:textfield name="czZcXx.zcsybmmc" id="zcsybmmc" cssClass="input"/>
					</td>
				</tr>				
				<tr>
					<td class="td_zxy01">费用种类：</td>
					<td class="td_zxy02">
						<s:hidden name="czZcXx.acFyzl" id="acFyzl" />
						<s:textfield name="czZcXx.afymc" id="afymc" />
          				<img src="resource/ProjectImages/search.gif" onclick="openTreeByType('feiyong');">
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">经办行：</td>
					<td class="td_zxy02" valign="middle" colspan="3">
						<s:select name='czZcXx.acJbhbh' id='acJbhbh' onchange="changeJBH()" list ="%{#request.jbhMap}" value="" />
						<s:select name="czZcXx.acEjfhbh" id='acEjfhbh' list="#{}" />
					</td>					
				</tr>				
				<tr>
					<td class="td_zxy01">金额：</td>
					<td class="td_zxy02" colspan="3">
									<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" class="newtable">
										<tr>
											<td>
												<a href="#" onclick="AddTable_base();return false;">&nbsp;+ &nbsp;</a>增加金额明细 
											</td>
										</tr>
									</table>
									<table id="TableBox" width="100%" border="0" cellspacing="0" cellpadding="0" align="center" class="newtable">
										<s:iterator var="sqsd"  value="%{#request.sqsdfyxxs}" >
											<tr>
											<td nowrap="nowrap">
												<a href="#" onclick="myDeleteRow(this);return false;">&nbsp;x&nbsp;</a>
												项目名称:
												<s:textfield type="text" name="xmmc" value="%{#sqsd.xmmc}"/> 
												申请金额(元):
												<s:textfield type="text" name="sqje" value="%{#sqsd.sqje}"/> 
												审定金额(元)：
												<s:textfield type="text" name="sdje" value="%{#sqsd.sdje}"/>
											</td>
											</tr>
										</s:iterator>
									</table>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						办理说明：
					</td>
					<td class="td_zxy02" colspan="4">
						<s:textarea name="czZcXx.ablsm" cssClass="input" rows="4"/>
					</td>
				</tr>
</table>
<table class="newtable"  width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
				<tr>
					<td colspan="4" align="right" class="td_zxy01">
						<input type="button" value="确定" onclick="addAsset();" />
						&nbsp;&nbsp;
						<input type="button" value="关闭" onclick="javascript:window.close();" />
					</td>
				</tr>
			</table>
		</s:form>
	</body>
</html>
<SCRIPT LANGUAGE="JavaScript">
	function addAsset(){
		var azcid = document.getElementById('azcid').value;
		if(azcid !=''){
			myForm.action="<%=request.getContextPath()%>/cjtz/CzZcXxAction_addFy.do?headId=${headId}";
	    	myForm.submit();
		}else{
			alert("请选择资产");
		}
	}

	var xxx;
	$(function(){
		xxx =  $("#TableBox1").html();
	});
	function myDeleteRow(hrefObj){
		var rowObj = hrefObj.parentElement.parentElement;
		$(rowObj).remove();
	}
	function AddTable_base(){
		$("#TableBox").append(xxx);
	}
	if('${message}' != "") {
		alert('${message}'); 
		window.opener.reloadGrid();
		window.close();
	}
</SCRIPT>
