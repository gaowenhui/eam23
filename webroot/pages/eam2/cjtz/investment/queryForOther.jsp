<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
String cldId = request.getParameter("cldId");
%>
<html>
	<head>
		<base href="<%=basePath %>">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		<title>新增资产</title>
		<script type="text/javascript">
			var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";
			var isInit = false;
			$(function(){
				if(isInit)return;
				
				$(".layout-body").height($("body").height()-40);
				$(window).bind('resize',function(){
					$(".layout-body").height($("body").height()-40);
				});
				
				isInit = true;
			});
			var assetType = 'A';
			var assetType2 = 'B1';
			function changeLevel_1(obj){
				assetType = $("#level1Select option:selected").val();
				if(assetType == 'B' || assetType == 'C'){
					$("#level2Select").attr("disabled","");
					$("#level2Select option[value='B1']").attr("selected",true);
					changeLevel_2($("#level2Select"));
				}else{
					$("#level2Select").attr("disabled",true);
					$("#level2Select option[value='']").attr("selected",true);
					if(assetType == 'A1'){//经营性固定资产
						childQuery.window.location="<%=basePath %>jygdzc/AssetQuery_initForZccz.do?fenlei=1&option=CJTZ";
					}else if(assetType == 'A2'){//待处置资产
						childQuery.window.location="<%=basePath %>jygdzc/AssetQuery_initForZccz.do?fenlei=-1&option=CJTZ";
					}else if(assetType == 'A3'){//自用资产
						childQuery.window.location="<%=basePath %>zyzc/ZCQuery_init.do?option=CJTZ";
					}else if(assetType == 'D'){//委贷抵债物
						childQuery.window.location="<%=basePath %>wtdk/loansQuery_init.do?ctlButton=show&assetType=2&option=CJTZ&optionType=WDDZW";
					}else if(assetType == 'E'){//债券
						childQuery.window.location="<%=basePath %>stock/maintain_listStockMaintain.do?sign=1&option=CJTZ";
					}
				}
			}
				
			function changeLevel_2(obj){
				assetType2 = $("#level2Select option:selected").val();
				if(assetType == 'B'){//实体
					if(assetType2 == 'B1'){//咨询类实体
						childQuery.window.location="<%=basePath %>stgl/weihu_listEntities.do?option=CJTZ&zixunType=0";
					}else if(assetType2 == 'B2'){//非咨询处置类实体
						childQuery.window.location="<%=basePath %>stgl/weihu_listEntities.do?option=CJTZ&zixunType=1";
					}else if(assetType2 == 'B3'){//非咨询持续经营类实体
						childQuery.window.location="<%=basePath %>stgl/weihu_listEntities.do?option=CJTZ&zixunType=3";
					}
				}else if(assetType == 'C'){//实体内资产
					if(assetType2 == 'B1'){//咨询类实体
						childQuery.window.location="<%=basePath %>stgl/weihu_listEntities.do?ctlButton=show&zixunType=0&option=CJTZ&optionType=STLZC";
					}else if(assetType2 == 'B2'){//非咨询处置类实体
						childQuery.window.location="<%=basePath %>stgl/weihu_listEntities.do?ctlButton=show&zixunType=1&option=CJTZ&optionType=STLZC";
					}else if(assetType2 == 'B3'){//非咨询持续经营类实体
						childQuery.window.location="<%=basePath %>stgl/weihu_listEntities.do?ctlButton=show&zixunType=3&option=CJTZ&optionType=STLZC";
					}
				}
			}
			
			function addZyzc(gr){//自用资产
				$.post('<%=basePath %>cjtz/cjtzBodyAction_addOtherZyzc.do',{
					'zyzcIds'	: '' + gr,
					'cldId'		: '<%=cldId %>'
				},function(returnStr){
					if(returnStr == "SUCCESS"){
						window.opener.reloadOtherGrid();
						window.close();
					}else{
						alert("添加自用资产失败!");
					}
				});
			}
			
			//经营性固定资产'fenlei=1'、待处置资产'fenlei=2'
			function insertAsset(gr,quanshu,fenlei,assetType){
				$.post('<%=basePath %>cjtz/cjtzBodyAction_addOtherJygdzc.do',{
					'jygdzcIds'	: '' + gr,
					'fenlei'	: '' + fenlei,
					'cldId'		: '<%=cldId %>'
				},function(returnStr){
					if(returnStr == "SUCCESS"){
						window.opener.reloadOtherGrid();
						window.close();
					}else{
						if(fenlei == '1')
							alert("添加经营性固定资产失败!");
						else
							alert("添加待处置资产失败!");
					}
				});
			}
			
			function addZQuan(gr){//债券
				$.post('<%=basePath %>cjtz/cjtzBodyAction_addOtherZQuan.do',{
					'zqIds'	: '' + gr,
					'cldId'		: '<%=cldId %>'
				},function(returnStr){
					if(returnStr == "SUCCESS"){
						window.opener.reloadOtherGrid();
						window.close();
					}else{
						alert("添加债券失败!");
					}
				});
			}
			
			//实体内资产,委贷抵债物
			function addStlZc(stid,optionType,
				landList,houseList,machineList,trafficList,otherassetList
			){
				alert(optionType);
				var url = "";
				if("STLZC" == optionType){
					url = "<%=basePath %>cjtz/cjtzBodyAction_addOtherStlzc.do";
				}else if("WDDZW" == optionType){
					url = "<%=basePath %>cjtz/cjtzBodyAction_addOtherWddzw.do";
				}
				$.post(url,{
					'stid'				: '' + stid,	//实体id或委贷id
					'landList'			: '' + landList,
					'houseList'			: '' + houseList,
					'machineList'		: '' + machineList,
					'trafficList'		: '' + trafficList,
					'otherassetList'	: '' + otherassetList,
					'cldId'				: '<%=cldId %>'
				},function(returnStr){
					if(returnStr == "SUCCESS"){
						window.opener.reloadOtherGrid();
						window.close();
					}else{
						if("STLZC" == optionType)
							alert("添加实体内资产失败!");
						else if("WDDZW" == optionType)
							alert("添加委贷抵债物失败!");
					}
				});
			}
			
			//添加实体
			function addSt(stIds){
				$.post('<%=basePath %>cjtz/cjtzBodyAction_addOtherSti.do',{
					'stIds'	: '' + stIds,
					'cldId'		: '<%=cldId %>'
				},function(returnStr){
					if(returnStr == "SUCCESS"){
						window.opener.reloadOtherGrid();
						window.close();
					}else{
						alert("添加债券失败!");
					}
				});
			}
		</script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<div class="panel-header" style="width: 100%;">
			<table width="100%" border="0" align="center" cellspacing="0" class="newTable">
				<tr>
					<td class="td_zxy01">资产类型:</td>
					<td class="td_zxy03">
						<s:select list="#{'A1':'经营性固定资产','A2':'待处置资产','A3':'自用资产','B':'实体','C':'实体内资产','D':'委贷抵债物','E':'债券'}"
							name="level1Select" id="level1Select" onchange="changeLevel_1()"
						></s:select>
						<s:select list="#{'':'','B1':'咨询类实体','B2':'非咨询处置类实体','B3':'非咨询持续经营类实体'}"
							name="level2Select" id="level2Select" onchange="changeLevel_2()" disabled="true"
						></s:select>
					</td>
				</tr>
			</table>
		</div>
		<div scrolling="no" class="layout-body panel-body" style="height: 563px;">
			<iframe id="childQuery" width=100% style="height: 100%; border: none;"
			 src="<%=basePath %>jygdzc/AssetQuery_initForZccz.do?fenlei=1&option=CJTZ">
			</iframe>
		</div>
	</body>
</html>