<%@ page language="java" import="java.util.*,com.tansun.rdp4j.common.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	<script type="text/javascript">
		$(function(){
			jQuery("#file_list").setGridWidth($("#common_tableWidth").width());
			$(window).bind('resize', function(){
				jQuery("#file_list").setGridWidth($("#common_tableWidth").width());
      		 });
			var buttonFileJSonString = '[{"buttonHandler":"addFileAss","buttonIcon":"icon-add","buttonText":"增加"},\
										{"buttonHandler":"delFileAss","buttonIcon":"icon-remove","buttonText":"删除"},\
										{"buttonHandler":"up","buttonIcon":"icon-up","buttonText":"上移"},\
                                        {"buttonHandler":"down","buttonIcon":"icon-down","buttonText":"下移"}\
			]';
			addButtons(jQuery("#gview_file_list > .ui-jqgrid-titlebar"),buttonFileJSonString);
			$("select,input,textarea").attr("disabled","disabled");
		});
		function closebody(){
			window.close();
		}
	</script>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>车辆</title>
	</head>
<script type="text/javascript">
</script>
	<body>
		<s:form method="post" id="building">
			<s:set name="biaodanid" value="aeVehicle.zcId" />
			<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
			<table width="100%" border="0" id="common_tableWidth" class="newtable" cellpadding="2" cellspacing="0"
				align="center" >
				<tr>
					<td colspan="6" class="td_top" align="left">
						基本情况
					</td>
				</tr>
				<tr>
					<td width="140" class="td_ylp01">
						数量：
					</td>
					<td class="td_ylp02">
						<s:textfield name="aeVehicle.shuliang" cssClass="input"  id="shuliang"  />
					</td>
					<td width="140" class="td_ylp01">
						购置日期：
					</td>
					<td class="td_ylp02">
						<s:date name="%{#request.aeVehicle.gzrq}" format="yyyy-MM-dd"
							var="draftDate" />
						<s:textfield name="aeVehicle.gzrq" id="gzrq"  />
					</td>
					<td width="140" class="td_ylp01">
						启用日期：
					</td>
					<td class="td_ylp02">
						<s:date name="%{#request.aeVehicle.qyrq}" format="yyyy-MM-dd"
							var="draftDate" />
						<s:textfield name="aeVehicle.qyrq" id="qyrq" />
					</td>
				</tr>

				<tr>
					<td colspan="6" class="td_top" align="left">
						使用状况
					</td>
				</tr>
				<tr>
					<td class="td_ylp01">
						是否正常：
					</td>
					<td class="td_ylp02">
						<s:select list="#{'0':'否','1':'是'}" name="aeVehicle.sfzc" id="sfzc"   />
					</td>
					<td class="td_ylp01">
						是否闲置：
					</td>
					<td class="td_ylp02">
						<s:select list="#{'0':'否','1':'是'}" name="aeVehicle.sfxz" id="sfxz"  />
					</td>
					<td class="td_ylp01">
						是否淘汰：
					</td>
					<td class="td_ylp02">
						<s:select list="#{'0':'否','1':'是'}" name="aeVehicle.sftt" id="sftt"   />
					</td>
				</tr>
					<td class="td_ylp01">
						是否待报废：
					</td>
					<td class="td_ylp02">
						<s:select list="#{'0':'否','1':'是'}" name="aeVehicle.sfdbf" id="sfdbf"  />
					</td>
					<td class="td_ylp01">
						建行租用：
					</td>
					<td class="td_ylp02">
						<s:select list="#{'0':'否','1':'是'}" name="aeVehicle.sfjhzy" id="sfjhzy"    />
					</td>
					<td class="td_ylp01">
						其他第三方租用：
					</td>
					<td class="td_ylp02">
						<s:select list="#{'0':'否','1':'是'}" name="aeVehicle.qtdsfzy" id="qtdsfzy"  />
					</td>
				</tr>
				<tr>
					<td class="td_ylp01">
						无偿占用：
					</td>
					<td class="td_ylp02">
						<s:select list="#{'0':'否','1':'是'}" name="aeVehicle.wczy" id="wczy"   />
					</td>
					<td class="td_ylp01">
						现时使用者：
					</td>
					<td class="td_ylp02">
						<s:textfield name="aeVehicle.xssyz" cssClass="input"  id="xssyz"   />
					</td>
					<td class="td_ylp01">
						现时使用者地址：
					</td>
					<td class="td_ylp02">
						<s:textfield name="aeVehicle.xssyzdz" cssClass="input" id="xssyzdz"   />
					</td>
				</tr>
				<tr>
					<td width="140" class="td_ylp01">
						纠纷、抵押、诉讼、无偿占用情况说明：
					</td>
					<td class="td_ylp02" colspan="5">
						<s:textarea name="aeVehicle.wczyqksm" id="wczyqksm"  cols="150" rows="4"></s:textarea>
					</td>
				</tr>
				<tr>
					<td colspan="6" class="td_top" align="left">
						账实情况
					</td>
				</tr>
				<tr>
					<td class="td_ylp01">
						盘盈：
					</td>
					<td class="td_ylp02">
						<s:select list="#{'0':'否','1':'是'}" name="aeVehicle.sfpy" id="sfpy"    />
					</td>
					<td width="140" class="td_ylp01">&nbsp;</td>
					<td class="td_ylp02">&nbsp;</td>
					<td width="140" class="td_ylp01">&nbsp;</td>
					<td class="td_ylp02">&nbsp;</td>
				</tr>
				<tr>
					<td width="140" class="td_ylp01">
						盘盈原因：
					</td>
					<td class="td_ylp02" colspan="5">
						<s:textarea  name="aeVehicle.pyyy" cssClass="input"  id="pyyy" cols="200" rows="6"></s:textarea>
					</td>
				</tr>
				
				<tr>
					<td class="td_ylp01">
						盘亏：
					</td>
					<td class="td_ylp02">
						<s:select list="#{'0':'否','1':'是'}" name="aeVehicle.sfpk" id="sfpk"  />
					</td>
					<td width="140" class="td_ylp01">&nbsp;</td>
					<td class="td_ylp02">&nbsp;</td>
					<td width="140" class="td_ylp01">&nbsp;</td>
					<td class="td_ylp02">&nbsp;</td>
				</tr>
				<tr>
					<td width="140" class="td_ylp01">
						盘亏原因：
					</td>
					<td class="td_ylp02" colspan="5">
						<s:textarea name="aeVehicle.pkyy" id="pkyy"   cols="150" rows="4"></s:textarea>
					</td>
				</tr>
				
				<tr>
					<td class="td_ylp01">
						退役不实：
					</td>
					<td class="td_ylp02">
						<s:select list="#{'0':'否','1':'是'}" name="aeVehicle.sftybs" id="sftybs" />
					</td>
					<td width="140" class="td_ylp01">&nbsp;</td>
					<td class="td_ylp02">&nbsp;</td>
					<td width="140" class="td_ylp01">&nbsp;</td>
					<td class="td_ylp02">&nbsp;</td>
				</tr>
				<tr>
					<td width="140" class="td_ylp01">
						退役不实原因：
					</td>
					<td class="td_ylp02" colspan="5">
						<s:textarea name="aeVehicle.tybsyy" id="tybsyy" cols="150" rows="4"></s:textarea>
					</td>
				</tr>
				<tr>
					<td class="td_ylp01">
						已处置：
					</td>
					<td class="td_ylp02">
						<s:select list="#{'0':'否','1':'是'}" name="aeVehicle.sfycz" id="sfycz"   />
					</td>
					<td width="140" class="td_ylp01">&nbsp;</td>
					<td class="td_ylp02">&nbsp;</td>
					<td width="140" class="td_ylp01">&nbsp;</td>
					<td class="td_ylp02">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="6" class="td_top" align="left">
						租赁情况
					</td>
				</tr>
				<tr>
					<td width="140" class="td_ylp01">
						租用人法定地址：
					</td>
					<td class="td_ylp02">
						<s:textfield name="aeVehicle.zyrfddz" cssClass="input"  id="zyrfddz"  />
					</td>
					<td width="140" class="td_ylp01">
						是否有租赁合同：
					</td>
					<td class="td_ylp02">
						<s:select list="#{'0':'否','1':'是'}" name="aeVehicle.sfyzlht" id="sfyzlht"   />
					</td>
					<td width="140" class="td_ylp01">
						租赁合同序号：
					</td>
					<td class="td_ylp02">
						<s:textfield  name="aeVehicle.zlhth" cssClass="input"  id="zlhth"   />
					</td>
				</tr>
				<tr>
					<td class="td_ylp01">
						租赁合同起始日期：
					</td>
					<td class="td_ylp02">
						<s:textfield name="aeVehicle.zlhtqsrq" cssClass="input"  id="zlhtqsrq"  />
					</td>
					<td width="140" class="td_ylp01">
						租赁期(月)：
					</td>
					<td class="td_ylp02">
						<s:textfield name="aeVehicle.zlq" cssClass="input"  id="zlq"   />
					</td>
					<td width="140" class="td_ylp01">
						月租金价格(元/月)：
					</td>
					<td class="td_ylp02">
						<s:textfield name="aeVehicle.yzjjg" cssClass="input"  id="yzjjg"  />
					</td>
				</tr>
				
				<tr>
					<td colspan="6" class="td_top" align="left">
						处置情况
					</td>
				</tr>
				<tr>
					<td width="140" class="td_ylp01">
						处置时间：
					</td>
					<td class="td_ylp02">
						<s:textfield name="aeVehicle.czsj" cssClass="input"  id="czsj"  />
					</td>
					<td width="140" class="td_ylp01">
						原值（当月账面价值）：
					</td>
					<td class="td_ylp02">
						<s:textfield name="aeVehicle.yuanzhi" cssClass="input"  id="yuanzhi"  />
					</td>
					<td width="140" class="td_ylp01">
						净额（当月账面价值）：
					</td>
					<td class="td_ylp02">
						<s:textfield name="aeVehicle.jinge" cssClass="input"  id="jinge"  />
					</td>
				</tr>
				<tr>
					<td width="140" class="td_ylp01">
						处置合同：
					</td>
					<td class="td_ylp02">
						<s:select list="#{'0':'否','1':'是'}" name="aeVehicle.czht" id="czht"  />
					</td>
					<td width="140" class="td_ylp01">
						合同编号：
					</td>
					<td class="td_ylp02">
						<s:textfield name="aeVehicle.htbh" cssClass="input"  id="htbh"     />
					</td>
					<td width="140" class="td_ylp01">
						处置收入：
					</td>
					<td class="td_ylp02">
						<s:textfield name="aeVehicle.czsr" cssClass="input"  id="czsr"   />
					</td>
				</tr>
				<tr>
					<td width="140" class="td_ylp01">
						处置费用：
					</td>
					<td class="td_ylp02">
						<s:textfield name="aeVehicle.czfy" cssClass="input"  id="czfy"   />
					</td>
					<td width="140" class="td_ylp01">
						处置损益：
					</td>
					<td class="td_ylp02">
						<s:textfield name="aeVehicle.czsy" cssClass="input"  id="czsy"     />
					</td>
					<td width="140" class="td_ylp01">
						处置后是否及时入账：
					</td>
					<td class="td_ylp02">
						<s:select list="#{'0':'否','1':'是'}" name="aeVehicle.czhsfjsrz" id="czhsfjsrz"   />
					</td>
				</tr>
				
				<tr>
					<td width="140" class="td_ylp01">
						已处置未入账的原因：
					</td>
					<td class="td_ylp02" colspan="5">
						<s:textarea name="aeVehicle.wrzyy" id="wrzyy"  cols="150" rows="4"/>
					</td>
				</tr>
				
				<tr>
					<td colspan="6" class="td_top" align="left">
						权属情况
					</td>
				</tr>
				<tr>
					<td width="140" class="td_ylp01">
						是否纠纷：
					</td>
					<td class="td_ylp02">
						<s:select list="#{'0':'否','1':'是'}" name="aeVehicle.sfjf" id="sfjf" />
					</td>
					<td width="140" class="td_ylp01">
						是否抵押：
					</td>
					<td class="td_ylp02">
						<s:select list="#{'0':'否','1':'是'}" name="aeVehicle.sfdy" id="sfdy" />
					</td>
					<td width="140" class="td_ylp01">
						是否诉讼：
					</td>
					<td class="td_ylp02">
						<s:select list="#{'0':'否','1':'是'}" name="aeVehicle.sfss" id="sfss" />
					</td>
				</tr>
				<tr>
					<td colspan="6" class="td_top" align="left">
						欠缴车船税
					</td>
				</tr>
				<tr>
					<td width="140" class="td_ylp01">
						期间：
					</td>
					<td class="td_ylp02">
						<s:textfield  name="aeVehicle.qijian" cssClass="input"  id="qijian"  />
					</td>
					<td width="140" class="td_ylp01">
						金额：
					</td>
					<td class="td_ylp02">
						<s:textfield name="aeVehicle.jine" cssClass="input"  id="jine"    />
					</td>
					<td width="140" class="td_ylp01">&nbsp;</td>
					<td class="td_ylp02">&nbsp;</td>
				</tr>
				
				<tr>
					<td colspan="6" class="td_top" align="left">
						账面价值
					</td>
				</tr>
				<tr>
					<td width="140" class="td_ylp01">
						原值：
					</td>
					<td class="td_ylp02">
						<s:textfield  name="aeVehicle.zmyz" cssClass="input"  id="zmyz"    />
					</td>
					<td width="140" class="td_ylp01">
						减值：
					</td>
					<td class="td_ylp02">
						<s:textfield  name="aeVehicle.zmjz" cssClass="input"  id="zmjz"    />
					</td>
					<td width="140" class="td_ylp01">
						减值准备：
					</td>
					<td class="td_ylp02">
						<s:textfield  name="aeVehicle.jzzb" cssClass="input"  id="jzzb"     />
					</td>
				</tr>
				<tr>
				<td width="140" class="td_ylp01">
						净额：
					</td>
					<td class="td_ylp02">
						<s:textfield name="aeVehicle.zmje"  cssClass="input"  id="zmje"    />
					</td>
					<td width="140" class="td_ylp01">
						&nbsp;
					</td>
					<td class="td_ylp02">&nbsp;</td>
					<td width="140" class="td_ylp01">&nbsp;</td>
					<td class="td_ylp02">&nbsp;</td>
				</tr>
				
				<tr>
					<td width="140" class="td_ylp01">
						资产管理建议：
					</td>
					<td class="td_ylp02" colspan="5">
						<s:textarea name="aeVehicle.zcgljy" id="zcgljy"  cols="150" rows="4"></s:textarea>
					</td>
				</tr>
				<tr>
					<td width="140" class="td_ylp01">
						备注：
					</td>
					<td class="td_ylp02" colspan="5">
						<s:textarea name="aeVehicle.beizhu" id="beizhu"    cols="150" rows="4"></s:textarea>
					</td>
				</tr>
			</table>
			<%@ include file="/inc/file.inc"%>
			<s:submit value="关闭" type="button" onclick="closebody();return false;"/>
		</s:form>
	</body>
</html>