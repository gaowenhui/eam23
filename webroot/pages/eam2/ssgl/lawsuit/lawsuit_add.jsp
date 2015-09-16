  <%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String stid = (String) request.getAttribute("stid");
	String sslxid = (String) request.getAttribute("sslxid");
	String sazclbbm = (String) request.getAttribute("sazclbbm");
	String stgl = (String) request.getAttribute("stgl");
	String zcgl = (String) request.getAttribute("zcgl");
	String look = (String)request.getAttribute("look");
	String ifSave = (String)request.getAttribute("ifSave");
	String rework = (String)request.getAttribute("rework");
%>
<html>
	<head>
<script type="text/javascript">
function openTreeByType(type4Card){
		type4Card = 'department'
		var url = "<%=request.getContextPath()%>/kpgl/cardTree_tree.do?type4Card="+type4Card;
		var _g_privateDialogFeatures = 'height=400, width=200,toolbar=no,scrollbars=yes,location=no,directories=no,menubar=no,resizable=no,left=400,top=200';
		window.open(url,'',_g_privateDialogFeatures);
	}
	
	function getCallBack4Tree(type4Card,id,value){
		document.getElementById("jbr").value = value;
		//document.getElementById(type4Card+"value").value 	= value;
	}

function selectZc(){
	var url ="<%=basePath%>jygdzc/AssetQuery_init.do?fromurl=susong&returnValue=true";
	var _g_privateDialogFeatures = 'height=600, width=1024,toolbar=no,scrollbars=yes,location=no,directories=no,menubar=no,resizable=no,left=100,top=100';
	window.open(url,'',_g_privateDialogFeatures);
}
function addValue(sss,xxx){
	document.doublecombo.sazcid.value=sss;
	document.doublecombo.sazcmc.value=xxx;
	//alert("回调函数的值："+sss);
}
//立案日期
	$(function(){
	
		$("#larq,#qssj,#sarq").datebox({
	    	formatter:function(date){
	    		 //alert(now);
	    		return formatDate(date,"YYYY");
	    	}
	    });
	    
    	if('1' == '<%=look%>'){
		  var a  = document.getElementsByTagName("input");
		  var b  = document.getElementsByTagName("select");
		  var c  = document.getElementsByTagName("textarea");
			for(var i=0;i<a.length;i++){
				a[i].disabled = "true";
			}
			document.getElementById("yishen").disabled=false;
			document.getElementById("ershen").disabled=false;
			document.getElementById("zhixing").disabled=false;
			document.getElementById("zaishen").disabled=false;
			for(var i=0;i<b.length;i++){
				b[i].disabled = "true";
			}
			for(var i=0;i<c.length;i++){
				c[i].disabled = "true";
			}				
		}
		if('asset' == '<%=zcgl%>'){   
			window.opener.reloadGridSsXx();
			document.getElementById("sazcmc").disabled="true";
			document.getElementById("sazclbid").disabled="true";
		}
	});
	function windowOpen(theURL,winName,features,width,hight,scrollbars,top,left){
	  var parameter="top="+top+",left="+left+",width="+width+",height="+hight;
	  if(scrollbars=="no") {
	  	parameter+=",scrollbars=no";
	  }  else {
	  	parameter+=",scrollbars=yes";  	
	  }
	  window.open(theURL,winName,parameter);
	}
	
	function displayUpperLayer(){
			var selectedindex = document.getElementById("sslxid").selectedIndex;
			if(document.getElementById("sslxid").options[selectedindex].value==0){
			   document.getElementById("div0").style.display="block";
			   document.getElementById("div1").style.display="none";
			}else{
			   document.getElementById("div0").style.display="none";
			   document.getElementById("div1").style.display="block";
			}
	}

	function displayCardType(index){
		for(var i=1;i<=5;i++){
			if(index==i){
			   document.getElementById("card_type"+i).style.display="block";
			   document.getElementById("div"+i).style.display="block";
			}else{
			   document.getElementById("card_type"+i).style.display="none";
			   document.getElementById("div"+i).style.display="none";
			}
		}
	}
	function showSubimtPage(){
		document.getElementById("subimtPage").style.display="block";
	}
	function cancleSubmit(){
		document.getElementById("subimtPage").style.display="none";

	}
	function saveBody(){
   		if(checkValues()){
   			document.getElementById("sazcmc").disabled=false;
			document.getElementById("sazclbid").disabled=false;
   			doublecombo.action='<%=basePath%>ssgl/lawsuit_saveHead.do'
	   		doublecombo.submit();
   			alert("保存成功");
   		}
   	}
		function saveLigitation(){
			if(checkValues()){
				doublecombo.action="<%=basePath%>ssgl/lawsuit_saveHead.do?stid="+'<%=stid%>'+'&sslxid='+'<%=sslxid%>'+'&sazclbbm='+'<%=sazclbbm%>'+'&stgl='+'<%=stgl%>'+'&ifSave='+1+'&rework='+'<%=rework%>';
		   		doublecombo.submit();
			}
		}
		$(document).ready(function(){
				var buttonFileJSonString = '[{"buttonHandler":"addFileAss","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"delFileAss","buttonIcon":"icon-remove","buttonText":"删除"},\
											{"buttonHandler":"up","buttonIcon":"icon-up","buttonText":"上移"},\
                                            {"buttonHandler":"down","buttonIcon":"icon-down","buttonText":"下移"}\
											]';
			if('1' != '<%=look%>'){								
				addButtons(jQuery("#gview_file_list > .ui-jqgrid-titlebar"),buttonFileJSonString);
			}
			
			jQuery("#file_list").setGridWidth($("#common_tableWidth").width());
			$(window).bind('resize', function(){
				jQuery("#file_list").setGridWidth($("#common_tableWidth").width());
			});
		});
		
//		if('1' == '<%=stgl%>'){
//			$(function(){
//					$("#doublecombo").ajaxForm({
//				   		success: function(responseText){
//					   		$("#id").val(responseText);
//					   		window.opener.reloadGrid();
//					   		alert("保存成功!");
//					   	}
//				   });
//			});	
//		}
		
		function refurbishGrid(){
			if('1' == '<%=stgl%>' && '1' == '<%=ifSave%>'){
				window.opener.reloadGrid();
				alert("保存成功!");
			}
		}
		
		function checkValues(){
		var bde = $.trim($("#bde").val());
		var zxhk = $.trim($("#zxhk").val());
			if(document.getElementById("sfid").value==''){
				alert("省份不能为空！");
				return false;
			}else if(document.getElementById("sazcmc").value==''){
				alert("资产不能为空！");
				return false;
			}else if(document.getElementById("yg").value==''){
				alert("原告不能为空！");
				return false;
			}else if(document.getElementById("bg").value==''){
				alert("被告不能为空！");
				return false;
			}else if(document.getElementById("bde").value!=''&&!isFloat(bde)){
				alert("标的额请输入数字！");
				return false;
			}else if(document.getElementById("zxhk").value!=''&&!isFloat(zxhk)){
				alert("执行回款请输入数字！");
				return false;
			}else {
				return true;
			}
		}
	//当省份改变时触发此方法，显示出地级市供选择
	function ejflRefresh(sfid){
		$.post("<%=basePath%>ssgl/lawsuit_provienceCity.do",{
					"sfid" : $(sfid).val()
				},function(returnStr){
					$("#djsbm").html("<option>请选择</option>");
					var returnObj = eval('(' + returnStr + ')');
					$.each(returnObj,function(i){
						$("#djsbm").append("<option value='" + i + "'>" + returnObj[i] + "</option>");
				});
		 });
	}	
</SCRIPT>
	</head>
	<base target="_self" />
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onLoad="refurbishGrid();">
		<form action="lawsuit_saveHead.do" method="post" name="doublecombo"
			id="doublecombo">
			<s:set name="biaodanid" value="%{#request.id}" />
			<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
			<input type='hidden' name='id' id="id" value='${id}' size='40' />
			<s:hidden name="ssBaseinfo.id" value="%{#request.id}" />
			<s:hidden name="zcgl" value="%{#request.zcgl}" />
			<table width="100%" border="0" cellpadding="2" cellspacing="0"
				align="center" id="common_tableWidth">
				<tr>
					<td colspan="6" class="td_top" align="left">
						诉讼基本信息
					</td>
				</tr>
				<tr>
					<td class="td_form01" width="11%">
						<font color="#FF0000"><strong>*</strong></font>所属省份：
					</td>
					<td width="22%" class="td_form02">
						<e:select parRefKey="PROVIENCE" list="#{}" name="ssBaseinfo.sfid" headerKey="" headerValue="请选择"
							id="sfid" value="%{#request.ssBaseinfo.sfid }"  onchange="ejflRefresh(this);"/>
						<s:hidden name='ssBaseinfo.sfbm' />
						<s:hidden name='ssBaseinfo.sfmc' />

					</td>
					<td class="td_form01" width="11%">地级市：</td>
					<td class="td_form02" width="22%">
						<s:select list="%{#request.djsMap}" name="ssBaseinfo.djsbm" headerKey="0" headerValue="请选择" id="djsbm" value="%{#request.ssBaseinfo.djsbm }"/></td>
					<td class="td_form01" width="11%">&nbsp;</td>
					<td class="td_form02" valign="middle">&nbsp;</td>
				</tr>
				<tr>

					<td class="td_form01" width="11%">
					涉案资产类别：
					</td>
					<td class="td_form02" width="22%">
						<s:select name="ssBaseinfo.sazclbid" id="sazclbid" onchange="chagezc()" list="#{'1':'固定资产类','2':'实体类','3':'委托贷款类','4':'债券类','5':'债权类','6':'其他'}" />
						<s:hidden name='ssBaseinfo.sazclbbm' />
						<s:hidden name='ssBaseinfo.sazclbmc' />
					</td>
					
					<td class="td_form01" width="11%">
						<font color="#FF0000"><strong>*</strong></font>涉案资产名称：
					</td>
					<td class="td_form02" valign="middle">
						<s:hidden name='ssBaseinfo.sazcid' id='sazcid' />
						<s:textfield name='ssBaseinfo.sazcmc' id='sazcmc' style="width:83%"/>
						<img src="<%=basePath%>resource/ProjectImages/search.gif"
							onclick='selectWin()' id='selectzc' width="21" height="20" align="absmiddle">
					</td>
					<td class="td_form01" width="11%">&nbsp;</td>
					<td width="22%" class="td_form02">&nbsp;</td>
				</tr>
				<script>
				function selectWin(){
					var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";
					if(document.getElementById('sazclbid').value=='1'){
						selectZc();
					}else if(document.getElementById('sazclbid').value=='2'){
						selfTransactEntity()
					}else if(document.getElementById('sazclbid').value=='4'){
						window.open("<%=basePath %>stock/maintain_listStockMaintain.do"
						+ "?assetType=7"
						+ "&sign=1"
						+ "&option=ssgl" ,'',winOpenStr);
						//stock_List.jsp
					}else if(document.getElementById('sazclbid').value=='5'){
						window.open("<%=basePath%>zqgl/debt_debtList.do"
						+ "?assetType=7"
						+ "&sign=1"
						+ "&option=ssgl" ,'',winOpenStr);
						//basic_debt_list.jsp
					}else if(document.getElementById('sazclbid').value=='3'){
						window.open("<%=basePath %>wtdk/loansQuery_init.do?option=ssgl&ctlButton=show&assetType=2",'',winOpenStr);
						//loansQuery.jsp
					}
				}
				
				function  chagezc(){
					if(document.getElementById('sazclbid').value=='1'){
						document.getElementById("selectzc").style.display='';
					}else if(document.getElementById('sazclbid').value=='2'){
						document.getElementById("selectzc").style.display='';
					}else if(document.getElementById('sazclbid').value=='4'){
						document.getElementById("selectzc").style.display='';
					}else if(document.getElementById('sazclbid').value=='3'){
						document.getElementById("selectzc").style.display='';
					}else  if(document.getElementById('sazclbid').value=='5'){
						document.getElementById("selectzc").style.display='';
					}else {
						document.getElementById("selectzc").style.display='none';
					}
						$("#sazcmc").val("");
						$("#sazcid").val("");
				}
			var winVar = "height=500, width=800, top=100, left=100,toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no, directories=no ,center=yes";
			function selfTransactEntity(){
			window.open('/eam2/stgl/weihu_listEntities.do?debtSign='+1+'&zixunType='+1,'',winVar);
			return false;
		}
		
		function getEntity(gr){
		$.post("/eam2/zqgl/debt_returnJson.do",{
		 'stid':''+gr
		},function(returnStr){
		var returnObj = eval('('+ returnStr + ')');
			$("#sazcmc").val(returnObj.stzwmc);
			$("#sazcid").val(returnObj.id);
	});
}
			</script>
				<tr>
					<td class="td_form01">
						<font color="#FF0000"><strong>*</strong></font>原告：
					</td>
					<td class="td_form02">
						<s:textfield name='ssBaseinfo.yg' id='yg'  />
					</td>
					<td class="td_form01">
						<font color="#FF0000"><strong>*</strong></font>被告：
					</td>
					<td class="td_form02">
						<s:textfield name='ssBaseinfo.bg'  id='bg'  />
					</td>
					<td class="td_form01">
						第三人：
					</td>
					<td class="td_form02">
						<s:textfield name='ssBaseinfo.dsr'  id='dsr' />
					</td>

				</tr>
				<tr>
					<td class="td_form01">
						诉讼类型：
					</td>
					<td class="td_form02">


						<s:select name="ssBaseinfo.sslxid" id="sslxid"
							list="#{'0':'起诉','1':'被诉'}"
							onChange="redirect(this.options.selectedIndex);displayUpperLayer()"
							value="%{#request.ssBaseinfo.sslxid}" />

						<script>

var groups=document.getElementById('sslxid').options.length
var group=new Array(groups)
for (i=0; i<groups; i++)
group[i]=new Array()
group[0][0]=new Option("胜诉执结案件","1")
group[0][1]=new Option("胜诉执行过程中案件","2")
group[0][2]=new Option("败诉执结案件案件","3")
group[0][3]=new Option("胜诉结案","4")
group[0][4]=new Option("审理过程中案件","5")
group[1][0]=new Option("胜诉结案","1")
group[1][1]=new Option("败诉结案","2")
group[1][2]=new Option("审理过程中案件","3")
var temp=document.doublecombo.stage2
	function redirect(x){
		var selectedindex = document.getElementById('sslxid').selectedIndex;
					if(document.getElementById('sslxid').options[selectedindex].value==0){
					   document.getElementById("div0").style.display="block";
					   document.getElementById("div1").style.display="none";
					}else{
					   document.getElementById("div0").style.display="none";
					   document.getElementById("div1").style.display="block";
					}
		for (m=temp.options.length-1;m>0;m--)
		temp.options[m]=null
		for (i=0;i<group[x].length;i++){
			temp.options[i]=new Option(group[x][i].text,group[x][i].value)
		}
	}
</script>

						<s:hidden name='ssBaseinfo.sslxbm' />
						<s:hidden name='ssBaseinfo.sslxmc' />
					</td>
					<td class="td_form01">
						案件类别：
					</td>
					<td class="td_form02">
						<s:select name="ssBaseinfo.ajlbid" id='ajlbid'
							value="%{#request.ssBaseinfo.ajlbid}"
							list="#{'1':'胜诉执结案件','2':'胜诉执行过程中案件','3':'败诉执结案件案件','4':'败诉执行过程中案件','5':'审理过程中案件'}" />
					</td>
					<td class="td_form01">
						&nbsp;
					</td>
					<td class="td_form02">
						&nbsp;
					</td>
				</tr>
				<tr>
					<script>
var groups=document.getElementById('sslxid').options.length
var group=new Array(groups)
for (i=0; i<groups; i++)
group[i]=new Array()
group[0][0]=new Option("胜诉执结案件","1")
group[0][1]=new Option("胜诉执行过程中案件","2")
group[0][2]=new Option("败诉执结案件案件","3")
group[0][3]=new Option("胜诉结案","4")
group[0][4]=new Option("审理过程中案件","5")
group[1][0]=new Option("胜诉结案","1")
group[1][1]=new Option("败诉结案","2")
group[1][2]=new Option("审理过程中案件","3")
var temp=document.doublecombo.ajlbid

function redirect(x){
var selectedindex = document.getElementById('sslxid').selectedIndex;
			if(document.getElementById('sslxid').options[selectedindex].value==0){
			   document.getElementById("div0").style.display="block";
			   document.getElementById("div1").style.display="none";
			}else{
			   document.getElementById("div0").style.display="none";
			   document.getElementById("div1").style.display="block";
			}

	for (m=temp.options.length-1;m>0;m--)
	
	temp.options[m]=null
	
	for (i=0;i<group[x].length;i++){
	
	temp.options[i]=new Option(group[x][i].text,group[x][i].value)
	
	}
	temp.options[0].selected=true
	
	}



</script>

					<td class="td_form01">
						立案日期：
					</td>
					<td class="td_form02">
						<s:textfield name="ssBaseinfo.larq" id="larq" readonly="true" />

					</td>
					<td class="td_form01">
						起诉日期：
					</td>
					<td class="td_form02">
						<s:textfield name="ssBaseinfo.qssj" id="qssj" readonly="true" />
					</td>
					<td class="td_form01">
						&nbsp;
					</td>
					<td class="td_form02">
						&nbsp;
					</td>
				</tr>

				<tr>
					<td class="td_form01">
						案由：
					</td>
					<td class="td_form02" colspan="5">
						<s:textfield name='ssBaseinfo.ay' id='ay' />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						标的额(元)：
					</td>
					<td class="td_form02">
						<s:textfield name="ssBaseinfo.bde" id="bde" />
					</td>
					<td class="td_form01">
						<div style="display: block" id="div0">
							执行回款(元)：
						</div>
						<div style="display: none" id="div1">
							付款金额(元)：
						</div>
					</td>
					<td class="td_form02">
						<s:textfield name="ssBaseinfo.zxhk" id="zxhk" />
					</td>
					<td class="td_form01">
						诉讼请求：
					</td>
					<td class="td_form02">
						<s:textfield name='ssBaseinfo.ssqq' id='ssqq' />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						结案状态：
					</td>
					<td class="td_form02">
						<s:hidden name='ssBaseinfo.ssztid' />
						<s:hidden name='ssBaseinfo.ssztbm' />
						<!-- s:hidden name='ssBaseinfo.ssztmc' / -->
						<s:hidden name='ssBaseinfo.jaztbm' />
						<s:hidden name='ssBaseinfo.jaztmc' />
						<s:select list="#{'2':'未结案','1':'结案'}" name="ssBaseinfo.jaztid"
							id="jaztid"></s:select>
					</td>
					<td class="td_form01">
						中国建投是否为当事人：
					</td>
					<td class="td_form02">
						<s:select list="#{'1':'是','2':'否'}" name="ssBaseinfo.jtsfwdsr"></s:select>
					</td>
					<td class="td_form01" nowrap>
						中国建投部门：
					</td>
					<td class="td_form02">
						<s:textfield id="jbr" name="ssBaseinfo.jbr" />
						<img
							src="<%=request.getContextPath()%>/resource/ProjectImages/search.gif"
							onclick="openTreeByType('assetType');" width="21" height="20">
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						建行(本案关联行)：
					</td>
					<td class="td_form02" colspan="5">
						<s:textfield name='ssBaseinfo.bhglh' size='100' />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						代理人：
					</td>
					<td class="td_form02" colspan="5">
						<s:textfield name='ssBaseinfo.dlr' id='dlr' size='100' />
					</td>
				</tr>
  				<tr>
            	    <td class="td_form01">案情简述：</td>
            	    <td colspan="5"  class="td_form02"><s:textarea name='ssBaseinfo.aqjs' style="width: 85%;"  rows="3"/>
            		</td>
            		
            	</tr>
				<tr>
					<td class="td_form01">
						录入人：
					</td>
					<td class="td_form02">
						<s:hidden name='ssBaseinfo.lrrid' />
						<s:textfield name='ssBaseinfo.lrr' id='lrr'
							value="%{#request.userdeptname}" readonly="true" />
					</td>
					<td class="td_form01">
						录入日期：
					</td>
					<td class="td_form02" colspan="1">
						<s:date name="ssBaseinfo.lrsj" format="yyyy-MM-dd" var="draftDate" />
						<s:textfield id="lrsj" name="ssBaseinfo.lrsj"
							value="%{#request.draftDate}" readonly="true" />
					</td>
					<td class="td_form01">
						收案日期：
					</td>
					<td class="td_form02">
						<s:textfield name="ssBaseinfo.sarq" id="sarq" readonly="true" />
					</td>
				</tr>
				<tr>
					<td class="td_form02"  colspan="6">
					<div align="right">
						<%
							if (!"1".equals(stgl) && stgl != null) {
						%>
						<s:submit value='保存基本信息'>
						</s:submit>
						<div id="hidebutton">
							<input type="button" id="closebut" value="关闭"
								onclick="window.close()">
						</div>
						<script type="text/javascript">
					if(window.opener!=null){
						
					}else{
					document.getElementById("closebut").style.display='none';
					}
					</script>
						<%
							} else if ("asset".equals(zcgl)) {
						%>
						<input type="button" value="保存基本信息" onclick="saveBody();" />
						<input type="button" id="closebut" value="关闭"
							onclick="window.close()">
						<%
							} else {
								 
						%>
						<input type="button" value="保存基本信息" 
							onclick="saveLigitation();" />
						<%
							 
							}
						%>
						</div>
					</td>
				</tr>
				
				<tr>
					<td class="td_form01">
						诉讼过程信息：
					</td>
					<td class="td_form02" colspan="5">
						<input type="button" id="yishen"  onClick="showpro(1)" class="buttonface02"
							value="一审">
						<input type="button" id="ershen" onClick="showpro(2)" class="buttonface02"
							value="二审">
						<input type="button" id="zhixing" onClick="showpro(3)" class="buttonface02"
							value="执行">
						<input type="button" id="zaishen" onClick="showpro(4)" class="buttonface02"
							value="再审">
						<script type="text/javascript">
		function showpro(i){
			if(document.doublecombo.id.value !=''){
				div2.style.display=div2.style.display=='none'?'block':'block';iframe1.location='pro_pro.do?jbxxid='+document.all.id.value+'&type='+i+'&look='+'<%=look%>'
			}else{
				alert('请先执行保存!')
			}
		}
</script>
					</td>
				</tr>
			</table>
			<br>
			<div id="div2" style="display: none">
				<iframe src='' width='100%' height="280px" marginwidth="1"
					marginheight="1" scrolling="no" name="iframe1" border="0"
					frameborder="0">
				</iframe>
			</div>

			<table width="100%" border="0" cellpadding="2" cellspacing="0"
				align="center">

				<tr>
			        <table class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
							<%@ include file="/inc/file.inc"%>
					</table>		
		        </tr>
			</table>
		</form>

		<script type="text/javascript">
if('<s:property value="%{#request.ssBaseinfo.sslxid}" />' =='1'){
	redirect("1");
	document.doublecombo.ajlbid.value='<s:property value="%{#request.ssBaseinfo.ajlbid}" />'
}



/*
var a  = document.getElementsByTagName("select");
	for(var i=0;i<a.length;i++){
		a[i].disabled = true;
	}
var b  = document.getElementsByTagName("input");
	for(var i=0;i<b.length;i++){
		b[i].disabled = true;
	}
	
	document.getElementById("yishen").disabled=false;
	document.getElementById("ershen").disabled=false;
	document.getElementById("zhixing").disabled=false;
	document.getElementById("zaishen").disabled=false;
	*/
</script>
	</body>
</html>



<style>
</style>
