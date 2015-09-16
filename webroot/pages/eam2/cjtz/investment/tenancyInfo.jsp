<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<html>
	<head>
		<base href="<%=basePath%>">
		<title>经营租赁</title>
<SCRIPT language=JavaScript type=text/JavaScript>
	$(function(){
		var alldesable = "${alldesable}";
	 	var ywlx = "${ywlx}";
		if(alldesable){
			$("input,select,textarea").attr("readonly","readonly");
			document.getElementById("addasset").style.display="none";
			document.getElementById("addtenancy").style.display="none";
		}else{
			var buttonAssetJSonString = '[{"buttonHandler":"assetQuery","buttonIcon":"icon-add","buttonText":"增加资产"}\
											]';
			addButtons(jQuery("#addasset"),buttonAssetJSonString);
			if($("#id").val()!=null&&""!=$("#id").val()){
				window.opener.reloadGrid();
			}
		}
	});
	function choose(){
		var aa= document.getElementById("azcbh").value;
		if(aa==null||aa==""){
			alert("请选择资产");
		}
	}
	function assetQuery(){
  	 window.open('<%=basePath%>jygdzc/AssetQuery_init.do?sheettype=assetQuery&returnValue=true&mulSelect=false','','height=500, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
	}
	
	function addValue(gr){
		var delblyjurl ="<%=basePath%>zltb/IntentionManageBody_assetView.do";
		$.post(delblyjurl,
			{zcId:"" + gr + ""},
			function(returnStr){
			assetView(returnStr);
		});
	}
	function assetView(objString){
		reobj = eval('(' + objString + ')');
			document.getElementById("azcid").value = reobj.rows[0].id == null?"":reobj.rows[0].id;
			document.getElementById("azcbh").value = reobj.rows[0].zcbh == null?"":reobj.rows[0].zcbh;
			document.getElementById("azcmc").value = reobj.rows[0].zcmc == null?"":reobj.rows[0].zcmc;
			document.getElementById("acJyfl").value = reobj.rows[0].CJyfl == null?"":reobj.rows[0].CJyfl;
			document.getElementById("acZczc").value = reobj.rows[0].CZczc == null?"":reobj.rows[0].CZczc;
			document.getElementById("acZcdq").value = reobj.rows[0].CZcdq == null?"":reobj.rows[0].CZcdq;
			document.getElementById("acYt").value = reobj.rows[0].CYt == null?"":reobj.rows[0].CYt;
			document.getElementById("azcglbmmc").value = reobj.rows[0].glbm == null?"":reobj.rows[0].glbm;
			document.getElementById("azcsybmmc").value = reobj.rows[0].sybm == null?"":reobj.rows[0].sybm;
			document.getElementById("zjm").value = reobj.rows[0].jzmj == null?"":reobj.rows[0].jzmj;
			document.getElementById("zdmj").value = reobj.rows[0].tdmj == null?"":reobj.rows[0].tdmj;
			document.getElementById("yzmj").value = reobj.rows[0].yzmj == null?"":reobj.rows[0].yzmj;
			
	}
	function saveBody(){
		myform.action="<%=basePath%>cjtz/CzZcXxAction_saveBody.do";
		myform.submit();
	}
	function closeBody(){
			 window.close();
	}
	$(function(){
		$("#zlqsrq,#zldqrq").datebox({
			formatter:function(date){
			return formatDate(date);
			}
		});
	})
</SCRIPT>

	</head>

	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<s:form action="" id="myform" method="post">
			<s:hidden name="headId" />
			<s:hidden name="czZcXx.cldId"/>	
			<s:hidden name="czZcXx.azcid" id="azcid"/>
			<s:hidden name="czZcXx.id" id="id"/>
		<div class="panel-header" style="width: 100%;">
				<div class="panel-title">资产信息</div>
				<div id="addasset" class="panel-tool"></div>
		</div>		
			<table class="newtable" width="100%" id="table" border="0"
				cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td class="td_zxy01">资产编号：</td>
					<td class="td_zxy02">
						<s:textfield name="czZcXx.azcbh" id="azcbh" readonly="true" cssClass="input"  />
					</td>
					<td class="td_zxy01">资产名称：</td>
					<td class="td_zxy02">
						<s:textfield name="czZcXx.azcmc" readonly="true" id="azcmc" cssClass="input" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">经营分类：</td>
					<td class="td_zxy02">
						<s:textfield name="czZcXx.acJyfl" readonly="true" id="acJyfl" cssClass="input" />
					</td>
					<td class="td_zxy01">资产状态：</td>
					<td class="td_zxy02">
						<s:textfield name="czZcXx.acZczc" readonly="true" id="acZczc" cssClass="input" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">地区：</td>
					<td class="td_zxy02">
						<s:textfield name="czZcXx.acZcdq" readonly="true" id="acZcdq" cssClass="input"  />
					</td>
					<td class="td_zxy01">用途：</td>
					<td class="td_zxy02">
						<s:textfield name="czZcXx.acYt" id="acYt" readonly="true"	cssClass="input"  />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">管理部门：</td>
					<td class="td_zxy02">
						<s:hidden name="czZcXx.azcglbm" id="azcglbm" />
						<s:textfield name="czZcXx.azcglbmmc" id="azcglbmmc" readonly="true"	cssClass="input"/>
					</td>
					<td class="td_zxy01">使用部门：</td>
					<td class="td_zxy02">
						<s:hidden name="czZcXx.azcsybm" id="azcsybm"/>
						<s:textfield name="czZcXx.azcsybmmc" id="azcsybmmc" readonly="true"	cssClass="input"/>
					</td>
				</tr>
			</table>
			<div class="panel-header" style="width: 100%;">
				<div class="panel-title">租赁信息</div>
				<div id="addtenancy" class="panel-tool"></div>
			</div>	
			<table class="newtable" width="100%" onclick="choose()" border="0"
				cellspacing="0" cellpadding="0" align="center">
				<tr>
					<td class="td_zxy01">交易对象：</td>
					<td class="td_zxy02" colspan="3">
						<s:select list="{'','建行','非建行'}" name="czZcXx.jydx" id="jydx"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">经办行省份：</td>
					<td class="td_zxy02">
						<e:select parRefKey="PROVIENCE" headerKey="" headerValue="" list="#{}"name="czZcXx.acJbhbh" id="acJbhbh"/>	
					</td>
					<td class="td_zxy01"> 二级经办行：</td>
					<td class="td_zxy02">
						<e:select parRefKey="department" headerKey="" headerValue="" parentId="438" list="#{}" name="czZcXx.acEjfhbh" id="acEjfhbh"/>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">租赁起始日期：</td>
					<td class="td_zxy02">
						<s:date name="%{#request.czZcXx.zlqsrq}" format="yyyy-MM-dd" var="draftDate3" />
						<s:textfield name="czZcXx.zlqsrq" id="zlqsrq" readonly="true" cssClass="input" value="%{#draftDate3}" />
					</td>
					<td class="td_zxy01">租赁到期日期：</td>
					<td class="td_zxy02">
						<s:date name="%{#request.czZcXx.zldqrq}" format="yyyy-MM-dd" var="draftDate4" />
						<s:textfield name="czZcXx.zldqrq" id="zldqrq" readonly="true" cssClass="input" value="%{#draftDate4}" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">资产承租人： </td>
					<td class="td_zxy02">
						<s:textfield name="czZcXx.czr" id="czr" cssClass="input" />
					</td>
					<td class="td_zxy01">意向租金总金额（元）：</td>
					<td class="td_zxy02">
						<s:textfield name="czZcXx.yxzjzje" id="yxzjzje"	cssClass="input" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">占地面积：</td>
					<td class="td_zxy02" valign="middle"> 
						<s:textfield name="czZcXx.zdmj" id="zdmj" readonly="true" cssClass="input"/>
					</td>
					<td class="td_zxy01">总面积：</td>
					<td class="td_zxy02" valign="middle">
						<s:textfield name="czZcXx.zjm" id="zjm" readonly="true" cssClass="input"  />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">已租面积：</td>
					<td class="td_zxy02" valign="middle">
						<s:textfield name="czZcXx.yzmj" id="yzmj" cssClass="input" readonly="true"/>
					</td>
					<td class="td_zxy01">意向租赁面积：</td>
					<td class="td_zxy02">
						<s:textfield name="czZcXx.yxzlmj" id="yxzlmj"	cssClass="input" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">意向租期：</td>
					<td class="td_zxy02">
						<s:textfield name="czZcXx.yxzq" id="yxzq" cssClass="input" />
					</td>
					<td class="td_zxy01">出租用途：</td>
					<td class="td_zxy02">
						<s:textfield name="czZcXx.czyt" id="czyt" cssClass="input"/>
					</td>
				</tr>
			</table>
			<div id="rent">
				<table class="newtable" width="100%" onclick="choose()" border="0"
					cellspacing="0" cellpadding="0" align="center">
					<tr>
						<td class="td_zxy01">租赁说明：</td>
						<td class="td_zxy03" colspan="5">
							<s:textarea name="czZcXx.zlsm" id="zlsm"  style="width:94%;" rows="4" cssClass="input" />
						</td>
					</tr>
				</table>
			</div>
			
		<table class="newtable" width="100%"  border="0"
					cellspacing="2" cellpadding="0" align="center">
				<tr>
					<td align="right" colspan="4">
						<input type="button" onclick="saveBody();" value="保存" />
						<input type="button" onclick="closeBody()" value="关闭" />
					</td>
				</tr>
			</table>
		</s:form>
	</body>
</html>
<script type="text/javascript">
	if('${message}' != "") {
		alert('${message}'); 
		window.opener.reloadGrid();
		window.close();
	}
</script>

