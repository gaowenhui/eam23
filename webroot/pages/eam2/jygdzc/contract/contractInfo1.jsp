<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<head>
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
    td.className = 'td_form02';
    td.colSpan = '9';
    td.innerHTML="<a href='#' onclick='TableBox.deleteRow(parentElement.parentElement.rowIndex)'>&nbsp;x&nbsp;</a>&nbsp;开始日期:<input class='input'style='width:100'>&nbsp;结束日期:<input class='input' style='width:100'>&nbsp;变动:<input style='width:100' class='input'>&nbsp;月租金:<input style='width:100' class='input'>";
    }


</SCRIPT>
</head>
<html>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<input type="text"  name="headId" value="${headId}" />
<input type="text"  name="head.id" value="${headId}" />
<input type="text" name="head.lcmc" value="${sheettype}" />
<s:set name="biaodanid" value="head.id" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<s:hidden name="deptid" value="11318" />
<table width="98%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="25" align="center" valign="bottom" class="td06">
        <table width="95%" border="0" cellspacing="3" cellpadding="0">
          <tr>
            <td width="15"><img src="../../images/index_32.gif" width="9" height="9"></td>
            <td valign="bottom" class="title">合同信息</td>
          </tr>
        </table>
    </td>
  </tr>
</table>

<TABLE  align="center" border=0 id="upperTable" style="border-color:blue; " width="95%">
    <TR oncontextmenu='return false' ondragstart='return false' onselectstart ='return false' onselect='document.selection.empty()' oncopy='document.selection.empty()' onbeforecopy='return false' onmouseup='document.selection.empty()'>
       <TD class="clicked" onClick="displayUpperLayer(0)">合同信息</TD>
       <TD class="ttd"  onClick="displayUpperLayer(1)">变动记录</TD>
       <TD class="ttd"  onClick="displayUpperLayer(2)">资产信息</TD>
       <TD class="ttd"  onClick="displayUpperLayer(3)">清算信息</TD>
    </TR>
</TABLE>
<div  style="display:block" id="upperLayer0">
    <iframe id="contentRight" name="contentRight" src="<%=request.getContextPath() %>/pages/eam2/jygdzc/contract/Info/zulin.jsp" width="100%" height="100%" frameborder="0" scrolling="auto"></iframe>
</div>
<div  style="display:none" id="upperLayer1">
    <iframe id="contentRight" name="contentRight" src="<%=request.getContextPath() %>/pages/eam2/jygdzc/contract/Info/change.jsp" width="100%" height="100%" frameborder="0" scrolling="auto"></iframe>
</div>
<div  style="display:none" id="upperLayer2">
    <iframe id="contentRight" name="contentRight" src="<%=request.getContextPath() %>/pages/eam2/jygdzc/contract/Info/assetInfo.jsp" width="100%" height="100%" frameborder="0" scrolling="auto"></iframe>
</div>
<div  style="display:none" id="upperLayer3">
    <iframe id="contentRight" name="contentRight" src="<%=request.getContextPath() %>/pages/eam2/jygdzc/contract/Info/liquidateInfo.jsp" width="100%" height="100%" frameborder="0" scrolling="auto"></iframe>
</div>
    
</body>
</html>
