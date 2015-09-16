<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title>新增合同</title>

<SCRIPT language=JavaScript type=text/JavaScript>
	function windowOpen(theURL,winName,features,width,hight,scrollbars,top,left){
	  var parameter="top="+top+",left="+left+",width="+width+",height="+hight;
	  if(scrollbars=="no") {
	  	parameter+=",scrollbars=no";
	  }  else {
	  	parameter+=",scrollbars=yes";  	
	  }
	  window.open(theURL,winName,parameter);
	}
function contract(id){

	var i=document.getElementById("contract").selectedIndex;
	if(i==0){
		document.getElementById(id).selectedIndex=1;
		document.getElementById(id).disabled=true;
	}else{
		document.getElementById(id).disabled=false;
	}

}
	function displayCardType(index){
	
		for(var i=1;i<5;i++){
			if(index==i){
			   document.getElementById("card_type"+i).style.display="block";
			 }else{
			   document.getElementById("card_type"+i).style.display="none";
			
			}
		}
	}
function AddTable(){
	var td = TableBox.insertRow().insertCell();
	td.className = 'td_form02';
	td.colSpan = '9';
	td.innerHTML="<a href='#' onclick='TableBox.deleteRow(parentElement.parentElement.rowIndex)'>&nbsp;x&nbsp;</a>&nbsp;开始日期：<input   style='width:100' >&nbsp;结束日期：<input   style='width:100'>&nbsp;变动：<input style='width:100'   >&nbsp;月租金(元)：<input style='width:100'  >";
	}
function DeleteTr(){
	var No=TableBox.rows.length;
	for(i=0;i<No;i++)TableBox.deleteRow();
	}
	
	function showSubimtPage(){
		document.getElementById("subimtPage").style.display="block";
	}
	function cancleSubmit(){
		document.getElementById("subimtPage").style.display="none";

	}
</SCRIPT>

</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br/>
<table width="95%" border="0" cellpadding="2" cellspacing="0" align="center"  >
	  <tr>
		<td width="105"  class="td07" valign="baseline">合同类型:</td>
		<td width="1151"  class="td07"><form name="form1" method="post" action="">
		  <label>
		  <input type="radio" name="radiobutton" value="radiobutton" onClick="displayCardType(1)" checked="checked" />
			租赁合同</label>
		  <label>
		  <input type="radio" name="radiobutton" value="radiobutton" onClick="displayCardType(2)"/>
			委管合同</label>
		  <label>
		  <input type="radio" name="radiobutton" value="radiobutton" onClick="displayCardType(3)"/>
			车险合同</label>
			<label>
		  <input type="radio" name="radiobutton" value="radiobutton" onClick="displayCardType(4)"/>
			非车险合同</label>
		</form></td>
	  </tr>

	 
	</table>

<table  class="newtable" width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
	<td align="right">
	<table id="purchase_list" width="100%"></table>
	  <div id="pgtoolbar1"></div>
	</td>
  </tr>
</table>

	
	<div  id="card_type1"  style="display:block" >
 <table width="95%"  border="0" cellspacing="2" cellpadding="0" align="center" class="newtable" >
 <!--
    <tr>
	 <td class="td_form01" >资产编号：</td>
      <td class="td_form02"  ><input  type="text"   size="30" value="1212233123123">      </td>
	  <td class="td_form01"  >资产名称：</td>
      <td class="td_form02"  ><input name="textfield2234" type="text"   size="30" value="捷达小轿车"></td>
    </tr>
	-->
	<tr><td colspan="4">合同信息</td></tr>
	
	 <tr>
	 <td  width="11%" class="td_form01">合同编号：</td>
      <td width="39%" class="td_form02"><input  type="text"    size="30"  />
	  <input   type="button"value="生成" ></td>
	  <td width="11%" class="td_form01">实物合同编号：</td>
      <td width="39%" class="td_form02"><input  type="text" size="30"></td>
    </tr>
	 <tr>
       <td  class="td_form01">合同状态：</td>
       <td  class="td_form02"  ><select><option>执行中</option><option>待执行</option><option>执行完毕</option></select></td>
     <td class="td_form01">承租人：</td>
      <td class="td_form02"  ><input  type="text"    size="30"/></td>
    </tr>
	<tr>
      <td class="td_form01">承租人性质：</td>
      <td class="td_form02"  ><select name="select2">
          <option value="1"  selected="selected">企业法人</option>
          <option value="2">企业分支机构</option>
          <option value="3">企业其他</option>
          <option value="4">事业法人</option>
          <option value="5">事业其他</option>
		  <option value="6">社团法人</option>
          <option value="7">社团其他</option>
		  <option value="8">行政机构</option>
          <option value="9">民办非企业机构</option>
		  <option value="10">个体</option>
          <option value="11">工会法人</option>
		  <option value="12">其他</option>
		</select>      </td>
     <td class="td_form01">承租联系人：</td>
      <td class="td_form02"><input name="textfield3" type="text"   id="textfield3" size="30"></td>
    </tr>
   
   
    <tr>
      <td class="td_form01">承租方联系电话：</td>
      <td class="td_form02"><input    type="text"   size="30" ></td>
      <td class="td_form01">交易对象：</td>
      <td class="td_form02">
	  <select id="contract"  onchange="contract('way')">
	  		<option value="1">建行</option>
	    	<option value="2" selected="selected">非建行</option>
	  </select></td>
    </tr>
   
    <tr>
	 <td class="td_form01">承租数量：</td>
      <td class="td_form02"><input    type="text"   size="30"  ></td>
      <td class="td_form01"> 租金价格：</td>
      <td class="td_form02"><input name="textfield9" type="text"   id="textfield9" size="30" ></td>
	   </tr>
	
	<tr>
      <td class="td_form01"  >月租金：</td>
      <td  colspan="5"  rowspan="">
	  		<table width="100%" >
	  			<tr>
	  				<td  colspan="5">
						<table width="100%"  border="0" cellspacing="0" cellpadding="0"  >
							<tr>
								<td class="td_form02">
										<a href="#"  onclick="AddTable()">&nbsp;+ &nbsp;</a>阶段性月租金								</td>
							</tr>
						</table>
						<table id="TableBox"  width="100%"  border="0" cellspacing="0" cellpadding="0">
						<tr>
						<td  class="td_form02"><a href="#" onclick='TableBox.deleteRow(parentElement.parentElement.rowIndex)'>&nbsp;x&nbsp;</a>
							开始日期：<input   style='width:100' />
						结束日期：<input   style='width:100'/>
						变动：<input style='width:100'   />
						月租金(元)：<input style='width:100'  />						</td>
						</tr>
					    </table>			        </td>
	  			</tr>
	  		</table>	   </td>
      </tr>
	  <tr>
      <td class="td_form01">结算方式：</td>
      <td class="td_form02"> 
	  <select id="way">
	 		<option  selected="selected">月付</option>
	  		<option >季付</option>
			<option >半年付</option>
	    	<option >年付</option>
			<option >其他</option>
	  </select></td>
   
      <td class="td_form01"> 年租金价格：</td>
      <td class="td_form02" ><input name="textfield9" type="text"   id="textfield9" size="30" ></td>
    </tr>
	 <tr>
	  <td class="td_form01">租金支付方式：</td>
      <td class="td_form02" ><select>
	  		<option value="1">期初支付</option>
	    	<option value="2">期末支付</option>
	  </select></td>
	  <td class="td_form01">当地同类房屋的租金价格（元）：</td>
      <td class="td_form02" ><input    type="text"   size="30" ></td>
    </tr>
	 <tr>
	   <td class="td_form01">本次清算调整金额（元）：</td>
	   <td class="td_form02"  >&nbsp;</td>
	   <td class="td_form01">&nbsp;</td>
	   <td class="td_form02"  >&nbsp;</td>
    </tr>
	 <tr>
	   <td colspan="4" class="td_form01">&nbsp;</td>
    </tr>
    <tr>
      <td class="td_form01">累计租金(元)：</td>
      <td class="td_form02"  ><input    type="text"   size="30" ></td>
      <td class="td_form01">租赁收益成本率(%)：</td>
      <td class="td_form02"  >&nbsp;</td>
    </tr>
	<tr>
      <td class="td_form01">押金(元)：</td>
      <td class="td_form02"  ><input  type="text"    size="30"></td>
	   <td class="td_form01">已收押金(元)：</td>
      <td class="td_form02"  ><input  type="text"    size="30"></td>
    </tr>
	<tr>
     
      <td class="td_form01">违约金(元)：</td>
      <td class="td_form02"  ><input  type="text"    size="30"></td>
	  <td class="td_form01">已收违约金(元)：</td>
      <td class="td_form02"  ><input  type="text"    size="30"></td>
    </tr>
	<tr>
      <td class="td_form01">合同起始日期：</td>
      <td class="td_form02"  ><input  type="text"    size="30"  ></td>
      <td class="td_form01">合同到期日期：</td>
      <td class="td_form02"  ><input  type="text"    size="30"></td>
    </tr>
	<tr>
      <td class="td_form01">免租起始日期：</td>
      <td class="td_form02"  ><input  type="text"    size="30"></td>
      <td class="td_form01">免租到期日期：</td>
      <td class="td_form02"  ><input  type="text"    size="30"></td>
    </tr>
	<tr>
      <td class="td_form01">上次清算日期：</td>
      <td class="td_form02"  ><input  type="text"    size="30"></td>
      <td class="td_form01">上次清算截止日期：</td>
      <td class="td_form02"  ><input  type="text"    size="30"></td>
    </tr>
	<tr>
      <td class="td_form01">承租人地址：</td>
      <td class="td_form02"  ><input  type="text"    size="30"></td>
      <td class="td_form01">承租人法定地址：</td>
      <td class="td_form02"  ><input  type="text"    size="30"></td>
    </tr>
	
   <tr> 
	    <td height="63" class="td_form01">租贷用途：</td>
      <td class="td_form02" colspan="5"><textarea name="textarea" cols="150" rows="4">
xxxxxxxxxxxxxxxxxxxxx</textarea></td>
    </tr>
	 <tr>
      <td class="td_form01">录入人：</td>
      <td class="td_form02"><input  type="text"   size="30" value="王芊"></td>
	  <td class="td_form01">录入日期：</td>
       <td class="td_form02"  ><input  type="text"   size="30" value="2010-8-10"></td>
	 </tr>
	  <tr>
        <td nowrap class="td_form01">附件：</td>
        <td colspan="5" class="td_form02">
			<table width="100%" height="100%" border="0" align="center"cellpadding="5" cellspacing="0" class="table01" id="fileTab3">
				<tr>
					 <td colspan="2" align="right" class="td03">
					  <input type="file" name="file4" id="fi3" style="display: none;" onChange="addRow(this,'fileTab3')"/>
					  <input type="button" class="buttonface" value="选择文件..." onClick="fi3.click();" name="optionButton4" />					 								 					</td>
				</tr>
			</table>		</td>
    </tr>	
	</table>	
</div>	

<div  id="card_type2"  style="display:none" >
 <table width="95%" cellpadding="0" cellspacing="2"  border="0" align="center"  class="newtable" >
<!--
<tr>
<td colspan="6"  class="td_top" align="left">合同信息 </td>
</tr>
 <tr>
	 <td class="td_form01" >资产编号：</td>
      <td class="td_form02" ><input type="text" size="30"></td>
	  <td class="td_form01">资产名称：</td>
      <td class="td_form02" ><input type="text" size="30"></td>
    </tr>
	-->
	<tr><td colspan="4">合同信息</td></tr>
	<tr>
	   <td class="td_form01">合同编号：</td>
      <td class="td_form02"><input  type="text"    size="30"/>
	  <input  type="button"value="生成"></td>
       <td class="td_form01">交易对象：</td>
      <td class="td_form02">
	  <select >
	  		<option value="1" selected="selected">建行</option>
	    	<option value="2">实体</option>
	  </select>
	 </td>
	</tr>
	 <tr>
	   <td  class="td_form01">合同状态：</td>
       <td  class="td_form02"  ><select><option>执行中</option><option>待执行</option><option>执行完毕</option></select></td>
   	   <td class="td_form01">一级分行：</td>
       <td class="td_form02">
	   <select>
	  		<option value="1" selected="selected"></option>
	    	<option value="2">总行本级</option>
		    <option value="3">北京市分行</option>
		    <option value="4">天津市分行</option>
			<option value="4">河北省分行</option>
			<option value="4">内蒙古区分行</option>
	  </select>	  </td>
 </tr>
	
	 <tr>
	  <td class="td_form01">委托管理单位：</td>
      <td class="td_form02">
	  <select >
	  		<option value="1" selected="selected">建行</option>
	    	<option value="2">大连建兴达物业管理有限公司</option>
		    <option value="3">陕西恒信物业管理有限公司</option>
		    <option value="4">山东建银金融服务有限公司</option>
			<option value="5">广州市建银物业管理有限公司</option>
			<option value="6">贵州建银物业管理有限公司</option>
	  </select>
	  </td>
	   <td class="td_form01">委托管理原值(元)：</td>
       <td class="td_form02"  ><input name="textfield2232" type="text"   id="textfield2232" size="30"></td>
	</tr>
	<tr>
		<td class="td_form01">委托费用比例(%)：</td>
      <td class="td_form02"  >&nbsp;</td>
      
	  <td class="td_form01">委托管理价格(元)：</td>
      <td class="td_form02"  ><input  type="text"    size="30"></td>
    </tr>
	<tr>
      <td class="td_form01">委托管理数量：</td>
      <td class="td_form02"  ><input  type="text"    size="30"></td>
	  <td class="td_form01">月委托管理费(元)：</td>
      <td class="td_form02"  ><input name="textfield2233" type="text"   id="textfield2233" size="30"/>      </td>
    </tr>
	<tr>
	 <td class="td_form01">累计实收委管费(元)：</td>
      <td class="td_form02"  ><input  type="text"    size="30"/>      </td>
      <td class="td_form01">累计应收委管费(元)：</td>
      <td class="td_form02"  ><input name="textfield2233" type="text"   id="textfield2233" size="30"/>      </td>
    </tr>
	<tr>
      <td class="td_form01">合同起始日期：</td>
      <td class="td_form02"  ><input  type="text"    size="30"></td>
      <td class="td_form01">合同到期日期：</td>
      <td class="td_form02"  ><input  type="text"    size="30"></td>
    </tr>
	<tr>
      <td class="td_form01">上次清算日期：</td>
      <td class="td_form02"  ><input  type="text"    size="30"></td>
      <td class="td_form01">上次清算截止日期：</td>
      <td class="td_form02"  ><input  type="text"    size="30"></td>
    </tr>
	<tr>
      <td class="td_form01">本次清算调整金额（元）：</td>
      <td class="td_form02"  ><input  type="text"    size="30"></td>
      <td class="td_form01"></td>
      <td class="td_form02" ></td>
    </tr>
	<tr>
      <td class="td_form01">结算方式：</td>
      <td class="td_form02"  ><select  disabled="disabled">
		    <option value="5">月付</option>
		    <option value="1" selected="selected">季付</option>
			<option value="2">半年付</option>
	    	<option value="3">年付</option>
			<option value="4">其他</option></select>
			</td>
      <td class="td_form01">度量单位：</td>
      <td class="td_form02"  >
	  <select>
	  		<option value="1" selected="selected">个</option>
	    	<option value="2">平方米</option>
	  </select>	  </td>
    </tr>
	<tr>
      <td class="td_form01">录入人：</td>
      <td class="td_form02"  ><input  type="text"   size="30" value="王芊"></td>
      <td class="td_form01">录入日期：</td>
      <td class="td_form02"  ><input  type="text"   size="30" value="2010-8-10"></td>
    </tr>
    <tr>
        <td nowrap class="td_form01">附件：</td>
        <td colspan="5" class="td_form02">
			<table width="100%" height="100%" border="0" align="center"cellpadding="5" cellspacing="0" class="table01" id="fileTable4">
				<tr>
					 <td colspan="2" align="right" class="td03">
					  <input type="file" name="file4" id="file4" style="display: none;" onChange="addRow(this,'fileTable4')"/>
					  <input type="button" class="buttonface" value="选择文件..." onClick="file4.click();" name="optionButton4" />					 								 					</td>
				</tr>
			</table>
		</td>
    </tr>	
	
</table>
</div>	
<div  id="card_type3"  style="display:none" >
<table width="95%" class="newtable"  border="0" cellspacing="2" cellpadding="0" align="center" >
	<tr>
      <td colspan="4">合同信息</td>
    </tr>
	<tr>
	   <td class="td_form01">合同编号：</td>
      <td class="td_form02"><input  type="text"    size="30"/>
	  <input  type="button"value="生成"></td>
       <td class="td_form01">实物合同编号：</td>
      <td class="td_form02">
	  <input  type="text"    size="30"/>
	 </td>
	</tr>
	 <tr>
	   <td  class="td_form01">合同状态：</td>
       <td  class="td_form02"  ><select><option>执行中</option><option>待执行</option><option>执行完毕</option></select></td>
   	   <td class="td_form01">一级分行：</td>
       <td class="td_form02">
	   <select> 
	  		<option value="1" selected="selected"></option>
	    	<option value="2">总行本级</option>
		    <option value="3">北京市分行</option>
		    <option value="4">天津市分行</option>
			<option value="4">河北省分行</option>
			<option value="4">内蒙古区分行</option>
	  </select>	  </td>
 </tr>
    <tr>
	 <td class="td_form01">保险公司名称：</td>
      <td class="td_form02"><input name="textfield24" type="text"   size="30"  ></td>
      <td class="td_form01">保险公司地址：</td>
      <td class="td_form02"><input name="textfield24" type="text"    size="30"  ></td>
    </tr>
	<tr>
	  <td class="td_form01">保险公司联系人：</td>
	  <td class="td_form02"><input name="textfield24" type="text"   size="30"  ></td>
	  <td class="td_form01">联系人电话：</td>
	  <td class="td_form02"><input name="textfield24" type="text"   size="30"  ></td>
    </tr>
	<tr>
	  <td  class="td_form01">车牌号：</td>
      <td  class="td_form02"><input name="textfield3" type="text"  id="textfield3" size="30" ></td>
	  <td  class="td_form01">&nbsp;</td>
      <td  class="td_form02">&nbsp;</td>
	</tr>
	 
	  <tr>
	   <td  class="td_form01">商业险保费(元)：</td>
      <td class="td_form02"  colspan="3"><input  type="text"   size="30" ></td>
    </tr>
	 <tr>
      <td  class="td_form01">商业险保险开始日期：</td>
      <td class="td_form02"><input  type="text"   size="30"></td>
      <td  class="td_form01">商业险保险结束日期：</td>
      <td class="td_form02"><input  type="text"   size="30" ></td>
    </tr>
	 <tr>
	  <td class="td_form01">交强险保费(元)：</td>
      <td class="td_form02" colspan="3"><input name="textfield3" type="text"  id="textfield3" size="30" ></td>
    </tr>
		 <tr>
      <td  class="td_form01">交强险保险开始日期：</td>
      <td class="td_form02"><input  type="text"   size="30" ></td>
      <td  class="td_form01">交强险保险结束日期：</td>
      <td class="td_form02"><input  type="text"   size="30" ></td>
    </tr>
	<tr>
      
     <td class="td_form01">车船税金额(元)</td>
      <td class="td_form02" colspan="3"><input name="textfield3" type="text"  id="textfield3" size="30"></td>
    </tr>
    <tr>
      <td class="td_form01">税费合计(元)：</td>
      <td class="td_form02" valign="middle"><input name="textfield3" type="text"  id="textfield3" size="30" ></td>
     <td class="td_form01">&nbsp;</td>
      <td class="td_form02">&nbsp;</td>
    </tr>
	 <tr>
        <td nowrap class="td_form01">附件：</td>
        <td colspan="5" class="td_form02">
			<table width="100%" height="100%" border="0" align="center"cellpadding="5" cellspacing="0" class="table01" id="fileTable4">
				<tr>
					 <td colspan="2" align="right" class="td03">
					  <input type="file" name="file4" id="file4" style="display: none;" onChange="addRow(this,'fileTable4')"/>
					  <input type="button" class="buttonface" value="选择文件..." onClick="file4.click();" name="optionButton4" />					 								 					</td>
				</tr>
			</table>
		</td>
    </tr>	
	</table>	
</div>
<div  id="card_type4"  style="display:none" >
<table width="95%"  class="newtable"  border="0" cellspacing="2" cellpadding="0" align="center" >
	<tr>
      <td colspan="4" >合同信息</td>
    </tr>
	<tr>
	   <td class="td_form01">合同编号：</td>
      <td class="td_form02"><input  type="text"    size="30"/>
	  <input  type="button"value="生成"></td>
       <td class="td_form01">实物合同编号：</td>
      <td class="td_form02">
	  <input  type="text"    size="30"/>
      </td>
	</tr>
	 <tr>
	   <td  class="td_form01">合同状态：</td>
       <td  class="td_form02"  ><select><option>执行中</option><option>待执行</option><option>执行完毕</option></select></td>
   	   <td class="td_form01">一级分行：</td>
       <td class="td_form02">
	   <select>
	  		<option value="1" selected="selected"></option>
	    	<option value="2">总行本级</option>
		    <option value="3">北京市分行</option>
		    <option value="4">天津市分行</option>
			<option value="4">河北省分行</option>
			<option value="4">内蒙古区分行</option>
	  </select>	  </td>
 </tr>
    <tr>
	 <td class="td_form01">保险公司名称：</td>
      <td class="td_form02"><input name="textfield24" type="text"   size="30"  ></td>
      <td class="td_form01">保险公司地址：</td>
      <td class="td_form02"><input name="textfield24" type="text"    size="30"  ></td>
    </tr>
	<tr>
	  <td class="td_form01">保险公司联系人：</td>
	  <td class="td_form02"><input name="textfield24" type="text"   size="30"  ></td>
	  <td class="td_form01">联系人电话：</td>
	  <td class="td_form02"><input name="textfield24" type="text"   size="30"  ></td>
    </tr>
	 <tr>
      <td  class="td_form01">机器损坏险保险费率(%)：</td>
      <td class="td_form02"><input  type="text"   size="30" ></td>
      <td class="td_form01">机器损坏险保费(元)：</td>
      <td class="td_form02"><input name="textfield3" type="text"  id="textfield3" size="30" ></td>
    </tr>
	 <tr>
      <td  class="td_form01">机器损坏险开始日期：</td>
      <td class="td_form02"><input  type="text"   size="30" ></td>
      <td  class="td_form01">机器损坏险结束日期：</td>
      <td class="td_form02"><input  type="text"   size="30"></td>
    </tr>
	 <tr>
      <td  class="td_form01">公众责任保险保险费率(%)：</td>
      <td class="td_form02"><input  type="text"   size="30"></td>
      <td class="td_form01">公众责任保险保费(元)：</td>
      <td class="td_form02"><input name="textfield3" type="text"  id="textfield3" size="30" ></td>
    </tr>
	 <tr>
      <td  class="td_form01">公众责任保险开始日期：</td>
      <td class="td_form02"><input  type="text"   size="30"></td>
      <td  class="td_form01">公众责任保险结束日期：</td>
      <td class="td_form02"><input  type="text"   size="30"></td>
    </tr>
	 <tr>
      <td  class="td_form01">财产险及附加地震险保险费率(%)：</td>
      <td class="td_form02"><input  type="text"   size="30" ></td>
      <td class="td_form01">财产险及附加地震险保费(元)：</td>
      <td class="td_form02"><input name="textfield3" type="text"  id="textfield3" size="30" ></td>
    </tr>
	 <tr>
      <td  class="td_form01">财产险及附加地震险开始日期：</td>
      <td class="td_form02"><input  type="text"   size="30"  ></td>
      <td  class="td_form01">财产险及附加地震险结束日期：</td>
      <td class="td_form02"><input  type="text"   size="30" ></td>
    </tr>
	 <tr>
        <td nowrap class="td_form01">附件：</td>
        <td colspan="5" class="td_form02">
			<table width="100%" height="100%" border="0" align="center"cellpadding="5" cellspacing="0" class="table01" id="fileTable4">
				<tr>
					 <td colspan="2" align="right" class="td03">
					  <input type="file" name="file4" id="file4" style="display: none;" onChange="addRow(this,'fileTable4')"/>
					  <input type="button" class="buttonface" value="选择文件..." onClick="file4.click();" name="optionButton4" />					 								 					</td>
				</tr>
			</table>
		</td>
    </tr>	
	</table>
	</div>
<table width="95%"  class="newtable"   border="0" cellspacing="2" cellpadding="0" align="center" >
	<tr ><td align="right" colspan="4">
		<input type="button" value="确定" class="buttonface02"/>
	    <input  type="submit" onClick="" class="buttonface" value="关闭"/>
		</td>
	</tr>
</table>
</body>
</html>
<script type="text/javascript">
$(function(){	
				//在列表的标题右端添加按钮，最后一个按钮距右端20px
				$("#gview_purchase_list> .ui-jqgrid-titlebar").append("\
					<a href='#' id='add_card' class='easyui-linkbutton' iconCls='icon-add'>增加</a>\
					<a href='#' id='delete_card' class='easyui-linkbutton' iconCls='icon-remove'  style='margin-right:20px'>删除</a>\
				");
				
				$('#add_card,#delete_card,#update_card').linkbutton({
	                    duration: 9999999999,
						plain:true
			    });
				$("#delete_card").click(function(){
					confirm("确认要删除吗");
				});
				$("#add_card").click(function(){
					window.open('../asset/assetList2.html','','height=500, width=800, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				});
			});

                                        jQuery("#purchase_list").jqGrid({       
                                            datatype: "local",    
                                            colNames: ['资产编号', '资产名称','资产类型','主卡片编号','主卡片名称','地区','原币原值'],
                                            colModel: [
											{
                                                name: 'zcbh',
                                                index: 'zcbh',
												align: "center"
                                            },{
                                                name: 'zcmc',
                                                index: 'zcmc',
												align: "center"
                                            },  {
                                                name: 'jyfl',
                                                index: 'jyfl',
												align: "center"
                                            },  {
                                                name: 'zclx',
                                                index: 'zclx',
												align: "center"
                                            },{
                                                name: 'zczt',
                                                index: 'zczt',
												align: "center"
                                            },{
                                                name: 'sybm',
                                                index: 'sybm',
												align: "center"
                                            },{
                                                name: 'ybyz',
                                                index: 'sybm',
												align: "center"
                                            }],
										    height: 'auto',
                                            autowidth: true,
                                            multiselect: true,
                                            caption: '资产列表',
											pager: '#pgtoolbar1',
                                            toolbar: [true, "top"]
                                        });
                                        var mydata = [{    
                                           zcbh: '<a href="#" onClick="javascript:openwindow(\'../asset/asset-info.html\',\'\',800,500)">2110030100002375</a>'
                                         }];
                                        for (var i = 0; i <= mydata.length; i++) 
                                            jQuery("#purchase_list").jqGrid('addRowData', i + 1, mydata[i]);
										
                                        jQuery("#purchase_list").jqGrid('navGrid', '#pgtoolbar1', {
                                            edit: false,
                                            add: false,
                                            del: false
                                        });
							 $(window).bind('resize', function(){
                                     var size = getWidthAndHeigh(true);
                                            jQuery("#purchase_list").setGridWidth(size.width * 0.95);
                                        });  
                                      
							 </script>
