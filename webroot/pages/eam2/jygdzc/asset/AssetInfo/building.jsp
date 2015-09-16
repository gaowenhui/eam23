<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>房屋建筑物</title>
		<base href="<%=basePath%>" />
	</head>
	<script type="text/javascript">
	$(function(){
		$("select,input").attr("disabled","disabled");
	});
	function closebody(){
		window.parent.close();
	}
</script>
	<body>
		<s:form method="post" id="building">
			<s:hidden name="zcId" value="%{#request.zcId}" />
			<s:hidden name="headId" value="%{#request.headId}" />
			<s:hidden name="sheettype" value="%{#request.sheettype}" />
			<table width="100%" border="0" class="newtable" cellpadding="2" cellspacing="0"
				align="center" >
				<tr>
					<td colspan="6" class="td_top" align="left">
						房屋基本状况
					</td>
				</tr>
				<tr>
					<td width="120" class="td_form01">
						建成日期：
					</td>
					<td class="td_form02">
						<s:date name="%{#request.jyzcXxBuilding.jcrq}" format="yyyy-MM-dd"
							var="draftDate" />
						<s:textfield name="jyzcXxBuilding.jcrq" id="jcrq" 
							value="%{#draftDate}" readonly="true" />
					</td>
					<td width="120" class="td_form01">
						房屋结构：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxBuilding.fwjg" id="fwjg" 
							value="%{#request.jyzcXxBuilding.fwjg}"   />
					</td>
					<td width="120" class="td_form01">
						檐高：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxBuilding.yangao" id="yangao"
							 value="%{#request.jyzcXxBuilding.yangao}"   />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						标准层高：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxBuilding.bzcg" id="bzcg" 
							value="%{#request.jyzcXxBuilding.bzcg}"   />
					</td>
					<td class="td_form01">
						总层数：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxBuilding.zcs" id="zcs" 
							value="%{#request.jyzcXxBuilding.zcs}"   />
					</td>
					<td class="td_form01">
						坐落在几层：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxBuilding.zlzdjc" id="zlzdjc"
							 value="%{#request.jyzcXxBuilding.zlzdjc}"   />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						房间号：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxBuilding.fjh" id="fjh" 
							value="%{#request.jyzcXxBuilding.fjh}"   />
					</td>
					<td class="td_form01">
						建筑面积：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxBuilding.jzmj" id="jzmj" 
							value="%{#request.jyzcXxBuilding.jzmj}"   />
					</td>
					<td class="td_form01">
						成本单价：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxBuilding.cbdj" id="cbdj" 
							value="%{#request.jyzcXxBuilding.cbdj}"   />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						房地分离房屋：
					</td>
					<td class="td_form02" valign="middle">
						<s:select list="#{'':'','0':'否','1':'是'}" name="jyzcXxBuilding.fdflfw"
							id="fdflfw" value="%{#request.jyzcXxBuilding.fdflfw}"   />
					</td>
					<td class="td_form01">
						有无土地：
					</td>
					<td class="td_form02" valign="middle">
						<s:select list="#{'':'','0':'有','1':'无'}" name="jyzcXxBuilding.CYwtd"
							id="CYwtd" value="%{#request.jyzcXxBuilding.CYwtd}"  />
					</td>
					<td class="td_form01">
						&nbsp;
					</td>
					<td class="td_form02">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						房产证所有权人：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxBuilding.fczsyqr" id="fczsyqr"
							 value="%{#request.jyzcXxBuilding.fczsyqr}"   />
					</td>
					<td class="td_form01">
						房产证号：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxBuilding.fczh" id="fczh" 
							value="%{#request.jyzcXxBuilding.fczh}"   />
					</td>
					<td class="td_form01">
						房产证替代文件：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxBuilding.fcztdwj" id="fcztdwj"
							 value="%{#request.jyzcXxBuilding.fcztdwj}"   />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						房产证无有效文件：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="jyzcXxBuilding.fczwyxwj"
							id="fczwyxwj" value="%{#request.jyzcXxBuilding.fczwyxwj}"  />
					</td>
					<td class="td_form01">
						房屋已办证：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="jyzcXxBuilding.fwybz"
							id="fwybz" value="%{#request.jyzcXxBuilding.fwybz}"  />
					</td>
					<td class="td_form01">
						房产办证日期：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxBuilding.fczblsj" id="fczblsj"
							  readonly="true" value="%{#request.jyzcXxBuilding.fczblsj}" />
					</td>
				</tr>
				<tr>
					<td colspan="6" class="td_top" align="left">
						土地基本状况
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						空地：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="jyzcXxBuilding.kongdi"
							id="kongdi" value="%{#request.jyzcXxBuilding.kongdi}"   />
					</td>
					<td class="td_form01">
						用地性质：
					</td>
					<td class="td_form02">
						<e:select parRefKey="LAND_USE_PROPERTY" list="#{}" headerKey="" headerValue="" 
							name="jyzcXxBuilding.CYdxz" id="CYdxz"
							value="%{#request.jyzcXxBuilding.CYdxz}"  />
					</td>
					<td width="93" class="td_form01">
						土地面积：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxBuilding.tdmj" id="tdmj" 
							value="%{#request.jyzcXxBuilding.tdmj}"   />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						取得日期：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxBuilding.qdrq" id="qdrq"  readonly="true" 
							value="%{#request.jyzcXxBuilding.qdrq}" />
					</td>
					<td class="td_form01">
						准用年限：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxBuilding.zynx" id="zynx" 
							value="%{#request.jyzcXxBuilding.zynx}"   />
					</td>
					<td class="td_form01">
						剩余使用年限：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxBuilding.sysynx" id="sysynx"
							 value="%{#request.jyzcXxBuilding.sysynx}"   />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						开发程度：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxBuilding.kfcd" id="kfcd" 
							value="%{#request.jyzcXxBuilding.kfcd}"   />
					</td>
					<td class="td_form01">
						房地分离土地：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="jyzcXxBuilding.fdfltd"
							id="fdfltd" value="%{#request.jyzcXxBuilding.fdfltd}"  />
					</td>
					<td class="td_form01">
						&nbsp;
					</td>
					<td class="td_form02">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						土地证使用权人：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxBuilding.tdzsyqr" id="tdzsyqr"
							 value="%{#request.jyzcXxBuilding.tdzsyqr}"   />
					</td>
					<td class="td_form01">
						土地证号：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxBuilding.tdzh" id="tdzh" 
							value="%{#request.jyzcXxBuilding.tdzh}"   />
					</td>
					<td class="td_form01">
						土地证替代文件：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxBuilding.tdztdwj" id="tdztdwj"
							 value="%{#request.jyzcXxBuilding.tdztdwj}"   />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						土地无有效文件：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="jyzcXxBuilding.tdwyxwj"
							id="tdwyxwj" value="%{#request.jyzcXxBuilding.tdwyxwj}"  />
					</td>
					<td class="td_form01">
						土地已办证：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="jyzcXxBuilding.tdybz"
							id="tdybz" value="%{#request.jyzcXxBuilding.tdybz}"  />
					</td>
					<td class="td_form01">
						土地证办理日期：
					</td>
					<td class="td_form02">
						<s:date name="%{#request.jyzcXxBuilding.tdzblsj}" format="yyyy-MM-dd"
							var="draftDate3" />
						<s:textfield name="jyzcXxBuilding.tdzblsj"  readonly="true" id="tdzblsj"
							 value="%{#draftDate3}" />
					</td>
				</tr>
				<tr>
					<td colspan="6" class="td_top" align="left">
						构筑物基本状况
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						结构：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxBuilding.gzwjg" id="gzwjg"
							 value="%{#request.jyzcXxBuilding.gzwjg}"   />
					</td>
					<td class="td_form01">
						规格尺寸：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxBuilding.ggcc" id="ggcc" 
							value="%{#request.jyzcXxBuilding.ggcc}"   />
					</td>
					<td class="td_form01">
						计量单位：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxBuilding.jldw" id="jldw" 
							value="%{#request.jyzcXxBuilding.jldw}"   />
					</td>
				</tr>

				<tr>
					<td class="td_form01">
						数量：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxBuilding.gzwsl" id="gzwsl"
							 value="%{#request.jyzcXxBuilding.gzwsl}"   />
					</td>
					<td class="td_form01">
						成本单价：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxBuilding.gzwcbdj" id="gzwcbdj"
							 value="%{#request.jyzcXxBuilding.gzwcbdj}"   />
					</td>
					<td class="td_form01">
						构建物建成日期：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxBuilding.gzwjcsj"  readonly="true" id="gzwjcsj"  value="%{#request.jyzcXxBuilding.gzwjcsj}"/>
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						房地合一：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="jyzcXxBuilding.fdhy"
							id="fdhy" value="%{#request.jyzcXxBuilding.fdhy}"  />
					</td>
					<td class="td_form01">
						房地合一已办证：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="jyzcXxBuilding.fdhyybz"
							id="fdhyybz" value="%{#request.jyzcXxBuilding.fdhyybz}"  />
					</td>
					<td class="td_form01">
						房地合一权证号：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxBuilding.fdhyqzh" id="fdhyqzh"
							 value="%{#request.jyzcXxBuilding.fdhyqzh}"   />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						特殊类型：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxBuilding.tslx" id="tslx" 
							value="%{#request.jyzcXxBuilding.tslx}"   />
					</td>
					<td class="td_form01">
						无法办证原因：
					</td>
					<td class="td_form02">
						<s:textfield name="jyzcXxBuilding.wfbzyy" id="wfbzyy"
							 value="%{#request.jyzcXxBuilding.wfbzyy}"   />
					</td>
					<td class="td_form01">
						两证全未办：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="jyzcXxBuilding.lzqwb"
							id="lzqwb" value="%{#request.jyzcXxBuilding.lzqwb}"  />
					</td>
				</tr>
			</table>
			<s:submit value="关闭" type="button" onclick="closebody();return false;"/>
		</s:form>
	</body>
</html>