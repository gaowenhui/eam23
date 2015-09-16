<%@ page language="java" import="com.tansun.eam2.jygdzc.vo.*" %>
<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
AssetInfoVO  assetInfoVO = (AssetInfoVO)request.getAttribute("assetInfoVO");
String zcId = (String)request.getAttribute("zcId");
zcId = zcId==null?"":zcId;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01head Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gbk">
<title>Insert title here</title>
<base href="<%=basePath%>" />
<script type="text/javascript">
	$(function(){
		window.parent.initVar($("#zcId").val(), $("#CZclx").val());
		document.getElementById("zcId").value = '<%=zcId%>';
		$("select,input").attr("disabled","disabled");
		<%
			if(assetInfoVO!=null&&assetInfoVO.getYbyz()!=null&&!"".equals(assetInfoVO.getYbyz())){
		%>	
				$("#ybyz").val(${assetInfoVO.ybyz}.toFixed(2));
		<%	
			}
		%>	
		<%
			if(assetInfoVO!=null&&assetInfoVO.getJzzb()!=null&&!"".equals(assetInfoVO.getJzzb())){
		%>	
				$("#jzzb").val(${assetInfoVO.jzzb}.toFixed(2));
		<%	
			}
		%>	
		<%
			if(assetInfoVO!=null&&assetInfoVO.getYzje()!=null&&!"".equals(assetInfoVO.getYzje())){
		%>	
				$("#yzje").val(${assetInfoVO.yzje}.toFixed(2));
		<%	
			}
		%>		
		<%
			if(assetInfoVO!=null&&assetInfoVO.getLjzj()!=null&&!"".equals(assetInfoVO.getLjzj())){
		%>	
				$("#ljzj").val(${assetInfoVO.ljzj}.toFixed(2));
		<%	
			}
		%>	
		<%
			if(assetInfoVO!=null&&assetInfoVO.getJvalue()!=null&&!"".equals(assetInfoVO.getJvalue())){
		%>	
				$("#jvalue").val(${assetInfoVO.jvalue}.toFixed(2));
		<%	
			}
		%>	
		<%
			if(assetInfoVO!=null&&assetInfoVO.getJevalue()!=null&&!"".equals(assetInfoVO.getJevalue())){
		%>	
				$("#jevalue").val(${assetInfoVO.jevalue}.toFixed(2));
		<%	
			}
		%>	
		<%
			if(assetInfoVO!=null&&assetInfoVO.getJcz()!=null&&!"".equals(assetInfoVO.getJcz())){
		%>	
				$("#jcz").val(${assetInfoVO.jcz}.toFixed(2));
		<%	
			}
		%>	
	});
	
	function closebody(){
		window.parent.close();
	}

</script>
</head>
<body>
<s:form  method="post" id ="main">
<s:hidden name="zcId" id ="zcId"  value="%{#request.zcId}"/>
<s:hidden name="headId"  value="%{#request.headId}"/>
<s:hidden name="jyzcXxMain.cldId" value="%{#request.headId }"/>
<s:hidden name="jyzcXxMain.id"  value="%{#request.zcId}"/>
<s:hidden name="sheettype" value="%{#request.sheettype}"/>
<div id="ruler" width="100%"></div>
  <table width="100%" border="0" class="newtable" cellpadding="2" cellspacing="0" align="center">
				<div class="panel-header" style="width: 100%;">
						<div class="panel-title">
						资产信息
						</div>
						<div id="addasset" class="panel-tool"></div>
				</div>
				<tr>
					  <td class="td_zxy01" >资产类型：</td>
					  <td class="td_zxy02">
						<e:select parRefKey="ASSET_TYPE"  onchange="changeType();"  list="#{}" readonly="true" name="jyzcXxMain.CZclx" id="CZclx"  value="%{#request.jyzcXxMain.CZclx}"/>
					 </td>
					  <td class="td_zxy01">地区：</td>
					  <td class="td_zxy02" >
						 <e:select parRefKey="PROVIENCE" headerKey="" headerValue=""  id="CZcdq"  list="#{}" name="jyzcXxMain.CZcdq" value="%{#request.jyzcXxMain.CZcdq}"/>
					  </td>
				</tr>
				<tr>
					  <td class="td_zxy01">资产种类：</td>
					  <td   class="td_zxy02"><s:textfield name="jyzcXxMain.CZczlbm" cssClass="input"  readonly="true" id="CZczlbm"  readonly="true" value="%{#request.jyzcXxMain.CZczlbm}"/>
					 </td>
					  <td  width="120" class="td_zxy01">&nbsp;</td>
					  <td  class="td_zxy02">&nbsp;</td>
				</tr>
				<tr>
					  <td class="td_zxy01">资产编号：</td>
					  <td class="td_zxy02"><s:textfield name="jyzcXxMain.zcbh" id="zcbh" readonly="true" cssClass="input" readonly="true"  value="%{#request.jyzcXxMain.zcbh}"/>
					  </td>
					  <td class="td_zxy01">资产名称：</td>
				 	 <td class="td_zxy02"><s:textfield name="jyzcXxMain.zcmc" id="zcmc" cssClass="input"  readonly="true" value="%{#request.jyzcXxMain.zcmc}"/></td>
				</tr>
				<tr>
				  <td class="td_zxy01">经营分类：</td> 
				  <td class="td_zxy02"><e:select parRefKey="ASSET_MANAGE_TYPE" list="#{}" headerKey="" headerValue=""   readonly="true" name="jyzcXxMain.CJyfl" id="CJyfl" value="%{#request.jyzcXxMain.CJyfl}" />
				  </td>
				  <td class="td_zxy01">用途：</td>
				  <td class="td_zxy02"><e:select parRefKey="ASSET_USE" list="#{}" headerKey=""  headerValue=""  readonly="true" name="jyzcXxMain.CYt" id="CYt" value="%{#request.jyzcXxMain.CYt}" />
				  </td>
				 </tr>
				<tr>
				  <td class="td_zxy01"> 资产详细地址：</td>
				  <td class="td_zxy02"  colspan="3"><s:textfield   readonly="true" name="jyzcXxMain.xxdz" id="xxdz" cssClass="input" value="%{#request.jyzcXxMain.xxdz}"/></td>
				</tr>
				<tr>
				  <td class="td_zxy01">经办单位：</td>
				  <td class="td_zxy02"><s:textfield   readonly="true" name="jyzcXxMain.jbdw" id="jbdw" cssClass="input" value="%{#request.jyzcXxMain.jbdw}"/></td>
				    <td width="153" class="td_zxy01">增加方式：</td>
					<td class="td_zxy02"><s:select list="{'','购置','建行股份转入','其他增加','自行购置','报批购置','建行承继','公司投资','其他','置换'}" readonly="true" name="jyzcXxMain.CZjfs" id="CZjfs" value="%{#request.jyzcXxMain.CZjfs}" />
				  </td>
			    </tr>
			    <tr>
				  <td class="td_zxy01">资产权属：</td>
				  <td class="td_zxy02" ><e:select parRefKey="ASSET_OWNERSHIP" list="#{}" headerKey=""  headerValue=""  name="jyzcXxMain.CZcqs" id="CZcqs"  value="%{#request.jyzcXxMain.CZcqs}"/></td>
				  <td class="td_zxy01">委托人：</td>
				  <td class="td_zxy02"><s:textfield name="jyzcXxMain.wtrmc" id="wtrmc" cssClass="input" value="%{#request.jyzcXxMain.wtrmc}"/></td>
				</tr>
				<tr>
				  <td class="td_zxy01">权属情况：</td>
				  <td class="td_zxy02" ><s:textfield name="jyzcXxMain.qsqk" id="qsqk" cssClass="input" value="%{#request.jyzcXxMain.qsqk}"/></td>
				  <td class="td_zxy01">周围环境：</td>
				  <td class="td_zxy02"><s:textfield name="jyzcXxMain.zwhj" id="zwhj" cssClass="input" value="%{#request.jyzcXxMain.zwhj}"/></td>
				</tr>
				<tr>
				  <td class="td_zxy01"> 资产状态：</td>
				  <td class="td_zxy02"> <e:select parRefKey="ASSET_STATUS" headerKey=""  headerValue=""   list="#{}"  readonly="true"  name="jyzcXxMain.CZczc" id="CZczc" value="%{#request.jyzcXxMain.CZczc}" />
				  </td>
				  <td class="td_zxy01">开始使用日期：</td>
				  <td class="td_zxy02">
					<s:date name="%{#request.jyzcXxMain.kssyrq}" format="yyyy-MM-dd"
							var="draftDate1" />
				   	<s:textfield name="jyzcXxMain.kssyrq" id="kssyrq" cssClass="input" readonly="true" value="%{#draftDate1}"/>
				  </td>
				</tr>
				<tr>
				  <td width="153" class="td_zxy01">一级分行：</td>
				  <td class="td_zxy02"><e:select  parRefKey="department" headerKey="" headerValue="" parentId="438" list="#{}" name="jyzcXxMain.ejdq" value="%{#request.jyzcXxMain.ejdq}"/></td>
				  <td class="td_zxy01">一级委托管理机构：</td>
				  <td class="td_zxy02"><s:textfield  name="jyzcXxMain.yjwtgljgvalue" cssClass="input" readonly="true"  value="%{#request.jyzcXxMain.yjwtgljgvalue}" />
                  </td>
				</tr>
				<tr>
					 <td class="td_zxy01">二级委托管理机构：</td>
				  <td class="td_zxy02">
					<s:textfield name="jyzcXxMain.ejwtgljgvalue" id="ejwtgljgvalue" cssClass="input"  value="%{#request.jyzcXxMain.ejwtgljgvalue}"  readonly="true"/>
                 </td>
				  <td class="td_zxy01">所属卡片数量：</td>
				  <td class="td_zxy02">
				  <s:textfield  name="assetInfoVO.gjkpsl"id="gjkpsl" cssClass="input" readonly="true" value="%{#request.assetInfoVO.gjkpsl}"/>
				  </td>
				</tr>
				<tr>
				  <td class="td_zxy01">录入日期：</td>
				  <td class="td_zxy02">
				 <s:date name="%{#request.jyzcXxMain.lrrq}" format="yyyy-MM-dd" var="draftDate"/>
		         <s:textfield id="lrrq" name="jyzcXxMain.lrrq"  cssClass="input" value="%{#draftDate}" readonly="true" />
				  </td>						
				  <td class="td_zxy01">录入人：</td>
				  <td class="td_zxy02"><s:textfield name="jyzcXxMain.lrr" id="lrr" cssClass="input" readonly="true" value="%{#request.jyzcXxMain.lrr}"/></td>
				</tr>
				<tr>
				  <td class="td_zxy02" colspan="4">
				  	<div class="panel-header" style="width: 100%;">
						<div class="panel-title">
						主卡片信息
						</div>
						<div id="addasset" class="panel-tool"></div>
				 	</div>
				  </td>
				</tr>
				<tr>
				  <td class="td_zxy01">管理部门：</td>
				  <td class="td_zxy02">
				  <s:textfield name="assetInfoVO.glbm" id="glbm"  cssClass="input"  value="%{#request.assetInfoVO.glbm}"  readonly="true"/>
                 
                 </td>
				  <td class="td_zxy01">使用部门：</td>
				 <td class="td_zxy02"> 
				 <s:textfield name="assetInfoVO.sybm" id="sybm"  cssClass="input"  value="%{#request.assetInfoVO.sybm}"  readonly="true"/>
                 </td>
				</tr>
				<tr>
				  <td class="td_zxy01">存放地点：</td>
				  <td class="td_zxy02"><s:textfield name="assetInfoVO.saveadsress" id="saveadsress"  value="%{#request.assetInfoVO.saveadsress}" cssClass="input" /></td>
				  <td class="td_zxy01">&nbsp;</td>
				  <td class="td_zxy02">&nbsp;</td>
				 
				</tr>
				<tr>
				  <td class="td_zxy02" colspan="4">
				  	 <div class="panel-header" style="width: 100%;">
						<div class="panel-title">
						卡片价值信息
						</div>
						<div id="addasset" class="panel-tool"></div>
				  	 </div>
				  </td>
				 
				</tr>
				<tr>
				  <td width="153" class="td_zxy01">原币原值(元)：</td>
				  <td class="td_zxy02"><s:textfield name="assetInfoVO.ybyz" id="ybyz"  value="%{#request.assetInfoVO.ybyz}"  cssClass="input"  readonly="true"/></td>
				  <td class="td_zxy01">减值准备(元)：</td>
				  <td class="td_zxy02"><s:textfield name="assetInfoVO.jzzb" id="jzzb"  value="%{#request.assetInfoVO.jzzb}"  cssClass="input"  readonly="true"/></td>
				</tr>
				<tr>
				  
				   <td width="163" class="td_zxy01">月折旧额(元)：</td>
				  <td class="td_zxy02"><s:textfield name="assetInfoVO.yzje" id="yzje" value="%{#request.assetInfoVO.yzje}" cssClass="input" readonly="true"/></td>
				  <td class="td_zxy01">累计折旧(元)：</td>
				  <td class="td_zxy02"><s:textfield name="assetInfoVO.ljzj" id="ljzj"  value="%{#request.assetInfoVO.ljzj}" cssClass="input" readonly="true"/></td>
				</tr>
				<tr>
				  <td width="163" class="td_zxy01">净值(元)：</td>
				  <td class="td_zxy02"><s:textfield   name="assetInfoVO.jvalue" id="jvalue" cssClass="input"  value="%{#request.assetInfoVO.jvalue}" readonly="true"/></td>
				  <td class="td_zxy01">净残值(元)：</td>
				  <td class="td_form02"><s:textfield   name="assetInfoVO.jcz" id="jcz" cssClass="input"   value="%{#request.assetInfoVO.jcz}" readonly="true"/></td>
				</tr>
				<tr>
				  <td class="td_zxy01">净额(元)：</td>
				  <td class="td_zxy02" ><s:textfield   name="assetInfoVO.jevalue" id="jevalue"  value="%{#request.assetInfoVO.jevalue}" cssClass="input" readonly="true"/></td>
				  <td class="td_zxy01">&nbsp;</td>
				  <td class="td_zxy02">&nbsp;</td>
				</tr>
			</table>
			<table  align="right">
				<tr>
					<td  colspan="6" >
						<s:submit value="关闭" type="button" onclick="closebody();return false;"/>
					</td>
				</tr>
			</table>
</s:form>
</body>
</html>
		