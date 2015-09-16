<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Untitled Document</title>
<link href="../css/style.css" rel="stylesheet" type="text/css" />
<script type= "text/javascript" src= "../../资产管理/js/tab.js"> </script>
<script type="text/javascript" src="../../资产管理/js/custom/tools.js"></script>
<script language="JavaScript" type="text/javascript" src="../../资产管理/js/win_center.js"></script>
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
	function showSubimtPage(){
		document.getElementById("subimtPage").style.display="block";
	}
	function cancleSubmit(){
		document.getElementById("subimtPage").style.display="none";

	}

</SCRIPT>

</head>

<body>
 <br>
 <br>
<table width="95%" border="0" id="upperTable"  cellspacing="0" cellpadding="0"  align="center">
<tr>
<td  class="td_page">编号:<input type="text" >标 题：<input type="text" >流程名称：<input type="text" >拟稿人：<input type="text" ></td>
</tr>
<tr>
<td  class="td_page">拟稿日期：:&nbsp;从 &nbsp; <input type="text" > &nbsp; 到 &nbsp; <input type="text" ><input type="button"  class="buttonface02" value="查询">&nbsp;<input type="button" class="buttonface02" value="重置" onClick="javascript:window.location='main.htm'"></td>
</tr>
</table> 
<table width="95%" border="0" id="upperTable"  cellspacing="0" cellpadding="0"  align="center">
	
		
	<TR  align="center" oncontextmenu='return false' ondragstart='return false' onselectstart ='return false' 
		onselect='document.selection.empty()' 	oncopy='document.selection.empty()' 
		 onbeforecopy='return false' onmouseup='document.selection.empty()'>
	  
	   <TD width="20%" class="clicked"  onClick="displayUpperLayer(0)">待办事宜</TD>
	   <TD width="20%" class="ttd"  onClick="displayUpperLayer(1)">已办事宜</TD>
	   <TD width="20%" class="ttd"  onClick="displayUpperLayer(2)">办结事宜</TD>
	   <TD width="20%" class="ttd"  onClick="displayUpperLayer(3)">草稿箱</TD>
	</TR>
</table>
<br>

<div id="upperLayer0" style="display:block" >

 <table width="95%" border="0" cellspacing="0" cellpadding="0"  align="center">
      <tr>
            <td height="25"><img src="../../资产管理/images/main_28.gif" width="9" height="9" align="absmiddle"> <strong>待办事宜</strong></td>
			 <td height="25" align="right"> <input type="button" class="buttonface02" value="作废流程" ></td>
      </tr>
      <tr>
			<td height="1" class="td05"><img src="../../资产管理/images/spacer.gif" width="1" height="1"></td	>
      </tr>
	  
	  
 </table>

 <table width="95%" border="0" cellspacing="0" cellpadding="0"  align="center" id="daiban">
 <tr>
		 <td class="td_top" ><input type="checkbox"  onClick="setCheckBoxInTable('daiban',this.checked)"/></td>
 		 <td class="td_top" align="center" >审批单号</td>
		 <td class="td_top" align="center" >标 题</td>
		  <td class="td_top" align="center"  >拟稿人：</td>
	     <td class="td_top" align="center"  >拟稿日期：</td>
		 <td class="td_top" align="center"  >流程名称</td>
		
 </tr>
   <tr >
		 <td class="td_01"  ><input type="checkbox"></td>
 		 <td class="td_01" align="center"  >
		 <A onClick="javascript:window.location='main/card-add-3.html';" href="#" style="color:#FF0000">2110030100002374</A>
		 </td>
		 <td class="td_01" align="center"  >卡片新增审批</td>
		 <td class="td_01" align="center"  >王芊</td>
		 <td class="td_01" align="center"  > 2010-08-17</td>
		 <td class="td_01" align="center"  >卡片新增</td>

 </tr>
    <tr >
		 <td class="td_01"  ><input type="checkbox"></td>
 		 <td class="td_01" align="center"  >
		 <A onClick="javascript:window.location='main/card-add-3.html';" href="#" style="color:#FF0000">2110030100002374</A>
		 </td>
		 <td class="td_01" align="center"  >卡片新增审批</td>
		 <td class="td_01" align="center"  >王芊</td>
		 <td class="td_01" align="center"  > 2010-08-17</td>
		 <td class="td_01" align="center"  >卡片新增</td>

 </tr>
   <tr >
		 <td class="td_01"  ><input type="checkbox"></td>
 		 <td class="td_01" align="center"  >
		 <A onClick="javascript:window.location='main/card-add-3.html';" href="#" style="color:#FF0000">2110030100002374</A>
		 </td>
		 <td class="td_01" align="center"  >卡片新增审批</td>
		 <td class="td_01" align="center"  >王芊</td>
		 <td class="td_01" align="center"  > 2010-08-17</td>
		 <td class="td_01" align="center"  >卡片新增</td>

 </tr>
    <tr >
		 <td class="td_01"  ><input type="checkbox"></td>
 		 <td class="td_01" align="center"  >
		 <A onClick="javascript:window.location='main/card-add-3.html';" href="#" style="color:#FF0000">2110030100002374</A>
		 </td>
		 <td class="td_01" align="center"  >卡片新增审批</td>
		 <td class="td_01" align="center"  >王芊</td>
		 <td class="td_01" align="center"  > 2010-08-17</td>
		 <td class="td_01" align="center"  >卡片新增</td>

 </tr>
    <tr >
		 <td class="td_01"  ><input type="checkbox"></td>
 		 <td class="td_01" align="center"  >
		 <A onClick="javascript:window.location='main/card-add-3.html';" href="#" style="color:#FF0000">2110030100002374</A>
		 </td>
		 <td class="td_01" align="center"  >卡片新增审批</td>
		 <td class="td_01" align="center"  >王芊</td>
		 <td class="td_01" align="center"  > 2010-08-17</td>
		 <td class="td_01" align="center"  >卡片新增</td>

 </tr>
    <tr >
		 <td class="td_01"  ><input type="checkbox"></td>
 		 <td class="td_01" align="center"  >
		 <A onClick="javascript:window.location='main/card-add-3.html';" href="#" style="color:#FF0000">2110030100002374</A>
		 </td>
		 <td class="td_01" align="center"  >卡片新增审批</td>
		 <td class="td_01" align="center"  >王芊</td>
		 <td class="td_01" align="center"  > 2010-08-17</td>
		 <td class="td_01" align="center"  >卡片新增</td>

 </tr> 
</table> 
<table width="95%"  border="0" cellpadding="0" cellspacing="0" class="table02" align="center">
  <tr>
    <td height="30" align="right"><img src="../../资产管理/images/1.gif" width="4" height="5" align="absmiddle"> 首页　 <img src="../../资产管理/images/2.gif" width="3" height="5" align="absmiddle"> 上一页　 <img src="../../资产管理/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页　 <img src="../../资产管理/images/3.gif" width="4" height="5" align="absmiddle"> 末页　　共 1000 条记录 本页显示第1~10条 第1页/共100页 
	跳转到 <input name="pageNum" type="text" style="width:20px"> 页</td>
  </tr>
</table>    
</div> 


<div id="upperLayer1" style="display:none " >
 <table width="95%" border="0" cellspacing="0" cellpadding="0"  align="center">
      <tr>
            <td height="25"><img src="../../资产管理/images/main_28.gif" width="9" height="9" align="absmiddle"> <strong>已办事宜</strong></td>
			<td height="25" align="right"> <input type="button" class="buttonface02" value="收回" ></td>
      </tr>
      <tr>
			<td height="1" class="td05"><img src="../../资产管理/images/spacer.gif" width="1" height="1"></td	>
      </tr>
	  
	  
 </table>
 <table width="95%" border="0" cellspacing="0" cellpadding="0"  align="center" id="yiban">
 <tr  >
		<td class="td_top" ><input type="checkbox"  onClick="setCheckBoxInTable('yiban',this.checked)"/></td>
 		 <td class="td_top" align="center"  >审批单号</td>
		 <td class="td_top" align="center"  >标 题</td>
		 <td class="td_top"  align="center"  >拟稿人：</td>
	     <td class="td_top" align="center"  > 拟稿日期：</td>
		 <td class="td_top" align="center"  >流程名称</td>
		 <td class="td_top" align="center"  >发送日期</td>
		 <td class="td_top"  align="center"  >状态</td>
		 	 
 </tr>
  <tr >
		<td class="td_01"  ><input type="checkbox"></td>
 		 <td class="td_01" align="center"  ><a href="#" onClick="javascript:window.location='main/card-add-4.html';">2110030100002374</a></td> 
		 <td class="td_01" align="center"  >卡片新增审批</td>
		 <td class="td_01" align="center"  >王芊</td>
		 <td class="td_01" align="center"  > 2010-08-17</td>
		 <td class="td_01" align="center"  >卡片新增</td>
		 <td class="td_01" align="center"  > 2010-08-17</td>
		 <td class="td_01" align="center"  >未查看</td>	 
 </tr>
   <tr >
		<td class="td_01"  ><input type="checkbox"></td>
 		 <td class="td_01" align="center"  ><a href="#" onClick="javascript:window.location='main/card-add-4.html';">2110030100002374</a></td> 
		 <td class="td_01" align="center"  >卡片新增审批</td>
		 <td class="td_01" align="center"  >王芊</td>
		 <td class="td_01" align="center"  > 2010-08-17</td>
		 <td class="td_01" align="center"  >卡片新增</td>
		  <td class="td_01" align="center"  > 2010-08-17</td>
		 <td class="td_01" align="center"  >已查看</td>	 
 </tr>
 
</table>   
<table width="95%"  border="0" cellpadding="0" cellspacing="0" class="table02" align="center">
  <tr>
    <td height="30" align="right"><img src="../../资产管理/images/1.gif" width="4" height="5" align="absmiddle"> 首页　 <img src="../../资产管理/images/2.gif" width="3" height="5" align="absmiddle"> 上一页　 <img src="../../资产管理/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页　 <img src="../../资产管理/images/3.gif" width="4" height="5" align="absmiddle"> 末页　　共 1000 条记录 本页显示第1~10条 第1页/共100页 
	跳转到 <input name="pageNum" type="text" style="width:20px"> 页</td>
  </tr>
</table>
   
</div> 

<div id="upperLayer2"  style="display:none">
 <table width="95%" border="0" cellspacing="0" cellpadding="0"  align="center">
      <tr>
            <td height="25"><img src="../../资产管理/images/main_28.gif" width="9" height="9" align="absmiddle"> <strong>办结事宜</strong></td>
      </tr>
      <tr>
			<td height="1" class="td05"><img src="../../资产管理/images/spacer.gif" width="1" height="1"></td	>
      </tr>
	  
	  
 </table>
  <table width="95%" border="0" cellspacing="0" cellpadding="0"  align="center" id="banjie">
 <tr  >
		 <td class="td_top" ><input type="checkbox"  onClick="setCheckBoxInTable('banjie',this.checked)"/></td>
 		 <td class="td_top" align="center"  >审批单号</td>
		 <td class="td_top" align="center"  >标 题</td>
		 <td class="td_top" align="center"  >拟稿人：</td>
	     <td class="td_top" align="center"  >拟稿日期：</td>
		 <td class="td_top" align="center"  >流程名称</td>
		
 </tr>
  <tr >
		<td class="td_01"  ><input type="checkbox"></td>
 		 <td class="td_01" align="center"  ><a href="#"  onClick="javascript:window.location='main/card-add-5.html';">2110030100002374</a></td>
		  <td class="td_01" align="center"  >卡片新增审批</td>
		  <td class="td_01" align="center"  >王芊</td>
	      <td class="td_01" align="center"  > 2010-08-17</td>
		 <td class="td_01" align="center"  >卡片新增</td>
		
 </tr>
  <tr >
		<td class="td_01"  ><input type="checkbox"></td>
 		 <td class="td_01" align="center"  ><a href="#"  onClick="javascript:window.location='main/card-add-5.html';">2110030100002374</a></td>
		  <td class="td_01" align="center"  >卡片新增审批</td>
		  <td class="td_01" align="center"  >王芊</td>
	      <td class="td_01" align="center"  > 2010-08-17</td>
		 <td class="td_01" align="center"  >卡片新增</td>
		
 </tr>
 
</table>   
<table width="95%"  border="0" cellpadding="0" cellspacing="0" class="table02" align="center">
  <tr>
    <td height="30" align="right"><img src="../../资产管理/images/1.gif" width="4" height="5" align="absmiddle"> 首页　 <img src="../../资产管理/images/2.gif" width="3" height="5" align="absmiddle"> 上一页　 <img src="../../资产管理/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页　 <img src="../../资产管理/images/3.gif" width="4" height="5" align="absmiddle"> 末页　　共 1000 条记录 本页显示第1~10条 第1页/共100页 
	跳转到 <input name="pageNum" type="text" style="width:20px"> 页</td>
  </tr>
</table>
   
</div> 
<div id="upperLayer3" style="display:none" >
 <table width="95%" border="0" cellspacing="0" cellpadding="0"  align="center">
      <tr>
            <td height="25"><img src="../../资产管理/images/main_28.gif" width="9" height="9" align="absmiddle"> <strong>草稿箱</strong></td>
			 <td align="right">
		<input name="Submit2" type="submit" class="buttonface02" value="删除" onClick="javascript:if(confirm('确实要删除吗？'))location='#'">	
	</td>
      </tr>
      <tr>
			<td height="1" class="td05"><img src="../../资产管理/images/spacer.gif" width="1" height="1"></td	>
      </tr>
	  
	  
 </table>
 <table width="95%" border="0" cellspacing="0" cellpadding="0"  align="center" id="caogao">
 <tr  >
		 <td class="td_top" ><input type="checkbox"  onClick="setCheckBoxInTable('caogao',this.checked)"/></td>
 		 <td class="td_top"  align="center" >序号</td>
	     <td class="td_top"  align="center" > 拟稿日期：</td>
		 <td class="td_top"  align="center" >标 题</td>
 </tr>
  <tr >
		 <td class="td_01"  ><input type="checkbox"></td>
 		 <td class="td_01"  align="center" >1</td>
	     <td class="td_01"  align="center" > 2010-08-17</td>
		 <td class="td_01"  align="center" ><a href="../../资产管理/html/card/hujiangnan-card-change-draft.html" target="_blank">卡片变动审批</a></td>

 </tr>
  <tr >
		 <td class="td_01"  ><input type="checkbox"></td>
 		 <td class="td_01"  align="center" >2</td>
	     <td class="td_01" align="center" >  2010-08-17</td>
		 <td class="td_01"  align="center" ><a href="../../资产管理/html/card/hujiangnan-card-change-draft.html" target="_blank">卡片变动审批</a></td>

 </tr>
 
</table>   

<table width="95%"  border="0" cellpadding="0" cellspacing="0" class="table02" align="center">
  <tr>
    <td height="30" align="right"><img src="../../资产管理/images/1.gif" width="4" height="5" align="absmiddle"> 首页　 <img src="../../资产管理/images/2.gif" width="3" height="5" align="absmiddle"> 上一页　 <img src="../../资产管理/images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页　 <img src="../../资产管理/images/3.gif" width="4" height="5" align="absmiddle"> 末页　　共 1000 条记录 本页显示第1~10条 第1页/共100页 
	跳转到 <input name="pageNum" type="text" style="width:20px"> 页</td>
  </tr>
</table> 
</div> 
</body>
</html>
