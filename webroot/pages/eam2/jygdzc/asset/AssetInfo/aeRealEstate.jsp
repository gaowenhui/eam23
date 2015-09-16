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
		
		<title>A中企华核查表</title>
	</head>
	<body>
		<s:form method="post" id="building">
			<s:set name="biaodanid" value="aeRealEstate.zcId" />
			<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
			<table width="100%" border="0" id ="common_tableWidth" class="newtable" cellpadding="2" cellspacing="0" align="center" >
				<tr>
					<td colspan="6" class="td_top" align="left">
						管理信息
					</td>
				</tr>

					<tr>
					<td width="120" class="td_form01">
						卡片编号：
					</td>
					<td  class="td_form02">
						<s:textfield name="aeRealEstate.kpbh" id="kpbh" />
					</td>
					<td width="120" class="td_form01">
						录入时间:
					</td>
					<td  class="td_form02">
						<s:date name="%{#request.aeRealEstate.lrsj}" format="yyyy-MM-dd"
							var="draftDate" />
						<s:textfield name="aeRealEstate.lrsj" id="lrsj"  />
					</td>
					
					<td width="120" class="td_form01">
						地域类别：
					</td>
					<td  class="td_form02">
					
						<s:textfield name="aeRealEstate.dylb" id="dylb"  />
					</td>
					</tr>
				<tr>
					<td colspan="6" class="td_top" align="left">
						资产办证情况
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						房地合一已办证(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','否':'否','是':'是'}"  name="aeRealEstate.fdhyybz" id="fdhyybz"   />
					</td>
					<td class="td_form01">
						房屋已办证(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','否':'否','是':'是'}"  name="aeRealEstate.fwybz" id="fwybz"   />
					</td>
					<td class="td_form01">
						土地已办证(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','否':'否','是':'是'}"  name="aeRealEstate.tdybz" id="tdybz"   />
					</td>
					
					</tr>
					<tr>
					<td class="td_form01">
						没有产权证能否补办(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','否':'否','是':'是'}"  name="aeRealEstate.cqznfbb" id="cqznfbb"   />
					</td>
				<td width="120" class="td_form01">&nbsp;</td>
					<td class="td_form02">&nbsp;</td>
				<td width="120" class="td_form01">&nbsp;</td>
					<td class="td_form02">&nbsp;</td>
				</tr>
				<tr>
				 <td class="td_form01">
						判断理由：
					</td>
					<td class="td_form02" colspan="5">
						<s:textarea name="aeRealEstate.pdly"  id="pdly" cols="150" rows="4"></s:textarea>
					</td>
				</tr>
				<tr>
					<td colspan="6" class="td_top" align="left">
						房屋权属文件
					</td>
				</tr>
				<tr>
					<td width="120" class="td_form01">
						房产证所有权人：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.fczsyqr" id="fczsyqr"   />
					</td>
					<td width="120" class="td_form01">
						房产证号：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.fczh" id="fczh"   />
					</td>
					<td width="120" class="td_form01">
						替代文件：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.fcztdwj"  id="fcztdwj"   />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						无有效文件(有/无)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','有':'有','无':'无'}" name="aeRealEstate.fwqsyxwj"  id="fwqsyxwj"  />
					</td>
					<td width="120" class="td_form01">
						是否纠纷(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','否':'否','是':'是'}" name="aeRealEstate.fwqsjf"  id="fwqsjf"  />
					</td>
					<td width="120" class="td_form01">
						房屋权属文件是否抵押(是/否)
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','否':'否','是':'是'}" name="aeRealEstate.fwqsdy"  id="fwqsdy"  />
					</td>
				</tr>
				<tr>
					<td width="120" class="td_form01">
						是否诉讼(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','否':'否','是':'是'}" name="aeRealEstate.fwqsss"  id="fwqsss"  />
					</td>
					<td width="120" class="td_form01">&nbsp;</td>
					<td class="td_form02">&nbsp;</td>
					<td width="120" class="td_form01">&nbsp;</td>
					<td class="td_form02">&nbsp;</td>
				</tr>
				 
				<tr>
					<td colspan="6" class="td_top" align="left">
						土地权属文件
					</td>
				</tr>
				<tr>
					<td  class="td_form01">
						土地证使用权人：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.tdzsyqr"  id="tdzsyqr"    />
					</td>
					<td  class="td_form01">
						土地证号：
					</td>
					<td class="td_form02">
						<s:textfield  name="aeRealEstate.tdzh"  id="tdzh"  />
					</td>
					<td  class="td_form01">
						替代文件：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.tdqstdwj"  id="tdqstdwj"/>
					</td>
					</tr>

				<tr>
					<td  class="td_form01">
						无有效文件(有/无)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'有','1':'无'}" name="aeRealEstate.tdqsyxwj"  id="tdqsyxwj"  />
					</td>
					<td  class="td_form01">
						是否纠纷(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.tdqssfjf"  id="tdqssfjf"   />
					</td>
					<td w class="td_form01">
						是否抵押(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.tdqssfdy"  id="tdqssfdy"   />
					</td>
				</tr>
				<tr>
					<td width="120" class="td_form01">
						是否诉讼(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.tdqssfss"  id="tdqssfss"   />
					</td>
					<td width="120" class="td_form01">
						无土地(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.wtd"  id="wtd"   />
					</td>
					<td width="120" class="td_form01">
						&nbsp;
					</td>
					<td class="td_form02">
						&nbsp;
					</td>
					</tr>
				
					<tr>
					<td colspan="6" class="td_top" align="left">
						权属情况
					</td>
				</tr>
				
				<tr>
					<td  class="td_form01">
						正常(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.syzkzc"  id="syzkzc" />
					</td>
					<td class="td_form01">
						闲置(是/否)：
					</td>
					<td class="td_form02" >
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.syzkxz"  id="syzkxz" />
					</td>
				  <td class="td_form01">
						空地(是/否)：
					</td>
					<td class="td_form02" >
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.syzkkd"  id="syzkkd" />
					</td>
				</tr>
				
				<tr>
				<td class="td_form01">
						建行租用(是/否)：
					</td>
					<td class="td_form02" >
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.syzkjhzy"  id="syzkjhzy" />
					</td>
				
				<td class="td_form01">
						其他第三方租用(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.syzkdsfzy"  id="syzkdsfzy" />
					</td>	
				<td class="td_form01">
						无偿占用(是/否)：
					</td>
					<td class="td_form02" >
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.syzkwczy"  id="syzkwczy" />
					</td>		
				</tr>
				
				<tr>
				   <td class="td_form01">
						现时使用者：
					</td>
					<td class="td_form02" >
						<s:textfield name="aeRealEstate.xsyz"  id="xsyz"    />
					</td>
						<td class="td_form01">
						现时使用者地址：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.xsydz"  id="xsydz"    />
					</td>
					<td class="td_form01">
						&nbsp;
					</td>
					<td class="td_form02" >
						&nbsp;
					</td>
				</tr>
				 
					<tr>
					<td colspan="6" class="td_top" align="left">
						在建工程状况
					</td>
				</tr>
				<tr>
					<td width="120" class="td_form01">
						已使用(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}"  name="aeRealEstate.zjgcysy"  id="zjgcysy"   />
					</td>
					<td width="120" class="td_form01">
						正常(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}"  name="aeRealEstate.zjgczc"  id="zjgczc"  />
					</td>
					<td width="120" class="td_form01">
						停建(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.zjgctj"  id="zjgctj"  />
					</td>
				</tr>
				<tr>
					<td colspan="6" class="td_top" align="left">
						长期待摊费用
					</td>
				</tr>
				<tr>
					<td width="120" class="td_form01">
						 形成日期：
					</td>
					<td class="td_form02">
						<s:textfield  name="aeRealEstate.cqdtxcrq"  id="cqdtxcrq"  />
					</td>
					<td width="120" class="td_form01">
						 原始发生额：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.cqdtysfse"  id="cqdtysfse"  />
					</td>
					<td width="120" class="td_form01">
						 预计摊销月数：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.cqdtyjtxyf"  id="cqdtyjtxyf" />
					</td>
				</tr>
				
				
				<tr>
					<td colspan="6" class="td_top" align="left">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td width="120" class="td_form01">
						纠纷、抵押、诉讼、无偿占用情况说明：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.qksm"  id="qksm"  />
					</td>
					<td width="120" class="td_form01">
						主辅分离统计(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}"  name="aeRealEstate.zffltj"  id="zffltj"  />
					</td>
					<td width="120" class="td_form01">
						房地分离统计(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.fdfltj"  id="fdfltj"  />
					</td>
				</tr>
				
			   			<tr>
					<td colspan="6" class="td_top" align="left">
						租赁情况
					</td>
				</tr>
				<tr>
					<td width="120" class="td_form01">
						租用人法定地址：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.zyrfddz"  id="zyrfddz"  />
					</td>
					<td width="120" class="td_form01">
						租用面积(平方米)：
					</td>
					<td class="td_form02">
						<s:textfield  name="aeRealEstate.zymj"  id="zymj"  />
					</td>
					<td width="120" class="td_form01">
						是否有租赁合同(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.sfyzlht"  id="sfyzlht"  />
					</td>
				</tr>	
				
					<tr>
					<td width="120" class="td_form01">
						租赁合同序号：
					</td>
					<td class="td_form02">
						<s:textfield  name="aeRealEstate.zlhtxh"  id="zlhtxh"  />
					</td>
					<td width="120" class="td_form01">
						部分租赁(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}"  name="aeRealEstate.bfzl"  id="bfzl"  />
					</td>
					<td width="120" class="td_form01">
						租赁合同起始日期：
					</td>
					<td class="td_form02">
						<s:textfield  name="aeRealEstate.zlhtqsrq"  id="zlhtqsrq"  />
					</td>
				</tr>
				
				<tr>
					<td width="120" class="td_form01">
						租赁期(月)：
					</td>
					<td class="td_form02">
						<s:textfield  name="aeRealEstate.zlq"  id="zlq"  />
					</td>
					<td class="td_form01">
						月租金价格(元/月/平方米)：
					</td>
					<td class="td_form02">
						<s:textfield  name="aeRealEstate.zlqyzjjg"  id="yzjjg"  />
					</td>
					<td class="td_form01">
					租金价格是否含物业费(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.zjjghwyf"  id="zjjghwyf"  />
					</td>
				</tr>
				
				<tr>
					<td width="120" class="td_form01">
					租赁期(月)：
					</td>
					<td class="td_form02">
						<s:textfield  name="aeRealEstate.zlq"  id="zlq"  />
					</td>
					<td width="120" class="td_form01">
					月租金价格(元/月/平方米)：
					</td>
					<td class="td_form02">
						<s:textfield  name="aeRealEstate.yzjjg"  id="yzjjg"  />
					</td>
					<td width="120" class="td_form01">
					租金价格是否含物业费(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.zjjghwyf"  id="zjjghwyf"  />
					</td>
				</tr>
				
				  
				<tr>
					<td  class="td_form01">
						当地同类房屋、土地的租金价格(元/月/平方米)：
					</td>
					<td  class="td_form02">
						<s:textfield name="aeRealEstate.tlfwzjjg" id="tlfwzjjg"  />
					</td>
					<td width="120" class="td_form01">
						租金案例1租金(元/月/平方米):
					</td>
					<td class="td_form02">
					    <s:textfield name="aeRealEstate.zjal1zj" id="zjal1zj"  />
					</td>
					<td width="120" class="td_form01">
						租金案例1案例名称:
					</td>
					<td class="td_form02">
					    <s:textfield name="aeRealEstate.zjal1name" id="zjal1name"  />
					</td>
				</tr>
				<tr>
				 <td width="120" class="td_form01">
						租金案例2租金(元/月/平方米):
					</td>
					<td class="td_form02">
					    <s:textfield name="aeRealEstate.zjal2zj" id="zjal2zj"  />
					</td>
					<td width="120" class="td_form01">
						租金案例2案例名称:
					</td>
					<td class="td_form02">
					    <s:textfield name="aeRealEstate.zjal2name" id="zjal2name"  />
					</td>
				<td width="120" class="td_form01">
						&nbsp;
					</td>
					<td class="td_form02">
					    &nbsp;
					</td>	
				</tr>
				
				
				<tr>
				 	  <td width="120" class="td_form01">
						租金案例3租金(元/月/平方米):
					</td>
					<td class="td_form02">
					    <s:textfield name="aeRealEstate.zjal3zj" id="zjal3zj"  />
					</td>
					<td width="120" class="td_form01">
						租金案例3案例名称:
					</td>
					<td class="td_form02">
					    <s:textfield name="aeRealEstate.zjal3name" id="zjal3name"  />
					</td>
					<td width="120" class="td_form01">
						&nbsp;
					</td>
					<td class="td_form02">
					    &nbsp;
					</td>	

				</tr>
				
				<tr>
					<td width="120" class="td_form01">
						年平均租金(元/年)：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.npjzj" id="npjzj"  />
					</td>
					<td width="120" class="td_form01">
						租金收益率(年租金/资产账面原值)：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.zjsyl" id="zjsyl"  />
					</td>
					<td width="120" class="td_form01">
						租金是否按期支付(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.zjsfaqzf"  id="zjsfaqzf"  />
					</td>
				</tr>
				
				<tr>
					<td colspan="6" class="td_top" align="left">
						账实情况
					</td>
				</tr>
				<tr>
					<td width="120" class="td_form01">
						盘盈(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}"  name="aeRealEstate.sfpy"  id="sfpy"   />
					</td>
					<td width="120" class="td_form01">
						盘盈原因：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.pkyy" id="pkyy"  />
					</td>
					<td width="120" class="td_form01">
						盘亏(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.pyyy"  id="pyyy"  />
					</td>
				</tr>
				
					<tr>
					<td width="120" class="td_form01">
						盘亏原因：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.pkyy" id="pkyy"  />
					</td>
					<td width="120" class="td_form01">
						退役不实(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}"  name="aeRealEstate.tybs"  id="tybs"  />
					</td>
					<td width="120" class="td_form01">
						退役不实原因：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.tybsyy" id="tybsyy"  />
					</td>
				</tr>
				
					<tr>
					<td width="120" class="td_form01">
						已处置(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}"  name="aeRealEstate.ycz"  id="ycz"   />
					</td>
					<td  class="td_form01">
						仅剩公摊(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.jsgt"  id="jsgt"  />
					</td>
					
					<td  class="td_form01">
						&nbsp;
					</td>
					<td class="td_form02">
						&nbsp;
					</td>
				</tr>
				
				
					<tr>
					<td colspan="6" class="td_top" align="left">
						非固定资产性质资产
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						装修费(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.zxf" id="zxf"   />
					</td>
					<td class="td_form01">
						非长期使用权的房产或土地(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.fcqsyqfctd" id="fcqsyqfctd"   />
					</td>
					<td class="td_form01">
						其他(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.fddzcxzzcqt" id="fddzcxzzcqt"   />
					</td>
				</tr>
				
				
				<tr>
					<td colspan="6" class="td_top" align="left">
						房屋用途
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						办公营业(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.bgyy" id="bgyy"   />
					</td>
					<td class="td_form01">
						宿舍(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.sushe" id="sushe"   />
					</td>
					<td class="td_form01">
						其他(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.fwytqt" id="fwytqt"   />
					</td>
				</tr>
				
				
				<tr>
					<td colspan="6" class="td_top" align="left">
						土地用途
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						规划用途：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.tdghyt" id="tdghyt"  />
					</td>
					<td width="120" class="td_form01">
						实际用途：
					</td>
					<td width="120"  class="td_form02">
					   <s:textfield name="aeRealEstate.tdsjytj" id="tdsjytj"  />
					</td>
					<td width="120" class="td_form01">
						&nbsp;
					</td>
					<td width="120" class="td_form02">
                        &nbsp;
					</td>
				</tr>
				
					<tr>
					<td colspan="6" class="td_top" align="left">
					  处置情况
					</td>
				</tr>
				
				<tr>
					<td class="td_form01">
						处置时间(年/月)：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.czsj" id="czsj"  />
					</td>
					
						<td class="td_form01">
						原值：
						</td>
						<td class="td_form02">
							<s:textfield name="aeRealEstate.czdyzmyz" id="czdyzmyz"  />
						</td>
						<td class="td_form01">
						净值：
						</td>
						<td class="td_form02">
							<s:textfield name="aeRealEstate.czdyzmjz" id="czdyzmjz"  />
						</td>
				</tr>
				
				
				<tr>
				    <td class="td_form01">
						处置合同(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.czht" id="czht"   />
					</td>
					<td class="td_form01">
						合同编号：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.htbh" id="htbh"  />
					</td>
					<td class="td_form01">
						处置收入：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.czsr" id="czsr"  />
					</td>
					
				</tr>
				
					<tr>
					<td class="td_form01">
						处置费用：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.czfy" id="czfy"  />
					</td>
					<td class="td_form01">
						处置损益：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.czsy" id="czsy"  />
					</td>
					<td class="td_form01">
						处置后是否及时入账(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.cshsfrz" id="cshsfrz"   />
					</td>
					
				</tr>

					<tr>
					<td class="td_form01">
						房产税(元/年)：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.fcs" id="fcs"  />
					</td>
					<td class="td_form01">
						城镇土地使用税(元/年)：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.cztdsys" id="cztdsys"  />
					</td>
							<td class="td_form01">
								费用名称：
							</td>
							<td class="td_form02">
								<s:textfield name="aeRealEstate.qtfymc" id="qtfymc"  />
							</td>
						
				</tr>
				
				<tr>
					<td class="td_form01">
						已处置未入账的原因：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.yczwrzyy" id="yczwrzyy"  />
					</td>
								<td class="td_form01">
								金额(元/年)：
							</td>
							<td class="td_form02">
								<s:textfield name="aeRealEstate.qtfyje" id="qtfyje"  />
							</td>
						
					<td class="td_form01">
						居住人身份：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.jzrsf" id="jzrsf"  />
					</td>
					
				</tr>
				
					<tr>
					<td class="td_form01">
						是否交租金(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.sfjzj" id="sfjzj"   />
					</td>
					<td class="td_form01">
						租金收取方：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.zjsqf" id="zjsqf"  />
					</td>
					<td class="td_form01">
						是否有房产证(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.sfyfcz" id="sfyfcz"   />
					</td>
					
				</tr>
				
				
					<tr>
					<td class="td_form01">
						房产证所有人：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.fczsyr" id="fczsyr"  />
					</td>
					<td class="td_form01">
						能否过户(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.nfgh" id="nfgh"   />
					</td>
					<td class="td_form01">
						不能过户原因：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.bnghyy" id="bnghyy"  />
					</td>
					
				</tr>
				
				
				<tr>
					<td colspan="6" class="td_top" align="left">
					  土地基本情况
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						土地出让金：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.ghtdcrj" id="ghtdcrj"  />
					</td>
					<td class="td_form01">
						欠缴公共维修基金金额：
					</td>
		 			<td>
		 			 <s:textfield name="aeRealEstate.ghggwxjj" id="ghggwxjj"  />
		 			</td>
						<td class="td_form01">
						物业管理费:
						</td>
						<td class="td_form02">
							<s:textfield name="aeRealEstate.ghwyglf" id="ghwyglf"  />
						</td>
					</tr>
					<tr>	
						<td class="td_form01">
						其他欠缴费用名称：
						</td>
						<td class="td_form02">
							<s:textfield name="aeRealEstate.ghqtqjfmc" id="ghqtqjfmc"  />
						</td>	
					<td class="td_form01">
						其他欠缴费用金额：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.ghqtqjfje" id="ghqtqjfje"  />
					</td>
					<td class="td_form01">
						小计：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.ghyjnfyhj" id="ghyjnfyhj"  />
					</td>
				</tr>
				
			
				<tr>
					<td colspan="6" class="td_top" align="left">
					  &nbsp;
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						购买意向(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.gmyx" id="gmyx"   />
					</td>
					<td class="td_form01">
						购买方式：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.gmfs" id="gmfs"  />
					</td>
					<td class="td_form01">
					意向购买价与市价比例%：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.yxgmjyscbl" id="yxgmjyscbl"  />
					</td>
					</tr>
					<tr>
						<td class="td_form01">
						宿舍处置建议：
						</td>
						<td class="td_form02">
							<s:textfield name="aeRealEstate.ssczjy" id="ssczjy"  />
						</td>	
				
					<td class="td_form01">
						专项调查的空地(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.zxdckd" id="zxdckd"   />
					</td>
					<td class="td_form01">
						再投资资产(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.ztzzc" id="ztzzc"   />
					</td>
				</tr>
					<tr>
						<td class="td_form01">
						建成日期(年/月)：
						</td>
						<td class="td_form02">
							<s:textfield name="aeRealEstate.jcrq" id="jcrq"  />
						</td>	
				
					<td class="td_form01">
						结构：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.fwjiegou" id="fwjiegou"  />
					</td>
					<td class="td_form01">
						檐高(米)：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.fwyg" id="fwyg"  />
					</td>
				</tr>
				
				<tr>
					<td class="td_form01">
					建成日期(年/月)：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.jcrq" id="jcrq"  />
					</td>	
				
					<td class="td_form01">
						结构：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.fwjiegou" id="fwjiegou"  />
					</td>
					<td class="td_form01">
						檐高(米)：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.fwyg" id="fwyg"  />
					</td>
				</tr>
				
				<tr>
					<td class="td_form01">
					标准层高(米)：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.fwbzcg" id="fwbzcg"  />
					</td>	
				
					<td class="td_form01">
					总层数：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.fwzcs" id="fwzcs"  />
					</td>
					<td class="td_form01">
					坐落在第几层：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.fwzldjc" id="fwzldjc"  />
					</td>
				</tr>
				
				<tr>
					<td class="td_form01">
					房间号：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.fwfjh" id="fwfjh"  />
					</td>	
				
					<td class="td_form01">
					建筑面积(M2)：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.jzmj" id="jzmj"  />
					</td>
					<td class="td_form01">
					核实后面积(平方米)：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.hshjzmj" id="hshjzmj"  />
					</td>
				</tr>
				
				<tr>
					<td class="td_form01">
					成本单价(元/M2)：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.fwcbdj" id="fwcbdj"  />
					</td>	
				
					<td class="td_form01">
					结构：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.jiegou" id="jiegou"  />
					</td>
					<td class="td_form01">
					规划尺寸：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.ggcc" id="ggcc"  />
					</td>
				</tr>
				
				
					<tr>
					<td class="td_form01">
					计量单位：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.jldw" id="jldw"  />
					</td>	
				
					<td class="td_form01">
					数量：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.shulinag" id="shulinag"  />
					</td>
					<td class="td_form01">
					成本单价：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.cbdj" id="cbdj"  />
					</td>
				</tr>
				
				<tr>
					<td class="td_form01">
						建成时间(年/月)：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.jcsj" id="jcsj"  />
					</td>
					<td width="120" class="td_form01">
						&nbsp;
					</td>
					<td class="td_form02">
						&nbsp;
					</td>
					<td width="120" class="td_form01">
						&nbsp;
					</td>
					<td  class="td_form02">
						&nbsp;
					</td>
				</tr>
				
				<tr>
					<td colspan="6" class="td_top" align="left">
						土地基本情况
					</td>
				</tr>
				<tr>
					
					  
					   <td  class="td_form01">
						出让(是/否)：
					</td>
					<td  class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.ydxzsfcr" id="ydxzsfcr"   />
					</td>
					<td  class="td_form01">
						划拨(是/否)：
					</td>
					<td  class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.ydxzsfhb" id="ydxzsfhb"   />
					</td>
					<td  class="td_form01">
						其他(是/否)：
					</td>
					<td  class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.ydxzqt" id="ydxzqt"   />
					</td>
					  
					</tr>
					<td width="120" class="td_form01">
						取得日期(年/月)：
					</td>
					<td  class="td_form02">
						<s:date name="%{#request.aeRealEstate.tdqdrq}" format="yyyy-MM-dd"
							var="draftDate" />
						<s:textfield name="aeRealEstate.tdqdrq" id="tdqdrq"  />
					</td>
					<td width="120" class="td_form01">
						准用年限：
					</td>
					<td  class="td_form02">
						<s:date name="%{#request.aeRealEstate.tdzynx}" format="yyyy-MM-dd"
							var="draftDate" />
						<s:textfield name="aeRealEstate.tdzynx" id="tdzynx"   />
					</td>
				  </tr>
			    	<tr>
					<td class="td_form01">
					剩余使用年限：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.tdsysynx" id="tdsysynx"   />
					</td>	
				
					<td class="td_form01">
					剩余使用年限：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.tdzynx" id="tdzynx"   />
					</td>
					<td class="td_form01">
					开发程度：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.tdkfcd" id="tdkfcd"   />
					</td>
				</tr>
				
				
					<tr>
					<td class="td_form01">
					面积(平方米)：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.tdmj" id="tdmj"   />
					</td>	
				
					<td class="td_form01">
					核实后面积(平方米)：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.tdhshmj" id="tdhshmj"   />
					</td>
					<td class="td_form01">
					设计用途：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.tjgcsjyt" id="tjgcsjyt"   />
					</td>
				</tr>
				
				
					<tr>
					<td class="td_form01">
					结构：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.tjgcjg" id="tjgcjg"   />
					</td>	
				
					<td class="td_form01">
					层数：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.tjgccs" id="tjgccs"   />
					</td>
					<td class="td_form01">
					建筑面积(平方米)：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.tjgcjzmj" id="tjgcjzmj"   />
					</td>
				</tr>
				
						<tr>
					<td class="td_form01">
					开工日期(年/月)：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.tjgckgrq" id="tjgckgrq"   />
					</td>	
				
					<td class="td_form01">
					预计完工日期(年/月)：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.tjgcyjwgrq" id="tjgcyjwgrq"   />
					</td>
					<td class="td_form01">
					形象进度(%)：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.tjgcxxjd" id="tjgcxxjd"   />
					</td>
				</tr>
				
				<tr>
					<td class="td_form01">
					付款比例(%)：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.tjgcfkbl" id="tjgcfkbl"   />
					</td>	
				
					<td class="td_form01">
					概算数(元)：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.gjgcgss" id="gjgcgss"   />
					</td>
					<td class="td_form01">
					土地出让合同(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.tjgctdcrht" id="tjgctdcrht"   />
					</td>
				</tr>
				
						<tr>
					<td class="td_form01">
					建筑用地许可证(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.tjgcydxk" id="tjgcydxk"   />
					</td>	
				
					<td class="td_form01">
					建筑规划许可证(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.tjgcghxk" id="tjgcghxk"   />
					</td>
					<td class="td_form01">
					建筑开工许可证(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.tjgckgxk" id="tjgckgxk"   />
					</td>
				</tr>
				
				<tr>
					<td class="td_form01">
						结算方式：
					</td>
					<td class="td_form02">
					    <s:textfield name="aeRealEstate.tjgcjsfs" id="tjgcjsfs"   />
					</td>
					<td width="120" class="td_form01">
						&nbsp;
					</td>
					<td class="td_form02">
						&nbsp;
					</td>
					<td width="120" class="td_form01">
						&nbsp;
					</td>
					<td  class="td_form02">
						&nbsp;
					</td>
				</tr>
				
				<tr>
					<td colspan="6" class="td_top" align="left">
					  账面价值
					</td>
				</tr>
				<tr>
						<td class="td_form01">
						原值：
						</td>
						<td class="td_form02">
							<s:textfield name="aeRealEstate.zmjzyz" id="zmjzyz"   />
						</td>	
				
					<td class="td_form01">
						净额：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.zmjzje" id="zmjzje"   />
					</td>
					<td class="td_form01">
						减值准备：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.zmjzjzzb" id="zmjzjzzb"   />
					</td>
					</tr>
					
					<tr>
					<td colspan="6" class="td_top" align="left">
					  拆分后账面价值
					</td>
				    </tr>
					<tr>
						<td class="td_form01">
						原值：
						</td>
						<td class="td_form02">
							<s:textfield name="aeRealEstate.cfhzmjzyz" id="cfhzmjzyz"   />
						</td>	
				
					<td class="td_form01">
						净植：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.cfhzmjzyz" id="cfhzmjzyz"   />
					</td>
					<td class="td_form01">
						减值准备：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.cfhzmjzjzzb" id="cfhzmjzjzzb" />
					</td>
				</tr>
				
				<tr>
					<td class="td_form01">
						净额：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.zfhzmjzje" id="zfhzmjzje"   />
					</td>
					<td width="120" class="td_form01">
						&nbsp;
					</td>
					<td class="td_form02">
						&nbsp;
					</td>
					<td width="120" class="td_form01">
						&nbsp;
					</td>
					<td  class="td_form02">
						&nbsp;
					</td>
				</tr>
				 	
				<tr>
					<td colspan="6" class="td_top" align="left">
					 评估价值
					</td>
				    </tr>
					<tr>
						<td class="td_form01">
						评估方法：
						</td>
						<td class="td_form02">
							<s:textfield name="aeRealEstate.pgff" id="pgff"   />
						</td>	
				
					
					    <td class="td_form01">
					     原值：
					    </td>
					     <td class="td_form02">
						<s:textfield name="aeRealEstate.scfwqcqjzyz" id="scfwqcqjzyz"   />
						</td>
						<td class="td_form01">
						成新率%：
						</td>
						<td class="td_form02">
							<s:textfield name="aeRealEstate.scfwqcqjzcxl" id="scfwqcqjzcxl"   />
						</td>
						</tr>
						<tr>
						<td class="td_form01">
						净值：
						</td>
						<td class="td_form02">
							<s:textfield name="aeRealEstate.scfwqcqjzjz"  id="scfwqcqjzjz"   />
						</td>

					    <td class="td_form01">
					     划拨地：
					    </td>
					     <td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.xczkhbd" id="xczkhbd"   />
						</td>
						<td class="td_form01">
						无土地证：
						</td>
						<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.xczkwtdz" id="xczkwtdz"  />
						</td>
						</tr>
						<tr>
						<td class="td_form01">
						无房产证：
						</td>
						<td class="td_form02">
							<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.xczkwfcz" id="xczkwfcz"   />
						</td>
						<td class="td_form01">
						存在纠纷：
						</td>
						<td class="td_form02">
							<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.xczkczjf" id="xczkczjf"   />
						</td>
						<td class="td_form01">
						其他：
						</td>
						<td class="td_form02">
						    <s:textfield name="aeRealEstate.xczkqt" id="xczkqt"   />
						</td>	
				</tr>
				
				
				<tr>
						<td class="td_form01">
						定向转让折扣%：
						</td>
						<td class="td_form02">
						    <s:textfield name="aeRealEstate.dxzrzk" id="dxzrzk" />
						</td>	
				
					<td class="td_form01">
						欠缴税费金额(不含土地出让金)：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.qjsfje" id="qjsfje"   />
					</td>
					<td class="td_form01">
						原值：
					</td>
					<td class="td_form02">
					    <s:textfield name="aeRealEstate.pgjzyz" id="pgjzyz"   />
					</td>
				</tr>
				
					<tr>
						<td class="td_form01">
						成新率%：
						</td>
						<td class="td_form02">
						    <s:textfield name="aeRealEstate.pgjzcxl" id="pgjzcxl"   />
						</td>	
				
					<td class="td_form01">
						净值：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.pgjzjz" id="pgjzjz"   />
					</td>
					<td class="td_form01">
						&nbsp;
					</td>
					<td class="td_form02">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td colspan="6" class="td_top" align="left">
					 &nbsp;
					</td>
				    </tr>
					<tr>
						<td class="td_form01">
						减值准备：
						</td>
						<td class="td_form02">
							<s:textfield name="aeRealEstate.jzzb" id="jzzb"   />
						</td>	
				
					<td class="td_form01">
						增值率%：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.zzl" id="zzl"   />
					</td>
					<td class="td_form01">
						评估单价(元/平方米)：
					</td>
					<td class="td_form02">
						<s:textfield name="aeRealEstate.pgdw" id="pgdw"   />
					</td>
				</tr>
				
	
				<tr>
					<td class="td_form01">
					是否需要评估(是/否)：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','0':'否','1':'是'}" name="aeRealEstate.sfxpg" id="sfxpg"   />
					</td>	
					<td width="120" class="td_form01">
						&nbsp;
					</td>
					<td class="td_form02">
						&nbsp;
					</td>
					<td width="120" class="td_form01">
						&nbsp;
					</td>
					<td  class="td_form02">
						&nbsp;
					</td>
			</tr>
			 
			  <tr>
				<td class="td_form01">
					资产管理建议:
				</td>
				<td class="td_form02" colspan="5">
					<s:textarea name="aeRealEstate.zcgljy"  id="zcgljy" cols="150" rows="4"></s:textarea>
				</td>
				</tr>
				<tr>
				<td class="td_form01">
					择机处置的原因：
				</td>
				<td class="td_form02" colspan="5">
					<s:textarea name="aeRealEstate.zjczyy"  id="zjczyy" cols="150" rows="4"></s:textarea>
				</td>
				</tr>
				
				<tr>
					<td class="td_form01">
					有处置障碍的原因：
					</td>
					<td class="td_form02" colspan="5">
						<s:textarea name="aeRealEstate.yczzayy"  id="yczzayy" cols="150" rows="4"></s:textarea>
					</td>	
			</tr>
			<tr>
				<td class="td_form01">
					备注:
				</td>
				<td class="td_form02" colspan="5">
					<s:textarea name="aeRealEstate.beizhu"  id="beizhu" cols="150" rows="4"></s:textarea>
				</td>
				</tr>
				
			</table>
			<%@ include file="/inc/file.inc"%>
			<s:submit value="关闭" type="button" onclick="closebody();return false;"/>
		</s:form>
	</body>
</html>