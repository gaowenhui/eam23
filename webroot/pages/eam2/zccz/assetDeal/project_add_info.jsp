<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc" %>
<%@ include file="/inc/ProjectJQuery.inc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    	<base href="<%=basePath %>"/>
<title>增加资产</title>



<script type="text/javascript">
function getIndex()
  {
  var x=document.getElementById("mySelect")
  var y = x.selectedIndex ;
  if(y==2){
  aa.style.display = "block";
 }else{
  aa.style.display = "none";
 
 }
 if(y==6){
  bb.style.display = "block";
  cc.style.display = "block";
 }else{
  bb.style.display = "none";
   cc.style.display = "none";
 
 }
  }
</script>

</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<br/>
<table width="95%" border="0" cellpadding="2" cellspacing="0" align="center"  >
  <tr>
    <td height="25" align="center" valign="bottom" class="td06">
		<table width="95%" border="0" cellspacing="3" cellpadding="0">
		  <tr>
			<td width="15"><img src="../../images/index_32.gif" width="9" height="9"/></td>
			<td valign="bottom" class="title">增加资产</td>
			
		  </tr>
		</table>
	</td>
  </tr>
</table>

	<div  id="div1"  style="display:block">
	<table width="95%" border="0" cellpadding="2" cellspacing="0" align="center" >
	  <tr>
	  	<td colspan="6" class="td_top" align="center">&nbsp;</td>
	  </tr>
	  <tr>
	   <td class="td_form01">资产类型</td>
	    <td class="td_form02"><select  onChange="getIndex()" id="mySelect">
          <option value="0" selected="selected"></option>
          <option value="1" >自用固定资产</option>
          <option value="2">实体内资产</option>
        </select>
        </td>
	    <td class="td_form01">省分行</td>
		<td class="td_form02" valign="middle"><select name="select">
			<option value="0" selected="selected"></option>
            <option value="1">总行本级</option>
            <option value="2">北京市分行</option>
            <option value="3">天津市分行</option>
            <option value="4">河北省分行</option>
            <option value="5">山西省分行</option>
            <option>内蒙古区分行</option>
            <option>辽宁省分行</option>
            <option>大连市分行</option>
            <option>吉林省分行</option>
            <option>建行上海分行</option>
            <option>江苏省分行</option>
            <option>苏州市分行</option>
            <option>浙江省分行</option>
            <option>宁波市分行</option>
            <option>安徽省分行</option>
            <option>福建省分行</option>
            <option>厦门市分行</option>
            <option>江西省分行</option>
            <option>山东省分行</option>
            <option>青岛市分行</option>
            <option>河南省分行</option>
            <option>湖北省分行</option>
            <option>三峡分行</option>
            <option>湖南省分行</option>
            <option>广东省分行</option>
            <option>深圳分行</option>
            <option>广西省分行</option>
            <option>海南省分行</option>
            <option>四川省分行</option>
            <option>重庆市分行</option>
            <option>贵州是分行</option>
            <option>云南省分行</option>
            <option>建行西藏分行</option>
            <option>陕西省分行</option>
            <option>甘肃省分行</option>
            <option>青海省分行</option>
            <option>宁夏区分行</option>
            <option>新疆区分行</option>
                  </select>        </td>
		 <td class="td_form01">管理部门</td>
		<td class="td_form02" valign="middle"><s:textfield name="head.ngbmmc" size="30" /></td>
		
	  </tr>
	  <tr> 
	  	<td  class="td_form01"  id="cc" style="display:none">实体类型</td>
	    <td class="td_form02" id="bb" style="display:none"><select><option>造价咨询类实体</option><option>非造价咨询类实体</option></select></td>
	 	<td  class="td_form01">资产编号</td>
	    <td class="td_form02"><s:textfield name="head.ngbmmc" size="30"/></td>
		 <td class="td_form01">资产名称</td>
	    <td class="td_form02" colspan="3"><s:textfield name="head.ngbmmc" size="30"/></td>	
	  </tr>	  
	   <tr  style="display:none" id="aa"> 
	 	 <td  class="td_form01">卡片编号</td>
	    <td  class="td_form02"><s:textfield name="head.ngbmmc" size="30"/></td>
	  	<td class="td_form01">卡片名称</td>
		<td class="td_form02" valign="middle" colspan="3">
		<s:textfield name="head.ngbmmc" size="30"/></td>
	  </tr>
 
	  <tr>
	    <td align="right" colspan="6">
		  <input name="Submit2" type="submit" class="buttonface02"  value="查询"/>
		  <input name="Submit" type="submit" class="buttonface02" onClick="javascript:window.location.reload();" value="清空"/></td>
	  </tr>
	</table>
	<br/>
	
</div>
<div id="div2" style="display:none">
	<table width="95%" border="0" cellpadding="2" cellspacing="0" align="center"    >
		  <tr>
			<td colspan="6" class="td_top" align="center">交通运输设备信息模板</td>
		  </tr>
		   <tr> 
			<td  class="td_form01">资产编号</td>
			<td class="td_form02"></td>
			<td class="td_form01">资产名称</td>
			<td class="td_form02"></td>
			<td class="td_form01">卡片状态</td>
			<td class="td_form02">在役</td>
		  </tr>
		  <tr>
			<td  class="td_form01">卡片名称</td>
			<td class="td_form02"><input name="textfield" type="text"    id="textName" size="30"></td>
			<td class="td_form01">卡片编号</td>
			<td class="td_form02">
			<input name="textfield" type="text"    id="textName" size="30" disabled="disabled"></td>
			<td class="td_form01">一级分行</td>
			<td class="td_form02" valign="middle">
				<select name="select">
				  <option value="1">总行本级</option>
				  <option value="2">北京市分行</option>
				  <option value="3">天津市分行</option>
				  <option value="4">河北省分行</option>
				  <option value="5">河南省分行</option>
				</select>	     </td>
		  </tr>
		  <tr> 
			<td  class="td_form01">类别名称</td>
			<td class="td_form02"><input name="textfield1" type="text"    id="textfield1" size="30" disabled="disabled"></td>
			<td class="td_form01">类别编码</td>
			<td class="td_form02"><input name="textfield2" type="text"    id="textfield2" size="30"></td>
			<td class="td_form01">规格型号</td>
			<td class="td_form02"><input name="textfield3" type="text"    id="textfield3" size="30"></td>
		  </tr>
		  <tr> 
			<td class="td_form01">使用情况</td>
			<td class="td_form02"><input name="textfield39" type="text"    id="textfield39" size="30"></td>
			<td class="td_form01">存放地点</td>
			<td class="td_form02"><input name="textfield4" type="text"    id="textfield4" size="30"></td>
			<td class="td_form01">资产状态</td>
			<td class="td_form02"></td>		
		  </tr>
		  <tr> 
			<td class="td_form01">增加方式</td>
			<td class="td_form02"><input name="textfield4" type="text" id="textfield4" size="20"/>
			<img src="../../images/search.gif" width="21" height="20" align="absmiddle"></td>
			<td class="td_form01">折旧方法</td>
			<td class="td_form02">
			<select name="select">
				  <option value="1">平均年限法</option>   
				  <option value="2">工作量法</option>   
			  </select>		
			</td>
			<td class="td_form01">是否继承</td>
			<td class="td_form02">
				<select name="select">
				  <option value="1">是</option>   
				  <option value="2">否</option>   
				</select>		</td>		
		  </tr>
		  
		  <tr> 
			<td class="td_form01">管理部门</td>
			<td class="td_form02"><input name="textfield39" type="text"    id="textfield39" size="30"></td>
			<td class="td_form01">使用部门</td>
			<td class="td_form02"><input name="textfield4" type="text"    id="textfield4" size="30"></td>
			<td class="td_form01">折旧承担部门</td>
			<td class="td_form02">
				<select name="select">
				  <option value="1">管理部门</option>   
				  <option value="2">使用部门</option>   
				</select>		</td>				
		  </tr>
		  <tr> 
			<td class="td_form01">开始使用日期</td>
			<td class="td_form02"><input name="textfield6" type="text"    id="textfield6" size="20"/> 
			  <img src="../../images/search.gif" width="21" height="20" align="absmiddle"></td>
			<td class="td_form01">启用日期</td>
			<td class="td_form02"><input name="textfield7" type="text"    id="textfield7" size="20"/> 
			  <img src="../../images/search.gif" width="21" height="20" align="absmiddle"></td>
			<td class="td_form01">变动原因</td>
			<td class="td_form02">新增卡片</td>
		  </tr>
		   <tr> 
			<td width="97" class="td_form01">注销日期</td>
			<td class="td_form02"></td>
			<td class="td_form01"></td>
			<td class="td_form02"></td>
			<td class="td_form01"></td>
			<td class="td_form02"></td>
		  </tr>
		  <tr>
			<td class="td_form01"> 原币原值</td>
			<td class="td_form02"><input name="textfield9" type="text"    id="textfield9" size="25"/>（元）</td>
			<td class="td_form01"> 减值准备 </td>
			<td class="td_form02"><input name="textfield10" type="text"    id="textfield10" size="25"/>（元）</td>
			<td class="td_form01"> 使用期限 </td>
			<td class="td_form02"><input name="textfield11" type="text"    id="textfield11" size="25"/>（年）</td>
		  </tr>
		  <tr> 
			<td class="td_form01">使用月限</td>
			<td class="td_form02"><input name="textfield12" type="text"    id="textfield12" size="25"/>（月）</td>
			<td class="td_form01">已计提月份</td>
			<td class="td_form02"><input name="textfield13" type="text"    id="textfield13" size="25"/>（月）</td>
			<td class="td_form01">月折旧额</td>
			<td class="td_form02"><input name="textfield14" type="text"    id="textfield14" size="25"/>（元）</td>
		  </tr>
		  <tr> 
			<td class="td_form01">累计折旧</td>
			<td class="td_form02"><input name="textfield15" type="text"    id="textfield15" size="25"/>（元）</td>
			<td class="td_form01">净残值</td>
			<td class="td_form02"><input name="textfield16" type="text"    id="textfield16" size="25"/>（元）</td>
			<td class="td_form01">净残值率</td>
			<td class="td_form02"><input name="textfield18" type="text"    id="textfield18" size="25"/>（%）</td>
		  </tr>
		  <tr> 
			<td class="td_form01">净值</td>
			<td class="td_form02"><input name="textfield19" type="text"    id="textfield19" size="25"/>（月）</td>
			<td class="td_form01">净额</td>
			<td class="td_form02"><input name="textfield20" type="text"    id="textfield20" size="25"/>（月）</td>
			<td class="td_form01">月折旧率</td>
			<td class="td_form02"><input name="textfield21" type="text"    id="textfield21" size="25"/>（%）</td>
		  </tr>	 
		  <tr>
			 
			<td  class="td_form01">车辆牌照号</td>
			<td class="td_form02"><input name="textfield1" type="text"    id="textfield1" size="30" disabled="disabled"></td>
			<td class="td_form01">发动机号码</td>
			<td class="td_form02"><input name="textfield2" type="text"    id="textfield2" size="30"></td>
			<td class="td_form01"></td>
			<td class="td_form02"></td>
		 
		  </tr>	 
		  <tr> 
			<td  class="td_form01">旧卡片编号</td>
			<td class="td_form02"><input name="textfield22" type="text"    id="textfield22" size="30"></td>
			<td class="td_form01">评估前原值</td>
			<td class="td_form02"><input name="textfield24" type="text"    id="textfield24" size="25"/>（元）</td>
			<td class="td_form01">评估前累计折旧</td>
			<td class="td_form02"><input name="textfield25" type="text"    id="textfield25" size="25"/>（元）</td>
		  </tr>
		  <tr> 
			<td  class="td_form01">录入日期</td>
			<td class="td_form02"><input name="textfield26" type="text"    id="textfield26" size="30" disabled="disabled"></td>
			<td class="td_form02">&nbsp;</td>
			<td class="td_form02">&nbsp;</td>
			<td class="td_form01">录入员</td>
			<td class="td_form02"><input name="textfield27" type="text"    id="textfield27" size="30"></td>
		  </tr>	   	   	  
		  <tr> 
			<td height="63" class="td_form01">备注</td>
			<td class="td_form02" colspan="5"> 
			  <textarea name="textarea" cols="150" rows="4"></textarea></td>
		  </tr>
      <tr>
	    <td nowrap class="td_form01">文档管理</td>
        <td colspan="5" class="td_form02">
			<table width="100%" height="100%" border="0" align="center"cellpadding="5" cellspacing="0" class="table01" id="fileTable100">
				<tr>
					 <td colspan="2" align="right" class="td03">
					 <input type="file" name="file100" id="file100" style="display: none;" onChange="addRow(this,'fileTable100')"/>
					 <input type="button" class="buttonface" value="选择文件..." onClick="file100.click();" name="optionButton3" />                 	</td>
				</tr>
			</table>
		</td>
      </tr>
      <tr>
        <td nowrap class="td_form01">权证管理</td>
        <td colspan="5" class="td_form02">
			<table width="100%" height="100%" border="0" align="center"cellpadding="5" cellspacing="0" class="table01" id="fileTable99">
				<tr>
					 <td colspan="2" align="right" class="td03">
					  <input type="file" name="file99" id="file99" style="display: none;" onChange="addRow(this,'fileTable99')"/>
					  <input type="button" class="buttonface" value="选择文件..." onClick="file99.click();" name="optionButton4" />                 </td>
				</tr>
			</table>
		</td>
      </tr>	  
 
	  <tr>
	    <td align="right" colspan="6">
		  <input name="Submit" type="submit" class="buttonface02" value="  确定  " onClick="javascript:window.location.reload();"/>
	    </td>
	  </tr>
  </table>
		<br/>
</div>
		<div id="div3" style="display:none">
		<table width="95%" border="0" cellpadding="2" cellspacing="0" align="center"  >
	  <tr>
	  	<td colspan="6" class="td_top" align="left">电子设备及其他信息模板</td>
	  </tr>
	  <tr>
	    <td  class="td_form01">资产名称</td>
	    <td  class="td_form02"><input name="textfield" type="text"    id="textName" size="30"></td>
		<td  class="td_form01">资产编号</td>
		<td  class="td_form02">
		<input name="textfield" type="text"    id="textName" size="30" ></td>
		<td  class="td_form01">卡片状态</td>
	    <td  class="td_form02"><input name="textfield3" type="text"    id="textfield3" size="30"  value="在役"></td>
	  </tr>
	  <tr> 
	    <td  class="td_form01">卡片名称</td>
	    <td class="td_form02"><input name="textfield1" type="text"    id="textfield1" size="30" disabled="disabled"></td>
	    <td class="td_form01">卡片编号</td>
	    <td class="td_form02"><input name="textfield2" type="text"    id="textfield2" size="30"></td>
		<td class="td_form01">一级分行</td>
		<td class="td_form02" valign="middle" >
		    <select name="select">
		      <option value="1">总行本级</option>
		      <option value="2">北京市分行</option>
			  <option value="3">天津市分行</option>
			  <option value="4">河北省分行</option>
			  <option value="5">河南省分行</option>
	        </select>	     </td>
	  </tr>
	    <tr> 
	    <td  class="td_form01">类别名称</td>
	    <td class="td_form02"><input name="textfield1" type="text"    id="textfield1" size="30" disabled="disabled"/> 
		<img src="../../images/search.gif" width="21" height="20" align="absmiddle"></td>
	    <td class="td_form01">类别编码</td>
	    <td class="td_form02"><input name="textfield2" type="text"    id="textfield2" size="30"></td>
	    <td class="td_form01">规格型号</td>
	    <td class="td_form02">
	      <input   value="在役"name="textfield32" type="text"    id="textfield32" size="30"></td>
	  </tr>
	   <tr> 
	    <td  class="td_form01">使用状况</td>
	    <td class="td_form02"><input name="textfield1" type="text"    id="textfield1" size="30" disabled="disabled"/>	
		<img src="../../images/search.gif" width="21" height="20" align="absmiddle"></td>
	    <td class="td_form01">存放地点</td>
	    <td class="td_form02"><input name="textfield2" type="text"    id="textfield2" size="30"></td>
	    <td class="td_form01">资产状态</td>
	    <td class="td_form02">&nbsp;</td>
	  </tr>
	  <tr> 
	    <td class="td_form01">增加方式</td>
	    <td class="td_form02"><input name="textfield39" type="text"    id="textfield39" size="30"/>
		 <img src="../../images/search.gif" width="21" height="20" align="absmiddle"></td>
		<td class="td_form01">折旧方法</td>
	    <td class="td_form02">
			<select name="select">
		      <option value="1"  selected="selected">不计提          </option>   
		      <option value="2">平均年限法（一）</option>   
		      <option value="3">平均年限法（二）</option>   
		      <option value="4">工作量法        </option>		
		      <option value="5">年数综合法      </option>   
		      <option value="6">双倍余额递减法  </option>   
		      <option value="7">五五摊销法      </option>   
		      <option value="8">一次摊完法      </option>		
	        </select>		</td>
		<td class="td_form01">是否承继</td>
	    <td class="td_form02">
			<select name="select">
		      <option value="1">是</option>   
		      <option value="2">否</option>   
		    </select>		</td>		
	  </tr>
	  <tr> 
	    <td class="td_form01">管理部门</td>
	    <td class="td_form02"><input name="textfield4" type="text"    id="textfield4" size="30"/>
		<img src="../../images/search.gif" width="21" height="20" align="absmiddle"></td>
	    <td class="td_form01">折旧部门</td>
	    <td class="td_form02"><input name="textfield5" type="text"    id="textfield5" size="30"/>
		<img src="../../images/search.gif" width="21" height="20" align="absmiddle"></td>
	    <td class="td_form01">折旧承担部门</td>
	    <td class="td_form02">
			<select name="select">
		      <option value="1">管理部门</option>   
		      <option value="2">折旧部门</option>   
		    </select>		</td>		
	  </tr>
	  <tr> 
	    <td class="td_form01">开始使用日期</td>
	    <td class="td_form02"><input name="textfield6" type="text"    id="textfield6" size="30"/> 
	      <img src="../../images/search.gif" width="21" height="20" align="absmiddle"></td>
	    <td class="td_form01">启用日期</td>
	    <td class="td_form02"><input name="textfield7" type="text"    id="textfield7" size="30"/> 
	      <img src="../../images/search.gif" width="21" height="20" align="absmiddle"></td>
	    <td class="td_form01">变动原因</td>
	    <td class="td_form02"><input name="textfield8" type="text"    id="textfield8" size="30"  value="新增卡片"></td>
	  </tr>
	   <tr>
	    <td class="td_form01">注销日期</td>
	    <td class="td_form02"><input name="textfield" type="text"    id="textName" size="30"></td>
		<td class="td_form01">使用人</td>
		<td class="td_form02">
			<select name="select">
		      <option value="1">董事长</option>   
		      <option value="2">董事长秘书</option>   
			  <option value="3">王芊</option>
		    </select></td>	
		<td class="td_form01">主要途径</td>
	    <td class="td_form02"><textarea></textarea></td>
	  </tr>
	  <tr>
	  	<td class="td_form01">主要途径</td>
	  <td class="td_form02" colspan="5"> 
	      <textarea  cols="150" rows="4"></textarea></td>
	  </tr>
	  <tr>
	    <td class="td_form01"> 原币原值</td>
	    <td class="td_form02"><input name="textfield9" type="text"    id="textfield9" size="30"/>（元）</td>
	    <td class="td_form01"> 减值准备 </td>
	    <td class="td_form02"><input name="textfield10" type="text"    id="textfield10" size="30"/>（元）</td>
	    <td class="td_form01"> 使用年限 </td>
	    <td class="td_form02"><input name="textfield11" type="text"    id="textfield11" size="30"/>（年）</td>
	  </tr>
	  <tr> 
	    <td class="td_form01">使用月限</td>
	    <td class="td_form02"><input name="textfield12" type="text"    id="textfield12" size="30"/>（月）</td>
		<td class="td_form01">月折旧额</td>
	    <td class="td_form02"><input name="textfield14" type="text"    id="textfield14" size="30"/>（元）</td>
	    <td class="td_form01">已计提月份</td>
	    <td class="td_form02"><input name="textfield122" type="text"    id="textfield122" size="30" value="0"/>
        （月）</td>
	  </tr>
	  <tr> 
	    <td class="td_form01">累计折旧</td>
	    <td class="td_form02"><input name="textfield15" type="text"    id="textfield15" size="30"></td>
		<td class="td_form01">净值</td>
	    <td class="td_form02"><input name="textfield19" type="text"    id="textfield19" size="30"></td>
	    <td class="td_form01">净额</td>
	    <td class="td_form02"><input name="textfield20" type="text"    id="textfield20" size="30"></td>
	  </tr>
	  <tr> 
		<td class="td_form01">净残值</td>
	    <td class="td_form02"><input name="textfield16" type="text"    id="textfield16" size="30"></td>
	    <td class="td_form01">净残值率</td>
	    <td class="td_form02"><input name="textfield18" type="text"    id="textfield18" size="30"></td>
	    <td class="td_form01">月折旧率</td>
	    <td class="td_form02"><input name="textfield21" type="text"    id="textfield21" size="30"></td>
	  </tr>	 
	  <tr> 
		<td class="td_form01">设备序列号</td>
	    <td class="td_form02"><input name="textfield16" type="text"    id="textfield16" size="30"></td>
	    <td class="td_form01">供应商</td>
	    <td class="td_form02"><input name="textfield18" type="text"    id="textfield18" size="30"></td>
	    <td class="td_form01">合同号码</td>
	    <td class="td_form02"><input name="textfield21" type="text"    id="textfield21" size="30"></td>
	  </tr>	  
	  <tr> 
		<td class="td_form01">保修期</td>
	    <td class="td_form02"><input name="textfield16" type="text"    id="textfield16" size="30"></td>
	    <td class="td_form01">上门保修期</td>
	    <td class="td_form02"><input name="textfield18" type="text"    id="textfield18" size="30"></td>
	    <td class="td_form01">送修保修期</td>
	    <td class="td_form02"><input name="textfield21" type="text"    id="textfield21" size="30"></td>
	  </tr>	 
	  <tr> 
		<td class="td_form01">CPU型号</td>
	    <td class="td_form02"><input name="textfield16" type="text"    id="textfield16" size="30"></td>
	    <td class="td_form01">外置硬盘</td>
	    <td class="td_form02"><input name="textfield18" type="text"    id="textfield18" size="30"></td>
	    <td class="td_form01">内置硬盘</td>
	    <td class="td_form02"><input name="textfield21" type="text"    id="textfield21" size="30"></td>
	  </tr>	 
	  <tr> 
		<td class="td_form01">显示器</td>
	    <td class="td_form02"><input name="textfield16" type="text"    id="textfield16" size="30"></td>
	    <td class="td_form01">硬盘型号</td>
	    <td class="td_form02"><input name="textfield18" type="text"    id="textfield18" size="30"></td>
	    <td class="td_form01">内存</td>
	    <td class="td_form02"><input name="textfield21" type="text"    id="textfield21" size="30"></td>
	  </tr>	 
	  <tr> 
	    <td class="td_form01">旧卡片编号</td>
	    <td class="td_form02"><input name="textfield22" type="text"    id="textfield22" size="30"></td>
	    <td class="td_form01">评估前原值</td>
	    <td class="td_form02"><input name="textfield24" type="text"    id="textfield24" size="30"></td>
	    <td class="td_form01">评估前累计折旧</td>
	    <td class="td_form02"><input name="textfield25" type="text"    id="textfield25" size="30"></td>
	  </tr>
	  <tr> 
	    <td class="td_form01">原系统录入员</td>
	    <td class="td_form02"><input name="textfield26" type="text"    id="textfield26" size="30" disabled="disabled"></td>
	    <td class="td_form02">&nbsp;</td>
	    <td class="td_form02">&nbsp;</td>
	    <td class="td_form01">录入员</td>
	    <td class="td_form02"><input name="textfield27" type="text"    id="textfield27" size="30"></td>
	  </tr>	   	   	  
	  <tr> 
	    <td height="63" class="td_form01">备注</td>
	    <td class="td_form02" colspan="5"><textarea name="textarea" cols="150" rows="4"></textarea></td>
	  </tr>
      <tr>
	    <td nowrap class="td_form01">文档管理</td>
        <td colspan="5" class="td_form02">
			<table width="100%" height="100%" border="0" align="center"cellpadding="5" cellspacing="0" class="table01" id="fileTable98">
				<tr>
					 <td colspan="2" align="right" class="td03">
					 <input type="file" name="file98" id="file98" style="display: none;" onChange="addRow(this,'fileTable98')"/>
					 <input type="button" class="buttonface" value="选择文件..." onClick="file98.click();" name="optionButton3" />                 	</td>
				</tr>
			</table>
		</td>
      </tr>
      <tr>
        <td nowrap class="td_form01">权证管理</td>
        <td colspan="5" class="td_form02">
			<table width="100%" height="100%" border="0" align="center"cellpadding="5" cellspacing="0" class="table01" id="fileTable97">
				<tr>
					 <td colspan="2" align="right" class="td03">
					  <input type="file" name="file97" id="file97" style="display: none;" onChange="addRow(this,'fileTable97')"/>
					  <input type="button" class="buttonface" value="选择文件..." onClick="file97.click();" name="optionButton4" />                 </td>
				</tr>
			</table>
		</td>
      </tr>	  
 
	  <tr>
	    <td align="right" colspan="6">
		  <input name="Submit" type="submit" class="buttonface02" value="  确定  " onClick="javascript:window.location.reload();"/>
	    </td>
	  </tr>	  
	</table>
	</div>
	    <div id="div4" style="display:display">
	    <table width="95%" height="249" border="0" align="center" cellpadding="2" cellspacing="0" >
	      
          
          <tr>
    <td class="td_top"><input type="checkbox" name="checkbox3" value="checkbox" onClick="setCheckBoxInTable('it',this.checked)"/></td>
            <td  align="center" class="td_top">资产名称</td>
            <td  align="center" class="td_top">资产类型</td>
			<td  align="center" class="td_top">省分行</td>
			<td align="center" class="td_top">资产编号</td>
			<td  align="center" class="td_top">管理部门</td>
			<td  align="center" class="td_top">帐面原值（万元）</td>
            <td  align="center" class="td_top">帐面净值（万元）</td>
            <td  align="center" class="td_top">评估价值（万元）</td>
          </tr>
          <tr>
            <td class="td07" width="10%" ><span >
              <input type="checkbox" name="checkbox32" value="checkbox" onClick="setCheckBoxInTable('it',this.checked)"/>
            </span></td>
            <td class="td07"  >&nbsp;</td>
            <td class="td07"  >&nbsp;</td>
            <td class="td07"  >&nbsp;</td>
            <td class="td07" >&nbsp;</td>
            <td class="td07"  >&nbsp;</td>
            <td class="td07" >&nbsp;</td>
			<td class="td07">&nbsp;</td>
            <td class="td07">&nbsp;</td>


			
          </tr>
          
          <tr>
            <td class="td07" width="10%" ><span>
              <input type="checkbox" name="checkbox34" value="checkbox" onClick="setCheckBoxInTable('it',this.checked)"/>
            </span></td>
            <td class="td07">&nbsp;</td>
            <td class="td07" >&nbsp;</td>
            <td class="td07"  >&nbsp;</td>
            <td class="td07" >&nbsp;</td>
            <td class="td07"  >&nbsp;</td>
            <td class="td07">&nbsp;</td>
			<td class="td07">&nbsp;</td>
            <td class="td07">&nbsp;</td>
          </tr>
          <tr>
            <td class="td07"><span >
              <input type="checkbox" name="checkbox35" value="checkbox" onClick="setCheckBoxInTable('it',this.checked)"/>
            </span></td>
            <td class="td07">&nbsp;</td>
            <td class="td07">&nbsp;</td>
            <td class="td07">&nbsp;</td>
            <td class="td07">&nbsp;</td>
            <td class="td07">&nbsp;</td>
            <td class="td07">&nbsp;</td>
			<td class="td07">&nbsp;</td>
            <td class="td07">&nbsp;</td>
          </tr>
          <tr>
            <td class="td07" width="10%" ><span >
              <input type="checkbox" name="checkbox36" value="checkbox" onClick="setCheckBoxInTable('it',this.checked)"/>
            </span></td>
            <td class="td07" >&nbsp;</td>
            <td class="td07" >&nbsp;</td>
            <td class="td07">&nbsp;</td>
            <td class="td07" >&nbsp;</td>
            <td class="td07"  >&nbsp;</td>
            <td class="td07" >&nbsp;</td>
			<td class="td07">&nbsp;</td>
            <td class="td07">&nbsp;</td>
          </tr>
          <tr>
            <td class="td07"><span >
              <input type="checkbox" name="checkbox37" value="checkbox" onClick="setCheckBoxInTable('it',this.checked)"/>
            </span></td>
            <td class="td07">&nbsp;</td>
            <td class="td07">&nbsp;</td>
            <td class="td07">&nbsp;</td>
            <td class="td07">&nbsp;</td>
            <td class="td07">&nbsp;</td>
            <td class="td07">&nbsp;</td>
			<td class="td07">&nbsp;</td>
            <td class="td07">&nbsp;</td>
          </tr>
          <tr>
            <td class="td07"><span>
              <input type="checkbox" name="checkbox38" value="checkbox" onClick="setCheckBoxInTable('it',this.checked)"/>
            </span></td>
            <td class="td07">&nbsp;</td>
            <td class="td07">&nbsp;</td>
            <td class="td07">&nbsp;</td>
            <td class="td07">&nbsp;</td>
            <td class="td07">&nbsp;</td>
            <td class="td07">&nbsp;</td>
			<td class="td07">&nbsp;</td>
            <td class="td07">&nbsp;</td>
          </tr>
          <tr>
            <td colspan="8" ><input name="Submit2222" type="submit" class="buttonface02"  value="确定"/>
              <input name="Submit322" type="submit" class="buttonface02" onClick="javascript:window.location.reload();" value="关闭"></td>
          </tr>
        </table>
</body>
</html>
