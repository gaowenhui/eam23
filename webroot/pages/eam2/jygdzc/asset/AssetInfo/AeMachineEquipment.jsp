<%@ page language="java" import="java.util.*,com.tansun.rdp4j.common.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
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
		<title>机器设备</title>
	</head>
<script type="text/javascript">
</script>
	<body>
		<s:form method="post" id="building">
			<s:set name="biaodanid" value="aeMachineEquipment.zcId" />
			<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
			<table width="100%" id="common_tableWidth" border="0" class="newtable" cellpadding="2" cellspacing="0" align="center" >
				<tr>
					<td colspan="6" class="td_top" align="left">
						基本情况
					</td>
				</tr>
				<tr>
					<td width="140" class="td_form01">
						数量：
					</td>
					<td class="td_form02">
						<s:textfield name="aeMachineEquipment.shuliang" id="shuliang"  />
					</td>
					<td width="140" class="td_form01">
						购置日期：
					</td>
					<td  class="td_form02">
						<s:date name="%{#request.aeMachineEquipment.gzrq}" format="yyyy-MM-dd"
							var="draftDate" />
						<s:textfield name="aeMachineEquipment.gzrq" id="gzrq" readonly="true" />
					</td>
					<td width="140" class="td_form01">
						启用日期：
					</td>
					<td  class="td_form02">
						<s:date name="%{#request.aeMachineEquipment.qyrq}" format="yyyy-MM-dd"
							var="draftDate" />
						<s:textfield name="aeMachineEquipment.qyrq" id="qyrq" readonly="true" />
					</td>
				</tr>
				<tr>
					<td width="140" class="td_form01">
						存放地点：
					</td>
					<td class="td_form02">
						<s:textfield name="aeMachineEquipment.cfdd" id="cfdd"   />
					</td>
					<td width="140" class="td_form01">
						&nbsp;
					</td>
					<td class="td_form02">&nbsp;</td>
					<td width="140" class="td_form01">&nbsp;</td>
					<td class="td_form02">&nbsp;</td>
				</tr>
				<tr>
					<td colspan="6" class="td_top" align="left">
						使用状况
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						是否正常：
					</td>
					<td class="td_form02">
						<s:select list="#{'0':'否','1':'是'}" name="aeMachineEquipment.sfzc" id="sfzc"   />
					</td>
					<td class="td_form01">
						是否闲置：
					</td>
					<td class="td_form02">
						<s:select list="#{'0':'否','1':'是'}" name="aeMachineEquipment.sfxz" id="sfxz"   />
					</td>
					<td class="td_form01">
						是否淘汰：
					</td>
					<td class="td_form02">
						<s:select list="#{'0':'否','1':'是'}" name="aeMachineEquipment.sftt" id="sftt"   />
					</td>
				</tr>
					<td class="td_form01">
						是否待报废：
					</td>
					<td class="td_form02">
						<s:select list="#{'0':'否','1':'是'}" name="aeMachineEquipment.sfdbf" id="sfdbf"   />
					</td>
					<td class="td_form01">
						建行租用：
					</td>
					<td class="td_form02">
						<s:select list="#{'0':'否','1':'是'}"  name="aeMachineEquipment.jhzy" id="jhzy"   />
					</td>
					<td class="td_form01">
						其他第三方租用：
					</td>
					<td class="td_form02">
						<s:select list="#{'0':'否','1':'是'}" name="aeMachineEquipment.qtdsfzy" id="qtdsfzy"   />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						无偿占用：
					</td>
					<td class="td_form02">
						<s:select list="#{'0':'否','1':'是'}"  name="aeMachineEquipment.wczy" id="wczy"   />
					</td>
					<td class="td_form01">
						现时使用者：
					</td>
					<td class="td_form02">
						<s:textfield name="aeMachineEquipment.xssyz" id="xssyz"  />
					</td>
					<td class="td_form01">
						现时使用者地址：
					</td>
					<td class="td_form02">
						<s:textfield name="aeMachineEquipment.xssyzdz" id="xssyzdz"  />
					</td>
				</tr>
				<tr>
					<td width="140" class="td_form01">
						纠纷、抵押、诉讼、无偿占用情况说明：
					</td>
					<td class="td_form02" colspan="5">
						<s:textarea name="aeMachineEquipment.wczyqksm" id="wczyqksm"  cols="150" rows="4"></s:textarea>
					</td>
				</tr>
				<tr>
					<td colspan="6" class="td_top" align="left">
						账实情况
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						盘盈：
					</td>
					<td class="td_form02">
						<s:select list="#{'0':'否','1':'是'}"  name="aeMachineEquipment.sfpy" id="sfpy"   />
					</td>
					<td width="140" class="td_form01">&nbsp;</td>
					<td class="td_form02">&nbsp;</td>
					<td width="140" class="td_form01">&nbsp;</td>
					<td class="td_form02">&nbsp;</td>
				</tr>
				<tr>
					<td width="140" class="td_form01">
						盘盈原因：
					</td>
					<td class="td_form02" colspan="5">
						<s:textarea name="aeMachineEquipment.pyyy" id="pyyy"   cols="150" rows="4"></s:textarea>
					</td>
				</tr>
				
				<tr>
					<td class="td_form01">
						盘亏：
					</td>
					<td class="td_form02">
						<s:select list="#{'0':'否','1':'是'}" name="aeMachineEquipment.sfpk" id="sfpk"  />
					</td>
					<td width="140" class="td_form01">&nbsp;</td>
					<td class="td_form02">&nbsp;</td>
					<td width="140" class="td_form01">&nbsp;</td>
					<td class="td_form02">&nbsp;</td>
				</tr>
				<tr>
					<td width="140" class="td_form01">
						盘亏原因：
					</td>
					<td class="td_form02" colspan="5">
						<s:textarea name="aeMachineEquipment.pkyy" id="pkyy" cols="150" rows="4"></s:textarea>
					</td>
				</tr>
				
				<tr>
					<td class="td_form01">
						退役不实：
					</td>
					<td class="td_form02">
						<s:select list="#{'0':'否','1':'是'}" name="aeMachineEquipment.tybs" id="tybs"   />
					</td>
					<td width="140" class="td_form01">&nbsp;</td>
					<td class="td_form02">&nbsp;</td>
					<td width="140" class="td_form01">&nbsp;</td>
					<td class="td_form02">&nbsp;</td>
				</tr>
				<tr>
				<td width="140" class="td_form01">
						退役不实原因：
					</td>
					<td class="td_form02" colspan="5">
						<s:textarea name="aeMachineEquipment.tybsyy" id="tybsyy"   cols="150" rows="4"></s:textarea>
					</td>
				</tr>
				
				<tr>
					<td colspan="6" class="td_top" align="left">
						租赁情况
					</td>
				</tr>
				<tr>
					<td width="140" class="td_form01">
						租用人法定地址：
					</td>
					<td class="td_form02">
						<s:textfield name="aeMachineEquipment.zyrfddz" id="zyrfddz"   />
					</td>
					<td width="140" class="td_form01">
						是否有租赁合同：
					</td>
					<td class="td_form02">
						<s:select list="#{'0':'否','1':'是'}" name="aeMachineEquipment.sfyzlht"  id="sfyzlht"  value="%{#request.jyzcXxBuilding.kongdi}"   />
					</td>
					<td width="140" class="td_form01">
						租赁合同序号：
					</td>
					<td class="td_form02">
						<s:textfield name="aeMachineEquipment.zlhtxh"  id="zlhtxh"   />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						租赁合同起始日期：
					</td>
					<td class="td_form02">
						<s:textfield name="aeMachineEquipment.zlhtqsrq"  id="zlhtqsrq"  />
					</td>
					<td width="140" class="td_form01">
						租赁期(月)：
					</td>
					<td class="td_form02">
						<s:textfield name="aeMachineEquipment.zlq"  id="zlq"  />
					</td>
					<td width="140" class="td_form01">
						月租金价格(元/月)：
					</td>
					<td class="td_form02">
						<s:textfield  name="aeMachineEquipment.yzjjg"  id="yzjjg"   />
					</td>
				</tr>
				
				<tr>
					<td colspan="6" class="td_top" align="left">
						处置情况
					</td>
				</tr>
				<tr>
					<td width="140" class="td_form01">
						处置时间：
					</td>
					<td class="td_form02">
						<s:textfield name="aeMachineEquipment.czsj"  id="czsj"    />
					</td>
					<td width="140" class="td_form01">
						原值：
					</td>
					<td class="td_form02">
						<s:textfield  name="aeMachineEquipment.yuanzhi"  id="yuanzhi"  />
					</td>
					<td width="140" class="td_form01">
						净额：
					</td>
					<td class="td_form02">
						<s:textfield name="aeMachineEquipment.jinge"  id="jinge"   />
					</td>
					</tr>

				<tr>
					<td width="140" class="td_form01">
						处置合同：
					</td>
					<td class="td_form02">
						<s:select list="#{'0':'否','1':'是'}" name="aeMachineEquipment.czht"  id="czht"  />
					</td>
					<td width="140" class="td_form01">
						合同编号：
					</td>
					<td class="td_form02">
						<s:textfield name="aeMachineEquipment.htbh"  id="htbh"   />
					</td>
					<td width="140" class="td_form01">
						处置收入：
					</td>
					<td class="td_form02">
						<s:textfield name="aeMachineEquipment.czsr"  id="czsr"    />
					</td>
				</tr>
				<tr>
					<td width="140" class="td_form01">
						处置费用：
					</td>
					<td class="td_form02">
						<s:textfield name="aeMachineEquipment.czfy"  id="czfy"    />
					</td>
					<td width="140" class="td_form01">
						处置损益：
					</td>
					<td class="td_form02">
						<s:textfield name="aeMachineEquipment.czsy"  id="czsy"  />
					</td>
					<td width="140" class="td_form01">
						处置后是否及时入账：
					</td>
					<td class="td_form02">
						<s:select list="#{'0':'否','1':'是'}" name="aeMachineEquipment.czhsfjsrz"  id="czhsfjsrz"   />
					</td>
				</tr>
				
				<tr>
					<td class="td_form01">
						已处置未入账的原因：
					</td>
					<td class="td_form02" colspan="5">
						<s:textarea name="aeMachineEquipment.wrzyy"  id="wrzyy"  cols="150" rows="4"></s:textarea>
					</td>
				</tr>
				
				<tr>
					<td colspan="6" class="td_top" align="left">
						权属情况
					</td>
				</tr>
				<tr>
					<td width="140" class="td_form01">
						是否纠纷：
					</td>
					<td class="td_form02">
						<s:select list="#{'0':'否','1':'是'}"  name="aeMachineEquipment.sfjf"  id="sfjf"   />
					</td>
					<td width="140" class="td_form01">
						是否抵押：
					</td>
					<td class="td_form02">
						<s:select list="#{'0':'否','1':'是'}"  name="aeMachineEquipment.sfdy"  id="sfdy"  />
					</td>
					<td width="140" class="td_form01">
						是否诉讼：
					</td>
					<td class="td_form02">
						<s:select list="#{'0':'否','1':'是'}" name="aeMachineEquipment.sfss"  id="sfss"  />
					</td>
				</tr>
				<tr>
					<td colspan="6" class="td_top" align="left">
						欠缴车船税
					</td>
				</tr>
				<tr>
					<td width="140" class="td_form01">
						期间：
					</td>
					<td class="td_form02">
						<s:textfield name="aeMachineEquipment.qijian"  id="qijian"   />
					</td>
					<td width="140" class="td_form01">
						金额：
					</td>
					<td class="td_form02">
						<s:textfield name="aeMachineEquipment.jine"  id="jine"  />
					</td>
					<td width="140" class="td_form01">&nbsp;</td>
					<td class="td_form02">&nbsp;</td>
				</tr>
				
				<tr>
					<td colspan="6" class="td_top" align="left">
						账面价值
					</td>
				</tr>
				<tr>
					<td width="140" class="td_form01">
						原值：
					</td>
					<td class="td_form02">
						<s:textfield  name="aeMachineEquipment.zmyz"  id="zmyz"  />
					</td>
					<td width="140" class="td_form01">
						净值：
					</td>
					<td class="td_form02">
						<s:textfield name="aeMachineEquipment.zmjz"  id="zmjz"  />
					</td>
					<td width="140" class="td_form01">
						减值准备：
					</td>
					<td class="td_form02">
						<s:textfield name="aeMachineEquipment.jzzb"  id="jzzb" />
					</td>
				</tr>
				<tr>
				<td width="140" class="td_form01">
						净额：
					</td>
					<td class="td_form02">
						<s:textfield name="aeMachineEquipment.zmje"  id="zmje" />
					</td>
					<td width="140" class="td_form01">
						&nbsp;
					</td>
					<td class="td_form02">&nbsp;</td>
					<td width="140" class="td_form01">&nbsp;</td>
					<td class="td_form02">&nbsp;</td>
				</tr>
				
				<tr>
					<td class="td_form01">
						资产管理建议：
					</td>
					<td class="td_form02" colspan="5">
						<s:textarea name="aeMachineEquipment.zcgljy"  id="zcgljy" cols="150" rows="4"></s:textarea>
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						备注：
					</td>
					<td class="td_form02" colspan="5">
						<s:textarea name="aeMachineEquipment.beizhu"  id="beizhu" cols="150" rows="4"></s:textarea>
					</td>
				</tr>
			</table>
			<%@ include file="/inc/file.inc"%>
			<s:submit value="关闭" type="button" onclick="closebody();return false;"/>
		</s:form>
	</body>
</html>