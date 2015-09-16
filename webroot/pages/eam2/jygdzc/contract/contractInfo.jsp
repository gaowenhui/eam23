<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>合同信息</title>
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
	function displayUpperLayer(index){
		for(var i=0;i<4;i++){
			if(index==i){
			   document.getElementById("upperLayer"+i).style.display="block";
			}else{
			   document.getElementById("upperLayer"+i).style.display="none";
			}
		}
	}
	function AddTable(){
	var td = TableBox.insertRow().insertCell();
	td.className = 'td_zxy02';
	td.colSpan = '9';
	td.innerHTML="<a href='#' onclick='TableBox.deleteRow(parentElement.parentElement.rowIndex)'>&nbsp;x&nbsp;</a>&nbsp;开始日期:<input class='input'style='width:100'>&nbsp;结束日期:<input class='input' style='width:100'>&nbsp;变动:<input style='width:100' class='input'>&nbsp;月租金:<input style='width:100' class='input'>";
	}

	//生成编号
	function createBianhao(){
		var headId="${headId}";
	    alert("headId");
		if(document.getElementById("htbh").value!=""){
			alert("已生成编号！");
			return false;
		}
		$.post("<%=basePath %>/jygdzc/AssetManageHead_createNum.do",{
			"headId":headId,
			"code":"jjgdzc_agentmanger"
		},function(data){
			document.getElementById("htbh").value = data;
		});
	}	

</SCRIPT>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<form action="<%=request.getContextPath() %>/htqs/ContractManageBody_savebiandong.do" method='post'>

<s:textfield type="text"  name="jjzcHtZlwgLsb.id" id="id"   size="40" /><br/>
<div style="display:none" >
<input type="text"  name="id" id="id"  value="${headId}" size="40" /><br/>

<s:hidden name="jjzcHtZlwgLsb.cldId"  value="%{#request.jjzcHtZlwgLsb.cldId}"/>
<input type="text"  name="headId" value="${headId}" size="40" /><br/>
<input type="text"  name="head.id" value="${headId}"  size="40" /><br>
<input type="text" name="head.lcmc" value="${sheettype}" />
</div>
<s:set name="biaodanid" value="head.id" />

<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<s:hidden name="deptid" value="11318" />
<table width="100%" border="0" cellspacing="0" cellpadding="0"   id="sss">
  <tr>
    <td height="25" align="center" valign="bottom" class="td06">
		<table width="100%" border="0" cellspacing="3" cellpadding="0">
		  <tr>
			<td width="15"><img src="../../images/index_32.gif" width="9" height="9"></td>
			<td valign="bottom" class="title">合同信息</td>
		  </tr>
		</table>
	</td>
  </tr>
</table>

<TABLE  align="center" border=0 id="upperTable" style="border-color:blue; " width="100%">
	<TR oncontextmenu='return false' ondragstart='return false' onselectstart ='return false' onselect='document.selection.empty()' oncopy='document.selection.empty()' onbeforecopy='return false' onmouseup='document.selection.empty()'>
	   <TD class="clicked" onClick="displayUpperLayer(0)">合同信息</TD>
	   <TD class="ttd"  onClick="displayUpperLayer(1)">变动记录</TD>
	   <TD class="ttd"  onClick="displayUpperLayer(2)">资产信息</TD>
	   <TD class="ttd"  onClick="displayUpperLayer(3)">清算信息</TD>
	</TR>
</TABLE>
<div  style="display:block" id="upperLayer0">

		<table width="100%"  border="0" cellspacing="2" cellpadding="0" align="center">
	<tr>
      <td colspan="6" class="td_top" align="left">合同信息</td>
    </tr>
	
    <tr>
	 <td class="td_zxy01">资产编号</td>
      <td class="td_zxy02" valign="middle"><s:textfield name="jjzcHtZlwgLsb.zcbh"  value="%{#request.jjzcHtZlwgLsb.zcbh}"  class="input" size="30"  />
     </td>
	  <td class="td_zxy01">资产名称</td>
      <td class="td_zxy02" valign="middle"><s:textfield name="jjzcHtZlwgLsb.zcmc" class="input"  value="%{#request.jjzcHtZlwgLsb.zcmc}" size="30" /></td>
    </tr>

	 <tr>
      <td class="td_zxy01">录入人</td>
      <td class="td_zxy02"><s:textfield name="jjzcHtZlwgLsb.lrr"  value="%{#request.jjzcHtZlwgLsb.lrr}"  class="input" size="30"  /></td>
	  <td class="td_zxy01">录入日期</td>
       <td class="td_zxy02" valign="middle"><s:date name="jjzcHtZlwgLsb.lrrq" format="yyyy-MM-dd" var="draftDate"/>
         <s:textfield id="ngrq" name="jjzcHtZlwgLsb.lrrq"  value="%{#request.jjzcHtZlwgLsb.lrrq}" cssClass="input" value="%{#draftDate}" readonly="true" /></td>
	 </tr>
	 <tr>
      <td class="td_zxy01">交易对象</td>
      <td class="td_zxy02">
	  <s:select list="#{'':'',0:'建行',1:'非建行'}" name="jjzcHtZlwgLsb.jydx"  value="%{#request.jjzcHtZlwgLsb.jydx}" id="jydx" />
	  </td>
	  <td class="td_zxy01">合同编号</td>
      <td class="td_zxy02"><s:textfield name="jjzcHtZlwgLsb.htbh" id="htbh" class="input" size="30" value="%{#request.jjzcHtZlwgLsb.htbh}"/>
	 </td>
    </tr>
	 <tr>
      <td class="td_zxy01">合同状态</td>
      <td class="td_zxy02" valign="middle"><s:textfield name="jjzcHtZlwgLsb.htzt" value="%{#request.jjzcHtZlwgLsb.htzt}" class="input" size="30"  /></td>
     <td class="td_zxy01">承租人</td>
      <td class="td_zxy02" valign="middle"><s:textfield name="jjzcHtZlwgLsb.czr" value="%{#request.jjzcHtZlwgLsb.czr}" class="input" size="30"  /></td>
    </tr>
	<tr>
      <td class="td_zxy01">承租人性质</td>
      <td class="td_zxy02" valign="middle">
         <e:select parRefKey="RENTER_PROPERTY" list="#{}" name="jjzcHtZlwgLsb.czrxz" value="%{#request.jjzcHtZlwgLsb.czrxz}"  /> </td>
     <td class="td_zxy01">承租联系人</td>
      <td class="td_zxy02"><s:textfield name="jjzcHtZlwgLsb.czlxr" value="%{#request.jjzcHtZlwgLsb.czlxr}" class="input" size="30" /></td>
    </tr>
   
   
    <tr>
      
      <td class="td_zxy01">承租数量</td>
      <td class="td_zxy02"><s:textfield name="jjzcHtZlwgLsb.czsl"  value="%{#request.jjzcHtZlwgLsb.czsl}" class="input" size="30" /></td>
	  <td class="td_zxy01">承租方联系电话：</td>
      <td class="td_zxy02"><s:textfield name="jjzcHtZlwgLsb.czflxfs" value="%{#request.jjzcHtZlwgLsb.czflxfs}" class="input" size="30" /></td>
    </tr>
   
    <tr>
      <td class="td_zxy01"> 租金价格</td>
      <td class="td_zxy02"><s:textfield name="jjzcHtZlwgLsb.zjjg" class="input" size="30" value="%{#request.jjzcHtZlwgLsb.zjjg}"/>（元）</td>
      <td class="td_zxy01">租金结算方式  </td>
      <td class="td_zxy02"> 
	
	  <s:select list="#{'0':'季付','1':'年付'}" name="jjzcHtZlwgLsb.CZjjsfs"  value="%{#request.jjzcHtZlwgLsb.CZjjsfs}"></s:select>
	  </td>
    </tr>
	<tr>
      <td class="td_zxy01"> 年租金价格</td>
      <td class="td_zxy02" colspan="3"><s:textfield name="jjzcHtZlwgLsb.nzjjg" class="input" size="30" value="%{#request.jjzcHtZlwgLsb.nzjjg}"/>（元）</td>
    </tr>
	<tr>
      <td class="td_zxy01"  >月租金</td>
      <td  colspan="5"  rowspan="">
	  		<table width="100%" >
	  			<tr>
	  				<td  colspan="5">
						<table width="100%"  border="0" cellspacing="0" cellpadding="0"  >
						<tr>
						<td  class="td_zxy02" colspan="7"><s:textfield name="jjzcHtJdzj.yzj" class="input" size="30" value="%{#request.jjzcHtJdzj.yzj}"/>（元）</td>
						</tr>
							<tr>
								<td class="td_zxy02">
										<a href="#"  onclick="AddTable()">&nbsp;+ &nbsp;</a>阶段性月租金
								</td>
							</tr>
						</table>
						<table id="TableBox"  width="100%"  border="0" cellspacing="0" cellpadding="0">
						
					    </table>			        </td>
	  			</tr>
	  		</table>	   </td>
      </tr>
	 <tr>
	  <td class="td_zxy01">租金支付方式</td>
      <td class="td_zxy02" colspan="3">
      <s:select list="#{'0':'期初支付','1':'期末支付'}" name="jjzcHtZlwgLsb.CZjjsfs" name="jjzcHtZlwgLsb.CZjjsfs" value="%{#request.jjzcHtZlwgLsb.CZjjsfs}"></s:select>
      </td>
    </tr>
	<tr>
      <td class="td_zxy01">累计租金</td>
      <td class="td_zxy02" valign="middle"><s:textfield name="jjzcHtZlwgLsb.ljzj" class="input" size="30" value="%{#request.jjzcHtZlwgLsb.ljzj}"/>（元）</td>
      <td class="td_zxy01">租赁收益成本率</td>
      <td class="td_zxy02" valign="middle">%</td>
    </tr>
	<tr>
      <td class="td_zxy01">本次清算调整金额</td>
      <td class="td_zxy02" valign="middle"><s:textfield name="jjzcHtZlwgLsb." class="input" size="30" value="%{#request.jjzcHtZlwgLsb.ljzj}"/></td>
      <td class="td_zxy01">押金</td>
      <td class="td_zxy02" valign="middle"><s:textfield name="jjzcHtZlwgLsb.ljzj" class="input" size="30" value="%{#request.jjzcHtZlwgLsb.ljzj}"/>（元）</td>
    </tr>
	<tr>
      <td class="td_zxy01">已收押金</td>
      <td class="td_zxy02" valign="middle"><s:textfield name="jjzcHtZlwgLsb.ljzj" class="input" size="30" value="%{#request.jjzcHtZlwgLsb.ljzj}"/>（元）</td>
      <td class="td_zxy01">违约金</td>
      <td class="td_zxy02" valign="middle"><s:textfield name="jjzcHtZlwgLsb.ljzj" class="input" size="30" value="%{#request.jjzcHtZlwgLsb.ljzj}"/>（元）</td>
    </tr>
	<tr>
      <td class="td_zxy01">合同起始日期</td>
      <td class="td_zxy02" valign="middle"><s:textfield name="jjzcHtZlwgLsb.htqsrq" class="input" size="30" value="%{#request.jjzcHtZlwgLsb.htqsrq}"/></td>
      <td class="td_zxy01">合同到期日期</td>
      <td class="td_zxy02" valign="middle"><s:textfield name="jjzcHtZlwgLsb.htdqrq" class="input" size="30" value="%{#request.jjzcHtZlwgLsb.htdqrq}"/></td>
    </tr>
	<tr>
      <td class="td_zxy01">已收违约金</td>
      <td class="td_zxy02" valign="middle"><s:textfield name="jjzcHtZlwgLsb.yswyj" class="input" size="30" value="%{#request.jjzcHtZlwgLsb.yswyj}"/>（元）</td>
      <td class="td_zxy01"></td>
      <td class="td_zxy02" valign="middle"><input name="textfield223" type="text" class="input" id="textfield223" size="30"></td>
    </tr>
	<tr>
      <td class="td_zxy01">免租起始日期</td>
      <td class="td_zxy02" valign="middle"><s:textfield name="jjzcHtZlwgLsb.mzqsrq" class="input" size="30" value="%{#request.jjzcHtZlwgLsb.mzqsrq}"/></td>
      <td class="td_zxy01">免租到期日期</td>
      <td class="td_zxy02" valign="middle"><s:textfield name="jjzcHtZlwgLsb.mzdqrq" class="input" size="30" value="%{#request.jjzcHtZlwgLsb.mzdqrq}"/></td>
    </tr>
	<tr>
      <td class="td_zxy01">拟稿人：联系电话：</td>
      <td class="td_zxy02" valign="middle"><s:textfield name="jjzcHtZlwgLsb.ngr" class="input" size="30" value="%{#request.jjzcHtZlwgLsb.ngr}"/></td>
      <td class="td_zxy01"></td>
      <td class="td_zxy02" valign="middle"><s:textfield name="jjzcHtZlwgLsb.lxdh" class="input" size="30" value="%{#request.jjzcHtZlwgLsb.lxdh}"/></td>
    </tr>
	<tr>
      <td class="td_zxy01">上次清算日期</td>
      <td class="td_zxy02" valign="middle"><s:textfield name="jjzcHtZlwgLsb.scqsrq" class="input" size="30" value="%{#request.jjzcHtZlwgLsb.scqsrq}"/></td>
      <td class="td_zxy01">上次清算截止日期</td>
      <td class="td_zxy02" valign="middle"><s:textfield name="jjzcHtZlwgLsb.scqsjzrq" class="input" size="30" value="%{#request.jjzcHtZlwgLsb.scqsjzrq}"/></td>
    </tr>
	<tr>
      <td class="td_zxy01">承租人地址</td>
      <td class="td_zxy02" valign="middle"><s:textfield name="jjzcHtZlwgLsb.czrdz" class="input" size="30" value="%{#request.jjzcHtZlwgLsb.czrdz}"/></td>
      <td class="td_zxy01">承租人法定地址</td>
      <td class="td_zxy02" valign="middle"><s:textfield name="jjzcHtZlwgLsb.czrfddz" class="input" size="30" value="%{#request.jjzcHtZlwgLsb.czrfddz}"/></td>
    </tr>
   <tr> 
	    <td height="63" class="td_zxy01">租贷用途</td>
	    <td class="td_zxy02" colspan="5"> 
	      <s:textfield name="jjzcHtZlwgLsb.zdyt" class="input" size="30" value="%{#request.jjzcHtZlwgLsb.zdyt}"/></td>
    </tr>
	
	</table>	
		
		<table width="100%" border="0" cellpadding="2" cellspacing="0" style="display:none" align="center">
		  <tr>
			<td colspan="6" class="td_top" align="left">合同详细信息</td>
		  </tr>
		   <tr> 
			<td width="97" class="td_zxy01">资产编号</td>
			<td class="td_zxy02"><input name="textfield" type="text" class="input" id="textName" size="30"/></td>
			<td class="td_zxy01">资产名称</td>
			<td class="td_zxy02"><input name="textfield3" type="text" class="input" id="textfield" size="30"/></td>
			<td class="td_zxy01">存放地点</td>
			<td class="td_zxy02"><input name="textfield" type="text" class="input" id="textName" size="30"/></td>
		  </tr>
		  <tr>
			<td width="97" class="td_zxy01">合同类型</td>
			<td class="td_zxy02"><input name="textfield" type="text" class="input" id="textName" size="30"/></td>
			<td class="td_zxy01">合同编号</td>
			<td class="td_zxy02">
			  <input name="textfield42" type="text" class="input" id="textfield42" size="30"/></td>
			<td class="td_zxy01">合同状态</td>
			<td class="td_zxy02"><input name="textfield39" type="text" class="input" id="textfield39" size="30"></td>
		  </tr>
		 
		  <tr> 
		  <td class="td_zxy01">一级分行</td>
			<td class="td_zxy02" valign="middle">
				<e:select parRefKey="ENTITY_TRADE" headerKey="" headerValue="" parentId="438" list="#{}" name="queryBO.yjfh"/></td>
		
			<td class="td_zxy01">委托管理单位</td>
			<td class="td_zxy02"><input name="textfield" type="text" class="input"  size="30" ></td>
			<td class="td_zxy01">资产位置</td>
			<td class="td_zxy02"><input name="textfield4" type="text" class="input" size="30"></td>		
		  </tr>
		  <tr> 
			<td class="td_zxy01">委托管理原值</td>
			<td class="td_zxy02"><s:textfield name="jjzcHtZlwgLsb.wtglyz" class="input" size="30" value="%{#request.jjzcHtZlwgLsb.wtglyz}"/></td>
			<td class="td_zxy01">委托管理数量</td>
			<td class="td_zxy02">
			<input name="textfield4" type="text" class="input" size="30"></td>
			<td class="td_zxy01">委托管理价格</td>
			<td class="td_zxy02">
				<s:textfield name="jjzcHtZlwgLsb.wtgljg" class="input" size="30" value="%{#request.jjzcHtZlwgLsb.wtgljg}"/></td>		
		  </tr>
		  
		  <tr> 
			<td class="td_zxy01">月委托管理费</td>
			<td class="td_zxy02"><s:textfield name="jjzcHtZlwgLsb.ywtglf" class="input" size="30" value="%{#request.jjzcHtZlwgLsb.ywtglf}"/></td>
			<td class="td_zxy01">累计实收委管费</td>
			<td class="td_zxy02"><s:textfield name="jjzcHtZlwgLsb.ljsswgf" class="input" size="30" value="%{#request.jjzcHtZlwgLsb.ljsswgf}"/></td>
			<td class="td_zxy01">累计应收委管费</td>
			<td class="td_zxy02">
				<s:textfield name="jjzcHtZlwgLsb.ljsswgf" class="input" size="30" value="%{#request.jjzcHtZlwgLsb.ljsswgf}"/></td>				
		  </tr>
		  <tr> 
			<td class="td_zxy01">合同起始日期</td>
			<td class="td_zxy02"><input name="textfield6" type="text" class="input" id="textfield6" size="30"> 
			  <img src="../../images/search.gif" width="21" height="20" align="absmiddle"></td>
			<td class="td_zxy01">合同到期日期</td>
			<td class="td_zxy02"><input name="textfield7" type="text" class="input" id="textfield7" size="30"> 
			  <img src="../../images/search.gif" width="21" height="20" align="absmiddle"></td>
			<td class="td_zxy01">结算方式</td>
			<td class="td_zxy02"><input name="textfield4" type="text" class="input"  size="30"></td>
		  </tr>
		   <tr> 
			<td class="td_zxy01">上次清算日期</td>
			<td class="td_zxy02"><input name="textfield6" type="text" class="input" id="textfield6" size="30"/> 
			  <img src="../../images/search.gif" width="21" height="20" align="absmiddle"/></td>
			<td class="td_zxy01">上次清算截止日期</td>
			<td class="td_zxy02"><input name="textfield42" type="text" class="input" id="textfield42" size="30"/>
			<img src="../../images/search.gif" width="21" height="20" align="absmiddle"></td>
			<td class="td_zxy01">本次清算调整金额</td>
			<td class="td_zxy02"><input name="textfield4" type="text" class="input"  size="30"></td>
		  </tr>
		  
		  <tr>
			<td class="td_zxy01"> 合同拟稿人：</td>
			<td class="td_zxy02"><input name="textfield11" type="text" class="input" id="textfield11" size="30"></td>
			<td class="td_zxy01"> 拟稿人：联系电话：</td>
			<td class="td_zxy02"><input name="textfield10" type="text" class="input" id="textfield10" size="30"></td>
			<td class="td_zxy01"> 度量单位 </td>
			<td class="td_zxy02"><input name="textfield10" type="text" class="input" id="textfield10" size="30"  value="平方米"></td>
		  </tr>
		   <tr>
        <td nowrap class="td_zxy01">文档管理</td>
        <td colspan="5" class="td_zxy02">
			<table width="100%" height="100%" border="0" align="center"cellpadding="5" cellspacing="0" class="table01" id="fileTable3">
				<tr>
					 <td colspan="2" align="right" class="td03">
					  <input type="file" name="file3" id="file3" style="display: none;" onChange="addRow(this,'fileTable3')"/>
					  <input type="button" class="buttonface" value="选择文件..." onClick="file3.click();" name="optionButton4" />					 								 					</td>
				</tr>
			</table>		</td>
      </tr>	
		 </table>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
		  <tr>
			<td align="right">
			<input name="Submit1" type="submit" class="buttonface02" value="  确定  " />	
			 <input name="Submit2" type="button" class="buttonface02" value="  关闭  " onClick="javascript:window.close();"/>	
		    </td>
		  </tr>
		</table>
		<br/>
</div>
	<div  style="display:none" id="upperLayer1">
		<h6 align="center">变动信息</h6>
	<table  class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
	            <td align="right">
					<table id="biandonglishi" width="100%"></table>
		            <div id="pgtoolbar1"></div>
				</td>
			</tr>
	</table>
	</div>
	<div  style="display:none" id="upperLayer2">
		
		<h6 align="center">合同挂接资产详细信息</h6>
			<table  class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
	            <td align="right">
					<table id="zichanxinxi" width="100%"></table>
		            <div id="pgtoolbar2"></div>
				</td>
			</tr>
	</table>
	</div>
<div  style="display:none" id="upperLayer3">
	<br />
		<h6 align="center">清算信息</h6>
					<table id="qingsuanxinxi" width="100%"></table>
		            <div id="pgtoolbar3"></div>
	</div>
</form>	
</body>
</html>

<script type="text/javascript">
	jQuery("#biandonglishi").jqGrid({				
					url:"<%=basePath%>htqs/ContractManageBody_getString2.do?htId=${headId}",
					datatype: "json",
					mtype:"POST",
	colNames: ['变动方式','变动原因','改变前值','改变后值','变动时间','录入人'],
    colModel: [
	    {name: '',index: 'changetype'}, 
	    {name: '',index: 'changetype'},
	    {name: 'before',index: 'before'},  
	    {name: 'after',index: 'after'},
	    {name: 'changedate',index: 'changedate'},
	    {name: 'changeperson',index: 'changeperson'}
	],
				   	pager:'pgtoolbar1',
				   	rowNum:10,
				   	prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
					multiselect:true,
					rownumbers:true,
					autowidth:true,
					height:'auto',
					viewrecords:true,
						caption: '变动历史信息',
					jsonReader : {
						root:"rows",
						page: "page",
						total: "total",
						records: "records",
						repeatitems: false,
						id: "0"
					}
				});
jQuery("#biandonglishi").jqGrid('navGrid', '#pgtoolbar1', {
	edit: false,
    add: false,
    del: false
});                                       
</script>

<script type="text/javascript">
   
   
jQuery("#zichanxinxi").jqGrid({
	url:"<%=basePath%>htqs/ContractManageBody_getString1.do?htId=${headId}",
    datatype: "json",
    colNames: ['资产编号','资产名称','存放地点','使用部门'],
    colModel: [
	    {name: 'bdfs',index: 'bdfs'}, 
	    {name: 'bdyy',index: 'bdyy'},
	    {name: 'gbqz',index: 'gbqz'},  
	    {name: 'lrr',index: 'lrr'}
	],
				   	pager:'pgtoolbar2',
				   	rowNum:10,
				   	prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
					multiselect:true,
					rownumbers:true,
					autowidth:true,
					height:'auto',
					viewrecords:true,
						caption: '变动历史信息',
					jsonReader : {
						root:"rows",
						page: "page",
						total: "total",
						records: "records",
						repeatitems: false,
						id: "0"
					}
				});


jQuery("#zichanxinxi").jqGrid('navGrid', '#pgtoolbar2', {
	edit: false,
    add: false,
    del: false
});       


                                
</script>


<script type="text/javascript">

	

jQuery("#qingsuanxinxi").jqGrid({
	url:"<%=basePath%>htqs/ContractManageBody_getString3.do?htId=${headId}",
    datatype: "json",
    colNames: ['清算起始日期','清算截止日期','应收资金','实收资金','变动资金','变动原因','变动调整金额'],
    colModel: [
	    {name: 'bdfs',index: 'bdfs'}, 
	    {name: 'bdyy',index: 'bdyy'},
	    {name: 'gbqz',index: 'gbqz'},  
	    {name: 'lrr',index: 'lrr'},
	    {name: 'lrr',index: 'lrr'},
	    {name: 'lrr',index: 'lrr'},
	    {name: 'lrr',index: 'lrr'}
	    
	],
		pager:'pgtoolbar3',
				   	rowNum:10,
				   	prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
					multiselect:true,
					rownumbers:true,
					autowidth:true,
					height:'auto',
					viewrecords:true,
						caption: '清算信息',
					jsonReader : {
						root:"rows",
						page: "page",
						total: "total",
						records: "records",
						repeatitems: false,
						id: "0"
					}
				});

jQuery("#qingsuanxinxi").jqGrid('navGrid', '#pgtoolbar3', {
	edit: false,
    add: false,
    del: false
});      



jQuery("#biandonglishi").setGridWidth($("#sss").width());
jQuery("#zichanxinxi").setGridWidth($("#sss").width());
jQuery("#zichanxinxi").setGridWidth($("#sss").width());

$(window).bind('resize', function(){
	jQuery("#biandonglishi").setGridWidth($("#sss").width());
	jQuery("#zichanxinxi").setGridWidth($("#sss").width());
	jQuery("#qingsuanxinxi").setGridWidth($("#sss").width());
});

		                                     
</script>