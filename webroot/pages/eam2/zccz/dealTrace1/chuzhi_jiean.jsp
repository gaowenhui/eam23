<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%
	String isAdd = "false";
	String headId = (String)request.getAttribute("headId");
	if(!(headId== null||"null".equals(headId)||"".equals(headId))){
		isAdd = "true";
	}
	String isFxglb = (String)request.getAttribute("isFxglb");
%>
<html>
	<head>
		<base href="<%=basePath%>" />
		<title>处置跟踪结案</title>
		<script type="text/javascript">
		$(function(){
			if(window.parent.clearPanelTool){
				window.parent.clearPanelTool();
			}
		}); 
            function getWidthAndHeigh(resize){
                var iframeHeight = document.body.clientHeight;
                var iframeWidth = document.body.clientWidth;
                var browser = navigator.appName;
                // chrome
                if (browser == "chrome") {
                    iframeWidth -= 16;
                    iframeHeight -= 85;
                }
                // firefox
                else 
                    if (browser == "firefox") {
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
                return {
                    width: iframeWidth,
                    height: iframeHeight
                };
            }
            function changeywlx(){
            	//document.getElementById("st_czfs").value = "";
            	//document.getElementById("zc_czfs").value = "";
            	var selected = document.getElementById("ywlx").value;
            	if(selected ==""){
            		//czfs1.style.display = "none";
            		//czfs2.style.display = "none";
            		//czfs3.style.display = "block";
            		czfs4.style.display = "none";
            		czfs5.style.display = "none";
            		czfs6.style.display = "none";
            		czfs7.style.display = "block";
            		czfs8.style.display = "block";
            		czfs9.style.display = "block";
            	}else if(selected == '20'){//处置投资
            		//czfs1.style.display = "none";
            		//czfs2.style.display = "block";
            		//czfs3.style.display = "none";
            		czfs4.style.display = "block";
            		czfs5.style.display = "block";
            		czfs6.style.display = "block";
            		czfs7.style.display = "none";
            		czfs8.style.display = "none";
            		czfs9.style.display = "none";
            	}else {//实体
            		//czfs1.style.display = "block";
            		//czfs2.style.display = "none";
            		//czfs3.style.display = "none";
            		czfs4.style.display = "block";
            		czfs5.style.display = "block";
            		czfs6.style.display = "block";
            		czfs7.style.display = "none";
            		czfs8.style.display = "none";
            		czfs9.style.display = "none";
            	}
            }
            function onload(){
            	var xmlx = "${xmlx}";
            	if(xmlx=="0"){
            		ywlx4czxm.style.display ="block";
            		ywlx4tzxm.style.display ="none";
            		//czfs4czxm.style.display ="block";
            		//czfs4czxm1.style.display ="none";
            	}else{
            		ywlx4czxm.style.display ="none";
            		ywlx4tzxm.style.display ="block";
            		//czfs4czxm.style.display ="none";
            		//czfs4czxm1.style.display ="block";
            		czfs4.style.display = "block";
            		czfs5.style.display = "block";
            		czfs6.style.display = "block";
            		czfs7.style.display = "none";
            		czfs8.style.display = "none";
            		czfs9.style.display = "none";
            		//jQuery("#purchaselist").hideCol('czfs');
            	}
            }
            
           function lookdblclickAss(rowid){
				var itemId = jQuery("#purchaselist").getCell(rowid,"xmId");
				<%if("1".equals(request.getAttribute("xmlx"))){%>
					window.open('<%=basePath %>cjtz/dealTrace2_viewItemInfo.do?itemId='+itemId);
				<%}else{%>
					window.open('<%=basePath %>zccz/dealTrace1Head_viewItemInfo.do?itemId='+itemId);
				<%}%>
			}
			function genzong(){
				var url = "<%=request.getContextPath()%>/zccz/disposeTrack_newTrack.do?zcIds=123&xmIds=1234&zcCzfs=zxqk";
				window.open(url);
			}
        </script>
	</head>
	<body onload="onload();" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<s:hidden name="xmlx" />
		<s:hidden name="isgdzccz" id="isgdzccz"/>
		<table id="condition" class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td class="td_form01">编号：</td>
				<td class="td_form02"><s:textfield name="vo.bh" id="bh" size="30"/></td>
				<td class="td_form01">处置项目名称：</td>
				<td class="td_form02"><s:textfield name="vo.czxmmc"  id="czxmmc" size="30"/></td>
				<td class="td_form01">项目状态：</td>
				<td class="td_form02">
					<s:select name="vo.xmzt"  id="xmzt" list="#{'':'',0:'处置方案未执行',1:'处置方案执行中',2:'已结案'}" />
				</td>
			</tr>
			<tr>
				<td class="td_form01">业务类型：</td>
				<td class="td_form02" id="ywlx4tzxm" >
					<e:select parRefKey="INVESTMENT_TYPE" headerKey="" headerValue="" list="#{}" id="ywlx2" name="vo.ywlx"  />
				</td>
				<td class="td_form02" id=ywlx4czxm >
					<e:select parRefKey="DISPOSE_TYPE" onchange="changeywlx();" headerKey="" headerValue="" list="#{}" id="ywlx" name="vo.ywlx"  />
				</td>
<!--				<td class="td_form01" id="czfs4czxm" >处置方式：</td>-->
<!--				<td class="td_form01" id="czfs4czxm1" >&nbsp;</td>-->
<!--				<td class="td_form02" id="czfs1" style="display:none">-->
<!--					<e:select parRefKey="ENTITY_DISPOSE_METHOD" headerKey="" headerValue="" list="#{}"  id="st_czfs" name="vo.czfs" />-->
<!--				</td>-->
<!--				<td class="td_form02" id="czfs2" style="display:none">-->
<!--					<e:select parRefKey="ASSET_DISPOSE_METHOD" headerKey="" headerValue="" list="#{}"  id="zc_czfs" name="vo.czfs"/>-->
<!--				</td>-->
<!--				<td class="td_form02" id="czfs3" style="display:block">&nbsp;</td>-->
				<td class="td_form01">资产所在位置：</td>
				<td class="td_form02" id="czfs4" style="display:none"><s:textfield  id="zcszwz" name="vo.zcszwz" size="30"/></td>
				<td class="td_form02" id="czfs7" style="display:block"><s:textfield readonly="true" size="30"/></td>
				<td class="td_form01">&nbsp;</td>
				<td class="td_form02">&nbsp;</td>
			</tr>
			<tr>
				<td class="td_form01">拟稿部门：</td>
				<td class="td_form02" id="czfs5" style="display:none"><s:textfield id="ngbmmc"  name="vo.ngbmmc"size="30"/></td>
				<td class="td_form02" id="czfs8" style="display:block"><s:textfield readonly="true" size="30"/></td>
				<td class="td_form01">拟稿人：</td>
				<td class="td_form02" id="czfs6" style="display:none"><s:textfield id="ngrmc"  name="vo.ngrmc"size="30"/></td>
				<td class="td_form02" id="czfs9" style="display:block"><s:textfield readonly="true" size="30"/></td>
				<td class="td_form01">&nbsp;</td>
				<td class="td_form02">&nbsp;</td>
			</tr>
			<tr>
				<td class="td_form01" colspan="6">
					<input type="button" value="查询" class="btn3_mouseover" onclick="ptQuery();"/>
					<input type="button" value="重置" class="btn3_mouseover" onclick="ptReset();"/>
				</td>
			</tr>
		</table>
		<table width="100%" class="newtable" border="0" align="center"
			cellpadding="0" cellspacing="0">
			<tr>
				<td align="right">
					<table id="purchaselist">
					</table>
					<div id="pgtoolbar1">
					</div>
				</td>
			</tr>
		</table>
	</body>
</html>
<script type="text/javascript">
function ptQuery(){
	var bh = document.getElementById("bh").value;
	var czxmmc = document.getElementById("czxmmc").value;
	var ngbmmc = document.getElementById("ngbmmc").value;
	var ngrmc = document.getElementById("ngrmc").value;
	var xmlx = "${xmlx}";
   	if(xmlx=="0"){
   		var ywlx = document.getElementById("ywlx").value;
   	}else{
   		var ywlx = document.getElementById("ywlx2").value;
   	}
	
	var zcszwz = document.getElementById("zcszwz").value;
	var xmzt = document.getElementById("xmzt").value;
	var xmlx = document.getElementById("xmlx").value;
	var czfs = "";
	if(document.getElementById("ywlx").value == '20'){
		//czfs = document.getElementById("zc_czfs").value;
	}else if(document.getElementById("ywlx").value == '21'||document.getElementById("ywlx").value == '22'){
		//czfs = document.getElementById("st_czfs").value;
	}
	
	var url1 = "<%=basePath%>zccz/dealTrace1Head_dealQuery.do";
	jQuery("#purchaselist").setGridParam({
		postData:{
			'vo.bh'     : ''+bh,
			'vo.czxmmc' : ''+czxmmc,
			'vo.ngbmmc' : ''+ngbmmc,
			'vo.ngrmc'  : ''+ngrmc,
			'vo.ywlx'   : ''+ywlx,
			//'vo.czfs'   : ''+czfs,
			'vo.zcszwz' : ''+zcszwz,
			'vo.xmzt'   : ''+xmzt,
			'vo.xmlx'   : ''+xmlx
		}
	}).trigger("reloadGrid");
}

function ptReset(){
	$("#condition input").not("input[type='button']").val("");
	$("#condition select").val("");
	ptQuery();
}

//8888888888888888888888888888888888888888888888888888888888888888888888888888
jQuery("#purchaselist").jqGrid({				
	url:'<%=basePath%>zccz/dealTrace1Head_dealQuery.do',
	postData:{'vo.xmlx'   : '${xmlx}'},
	datatype: "json",
	mtype:"POST",
   	//colNames: ['xmid','编号', '处置项目名称','业务类型', '项目状态','拟稿部门', '处置方式', '资产所在位置', '拟稿人', '审批委员', '主持人'],
   	colNames: ['xmid','编号', '处置项目名称','业务类型', '项目状态','拟稿部门', '资产所在位置', '拟稿人', '审批委员', '主持人'],
	colModel: [
	   {name: 'xmId',index: 'id',align: "center",sorttype: "int",hidden: true},
	   {name: 'bh',index: 'name',align: "center",sorttype: "int" }, 
	   {name: 'czxmmc',align: "center",index: 'diqu',sorttype: "int" }, 
	   {name: 'ywlx',align: "center",index: 'ywlx',sorttype: "string" }, 
	   {name: 'xmzt',index: 'xmzt',align: "center",sorttype: "int" }, 
	   {name: 'ngbmmc',align: "center",index: 'glbm',sorttype: "int" }, 
	   //{name: 'czfs',index: 'czfs',align: "center",sorttype: "int" }, 
	   {name: 'zcszwz',index: 'zxzt',align: "center",sorttype: "float" }, 
	   {name: 'ngrmc',index: 'cz',align: "center",sorttype: "int" }, 
	   {name: 'spwys',index: 'c1z',align: "center",sorttype: "int" }, 
	   {name: 'zcr',index: 'c1z',align: "center",sorttype: "int" }],
	pager:'pgtoolbar1',
	multiselect:true,
	rownumbers:true,
	autowidth:true,
	height:'auto',
	viewrecords:true,
	caption: '项目信息',
	rowNum:10,
	prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
  	rowList:[10,20,30],
	ondblClickRow:function(rowid){
		lookdblclickAss(rowid);
	},
	jsonReader : {
		root:"rows",
		page: "page",
		total: "total",
		records: "records",
		repeatitems: false,
		id: "0"
	},
	loadComplete:function(data){
		if(data.rows.length>0){
			jQuery("#purchaselist").setGridHeight(data.rows.length * 22 + 18);
		}else{
			jQuery("#purchaselist").setGridHeight(0);
		}
	},
	shrinkToFit:false
});

$(document).ready(function(){	
    var isAdd = "<%=isAdd%>";
	if(isAdd == "true"){
		var buttonJSonString = '[{"buttonHandler":"queding","buttonIcon":"icon-add","buttonText":"确定"}]';
	}else{
		<%if("1".equals(request.getAttribute("xmlx"))){%>
		var buttonJSonString = '[ <%if("true".equals(isFxglb)){%>{"buttonHandler":"duban","buttonIcon":"icon-add","buttonText":"督办"},\<%}%>{"buttonHandler":"jiean","buttonIcon":"icon-add","buttonText":"申请结案"}]';
		<%}else{%>
		var buttonJSonString = '[{"buttonHandler":"jiean","buttonIcon":"icon-add","buttonText":"申请结案"}]';
		<%}%>
	}
	addButtons(jQuery("#gview_purchaselist > .ui-jqgrid-titlebar"),buttonJSonString);
});
function jiean(){
	var xmId = jQuery("#purchaselist").jqGrid('getGridParam','selarrrow');
	if( xmId.length == 1&&xmId[0].length ==0 ){
		alert("没有可以选择的项目！");
	}else if(xmId.length>0){
		
		var url = '';
		if(document.getElementById('xmlx').value =='1'){
			url = '<%=basePath%>cjtz/dealTrace2_addHead.do?xmIds='+xmId+"&xmlx=${xmlx}&pdk=cjtz_tzfazxgz";
		}else{
			var isgdzccz = 1;
			for(var i=0;i<xmId.length;i++){
				var xmzt = jQuery("#purchaselist").getCell(xmId[i],"xmzt");
				if("已结案"==xmzt){
					alert("已经结案的项目不能再次申请");
					return ;
				}
				var ywlx = jQuery("#purchaselist").getCell(xmId[i],"ywlx");
				if("通用资产处置"==ywlx){
					if(isgdzccz==3){
						alert('业务类型为"通用资产处置"的项目，不能跟其他业务类型的项目一起结案！');
						return ;
					}
					isgdzccz = 2;
				}else{
					if(isgdzccz==2){
						alert('业务类型为"通用资产处置"的项目，不能跟其他业务类型的项目一起结案！');
						return ;
					}
					isgdzccz = 3;
				}
			}
			if(isgdzccz==3){
				isgdzccz="false";
			}else{
				isgdzccz="true";
			}
			url = '<%=basePath%>zccz/dealTrace1Head_addHead.do?xmIds='+xmId+"&xmlx=${xmlx}&pdk=zccz_czgzyja&isgdzccz="+isgdzccz;
		}
		window.location=url;
	}else if(xmId.length==0){
		alert("请选择项目!");
	}
}
function duban(){
	var xmId = jQuery("#purchaselist").jqGrid('getGridParam','selarrrow');
	if( xmId.length == 1&&xmId[0].length ==0 ){
		alert("没有可以选择的项目！");
	}else if(xmId.length>0){
		url = '<%=basePath%>cjtz/supervision_addHead.do?xmIds='+xmId+"&xmlx=${xmlx}&pdk=cjtz_tzfadblc";
		window.location=url;
	}else if(xmId.length==0){
		alert("请选择项目!");
	}
	
}
function queding(){
	var isgdzccz = document.getElementById('isgdzccz').value;
	var gr = jQuery("#purchaselist").jqGrid('getGridParam','selarrrow');
	if( gr.length == 1&&gr[0].length ==0 ){
		alert("没有可以选择的处置项目！");
	}
	/**
	else if(gr.length>0){
		if(isgdzccz=="true"){
			for(var i=0;i<gr.length;i++){
				var ywlx = jQuery("#purchaselist").getCell(gr[i],"ywlx");
				if(!("通用资产处置"==ywlx)){
					alert('您已选择业务类型为"通用资产处置"的项目，请选择相同业务类型的项目！');
					return ;
				}
			}
		}else{
			for(var i=0;i<gr.length;i++){
				var ywlx = jQuery("#purchaselist").getCell(gr[i],"ywlx");
				if("通用资产处置"==ywlx){
					alert('您已选择业务类型为非"通用资产处置"的项目，请选择非"通用资产处置"业务类型的项目！');
					return ;
				}
			}
		}
		window.opener.callBackXm(gr);
		window.close();
	}
	*/
	else if(gr.length==0){
		alert("请选择处置项目!");
		return;
	}else{
		window.opener.callBackXm(gr);
		window.close();
	}
	
}
$(window).bind('resize', function(){
    // resize the datagrid to fit the page properly: 
    var size = getWidthAndHeigh(true);
    jQuery("#purchaselist").setGridWidth(size.width * 0.98);

});
//888888888888888888888888888888888888888888888888888888888888888888888888888
</script>