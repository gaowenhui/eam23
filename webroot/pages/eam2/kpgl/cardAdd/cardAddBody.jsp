<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
//YanPeiling modify 2011-1-8 start
String hiddenZCChoiceButton = (String)request.getAttribute("hiddenZCChoiceButton");
String zcId = (String)request.getAttribute("zcId");
String zcbh = (String)request.getAttribute("zcbh");
String zcmc = (String)request.getAttribute("zcmc");
String zczt = (String)request.getAttribute("zczt");
//YanPeiling modify 2011-1-8 start
String headId = request.getParameter("headId");
String bodyId = request.getParameter("bodyId");
String sheetType = request.getParameter("sheetType");
String zcType = (String)request.getAttribute("zcType");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>卡片新增</title>
<link href="../../css/style.css" rel="stylesheet" type="text/css">
<script language="JavaScript" type="text/javascript" src="../../js/win_center.js"></script>
<script type= "text/javascript" src= "../../js/tab.js"> </script>
<script type="text/javascript" src="../../js/oper_table.js"></script>
<script type="text/javascript" src="../../js/custom/tools.js"></script>
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
	function displayCardType(index){
		for(var i=1;i<5;i++){
			if(index==i){
				document.getElementById("card_type"+i).style.display="block";
				if(index==1)
					document.getElementById("radiobutton0").checked="true";
				else if(index==4)
					document.getElementById("radiobutton8").checked="true";
			}else{
			   document.getElementById("card_type"+i).style.display="none";
			}
		}
	}
	var secondCardType = {"total" :[
							{"type":"94"},//房屋及建筑物  //  卡片类型在dic_app_asset_state表中，取的是pk_id，一期取的也是这个字段
							{"type":"95"},//土地
							{"type":"96"},//在建工程
							{"type":"98"},//无形资产
							{"type":"21628"},//投资性房屋
							{"type":"21629"},//投资性土地
							{"type":"93"},//交通运输设备
							{"type":"97"},//电子设备及其他
							{"type":"1668"},//经营租入固定资产改良
							{"type":"1669"},//长期待摊
							{"type":"1670"}//装修
							]};
	function secondDisplayCardType(index){
		var total = secondCardType.total;
		var url = "<%=request.getContextPath()%>/kpgl/cardBody_cardType.do?cardType="+total[index].type+"&headId="+"<%=headId %>&sheetType=<%=sheetType%>&zcType=<%=zcType%>&hiddenZCChoiceButton=<%=hiddenZCChoiceButton%>&zcId=<%=zcId%>&zcbh=<%=zcbh%>&zcmc=<%=zcmc%>&zczt=<%=zczt%>";
		cardAdd.window.location = url ;
	}
	function onload(){
		var total = secondCardType.total;
		var url = "<%=request.getContextPath()%>/kpgl/cardBody_cardType.do?cardType="+total[0].type+"&headId="+"<%=headId %>&sheetType=<%=sheetType%>&zcType=<%=zcType%>&hiddenZCChoiceButton=<%=hiddenZCChoiceButton%>&zcId=<%=zcId%>&zcbh=<%=zcbh%>&zcmc=<%=zcmc%>&zczt=<%=zczt%>";//total[0]为默认取房屋及建筑物页面
		cardAdd.window.location = url;
	}
</SCRIPT>
</head>
<body onload="onload()" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0"><br>
<table width="95%" border="0" cellpadding="2" cellspacing="0" align="center" >
  <tr>
    <td height="25" align="center" valign="bottom" class="td06">
		<table width="95%" border="0" cellspacing="3" cellpadding="0"  >
		  <tr>
			<td width="15"><img src="<%=request.getContextPath() %>/resource/ProjectImages/index_32.gif" width="9" height="9"></td>
			<td valign="bottom" class="title">卡片新增</td>
		  </tr>
		</table>
	</td>
  </tr>
</table>
	<table width="95%" border="0" cellpadding="2" cellspacing="0" align="center" id="mytable" >
	  <tr>
		<td width="105"  class="td07" valign="baseline">资产类型:</td>
		<td width="1151"  class="td07"><form name="form1" method="post" action="">
		  <label><input type="radio" name="radiobutton" onClick="displayCardType(1);secondDisplayCardType(0)" checked="checked" >不动产</label>
		  <label><input type="radio" name="radiobutton" onClick="displayCardType(2);secondDisplayCardType(6)">交通工具</label>
		  <label><input type="radio" name="radiobutton" onClick="displayCardType(3);secondDisplayCardType(7)">设备</label>
		  <label><input type="radio" name="radiobutton" onClick="displayCardType(4);secondDisplayCardType(8)">其他</label>
		</form></td>
	  </tr>
	  <tr style="display:block" id="card_type1">
		<td valign="baseline"  class="td07" >卡片类别：</td>
		<td  class="td07" ><form name="form2" method="post" action="">
		  <label><input type="radio" id="radiobutton0" name="radiobutton" onClick="secondDisplayCardType(0)" checked="checked" >房屋及建筑物</label>
		  <label><input type="radio" id="radiobutton1" name="radiobutton" onClick="secondDisplayCardType(1)">土地</label>
		  <label><input type="radio" id="radiobutton2" name="radiobutton" onClick="secondDisplayCardType(2)">在建工程</label>
		  <label><input type="radio" id="radiobutton3" name="radiobutton" onClick="secondDisplayCardType(3)">无形资产</label>
		  <label><input type="radio" id="radiobutton4" name="radiobutton" onClick="secondDisplayCardType(4)">投资性房屋</label>
		  <label><input type="radio" id="radiobutton5" name="radiobutton" onClick="secondDisplayCardType(5)">投资性土地</label>	
		</form></td>
	  </tr>
	  <tr style="display:none" id="card_type2">
		<td valign="baseline" class="td07">卡片类别：	    </td>
		<td class="td07"><form name="form2" method="post" action="">
		  <label><input type="radio" id="radiobutton6" name="radiobutton" checked="checked">交通运输设备</label>
		</form></td>
	  </tr>
	  <tr style="display:none" id="card_type3">
		<td valign="baseline" class="td07">卡片类别：	    </td>
		<td class="td07"><form name="form2" method="post" action="">
		  <label><input type="radio" id="radiobutton7" name="radiobutton" checked="checked">电子设备及其他</label>
		</form></td>
	  </tr>
	  <tr style="display:none" id="card_type4">
		<td valign="baseline" class="td07">卡片类别：</td>
		<td class="td07"><form name="form2" method="post" action="">
		  <label><input type="radio" id="radiobutton8" name="radiobutton" onClick="secondDisplayCardType(8)" checked="checked">经营租入固定资产改良</label>
		  <label><input type="radio" id="radiobutton9" name="radiobutton" onClick="secondDisplayCardType(9)">长期待摊</label>
		  <label><input type="radio" id="radiobutton10" name="radiobutton" onClick="secondDisplayCardType(10)">装修</label>
		</form></td>
	  </tr>
	</table>
	<table width="100%" border="0" cellpadding="2" cellspacing="0" align="center"  >
		<tr>
			<td colspan="6">
				<iframe id="cardAdd" frameBorder=0 height="800" width="100%" scrolling="no"
					src="">
				</iframe>
			</td>
		</tr>
	</table>
</body>
</html>
<SCRIPT LANGUAGE="JavaScript">
	if('<%=request.getAttribute("message")%>' != "null") {
		alert("<%=request.getAttribute("message")%>！"); 
		window.close();
	}
</SCRIPT>
