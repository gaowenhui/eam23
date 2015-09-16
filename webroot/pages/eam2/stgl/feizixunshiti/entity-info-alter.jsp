<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/stgl/checkJS.inc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<base href="<%=basePath %>"/>
<title>非造价咨询类实体</title>
<SCRIPT language=JavaScript type=text/JavaScript>	
	function AddTable(){
	var tr = TableBox1.insertRow();

	var td = tr.insertCell()
	
	td.colSpan = '19';

	td.innerHTML="<a href='#' onclick='DeleteTr()'>&nbsp;x&nbsp;</a>股东名称：<input type='text'>控股比例（%）：<input type='text'>注册资本（元）：<input type='text'>出资方式：<select><option value='1'>货币</option><option value='2'>实物</option><option value='3'>土地（含房屋）</option><option value='4'>无形资产</option><option value='5'>其他（见备注）</option></select>\
                出资情况:\
                  <select>\
                  <option value='1'>出资到位</option>\
                  <option value='2'>出资不实但达到最低出资额</option>\
                  <option value='3'>出资不实未达到最低出资额</option>\
                  <option value='4'>未出资</option>\
                  </select>\
				  <br>出资不实的数额(万元）:<input type='text'>\
                  抽逃出资:\
                  <select >\
                  <option value='1'>存在</option>\
                  <option value='2'>不存在</option>\
                  <option value='3'>无资料</option>\
                  </select>\
                  抽逃数额(元 )：\
                &nbsp;\
                <input ></input>\
                独立法人资格:\
                <select >\
                  <option value='1'>是</option>\
                  <option value='2'>否</option>\
                </select><br><br>";
	
	}	
function AddTable1(tableid){
	
	var tr =  document.getElementById(tableid).insertRow();
	var td = tr.insertCell();
	 td.className = 'td_form01_1';
	td.colSpan = '8';
	td.innerHTML="<a href='#' onclick='DeleteTr1(this,\"" + tableid + "\")'>&nbsp;x&nbsp;</a>&nbsp;姓名：<input  style='width:100'>&nbsp;联系方式：<input   style='width:100'>&nbsp;工作单位：<input   style='width:100'>";
	
	}
	function DeleteTr1(r,id){

			 var b=r.parentNode.parentNode.rowIndex
			 document.getElementById(id).deleteRow(b)
 
	}
	function up(){
	var a="启动清算";
	var b="清算报告审批";
	var c="缴销营业执照";
	var huanjie=document.getElementById("dqjd");
				
			if (huanjie.value ==a ){
				alert("已经是起始阶段");
			
			}else{
				if(huanjie.value==b ){
					huanjie.value=a;
					qidong.style.display="block";
					shenpi.style.display="none";
					jiaoxiao.style.display="none";
				}else{
					if(huanjie.value==c ){
						huanjie.value=b;
						qidong.style.display="none";
						shenpi.style.display="block";
						jiaoxiao.style.display="none";
					}
				}
			}
 }	
function down (){
	var a="启动清算";
	var b="清算报告审批";
	var c="缴销营业执照";
	var huanjie=document.getElementById("dqjd");
				
			if (huanjie.value ==a ){
					huanjie.value=b;
					qidong.style.display="none";
					shenpi.style.display="block";
					jiaoxiao.style.display="none";
			
			}else{
				if(huanjie.value==b ){
					huanjie.value=c;
					qidong.style.display="none";
					shenpi.style.display="none";
					jiaoxiao.style.display="block";
				}else{
					if(huanjie.value==c ){
						alert("已经是最后阶段");
					}
				}
			}
 }	
	function DeleteTr(){
			TableBox1.deleteRow();
	}
	function displayUpperLayer(index){
		for(var i=0;i<9;i++){
			if(index==i){
			   document.getElementById("upperLayer"+i).style.display="block";
			}else{
			   document.getElementById("upperLayer"+i).style.display="none";
			}
		}
	}
	function disposalgqzr(){
	gqzrWhole.style.display=gqzrWhole.style.display=='none'?'block':'none';
	nbgb.style.display='none';
	pcqs.style.display='none';

	}
	function disposalnbgb(){
	nbgb.style.display=nbgb.style.display=='none'?'block':'none';
	gqzrWhole.style.display='none';
	pcqs.style.display='none';

	}
	function disposalpcqs(){
	pcqs.style.display=pcqs.style.display=='none'?'block':'none';
	nbgb.style.display='none';
	gqzrWhole.style.display='none';

	}
	 function getWidthAndHeigh(resize) {
                var iframeHeight = document.body.clientHeight;
                var iframeWidth = document.body.clientWidth;
                var browser=navigator.appName;
             // chrome
                if (browser == "chrome") {
                        iframeWidth -= 16;
                        iframeHeight -= 85;
                }
                // firefox
                else if (browser == "firefox") {
                        iframeWidth -= 15;
                        iframeHeight -= 85;
                        if (resize) {
                                iframeWidth += 18;
                                iframeHeight += 13;
                        }
                } 
                // IE
                else {

                        iframeWidth -= 12;
                        iframeHeight -= 83;
                        if (resize) {
                                iframeHeight += 15;
                                iframeWidth += 10;
                        }
                }
                return {width: iframeWidth, height: iframeHeight};
        }

</SCRIPT>
<style>
.mouseover{
	abc:expression(this.onmouseout=mouseout);
	efg:expression(this.onmouseover=mouseover);
	opq:expression(this.onclick=releaseFunction);
	font-family : Verdana;
	font-size: 12;
	cursor:hand;
	height: 18;
	border:1px groove orange;
	border-bottom-style: groove;
	border-width : think;
	padding-left: 3px;
	text-align:center;
	
	background-color="orange";
	font-weight : italic;
}

.mouseout{
	abc:expression(this.onmouseout=mouseout);
	efg:expression(this.onmouseover=mouseover);
	opq:expression(this.onclick=releaseFunction);
	font-family : Verdana;
	font-size: 12;
	cursor:hand;
	height: 18;
	border:1px groove orange;
	border-bottom-style: groove;
	border-width : think;
	padding-left: 3px;
	text-align:center;	
	background-color="white";
	font-weight : normal;
}


.clicked
{
abc:expression(this.onmouseout=mouseout);
efg:expression(this.onmouseover=mouseover);
opq:expression(this.onclick=releaseFunction);
font-family : Verdana;
font-size: 12;
cursor:hand;
height: 18;
border:1px groove orange;
border-bottom-style: groove;
border-width : think;
padding-left: 3px;
text-align:center;

background-color="#C3DAF2";
font-weight : bold;
border-bottom-style : none;

}

.ttd {
abc:expression(this.onmouseout=mouseout);
efg:expression(this.onmouseover=mouseover);
opq:expression(this.onclick=releaseFunction);
font-family : Verdana;
font-size: 12;
cursor:hand;
height: 18;
border:1px groove orange;
border-bottom-style: groove;
border-width : think;
padding-left: 3px;
text-align:center;
}



.panelUpper{
border-width: 1px;
border-style: solid ;
width: 98%;
height:90%;
z-index: 1;
overflow: auto;
}


.panelLower{
border-width: 1px;
border-style: solid ;
width: 98%;
height:90%;

z-index: 1;
overflow: auto;
}

</style>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">

<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td height="25" align="center" valign="bottom" class="td06">
		<table width="98%" border="0" cellspacing="3" cellpadding="0">
		  <tr>
			<td width="15"><img src="resource/ProjectImages/index_32.gif" width="9" height="9"></td>
			<td valign="bottom" align="left" class="title">非造价咨询类实体信息</td>
		  </tr>
		</table>
	</td>
  </tr>
</table>

<TABLE  border=0 id="upperTable" style="border-color:blue; " width="98%" align="center">
	<TR oncontextmenu='return false' ondragstart='return false' onselectstart ='return false' onselect='document.selection.empty()' oncopy='document.selection.empty()' onbeforecopy='return false' onmouseup='document.selection.empty()'>
	   <TD width="11%" class="clicked"  onClick="displayUpperLayer(0)">基本信息</TD>
	   <TD   width="11%" class="ttd"  onClick="displayUpperLayer(1)">实体人员信息</TD>
	   <TD width="11%" class="ttd"  onClick="displayUpperLayer(2)">文件及公章存放情况</TD>
	   <TD width="11%" class="ttd"  onClick="displayUpperLayer(3)">实体资产情况</TD>
	   <TD width="11%" class="ttd"  onClick="displayUpperLayer(4)">债权债务情况</TD>
	   <TD  width="11%"class="ttd"  onClick="displayUpperLayer(5)">诉讼情况</TD>
	   <TD  width="11%" class="ttd"  onClick="displayUpperLayer(6)">日志信息</TD>
	   <TD  width="11%" class="ttd"  onClick="displayUpperLayer(7)">流程信息</TD>
	   <TD   class="ttd"  onClick="displayUpperLayer(8)">处置信息</TD>
    </TR>
</TABLE>

<div  style="display:block"  id="upperLayer0">
  <div align="left"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;基本信息</strong>  </div>
  <table width="98%" border="1" cellpadding="0" cellspacing="0" align="center"  >
    <tr>
      <td  width="11%" class="td_form01">资产编号：</td>
      <td  class="td_form02"><input name="text" type="text" />
          <input type="submit" name="Submit3" value="生成编号" />      </td>
      <td width="11%"  class="td_form01">实体名称：</td>
      <td  class="td_form02"><input type="text" name="beginTime27" /></td>
      <td class="td_form01">省份：</td>
      <td  class="td_form02"><select name="select4">
          <option value="1">广东</option>
          <option value="2">江苏</option>
          <option value="3">山东</option>
          <option value="4">四川</option>
          <option value="5">浙江</option>
          <option value="6">辽宁</option>
          <option value="7">河南</option>
          <option value="8">湖北</option>
          <option value="9">福建</option>
          <option value="10">河北</option>
          <option value="11">湖南</option>
          <option value="12">上海</option>
          <option value="13">香港</option>
          <option value="14">北京</option>
          <option value="15">黑龙江</option>
          <option value="16">天津</option>
          <option value="17">重庆</option>
          <option value="18">江西</option>
          <option value="19">山西</option>
          <option value="20">安徽</option>
          <option value="21">陕西</option>
          <option value="22">海南</option>
          <option value="23">云南</option>
          <option value="24">甘肃</option>
          <option value="25">内蒙古</option>
          <option value="26">贵州</option>
          <option value="27">新疆</option>
          <option value="28">西藏</option>
          <option value="29">青海</option>
          <option value="30">广西</option>
          <option value="31">澳门</option>
          <option value="32">宁夏</option>
          <option value="33">吉林</option>
        </select>      </td>
    </tr>
    <tr>
      <td width="11%" class="td_form01">成立时间：</td>
      <td width="21%"  class="td_form02"><input type="text" name="beginTime272" /></td>
      <td  class="td_form01">实体现状：</td>
      <td class="td_form02"><select name="select4">
          <option value="1">正常年检</option>
          <option value="2">停业</option>
          <option value="3">吊销未清算</option>
          <option value="4">吊销清算中</option>
          <option value="5">破产中</option>
          <option value="6">注销</option>
          <option value="7">已关闭</option>
          <option value="8">其他(见备注)</option>
        </select>      </td>
      <td class="td_form01">尚有人员数：</td>
      <td class="td_form02"><input type="text"></td>
    </tr>
    <tr>
      <td class="td_form01">有无历史遗留问题：</td>
      <td class="td_form02"><input type="radio"/>
        有
          <input type="radio"/>
        无 </td>
      <td class="td_form01">&nbsp;</td>
      <td class="td_form02">&nbsp;</td>
      <td class="td_form01">&nbsp;</td>
      <td class="td_form02">&nbsp;</td>
    </tr>
	    <tr>
      <td class="td_form01">历史遗留问题描述：</td>
      <td colspan="5" class="td_form02"><textarea name="textarea3" cols="144" rows="3"></textarea></td>
	    </tr>
  </table>
  <br/>
<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
       <tr>
         <td height="5" align="right">
                <table id="contributions_list"> </table>
				<div id="pgtoolbarcontributions"></div>
       </td>
     </tr>
</table>
<br/>
	<div align="left"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;财务信息</strong></div>
	<table width="98%" border="1" cellpadding="0" cellspacing="0" align="center"  >
    <tr>
      <td class="td_form01">原值：</td>
      <td class="td_form02"><input type="text" name="beginTime28" />
        万
        元</td>
      <td class="td_form01">净值：</td>
      <td class="td_form02"><input name="text" type="text" />
        万元</td>
      <td class="td_form01">减值准备：</td>
      <td class="td_form02"><input type="text" name="beginTime211" />
        万元</td>
    </tr>
    <tr>
      <td class="td_form01">对建投是否有负债：</td>
      <td class="td_form02"><input type="radio"/>
        有
        <input type="radio"/>
        无 </td>
      <td class="td_form01">负债金额：</td>
      <td class="td_form02"><input type="text" name="beginTime282" />
        万
        元</td>
      <td class="td_form01">&nbsp;</td>
      <td class="td_form02">&nbsp;</td>
    </tr>
    <tr>
      <td class="td_form01">账面内是否有预计负债：</td>
      <td class="td_form02"><input type="radio"/>
        有
        <input type="radio"/>
        无 </td>
      <td class="td_form01">预计负债金额：</td>
      <td class="td_form02"><input type="text" name="beginTime29" />
        万元</td>
      <td class="td_form01">&nbsp;</td>
      <td class="td_form02">&nbsp;</td>
    </tr>
    <tr>
      <td class="td_form01">账面资产总额：</td>
      <td class="td_form02"><input name="text" type="text" />
        万元</td>
      <td class="td_form01">账面资产负债：</td>
      <td class="td_form02"><input type="text" name="beginTime29" />
        万元</td>
      <td class="td_form01">&nbsp;</td>
      <td class="td_form02">&nbsp;</td>
    </tr>
    <tr>
      <td class="td_form01">备注：</td>
      <td colspan="5" class="td_form02"><textarea name="textarea" cols="144" rows="3"></textarea>
        <input name="button" type="button" value="确定"/>
      <input name="reset" type="reset" value="重置"/></td>
    </tr>
  </table>
</div>
	
	<div  style="display:none"  id="upperLayer1">

<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
       <tr>
         <td height="5" align="right">
              <div id="pgtoolbar2"></div>
              <table id="insider_list"> </table>				
       </td>
     </tr>
</table>
<br/>

<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
       <tr>
         <td height="5" align="right">
		         <div id="pgtoolbar3"></div>
                <table id="anzhiPerson_list"> </table>
				
       </td>
     </tr>
</table>
	</div>
	<div   style="display:none"  id="upperLayer2">
<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
       <tr>
         <td height="5" align="right">
		         <div id="pgtoolbar4"></div>
                <table id="filter_list"> </table>
				
       </td>
     </tr>
</table>
<br/>
	</div>	
		
	<div   style="display:none"  id="upperLayer3">
<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
       <tr>
         <td height="5" align="right">
		         <div id="pgtoolbar5"></div>
                <table id="cash_list"> </table>
				
       </td>
     </tr>
</table>
<br/>


<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
       <tr>
         <td height="5" align="right">
                <table id="land_list"> </table>
				<div id="pgtoolbarland"></div>
       </td>
     </tr>
</table>

<br/>

<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
       <tr>
         <td height="5" align="right">
                <table id="house_list"> </table>
				<div id="pgtoolbarhouse"></div>
       </td>
     </tr>
</table>
<br/>
<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">

<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
       <tr>
         <td height="5" align="right">
                <table id="machine_list"> </table>
				<div id="pgtoolbarmachine"></div>
       </td>
     </tr>
</table>
<br/>

<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
       <tr>
         <td height="5" align="right">
                <table id="traffic_list"> </table>
				<div id="pgtoolbartraffic"></div>
       </td>
     </tr>
</table>
<br/>

</table>
<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
       <tr>
         <td height="5" align="right">
                <table id="invest_list"> </table>
				<div id="pgtoolbarinvest"></div>
       </td>
     </tr>
</table>
<br/>


<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
       <tr>
         <td height="5" align="right">
                <table id="otherasset_list"> </table>
				<div id="pgtoolbarotherasset"></div>
       </td>
     </tr>
</table>
	</div>	
	
	<div   style="display:none"  id="upperLayer4">

<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
       <tr>
         <td height="5" align="right">
                <table id="claims_list"> </table>
				<div id="pgtoolbarclaims"></div>
       </td>
     </tr>
</table>
<br/>
<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
       <tr>
         <td height="5" align="right">
                <table id="debt_list"> </table>
				<div id="pgtoolbardebt"></div>
       </td>
     </tr>
</table>
<br/>
  <table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
       <tr>
         <td height="5" align="right">
                <table id="taxPayment_list"> </table>
				<div id="pgtoolbartaxPayment"></div>
       </td>
     </tr>
</table>
	</div>	
	
	<div   style="display:none"  id="upperLayer5">
	<table width="98%"  border="0" cellspacing="2" cellpadding="0" align="center">
  <tr> 
    <td align="right"><div align="left"><strong>起诉类案件</strong></div>
    <td align="right"><input name="Submit22" type="submit" class="buttonface02" value="案件新增" 
		onclick="javascript:window.location='lawsuit-add.html'" />    
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" id="it">
  <tr> 
    <td align="center" class="td_top"><input type="checkbox" name="checkbox3" value="checkbox" onClick="setCheckBoxInTable('it',this.checked)"/>全选</td>
    <td class="td_top" align="center">所属省份</td>
    <td class="td_top" align="center">资产类型</td>
    <td class="td_top" align="center">收案日期</td>
    <td class="td_top" align="center">原告</td>	
    <td class="td_top" align="center">被告</td>
    <td class="td_top" align="center">第三人</td>
    <td class="td_top" align="center">诉讼类型</td>
	<td class="td_top" align="center">案件类别</td>
	
  </tr>

    <tr> 
    <td align="center" class="td_01"><input type="checkbox" name="checkbox3" value="checkbox"></td>
    <td class="td_01" align="center"><a href="#" onClick="javascript:openwindow('card-info.html','',1024,500)">内蒙古</a></td>
    <td class="td_01" align="center">房屋</td>
    <td class="td_01" align="center">2010-08-10</td>
    <td class="td_01" align="center">内蒙古自治区建银房地产开发总公司</td>
    <td class="td_01" align="center">呼和浩特市金诺房地产开发有限责任公司</td>
    <td class="td_01" align="center">建行</td>
	<td class="td_01" align="center">起诉</td>
	<td class="td_01" align="center">胜诉执结案件</td>
  </tr>
 
</table>
<br/>
<table width="98%"  border="0" cellspacing="2" cellpadding="0" align="center">
  <tr>
    <td align="right"><div align="left"><strong>被诉类案件</strong> </div></td>
    <td align="right"><input name="Submit222" type="submit" class="buttonface02" value="案件新增" 
		onclick="javascript:window.location='lawsuit-add.html'" />
    </td>
  </tr>
</table>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" id="it">
  <tr>
    <td align="center" class="td_top"><input type="checkbox" name="checkbox32" value="checkbox" onclick="setCheckBoxInTable('it',this.checked)"/>
      全选</td>
    <td class="td_top" align="center">所属省份</td>
    <td class="td_top" align="center">资产类型</td>
    <td class="td_top" align="center">收案日期</td>
    <td class="td_top" align="center">原告</td>
    <td class="td_top" align="center">被告</td>
    <td class="td_top" align="center">第三人</td>
    <td class="td_top" align="center">诉讼类型</td>
    <td class="td_top" align="center">案件类别</td>
  </tr>
  <tr>
    <td align="center" class="td_01"><input type="checkbox" name="checkbox32" value="checkbox" /></td>
    <td class="td_01" align="center"><a href="#" onclick="javascript:openwindow('card-info.html','',1024,500)">内蒙古</a></td>
    <td class="td_01" align="center">房屋</td>
    <td class="td_01" align="center">2010-08-10</td>
    <td class="td_01" align="center">内蒙古自治区建银房地产开发总公司</td>
    <td class="td_01" align="center">呼和浩特市金诺房地产开发有限责任公司</td>
    <td class="td_01" align="center">建行</td>
    <td class="td_01" align="center">起诉</td>
    <td class="td_01" align="center">胜诉执结案件</td>
  </tr>
</table>
    </div>
	<div   style="display:none"  id="upperLayer6">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td class="td_page">修改时间：从
      <input type="text" name="textfield"/>
	到
	<input type="text" name="textfield3"/>
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;修改人
    <input type="text" name="textfield2"/>
    <input name="Submit2" type="submit" class="buttonface" value="  查询  "/>
    <input name="Submit" type="submit" class="buttonface" value="  重置  "/></td>
  </tr>
</table>
<div align="right">
  <tr> 
    <td>
      
      <div align="right">
        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" id="Table1">
          <tr>
            <td align="center" class="td_form02">&nbsp;</td>
          </tr>
        </table>
      </div></td>
  </tr>
</div>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" id="Table1">
  
  <tr>
    <td width="5%" class="td_top">修改人</td>
    <td width="6%" class="td_top">修改时间</td>
    <td width="7%" class="td_top">修改对象</td>
    <td width="6%" class="td_top">修改属性</td>
    <td width="6%" class="td_top">修改前值</td>
    <td width="6%" class="td_top">修改后值</td>
  </tr>
  <tr>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
  </tr>
  <tr>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
  </tr>
  <tr>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
  </tr>
  <tr>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
  </tr>
  <tr>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
  </tr>
  <tr>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
  </tr>
  <tr>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
  </tr>
  <tr>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
  </tr>
</table>
<table width="98%"  border="0" cellpadding="0" cellspacing="0" class="table02" align="center">
  <tr>
    <td height="30" align="right"><img src="resource/ProjectImages/1.gif" width="4" height="5" align="absmiddle"/> 首页　 <img src="resource/ProjectImages/2.gif" width="3" height="5" align="absmiddle"/> 上一页　 <img src="resource/ProjectImages/2-2.gif" width="3" height="5" align="absmiddle"/> 下一页　 <img src="resource/ProjectImages/3.gif" width="4" height="5" align="absmiddle"/> 末页　　共 1000 条记录 本页显示第1~10条 第1页/共100页 
      跳转到
      <input name="pageNum" type="text" style="width:20px"/>
      页</td>
  </tr>
</table>	
	</div>	
	
	<div   style="display:none"  id="upperLayer7">
	<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td class="td_page">拟稿时间：从
      <input type="text" name="textfield"/>
	到
	<input type="text" name="textfield3"/>
	&nbsp;&nbsp;标 题
	<input type="text" name="textfield22" />	&nbsp;&nbsp;拟稿人：
    <input type="text" name="textfield2"/>
    <input name="Submit2" type="submit" class="buttonface" value="  查询  "/>
    <input name="Submit" type="submit" class="buttonface" value="  重置  "/></td>
  </tr>
</table>
<div align="right">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" >
  <tr> 
    <td>
      
      <div align="right">
        <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" id="Table1">
          <tr>
            <td align="center" class="td_form02">&nbsp;</td>
          </tr>
        </table>
      </div>
	  </td>
  </tr>
 </table>
</div>
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" >
  
  <tr>
    <td width="5%" class="td_top">审批单号</td>
    <td width="6%" class="td_top">标 题</td>
    <td width="7%" class="td_top">拟稿人：</td>
    <td width="6%" class="td_top">拟稿日期：</td>
  </tr>
  <tr>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
  </tr>
  <tr>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
  </tr>
  <tr>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
  </tr>
  <tr>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
  </tr>
  <tr>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
  </tr>
  <tr>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
  </tr>
  <tr>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
  </tr>
  <tr>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
  </tr>
</table>
<table width="98%"  border="0" cellpadding="0" cellspacing="0" class="table02" align="center">
  <tr>
    <td height="25" align="right"><img src="resource/ProjectImages/1.gif" width="4" height="5" align="absmiddle"/> 首页　 <img src="resource/ProjectImages/2.gif" width="3" height="5" align="absmiddle"/> 上一页　 <img src="resource/ProjectImages/2-2.gif" width="3" height="5" align="absmiddle"/> 下一页　 <img src="resource/ProjectImages/3.gif" width="4" height="5" align="absmiddle"/> 末页　　共 1000 条记录 本页显示第1~10条 第1页/共100页 
      跳转到
      <input name="pageNum" type="text" style="width:20px"/>
      页</td>
  </tr>
</table>
	
	</div>
	
<div   style="display:none"  id="upperLayer8">
	
<table width="98%" border="0" cellpadding="0" cellspacing="0" align="center">
        
        <tr>
          <td width="150"  ><img  src="resource/ProjectImages/icon-import.gif" id="top_8" onClick="menu1('divperson','top_8');"/> <a onClick="javascript:divperson.style.display=divperson.style.display=='none'?'block':'none';"> <font class="td_title">人员安置</font></a></td>
        </tr>
</table>
<div id="divperson" style="display:block"  >
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" >
  
  <tr>
    <td width="9%"  class="td_top">审批编号</td>
    <td width="8%"  class="td_top">标 题</td>
    <td width="7%"  class="td_top">审批委员</td>
    <td width="7%"  class="td_top">审批时间</td>
	<td width="7%"  class="td_top">审批结论</td>
    <td width="8%"  class="td_top">安置方式</td>
	<td width="8%"  class="td_top">安置人数</td>
    <td width="10%"  class="td_top">安置费用</td>
    <td width="10%"  class="td_top">安置费用是否由建投垫付</td>
	<td width="8%"  class="td_top">操作</td>
    </tr>
  <tr>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
	<td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
	<td class="td_01">&nbsp;</td>
	<td class="td_01"><a onClick="javascript:tracks.style.display=tracks.style.display=='none'?'block':'none';">会后跟踪</a></td>
    </tr>
</table>
<br/>

<div id="tracks" style="display:none">
<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
       <tr>
         <td height="5" align="right">
                <table id="bcanzhiPerson_list"> </table>
				 <div id="pgtoolbcaranzhiperson"></div>
       </td>
     </tr>
</table>
<br/>
<table width="98%" border="0" cellpadding="0" cellspacing="0" align="center">
        
        <tr>
          <td width="150"  >    <input type="checkbox"/>
  是否聘请律师</td>
        </tr>
</table>

<table width="98%" border="1" cellpadding="0" cellspacing="0" align="center"  >
  <tr>
    <td  width="11%" class="td_form01">律师姓名：</td>
    <td width="21%"  class="td_form02"><input name="text3" type="text" /></td>
    <td width="11%"  class="td_form01">联系方式：</td>
    <td colspan="3"  class="td_form02"><input type="text" name="beginTime273" /></td>
  </tr>
  <tr>
    <td width="11%" class="td_form01">附件：</td>
    <td colspan="5"  class="td_form02"><table width="100%" height="100%" border="0" align="center"cellpadding="5" cellspacing="0"  id="fileTable3">
      <tr>
        <td colspan="2" align="right" class="td_form02"><div align="center">
          <input type="file" name="file3" id="file3" style="display: none;" onchange="addRow(this,'fileTable3')"/>
          <input type="button" class="buttonface" value="选择文件..." onclick="file3.click();" name="optionButton4" />
        </div></td>
      </tr>
    </table></td>
  </tr>
</table>
<br/>
<table width="98%" border="0" cellpadding="0" cellspacing="0" align="center">
  <tr>
    <td width="150"  ><input name="checkbox" type="checkbox" />
      是否发布安置公告</td>
  </tr>
  <tr> </tr>
</table>
<table width="98%" border="1" cellpadding="0" cellspacing="0" align="center"  >
  <tr>
    <td  width="11%" class="td_form01">公告信息描述：</td>
    <td colspan="3"  class="td_form02"><textarea name="textarea2" cols="144" rows="3"></textarea></td>
  </tr>
  <tr>
    <td width="11%" class="td_form01">附件：</td>
    <td colspan="4"  class="td_form02"><table width="100%" height="100%" border="0" align="center"cellpadding="5" cellspacing="0"  id="fileTable33">
      <tr>
        <td colspan="2" align="right" class="td_form02"><div align="center">
          <input type="file" name="file33" id="file33" style="display: none;" onchange="addRow(this,'fileTable33')"/>
          <input type="button" class="buttonface" value="选择文件..." onclick="file33.click();" name="optionButton44" />
        </div></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td  width="11%" class="td_form01">安置协议和收条签署情况描述：</td>
    <td colspan="3"  class="td_form02"><textarea name="textarea2" cols="144" rows="3"></textarea></td>
  </tr>
</table>
</div>
</div>
<br/>
<table width="98%" border="0" cellpadding="0" cellspacing="0" align="center">
        
        <tr>
          <td width="150"  ><img  src="resource/ProjectImages/icon-import.gif" id="top_whole" onClick="menu1('divwhole','top_whole');"/> <a onClick="javascript:divwhole.style.display=divwhole.style.display=='none'?'block':'none';"> <font class="td_title">实体整体处置</font></a></td>
        </tr>
</table>

<div  id="divwhole" style="display:block">

<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" >
  
  <tr>
    <td width="9%"  class="td_top">审批编号</td>
    <td width="8%"  class="td_top">标 题</td>
    <td width="7%"  class="td_top">审批委员</td>
    <td width="7%"  class="td_top">审批时间</td>
	<td width="7%"  class="td_top">审批结论</td>
    <td width="8%"  class="td_top">处置方式</td>
	<td width="8%"  class="td_top">操作</td>
    </tr>
  <tr>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">股权转让</td>
	<td class="td_01"><a onClick="disposalgqzr()">会后跟踪</a></td>
  </tr>
  <tr>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">内部关闭</td>
    <td class="td_01"><a onClick="disposalnbgb()">会后跟踪</a></td>
  </tr>
  <tr>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
	<td class="td_01">&nbsp;</td>
    <td class="td_01">破产清算</td>
    <td class="td_01"><a onClick="disposalpcqs()">会后跟踪</a></td>
    </tr>
</table>
<br/>
<div id="gqzrWhole" style="display:none">
<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
       <tr>
         <td height="5" align="right">
                <table id="gqzr_list"> </table>
				<div id="pgtoolbargqzr"></div>
       </td>
     </tr>
</table>
</div>
<div id="nbgb" style="display:none">
	<table width="98%" border="1" cellpadding="0" cellspacing="0" align="center" class="newtable">
	<tr>
      <td colspan="6" align="left"><strong>结案信息</strong></td>
    </tr>
	<tr>
		<td width="11%" class="td_form01" >常年不经营，被吊销</td><td class="td_form02"><input  type="checkbox"></td>
		<td width="11%" class="td_form01">无资产</td><td class="td_form02"><input  type="checkbox"></td>
		<td width="11%" class="td_form01">无第三方负债或者第三方负债已过期</td><td class="td_form02"><input  type="checkbox"></td>
	</tr>
	<tr>
		<td class="td_form01" >人员已安置</td><td class="td_form02"><input  type="checkbox"></td>
		<td  class="td_form01">无诉讼</td><td class="td_form02"><input  type="checkbox"></td>
		<td  class="td_form01">印章下落不明</td><td class="td_form02"><input  type="checkbox"></td>
	</tr>
	 <tr>
				<td nowrap class="td_form01">附件</td>
				<td colspan="5" class="td_form02">
					<table width="100%" height="100%" border="0" align="center"cellpadding="5" cellspacing="0" class="table01" id="fileTable12">
						<tr>
						  <td colspan="2" align="right" class="td03"><input type="file" name="file12" id="file12" style="display: none;" onChange="addRow(this,'fileTable12')"/>
							<input type="button" class="buttonface" value="选择文件..." onClick="file12.click();" name="optionButton4" />
						  </td>
						</tr>
     				</table>
				</td>
 			 </tr>	
	</table>	
</div>
<div id="pcqs" style="display:none">
 <table width="98%" border="0" cellpadding="0" cellspacing="0"  style="display:none" align="center" class="newtable">
	<tr>
      <td colspan="6" align="left"><font style="color:#66CCCC">结案信息</font></td>
    </tr>
	<tr>
	 <td  width="120" class="td_form01">当前阶段：</td> <td  class="td_form02"><input value="启动清算"  readonly="readonly"   id="dqjd"></td>
	</tr>
	</table>
<div id="qidong" style="display:block">
<table width="98%" border="0" cellpadding="0" cellspacing="0"   align="center" class="newtable">
	<tr>
      <td colspan="6" align="left"><font style="color:#66CCCC">结案信息</font></td>
    </tr>
	<tr>
	 <td  width="140" class="td_form01">当前阶段：</td> <td  class="td_form02"><input value="启动清算"  readonly="readonly"  ></td>
	</tr>
	</table>
<table width="98%" id="qingsuan"  border="0" cellspacing="0" cellpadding="0"   class="newtable"  align="center" >
		<tr >
			<td class="td_form01_1" >
					<a href="#"  onclick="AddTable1('qingsuan')">&nbsp;+ &nbsp;</a>清算小组人员清单：
			</td>
		</tr>
</table>
<table width="98%" border="0" cellpadding="2" cellspacing="0" align="center" class="newtable">
	<tr>
		<td  class="td_form01" width="140">清算工作内容：</td><td  class="td_form02"><textarea rows="2" style="width:80%"></textarea></td>
	</tr>
	<tr>	
		<td  class="td_form01"  width="140">内部核查结果：</td><td  class="td_form02"><textarea rows="2" style="width:80%"></textarea></td>
	</tr>
	<tr>
		<td nowrap class="td_form01" >清算方案：</td>
		<td colspan="5" class="td_form02">
			<table width="100%" height="100%" border="0" align="center"cellpadding="5" cellspacing="0" class="table01" id="fileTable12">
				<tr>
				  <td colspan="2" align="right" class="td03"><input type="file" name="file12" id="file12" style="display: none;" onChange="addRow(this,'fileTable12')"/>
					<input type="button" class="buttonface" value="上传" onClick="file12.click();" name="optionButton4" />
				  </td>
				</tr>
			</table>
		</td>
  </tr>
</table>
</div>
<div id="shenpi" style="display:none">
<table width="98%" border="0" cellpadding="0" cellspacing="0"   align="center" class="newtable">
	<tr>
      <td colspan="6" align="left"><font style="color:#66CCCC">结案信息</font></td>
    </tr>
	<tr>
	 <td  width="140" class="td_form01">当前阶段：</td> <td  class="td_form02"><input value="清算报告审批"  readonly="readonly" ></td>
	</tr>
	</table>

<table width="98%" border="0" cellpadding="2" cellspacing="0" align="center" class="newtable">
	<tr>
		<td  class="td_form01" width="140">会议通过时间：</td><td  class="td_form02"><input type="text"  ></td>
	</tr>
	<tr>
		<td nowrap class="td_form01" >清算报告：</td>
		<td colspan="5" class="td_form02">
			<table width="100%" height="100%" border="0" align="center"cellpadding="5" cellspacing="0" class="table01" id="fileTable12">
				<tr>
				  <td colspan="2" align="right" class="td03"><input type="file" name="file12" id="file12" style="display: none;" onChange="addRow(this,'fileTable12')"/>
					<input type="button" class="buttonface" value="上传" onClick="file12.click();" name="optionButton4" />
				  </td>
				</tr>
			</table>
		</td>
  </tr>
</table>
</div>
<div id="jiaoxiao" style="display:none">
<table width="98%" border="0" cellpadding="0" cellspacing="0"   align="center" class="newtable">
	<tr>
      <td colspan="6" align="left"><font style="color:#66CCCC">结案信息</font></td>
    </tr>
	<tr>
	 <td  width="140" class="td_form01">当前阶段：</td> <td  class="td_form02"><input value="缴销营业执照"  readonly="readonly"  ></td>
	</tr>
	</table>

<table width="98%" border="0" cellpadding="2" cellspacing="0" align="center" class="newtable">
	<tr>
		<td  class="td_form01" width="140">办理注销登记手续时间：</td><td  class="td_form02"><input type="text"  ></td>
	</tr>
	<tr>
		<td nowrap class="td_form01" >注销证明：</td>
		<td colspan="5" class="td_form02">
			<table width="100%" height="100%" border="0" align="center"cellpadding="5" cellspacing="0" class="table01" id="fileTable12">
				<tr>
				  <td colspan="2" align="right" class="td03"><input type="file" name="file12" id="file12" style="display: none;" onChange="addRow(this,'fileTable12')"/>
					<input type="button" class="buttonface" value="上传" onClick="file12.click();" name="optionButton4" />
				  </td>
				</tr>
			</table>
		</td>
  </tr>
</table>
</div>

 <table width="98%" border="0" cellpadding="0" cellspacing="0" align="center" class="newtable">	
	<tr>
	<td class="td_form01" colspan="8"><a href="#" onClick="OpenAll()" >显示全部</a>&nbsp;&nbsp;<a href="#" onClick="CloseAll()" >关闭全部</a>&nbsp;&nbsp;<a href="#" onClick="up()" >上一阶段</a>&nbsp;&nbsp;<input type="button" value="确定"><a href="#"  onClick="down()" >&nbsp;&nbsp;下一阶段</a></td>
	</tr>
</table>
</div>
</div>
<br/>
<table width="98%" border="0" cellpadding="0" cellspacing="0" align="center">

        <tr>
          <td width="150"  ><img  src="resource/ProjectImages/icon-import.gif" id="top_asset" onClick="menu1('divasset','top_asset');"/> <a onClick="javascript:divasset.style.display=divasset.style.display=='none'?'block':'none';"> <font class="td_title">资产处置</font></a></td>
        </tr>
</table>
<div id="divasset" style="display:block"  >
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" >
  
  <tr>
    <td width="9%"  class="td_top">审批编号</td>
    <td width="8%"  class="td_top">标 题</td>
    <td width="7%"  class="td_top">审批委员</td>
    <td width="7%"  class="td_top">审批时间</td>
	<td width="7%"  class="td_top">审批结论</td>
    <td width="8%"  class="td_top">处置方式</td>
	<td width="10%"  class="td_top">安置费用是否由建投垫付</td>
	<td width="8%"  class="td_top">资产明细</td>
	<td width="8%"  class="td_top">操作</td>
    </tr>
  <tr>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
	<td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
    <td class="td_01">&nbsp;</td>
	<td class="td_01">&nbsp;</td>
	<td class="td_01">会后跟踪</td>
    </tr>
</table>
<br/>
</div>

</div>	
	
</body>
	</html>
	

<script type="text/javascript">
   var v2

				jQuery("#insider_list").jqGrid({
					datatype: "local",
					colNames:['姓名','移动电话', '固定电话','工作单位'],
					colModel:[	
						{name:'name',index:'name', editable: true},
						{name:'mobileTel',index:'entityName', editable: true},
						{name:'tel',index:'tel', editable: true},
						{name:'workUnit',index:'workUni', editable: true} 
					],
					onSelectRow: function(id){
		               if(id && id!==v2){
		                 jQuery('#insider_list').jqGrid('restoreRow',v2);
			             jQuery('#insider_list').jqGrid('editRow',id,true);
			             v2=id;}
						 },
					editurl:"entity-info-alter.html",
					autowidth:true,
					height:'auto',
					pager: '#pgtoolbar2',
					multiselect: true,
					caption: '知情人员'
						});
				var insider = [ 
				        {name:'张三',mobileTel:'13213311111',tel:'8765321',workUnit:''},
						{name:'李四',mobileTel:'13213322222',tel:'8765322',workUnit:''},
						{name:'李五',mobileTel:'13213333333',tel:'8765323',workUnit:''}];
				for(var i=0;i<=insider.length;i++)
					jQuery("#insider_list").jqGrid('addRowData',i+1,insider[i]);	
                jQuery("#insider_list").jqGrid('navGrid','#pgtoolbar2',{edit:true,add:true,del:true});
				$(window).bind('resize', function() {  
						// resize the datagrid to fit the page properly: 
						var size = getWidthAndHeigh(true);
						jQuery("#insider_list").setGridWidth(size.width * 0.98); 
						
					}); 
</script>
<script type="text/javascript">
   var v3

				jQuery("#anzhiPerson_list").jqGrid({
					datatype: "local",
					colNames:['姓名','移动电话','固定电话','安置方式','安置费用','安置状态','安置协议','收条','备注'],
					colModel:[	
						{name:'name',index:'name', editable: true},
						{name:'mobileTel',index:'entityName', editable: true},
						{name:'tel',index:'tel', editable: true},
						{name:'arrangeWay',index:'arrangeWay', editable: true},
						{name:'arrangeCost',index:'arrangeCost', editable: true},
						{name:'arrangeState',index:'arrangeState',  editable: true,edittype:"select",editoptions:{value:"yes:已安置;no:未安置"}},
						{name:'arrangeTreaty',index:'arrangeTreaty',align:'center'},
						{name:'receipt',index:'arrangeState' ,align:'center'},
						{name:'remark',index:'arrangeState',  editable: true} 
						
					],
					onSelectRow: function(id){
		               if(id && id!==v3){
		                 jQuery('#anzhiPerson_list').jqGrid('restoreRow',v3);
			             jQuery('#anzhiPerson_list').jqGrid('editRow',id,true);
			             v3=id;}
						 },
					editurl:"entity-info-alter.html",
					autowidth:true,
					height:'auto',
					pager: '#pgtoolbar3',
					multiselect: true,
					caption: '安置人员'
						});
				var anzhiPerson= [ 
				        {name:'张三',mobileTel:'13213311111',tel:'8765321',arrangeWay:'1',arrangeCost:'',arrangeState:'2',arrangeTreaty:' <input  type="submit"   value="  查看  ">',receipt:'<input  type="submit"   value="  查看  ">',remark:''},
						{name:'张三',mobileTel:'13213311111',tel:'8765321',arrangeWay:'',arrangeCost:'',arrangeState:'',arrangeTreaty:'<input  type="submit"  value="  查看  ">',receipt:'<input  type="submit"   value="  查看  ">',remark:''}
						];
				for(var i=0;i<=anzhiPerson.length;i++)
					jQuery("#anzhiPerson_list").jqGrid('addRowData',i+1,anzhiPerson[i]);	
                jQuery("#anzhiPerson_list").jqGrid('navGrid','#pgtoolbar3',{edit:true,add:true,del:true});
				$(window).bind('resize', function() {  
						// resize the datagrid to fit the page properly: 
						var size = getWidthAndHeigh(true);
						jQuery("#anzhiPerson_list").setGridWidth(size.width * 0.98); 
						
					}); 
</script>
<script type="text/javascript">
   var v4

				jQuery("#filter_list").jqGrid({
					datatype: "local",
					colNames:['存放地点','保管机构','主要联系人','联系方式','存放内容'],
					colModel:[	
						{name:'adress',index:'adress', editable: true},
						{name:'organization',index:'organization', editable: true},
						{name:'person',index:'person', editable: true},
						{name:'contractWay',index:'contractWay', editable: true},
						{name:'storeContent',index:'storeContent',  editable: true,edittype:"select",editoptions:{value:"1:文件;2:公章;3:权证;4:账务账簿"}} 
						
					],
					onSelectRow: function(id){
		               if(id && id!==v4){
		                 jQuery('#filter_list').jqGrid('restoreRow',v4);
			             jQuery('#filter_list').jqGrid('editRow',id,true);
			             v4=id;}
						 },
					editurl:"entity-info-alter.html",
					autowidth:true,
					height:'auto',
					pager: '#pgtoolbar4',
					multiselect: true,
					caption: '文件及公章存放情况'
						});
				var filter= [ 
				        {adress:'',organization:'13213311111',person:'8765321',contractWay:'',storeContent:''},
						{adress:'',organization:'13213311111',person:'8765321',contractWay:'',storeContent:''}];
				for(var i=0;i<=filter.length;i++)
					jQuery("#filter_list").jqGrid('addRowData',i+1,filter[i]);	
                jQuery("#filter_list").jqGrid('navGrid','#pgtoolbar4',{edit:true,add:true,del:true});
				$(window).bind('resize', function() {  
						// resize the datagrid to fit the page properly: 
						var size = getWidthAndHeigh(true);
						jQuery("#filter_list").setGridWidth(size.width * 0.98); 
						
					}); 
</script>
<script type="text/javascript">
   var v5

				jQuery("#cash_list").jqGrid({
					datatype: "local",
					colNames:['金额','账户','账户名称'],
					colModel:[	
						{name:'amount',index:'amount', editable: true},
						{name:'account',index:'account', editable: true},
						{name:'accountTitle',index:'accountTitle', editable: true}						
					],
					onSelectRow: function(id){
		               if(id && id!==v5){
		                 jQuery('#filter_list').jqGrid('restoreRow',v5);
			             jQuery('#filter_list').jqGrid('editRow',id,true);
			             v5=id;}
						 },
					editurl:"entity-info-alter.html",
					autowidth:true,
					height:'auto',
					pager: '#pgtoolbar5',
					multiselect: true,
					caption: '现金'
						});
				var cash= [ 
				        {amount:'1',account:'',accountTitle:''},
						{amount:'2',account:'',accountTitle:''}];
				for(var i=0;i<=cash.length;i++)
					jQuery("#cash_list").jqGrid('addRowData',i+1,cash[i]);	
                jQuery("#cash_list").jqGrid('navGrid','#pgtoolbar5',{edit:true,add:true,del:true});
				$(window).bind('resize', function() {  
						// resize the datagrid to fit the page properly: 
						var size = getWidthAndHeigh(true);
						jQuery("#cash_list").setGridWidth(size.width * 0.98); 
						
					}); 
</script>
<script type="text/javascript">
   var vland

				jQuery("#land_list").jqGrid({
					datatype: "local",
					colNames:['土地名称','土地取得方式','实际占有人','《土地使用权证》','《土地使用权证》没有及下落不明的原因','抵押','抵押情况介绍','面积（平方米）','土地使用权人','评估值','变现额','土地描述','资产状态','处置方式'],
					colModel:[	
						{name:'landName',index:'landName', editable: true},
						{name:'gainMethod',index:'gainMethod', editable: true},
						{name:'holder',index:'holder', editable: true},
						{name:'useCard',index:'useCard',editable: true,edittype:"select",editoptions:{value:"1:有;2:无;3:下落不明"}},
						{name:'missReason',index:'', editable: true},
						{name:'pledge',index:'pledge', editable: true,edittype:"select",editoptions:{value:"1:是;2:否"}},
						{name:'pledgeDes',index:'pledgeDes', editable: true},	
						{name:'acreage',index:'acreage', editable: true},	
						{name:'rightOfUse',index:'rightOfUse', editable: true},	
						{name:'assessedValue',index:'assessedValue', editable: true},							
					    {name:'cashAmount',index:'cashAmount', editable: true},	
						{name:'landDes',index:'landDes', editable: true},	
						{name:'assetState',index:'assetState', editable: true,edittype:"select",editoptions:{value:"1:已处置;2:未处置;3:处置中"}},	
						{name:'handleWay',index:'handleWay', editable: true,edittype:"select",editoptions:{value:"1:公开拍卖;2:协议转让"}}											
					],
					onSelectRow: function(id){
		               if(id && id!==vland){
		                 jQuery('#land_list').jqGrid('restoreRow',vland);
			             jQuery('#land_list').jqGrid('editRow',id,true);
			             vland=id;}
						 },
					editurl:"entity-info-alter.html",
					autowidth:true,
					height:'auto',
					pager: '#pgtoolbarland',
					multiselect: true,
					caption: '土地'
						});
				var land= [ 
				        {landName:'1',gainMethod:'',holder:'',missReason:'',useCard:'',pledge:'',pledgeDes:'',acreage:'',rightOfUse:'',assessedValue:'',cashAmount:'',landDes:'',assetState:'',handleWay:''},
{landName:'1',gainMethod:'',holder:'',missReason:'',useCard:'',pledge:'',pledgeDes:'',acreage:'',rightOfUse:'',assessedValue:'',cashAmount:'',landDes:'',assetState:'',handleWay:''}];
				for(var i=0;i<=land.length;i++)
					jQuery("#land_list").jqGrid('addRowData',i+1,land[i]);	
                jQuery("#land_list").jqGrid('navGrid','#pgtoolbarland',{edit:true,add:true,del:true});
				$(window).bind('resize', function() {  
						// resize the datagrid to fit the page properly: 
						var size = getWidthAndHeigh(true);
						jQuery("#land_list").setGridWidth(size.width * 0.98); 
						
					}); 
</script>
<script type="text/javascript">
   var vhouse

				jQuery("#house_list").jqGrid({
					datatype: "local",
					colNames:['地址','房屋所有权人','实际占有人','《房屋使用权证》','《房屋所有权证》没有及下落不明的原因','抵押','抵押情况介绍','面积（平方米）','土地使用权人','评估值','变现额','土地描述','资产状态','处置方式'],
					colModel:[	
						{name:'adress',index:'adress', editable: true},
						{name:'titleholder',index:'gainMethod', editable: true},
						{name:'actulHolder',index:'actulHolder', editable: true},
						{name:'useCard',index:'useCard',editable: true,edittype:"select",editoptions:{value:"1:有;2:无;3:下落不明"}},
						{name:'missReason',index:'', editable: true},
						{name:'pledge',index:'pledge', editable: true,edittype:"select",editoptions:{value:"1:是;2:否"}},	
						{name:'pledgeDes',index:'', editable: true},
						{name:'acreage',index:'acreage', editable: true},	
						{name:'rightOfUse',index:'rightOfUse', editable: true},	
						{name:'assessedValue',index:'assessedValue', editable: true},							
					    {name:'cashAmount',index:'cashAmount', editable: true},	
						{name:'houseDes',index:'houseDes', editable: true},	
						{name:'assetState',index:'assetState', editable: true,edittype:"select",editoptions:{value:"1:已处置;2:未处置;3:处置中"}},	
						{name:'handleWay',index:'handleWay', editable: true,edittype:"select",editoptions:{value:"1:公开拍卖;2:协议转让"}}											
					],
					onSelectRow: function(id){
		               if(id && id!==vhouse){
		                 jQuery('#house_list').jqGrid('restoreRow',vhouse);
			             jQuery('#house_list').jqGrid('editRow',id,true);
			             vhouse=id;}
						 },
					editurl:"entity-info-alter.html",
					autowidth:true,
					height:'auto',
					pager: '#pgtoolbarhouse',
					multiselect: true,
					caption: '房屋'
						});
				var house= [ 
				        {adress:'',titleholder:'',actulHolder:'',missReason:'',useCard:'',pledge:'',pledgeDes:'',acreage:'',rightOfUse:'',assessedValue:'',cashAmount:'',houseDes:'',assetState:'',handleWay:''},
						{adress:'',titleholder:'',actulHolder:'',missReason:'',useCard:'',pledge:'',pledgeDes:'',acreage:'',rightOfUse:'',assessedValue:'',cashAmount:'',houseDes:'',assetState:'',handleWay:''}];
				for(var i=0;i<=house.length;i++)
				jQuery("#house_list").jqGrid('addRowData',i+1,house[i]);	
                jQuery("#house_list").jqGrid('navGrid','#pgtoolbarhouse',{edit:true,add:true,del:true});
				$(window).bind('resize', function() {  
						// resize the datagrid to fit the page properly: 
						var size = getWidthAndHeigh(true);
						jQuery("#house_list").setGridWidth(size.width * 0.98); 
						
					}); 
</script>
<script type="text/javascript">
   var vmachine

				jQuery("#machine_list").jqGrid({
					datatype: "local",
					colNames:['名称','存放何处','权属','实际占有人','抵押','抵押情况介绍','评估值','变现额','机器设备描述','资产状态','处置方式'],
					colModel:[	
						{name:'name',index:'name', editable: true},
						{name:'where',index:'where', editable: true},
						{name:'ownership',index:'ownership', editable: true},
						{name:'actulHolder',index:'actulHolder', editable: true},
						{name:'pledge',index:'pledge', editable: true,edittype:"select",editoptions:{value:"1:是;2:否"}},	
						{name:'pledgeDes',index:'', editable: true},	
						{name:'assessedValue',index:'assessedValue', editable: true},							
					    {name:'cashAmount',index:'cashAmount', editable: true},	
						{name:'machineDes',index:'machineDes', editable: true},	
						{name:'assetState',index:'assetState', editable: true,edittype:"select",editoptions:{value:"1:已处置;2:未处置;3:处置中"}},	
						{name:'handleWay',index:'handleWay', editable: true,edittype:"select",editoptions:{value:"1:公开拍卖;2:协议转让"}}											
					],
					onSelectRow: function(id){
		               if(id && id!==vmachine){
		                 jQuery('#machine_list').jqGrid('restoreRow',vmachine);
			             jQuery('#machine_list').jqGrid('editRow',id,true);
			             vmachine=id;}
						 },
					editurl:"entity-info-alter.html",
					autowidth:true,
					height:'auto',
					pager: '#pgtoolbarmachine',
					multiselect: true,
					caption: '机器设备'
						});
				var machine= [				                        {name:'',where:'',ownership:'',actulHolder:'',pledge:'',pledgeDes:'',acreage:'',assessedValue:'',cashAmount:'',machineDes:'',assetState:'',handleWay:''},
{name:'',where:'',ownership:'',actulHolder:'',pledge:'',pledgeDes:'',acreage:'',assessedValue:'',cashAmount:'',machineDes:'',assetState:'',handleWay:''}];
				for(var i=0;i<=machine.length;i++)
				jQuery("#machine_list").jqGrid('addRowData',i+1,machine[i]);	
                jQuery("#machine_list").jqGrid('navGrid','#pgtoolbarmachine',{edit:true,add:true,del:true});
				$(window).bind('resize', function() {  
						// resize the datagrid to fit the page properly: 
						var size = getWidthAndHeigh(true);
						jQuery("#machine_list").setGridWidth(size.width * 0.98); 
						
					}); 
</script>
<script type="text/javascript">
   var vtraffic

				jQuery("#traffic_list").jqGrid({
					datatype: "local",
					colNames:['车牌号','存放何处','权属','实际占有人','抵押','抵押情况介绍','评估值','变现额','机器设备描述','资产状态','处置方式'],
					colModel:[	
						{name:'name',index:'name', editable: true},
						{name:'where',index:'where', editable: true},
						{name:'ownership',index:'ownership', editable: true},
						{name:'actulHolder',index:'actulHolder', editable: true},
						{name:'pledge',index:'pledge', editable: true,edittype:"select",editoptions:{value:"1:是;2:否"}},	
						{name:'pledgeDes',index:'', editable: true},	
						{name:'assessedValue',index:'assessedValue', editable: true},							
					    {name:'cashAmount',index:'cashAmount', editable: true},	
						{name:'machineDes',index:'machineDes', editable: true},	
						{name:'assetState',index:'assetState', editable: true,edittype:"select",editoptions:{value:"1:已处置;2:未处置;3:处置中"}},	
						{name:'handleWay',index:'handleWay', editable: true,edittype:"select",editoptions:{value:"1:公开拍卖;2:协议转让"}}											
					],
					onSelectRow: function(id){
		               if(id && id!==vtraffic){
		                 jQuery('#traffic_list').jqGrid('restoreRow',vland);
			             jQuery('#traffic_list').jqGrid('editRow',id,true);
			             vmachine=id;}
						 },
					editurl:"entity-info-alter.html",
					autowidth:true,
					height:'auto',
					pager: '#pgtoolbartraffic',
					multiselect: true,
					caption: '交通运输工具'
						});
				var traffic= [	
				{name:'',where:'',ownership:'',actulHolder:'',pledge:'',pledgeDes:'',acreage:'',assessedValue:'',cashAmount:'',machineDes:'',assetState:'',handleWay:''},
{name:'',where:'',ownership:'',actulHolder:'',pledge:'',pledgeDes:'',acreage:'',assessedValue:'',cashAmount:'',machineDes:'',assetState:'',handleWay:''}];
				for(var i=0;i<=machine.length;i++)
				jQuery("#traffic_list").jqGrid('addRowData',i+1,traffic[i]);	
                jQuery("#traffic_list").jqGrid('navGrid','#pgtoolbartraffic',{edit:true,add:true,del:true});
				$(window).bind('resize', function() {  
						// resize the datagrid to fit the page properly: 
						var size = getWidthAndHeigh(true);
						jQuery("#traffic_list").setGridWidth(size.width * 0.98); 
						
					}); 
</script>
<script type="text/javascript">
   var vinvest

				jQuery("#invest_list").jqGrid({
					datatype: "local",
					colNames:['被投资企业名称','投资额','投资方式','投资情况描述'],
					colModel:[	
						{name:'name',index:'name', editable: true},
						{name:'account',index:'account', editable: true},
						{name:'investWay',index:'investWay', editable: true},
						{name:'investDes',index:'investDes', editable: true}],
					onSelectRow: function(id){
		               if(id && id!==vinvest){
		                 jQuery('#invest_list').jqGrid('restoreRow',vinvest);
			             jQuery('#invest_list').jqGrid('editRow',id,true);
			             vinvest=id;}
						 },
					editurl:"entity-info-alter.html",
					autowidth:true,
					height:'auto',
					pager: '#pgtoolbarinvest',
					multiselect: true,
					caption: '对外投资'
						});
				var invest= [ {name:'',where:'',ownership:'',actulHolder:'',pledge:'',pledgeDes:'',acreage:'',assessedValue:'',cashAmount:'',machineDes:'',assetState:'',handleWay:''},
{name:'',where:'',ownership:'',actulHolder:'',pledge:'',pledgeDes:'',acreage:'',assessedValue:'',cashAmount:'',machineDes:'',assetState:'',handleWay:''}];
				for(var i=0;i<=machine.length;i++)
				jQuery("#invest_list").jqGrid('addRowData',i+1,machine[i]);	
                jQuery("#invest_list").jqGrid('navGrid','#pgtoolbarinvest',{edit:true,add:true,del:true});
				$(window).bind('resize', function() {  
						// resize the datagrid to fit the page properly: 
						var size = getWidthAndHeigh(true);
						jQuery("#invest_list").setGridWidth(size.width * 0.98); 
						
					}); 
</script>
<script type="text/javascript">
   var votherasset

				jQuery("#otherasset_list").jqGrid({
					datatype: "local",
					colNames:['名称','存放何处','权属','实际占有人','抵押','抵押情况介绍','评估值','变现额','其他资产描述','资产状态','处置方式'],
					colModel:[	
						{name:'name',index:'name', editable: true},
						{name:'where',index:'where', editable: true},
						{name:'ownership',index:'ownership', editable: true},
						{name:'actulHolder',index:'actulHolder', editable: true},
						{name:'pledge',index:'pledge', editable: true,edittype:"select",editoptions:{value:"1:是;2:否"}},	
						{name:'pledgeDes',index:'', editable: true},	
						{name:'assessedValue',index:'assessedValue', editable: true},							
					    {name:'cashAmount',index:'cashAmount', editable: true},	
						{name:'otherassetDes',index:'otherassetDes', editable: true},	
						{name:'assetState',index:'assetState', editable: true,edittype:"select",editoptions:{value:"1:已处置;2:未处置;3:处置中"}},	
						{name:'handleWay',index:'handleWay', editable: true,edittype:"select",editoptions:{value:"1:公开拍卖;2:协议转让"}}											
					],
					onSelectRow: function(id){
		               if(id && id!==votherasset){
		                 jQuery('#otherasset_list').jqGrid('restoreRow',votherasset);
			             jQuery('#otherasset_list').jqGrid('editRow',id,true);
			             votherasset=id;}
						 },
					editurl:"entity-info-alter.html",
					autowidth:true,
					height:'auto',
					pager: '#pgtoolbarotherasset',
					multiselect: true,
					caption: '其他资产'
						});
				var otherasset= [{name:'',where:'',ownership:'',actulHolder:'',pledge:'',pledgeDes:'',acreage:'',assessedValue:'',cashAmount:'',otherassetDes:'',assetState:'',handleWay:''},
{name:'',where:'',ownership:'',actulHolder:'',pledge:'',pledgeDes:'',acreage:'',assessedValue:'',cashAmount:'',otherassetDes:'',assetState:'',handleWay:''}];
				for(var i=0;i<=otherasset.length;i++)
				jQuery("#otherasset_list").jqGrid('addRowData',i+1,otherasset[i]);	
                jQuery("#otherasset_list").jqGrid('navGrid','#pgtoolbarotherasset',{edit:true,add:true,del:true});
				$(window).bind('resize', function() {  
						// resize the datagrid to fit the page properly: 
						var size = getWidthAndHeigh(true);
						jQuery("#otherasset_list").setGridWidth(size.width * 0.98); 
						
					}); 
</script>
<script type="text/javascript">
   var vclaims

				jQuery("#claims_list").jqGrid({
					datatype: "local",
					colNames:['债务人名称','合同编号','担保方式','债权金额','诉讼时效','是否提起诉讼','债权期限（天）','抵押财产、质押财产、保证人等说明','债务人情况介绍','备注'],
					colModel:[	
						{name:'name',index:'name', editable: true},
						{name:'contractNo',index:'name', editable: true},
						{name:'security',index:'security', editable: true,edittype:'select',editoptions:{value:"1:无;2:保证;3:抵押;4:质押;5:其他（见备注）"}},
						{name:'claimsaccount',index:'claimsaccount', editable: true},
						{name:'litigation',index:'actulHolder', editable: true,edittype:"select",editoptions:{value:"1:超过;2:未超过"}},
						{name:'ifLitigation',index:'pledge', editable: true,edittype:"select",editoptions:{value:"1:是;2:否"}},	
						{name:'claimslimit',index:'claimsaccount', editable: true},
						{name:'pledgeDes',index:'', editable: true},	
						{name:'debtorDes',index:'assessedValue', editable: true},							
					    {name:'remark',index:'cashAmount', editable: true}
					],
					onSelectRow: function(id){
		               if(id && id!==vclaims){
		                 jQuery('#claims_list').jqGrid('restoreRow',vclaims);
			             jQuery('#claims_list').jqGrid('editRow',id,true);
			             vclaims=id;}
						 },
					editurl:"entity-info-alter.html",
					autowidth:true,
					height:'auto',
					pager: '#pgtoolbarclaims',
					multiselect: true,
					caption: '主要债权'
						});
				var claims= [
{name:'',contractNo:'',security:'',claimsaccount:'',litigation:'',ifLitigation:'',claimslimit:'',pledgeDes:'',debtorDes:'',remark:''},
{name:'',contractNo:'',security:'',claimsaccount:'',litigation:'',ifLitigation:'',claimslimit:'',pledgeDes:'',debtorDes:'',remark:''}];
				for(var i=0;i<=otherasset.length;i++)
				jQuery("#claims_list").jqGrid('addRowData',i+1,claims[i]);	
                jQuery("#claims_list").jqGrid('navGrid','#pgtoolbarclaims',{edit:true,add:true,del:true});
				$(window).bind('resize', function() {  
						// resize the datagrid to fit the page properly: 
						var size = getWidthAndHeigh(true);
						jQuery("#claims_list").setGridWidth(size.width * 0.98); 
						
					}); 
</script>
<script type="text/javascript">
   var vdebt

				jQuery("#debt_list").jqGrid({
					datatype: "local",
					colNames:['债权人名称','合同编号','担保方式','债权金额','诉讼时效','是否提起诉讼','债权期限（天）','抵押财产、质押财产、保证人等说明','或有负债介绍','备注'],
					colModel:[	
						{name:'name',index:'name', editable: true},
						{name:'contractNo',index:'name', editable: true},
						{name:'security',index:'security', editable: true,edittype:'select',editoptions:{value:"1:无;2:保证;3:抵押;4:质押;5:其他（见备注）"}},
						{name:'claimsaccount',index:'claimsaccount', editable: true},
						{name:'litigation',index:'actulHolder', editable: true,edittype:"select",editoptions:{value:"1:超过;2:未超过"}},
						{name:'ifLitigation',index:'pledge', editable: true,edittype:"select",editoptions:{value:"1:是;2:否"}},	
						{name:'claimslimit',index:'claimsaccount', editable: true},
						{name:'pledgeDes',index:'', editable: true},	
						{name:'liabilitiesDes',index:'assessedValue', editable: true},							
					    {name:'remark',index:'cashAmount', editable: true}
					],
					onSelectRow: function(id){
		               if(id && id!==vdebt){
		                 jQuery('#debt_list').jqGrid('restoreRow',vdebt);
			             jQuery('#debt_list').jqGrid('editRow',id,true);
			             vdebt=id;}
						 },
					editurl:"entity-info-alter.html",
					autowidth:true,
					height:'auto',
					pager: '#pgtoolbardebt',
					multiselect: true,
					caption: '主要债务'
						});
				var debt= [
{name:'',contractNo:'',security:'',claimsaccount:'',litigation:'',ifLitigation:'',claimslimit:'',pledgeDes:'',liabilitiesDesDes:'',remark:''},
{name:'',contractNo:'',security:'',claimsaccount:'',litigation:'',ifLitigation:'',claimslimit:'',pledgeDes:'',liabilitiesDesDes:'',remark:''}];
				for(var i=0;i<=otherasset.length;i++)
				jQuery("#debt_list").jqGrid('addRowData',i+1,debt[i]);	
                jQuery("#debt_list").jqGrid('navGrid','#pgtoolbardebt',{edit:true,add:true,del:true});
				$(window).bind('resize', function() {  
						// resize the datagrid to fit the page properly: 
						var size = getWidthAndHeigh(true);
						jQuery("#debt_list").setGridWidth(size.width * 0.98); 
						
					}); 
</script>
<script type="text/javascript">
   var vtaxPayment

				jQuery("#taxPayment_list").jqGrid({
					datatype: "local",
					colNames:['税款名称','是否按时缴纳','拖欠税款数额（元）','拖欠时间','税务机关是否可以减免'],
					colModel:[	
					    {name:'taxName',index:'taxName', editable: true},
						{name:'whetherPay',index:'name', editable: true,edittype:"select",editoptions:{value:"1:是;2:否"}},
						{name:'defaultAmount',index:'security', editable: true},
						{name:'defaultTime',index:'claimsaccount', editable: true},
						{name:'whetherRemission',index:'actulHolder', editable: true,edittype:"select",editoptions:{value:"1:是;2:否"}}						
					],
					onSelectRow: function(id){
		               if(id && id!==vtaxPayment){
		                 jQuery('#taxPayment_list').jqGrid('restoreRow',vtaxPayment);
			             jQuery('#taxPayment_list').jqGrid('editRow',id,true);
			             vtaxPayment=id;}
						 },
					editurl:"entity-info-alter.html",
					autowidth:true,
					height:'auto',
					pager: '#pgtoolbartaxPayment',
					multiselect: true,
					caption: '税款缴纳'
						});
				var taxPayment= [
{taxName:'',whetherPay:'',defaultAmount:'',defaultTime:'',whetherRemission:''},
{taxName:'',whetherPay:'',defaultAmount:'',defaultTime:'',whetherRemission:''}];
				for(var i=0;i<=taxPayment.length;i++)
				jQuery("#taxPayment_list").jqGrid('addRowData',i+1,taxPayment[i]);	
                jQuery("#taxPayment_list").jqGrid('navGrid','#pgtoolbartaxPayment',{edit:true,add:true,del:true});
				$(window).bind('resize', function() {  
						// resize the datagrid to fit the page properly: 
						var size = getWidthAndHeigh(true);
						jQuery("#taxPayment_list").setGridWidth(size.width * 0.98); 
						
					}); 
</script>
<script type="text/javascript">
   var vcontributions

				jQuery("#contributions_list").jqGrid({
					datatype: "local",
					colNames:['股东名称','控股比例（%）','注册资本（元）','出资方式','出资情况','出资不实的数额（万元）','抽逃出资','抽逃数额（元）','独立法人资格'],
					colModel:[	
					    {name:'holderName',index:'taxName', editable: true},
						{name:'proportion',index:'name', editable: true},
						{name:'registeredCapital',index:'security', editable: true},
						{name:'way',index:'claimsaccount',editable: true,edittype:"select",editoptions:{value:"1:货币;2:实物;3:土地（含房屋）;4:无形资产;5:其他（见备注）"}},
						{name:'conditions',index:'actulHolder', editable: true,edittype:"select",editoptions:{value:"1:出资到位;2:出资不实但达到最低出资额;3:出资不实未达到最低出资额;4:未出资"}},
						{name:'notReal',index:'security', editable: true},	
						{name:'escaped',index:'security',  editable: true,edittype:"select",editoptions:{value:"1:存在;2:不存;3:无资料"}},
						{name:'escapeAmount',index:'security', editable: true},	
						{name:'legalPerson',index:'security', editable: true,edittype:"select",editoptions:{value:"1:是;2:否"}}					
					],
					onSelectRow: function(id){
		               if(id && id!==vcontributions){
		                 jQuery('#contributions_list').jqGrid('restoreRow',vcontributions);
			             jQuery('#contributions_list').jqGrid('editRow',id,true);
			             vcontributions=id;}
						 },
					editurl:"entity-info-alter.html",
					autowidth:true,
					height:'auto',
					pager: '#pgtoolbarcontributions',
					multiselect: true,
					caption: '项目企业出资情况'
						});
				var contributions= [{},{},{}];
				for(var i=0;i<=contributions.length;i++)
				jQuery("#contributions_list").jqGrid('addRowData',i+1,contributions[i]);	
                jQuery("#contributions_list").jqGrid('navGrid','#pgtoolbarcontributions',{edit:true,add:true,del:true});
				$(window).bind('resize', function() {  
						// resize the datagrid to fit the page properly: 
						var size = getWidthAndHeigh(true);
						jQuery("#contributions_list").setGridWidth(size.width * 0.98); 
						
					}); 
</script>
<script type="text/javascript">
   var vbcanzhiPerson

				jQuery("#bcanzhiPerson_list").jqGrid({
					datatype: "local",
					colNames:['姓名','移动电话','固定电话','安置方式','安置费用','安置协议','收条','备注'],
					colModel:[	
						{name:'name',index:'name', editable: true},
						{name:'mobileTel',index:'entityName', editable: true},
						{name:'tel',index:'tel', editable: true},
						{name:'arrangeWay',index:'arrangeWay', editable: true},
						{name:'arrangeCost',index:'arrangeCost', editable: true},
						{name:'arrangeTreaty',index:'arrangeTreaty',align:'center'},
						{name:'receipt',index:'arrangeState' ,align:'center'},
						{name:'remark',index:'arrangeState',  editable: true} 
						
					],
					onSelectRow: function(id){
		               if(id && id!==vbcanzhiPerson){
		                 jQuery('#bcanzhiPerson_list').jqGrid('restoreRow',vbcanzhiPerson);
			             jQuery('#bcanzhiPerson_list').jqGrid('editRow',id,true);
			             vbcanzhiPerson=id;}
						 },
					editurl:"entity-info-alter.html",
					autowidth:true,
					height:'auto',
					multiselect: true,
					caption: '安置人员信息'
						});
				var bcanzhiPerson= [ 
				        {name:'张三',mobileTel:'13213311111',tel:'8765321',arrangeWay:'',arrangeCost:'',arrangeTreaty:'上传',receipt:'上传',remark:''},
						{name:'张三',mobileTel:'13213311111',tel:'8765321',arrangeWay:'',arrangeCost:'',arrangeTreaty:'上传',receipt:'上传',remark:''}
						];
				for(var i=0;i<=bcanzhiPerson.length;i++)
					jQuery("#bcanzhiPerson_list").jqGrid('addRowData',i+1,bcanzhiPerson[i]);	
				$(window).bind('resize', function() {  
						// resize the datagrid to fit the page properly: 
						var size = getWidthAndHeigh(true);
						jQuery("#bcanzhiPerson_list").setGridWidth(size.width * 0.98); 
						
					}); 
</script>
<script type="text/javascript">
   var vgqzr

				jQuery("#gqzr_list").jqGrid({
					datatype: "local",
					colNames:['股东名称','控股比例（%）','注册资本（元）','出资方式','出资情况','出资不实的数额（万元）','抽逃出资','抽逃数额（元）','独立法人资格','交易对象','股权转让种类','转让款','股权转让合同'],
					colModel:[	
					    {name:'holderName',index:'taxName', editable: true},
						{name:'proportion',index:'name', editable: true},
						{name:'registeredCapital',index:'security', editable: true},
						{name:'way',index:'claimsaccount',editable: true,edittype:"select",editoptions:{value:"1:货币;2:实物;3:土地（含房屋）;4:无形资产;5:其他（见备注）"}},
						{name:'conditions',index:'actulHolder', editable: true,edittype:"select",editoptions:{value:"1:出资到位;2:出资不实但达到最低出资额;3:出资不实未达到最低出资额;4:未出资"}},
						{name:'notReal',index:'security', editable: true},	
						{name:'escaped',index:'security',  editable: true,edittype:"select",editoptions:{value:"1:存在;2:不存;3:无资料"}},
						{name:'escapeAmount',index:'security', editable: true},	
						{name:'legalPerson',index:'security', editable: true,edittype:"select",editoptions:{value:"1:是;2:否"}}	,
						{name:'object',index:'security', editable: true},	
						{name:'type',index:'security', editable: true},	
						{name:'zrk',index:'security', editable: true},
						{name:'contract',index:'security', editable: true}				
					],
					onSelectRow: function(id){
		               if(id && id!==vgqzr){
		                 jQuery('#gqzr_list').jqGrid('restoreRow',vgqzr);
			             jQuery('#gqzr_list').jqGrid('editRow',id,true);
			             vgqzr=id;}
						 },
					editurl:"entity-info-alter.html",
					autowidth:true,
					height:'auto',
					pager: '#pgtoolbargqzr',
					multiselect: true,
					caption: '股权转让信息'
						});
				var gqzr= [{contract:'上传'},{contract:'上传'},{contract:'上传'}];
				for(var i=0;i<=gqzr.length;i++)
				jQuery("#gqzr_list").jqGrid('addRowData',i+1,gqzr[i]);	
                jQuery("#gqzr_list").jqGrid('navGrid','#pgtoolbargqzr',{edit:true,add:true,del:true});
				$(window).bind('resize', function() {  
						// resize the datagrid to fit the page properly: 
						var size = getWidthAndHeigh(true);
						jQuery("#gqzr_list").setGridWidth(size.width * 0.98); 
						
					}); 
</script>