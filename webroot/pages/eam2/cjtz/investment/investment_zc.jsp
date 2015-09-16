<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String headId = request.getAttribute("czstcztz.id").toString();
	status = com.tansun.eam2.common.util.WordStatus.getWordStatus(headId, "bank_Template");
%>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>承继投资审批</title>
		<script type="text/javascript">
		var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";
			$(function(){
				jQuery("#gdzc_list").setGridWidth($("#cjst").width());
				jQuery("#gdzc1_list").setGridWidth($("#cjst").width());
				jQuery("#cjst_list").setGridWidth($("#cjst").width());
				jQuery("#qita_List").setGridWidth($("#cjst").width());
				$(window).bind('resize', function(){
					jQuery("#gdzc_list").setGridWidth($("#cjst").width());
					jQuery("#gdzc1_list").setGridWidth($("#cjst").width());
					jQuery("#cjst_list").setGridWidth($("#cjst").width());
					jQuery("#qita_List").setGridWidth($("#cjst").width());
				});
				var buttonsStringmm = '[\
					{"buttonHandler":"stView","buttonIcon":"icon-search","buttonText":"查看实体信息"}\
				]';
				addButtons(jQuery("#stInfoButton"),buttonsStringmm);
				check1();
			});
			function stView(){
				var stlx = $("#stlx").val();
				var stid = $("#stid").val();
				if(stid == "" || stid == null || stid == undefined){
					alert("请先选择实体");
					return false;
				}
				if(stlx == "1"){
					window.open('<%=basePath %>stgl/weihu_newNonEntity.do?stid=' + stid  + '&look=1','',winOpenStr);
				}
				if(stlx == "0" || stlx == "3"){
					window.open('<%=basePath %>stgl/weihu_newEntity.do?stid=' + stid  + '&look=1','',winOpenStr);
				}
			}
			
			function qicaoClbg(readonly){
	       		wordTemplate('bank_Template', document.getElementById("myForm"),false,true, "投资方案"); 
	       		window.parent.setHtml("#shitibjczbg .l-btn-text","编辑投资方案");
				window.parent.setClass("#shitibjczbg .l-btn-text","l-btn-text icon-dealFile");
	       		//return false;
			}
			
			function showAddAsset3(){
				//var url = "<%=basePath %>jygdzc/AssetQuery_init.do?returnValue=true&sheettype=query";
				var url = "<%=basePath %>pages/eam2/cjtz/investment/queryForOther.jsp?cldId=${czstcztz.id}";
				window.open(url,'',winOpenStr);
				return false;
			}
			function showAddAsset2(){
				var url = "<%=basePath %>cjtz/CzZcXxAction_showAddAsset.do?headId=${czstcztz.id}&type=zulin";
				window.open(url);
				return false;
			}
			//=====================GDZC方法====================================
			function showAddAsset(){
				var url = "<%=basePath %>cjtz/CzZcXxAction_showAddAsset.do?headId=${czstcztz.id}&type=quequan";
				//var url = "<%=basePath %>jygdzc/AssetQuery_init.do?returnValue=true&sheettype=query";
				window.open(url);
				return false;
			}
 			function check1(){
 				var y=document.getElementById("tzywlx").value;
				if(y==2 || y==1 ){
					gdzc.style.display = "block";
					gdzc1.style.display = "none";
					qita.style.display = "none";
					cjst.style.display = "none";
				}else if(y ==10){
					gdzc.style.display = "none";
					gdzc1.style.display = "block";
					qita.style.display = "none";
					cjst.style.display = "none";
				}else{
					gdzc.style.display = "none";
					if(y==9 || y==11 ){
						gdzc.style.display = "none";
						qita.style.display = "block";
						gdzc1.style.display = "none";
						cjst.style.display = "none";
					}else{
						gdzc.style.display = "none";
						qita.style.display = "none";
						cjst.style.display = "block";
						gdzc1.style.display = "none";
						if(y==3 || y==4|| y==5|| y==6|| y==7|| y==8){
							document.getElementById("touzi").style.display="block"
		    			document.getElementById("chezi").style.display="none"
						}else if(y==12){
							document.getElementById("touzi").style.display="none";	
							document.getElementById("chezi").style.display="block";	
						}
					}
				}
 			}
		</script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<s:form action="" id="myForm">
	<!-- =================================正文需要============================= -->
		<r:userhidden id="userid" />
		<r:depthidden view="N" name="deptnameshow" />
		<r:depthidden view="N" name="deptid"  />
	<!-- =========================================================================== -->
		<s:hidden name="chooseData" id="chooseData"/>
		<s:hidden name="czstcztz.stid" id="stid"/>
		<s:hidden id="headId" name="czstcztz.id" />
		<s:hidden name="czstcztz.lcId" />
		<!-- 意见域、 依据和文件上传需要表单id -->
		<s:set name="biaodanid" value="czstcztz.id" />
		<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
		<s:hidden name="czstcztz.fafl" value="1" id="fafl"/>
		<s:hidden id="lcmc" name="czstcztz.lcmc" value="承继投资"/>
		<!-- 意见域、 依据和文件上传需要表单id -->
		<s:hidden id="tzywlx" name="czstcztz.tzywlx"/>
		<s:hidden id="CFalb" name="czstcztz.CFalb"/>
		
		<div id="cjst" style="display:none;width: 100%;">
			<div class="panel-header" style="width: 100%;">
				<div class="panel-title">实体信息</div>
				<div class="panel-tool" id="stInfoButton"></div>
			</div>
			<table width="100%" class="newtable" border="0" align="center" cellpadding="0" cellspacing="0">
			    <tr id="touzi" style="display:block">
					<td class="td_zxy01" >投资方式：</td>
					<td class="td_form02">
					  	<r:textfield cssClass="input" name="czstcztz.tzfs" id="czstcztz.tzfs" label="" />
					</td>
					<td class="td_zxy01">投资金额（元）：</td>
					<td class="td_form02">
						<r:textfield cssClass="input" name="czstcztz.tzje" id="czstcztz.tzje" label="" onblur="checkFloat(this);"/>
					</td>
				</tr>	
				<tr id="chezi" style="display:none">
					<td class="td_zxy01">撤资方式：</td>
					<td class="td_form02">
						<r:textfield cssClass="input" name="czstcztz.czfs" id="czstcztz.czfs" label=""/>
					</td>
					<td class="td_zxy01">撤资金额（元）：</td>
					<td class="td_form02">
						<r:textfield cssClass="input" name="czstcztz.czje" id="czstcztz.czje" label="" onblur="checkFloat(this);"/>
					</td>
				  </tr>
			 		<tr>
						<td class="td_zxy01">资产编号：</td>
						<td class="td_form02">
							<s:hidden id="czstcztz.stlx" id="stlx" />
							<r:textfield cssClass="input" name="czstcztz.zcbh" id="zcbh" readonly="true"/>
						</td>
						<td class="td_zxy01">实体名称：</td>
						<td class="td_form02">
							<r:textfield cssClass="input" name="czstcztz.stmc" id="stmc" readonly="true"/>
						</td>
		    		</tr>
		    		<tr>
						<td class="td_zxy01">股权构成：</td>
						<td class="td_form02">
		     				<s:hidden name="czstcztz.gqgc" id="gqgc" />
		     			<e:pc id="viewGqgcButton">
		     				<input name="gqqk" type="button" onclick="viewGqgc();"  value="查看" />
		     			</e:pc>
		     			</td>
		     			<td class="td_zxy01">资质情况：</td>
		     				<s:hidden cssClass="input" name="czstcztz.zzqk" id="zzqk" />
		     			<td class="td_form02">
		     			<e:pc id="viewZzqkButton">
		     				<input name="zzqk" type="button" onclick="viewZzqk();"  value="查看" />
		     			</e:pc>
		     			</td>
					</tr>
					<tr>
						<td class="td_zxy01">地区：</td>
						<td class="td_form02">
							<s:hidden name="czstcztz.stscsf" id="stscsf"/>
							<r:textfield cssClass="input" name="sfName" id="sfName" readonly="true"/></td>
						<td class="td_zxy01">办公地址：</td>
						<td class="td_form02">
							<r:textfield cssClass="input" name="czstcztz.bgdz" id="bgdz" readonly="true"/>
						</td>
		    		</tr>
				 	<tr>
						<td  class="td_zxy01">人数：</td>
						<td class="td_form02">
							<r:textfield cssClass="input" name="czstcztz.strs" id="strs" readonly="true"/>
						</td>
						<td   class="td_zxy01">账面投资（元）：</td>
						<td class="td_form02">
							<r:textfield cssClass="input" name="czstcztz.zmtz" id="zmtz" readonly="true"/>
						</td>
		    		</tr>
					<tr>
						<td class="td_zxy01">委托管理机构：</td>
						<td class="td_form02">
							<r:textfield cssClass="input" name="czstcztz.CWtgljg" id="CWtgljg"  readonly="true"/>
						</td>
						<td  class="td_zxy01">&nbsp;</td>
						<td class="td_form02">&nbsp;</td>
					</tr>
					<tr>
						<td class="td_zxy01">出资与工商年审情况：</td>
						<td colspan="3" class="td_form02">
							<r:textfield cssClass="input2" name="czstcztz.czygsnsqk" id="czygsnsqk" readonly="true" />
						</td>
					</tr>
					<tr>
						<td class="td_zxy01">主营业务：</td>
						<td colspan="3" class="td_form02">
							<r:textfield cssClass="input2" name="czstcztz.zyyw" id="zyyw"  readonly="true" />
						</td>
					</tr>
					<tr>
						<td class="td_zxy01">最近一期经审计报告：</td>
						<td class="td_form02" colspan="3">
							<e:filebutton fjlx="single" biaodanId="%{#request.biaodanid}" isview="N" />
							<script type="text/javascript">
								$("#deletefilebutton").remove();
							</script>
						</td>
					</tr>
					<tr>
						<td colspan="6" height="22" class="td_zxy01">
							<div align="left">最近一个月未经审计的报表的主要数据</div>
						</td>
					</tr>	
				   <tr>
						<td class="td_zxy01">总资产(元)：</td>
					    <td class="td_form02">
					    	<r:textfield  cssClass="input" name="czstcztz.zzc" id="zzc" maxlength="16" onblur="checkFloat(this);"/>
					    </td>
					    <td class="td_zxy01" >负债（元）：</td>
					    <td class="td_form02">
					    	<r:textfield  cssClass="input" name="czstcztz.fuzhai" id="fuzhai" maxlength="16" onblur="checkFloat(this);"/>
					    </td>
	   				</tr>
					<tr>
						<td class="td_zxy01">股本（元）：</td>
					    <td class="td_form02">
					    	<r:textfield  cssClass="input" name="czstcztz.guben"  id="guben" onblur="checkFloat(this);"/>
					    </td>
					    <td class="td_zxy01" >净资产（元）：</td>
					    <td class="td_form02">
					   		<r:textfield  cssClass="input" name="czstcztz.jzc" id="jzc" maxlength="16" onblur="checkFloat(this);"/>
					   	</td>
	   				</tr>
		 			<tr>
		  				<td class="td_zxy01">收入（元）：</td>
					    <td class="td_form02">
					    	<r:textfield  cssClass="input" name="czstcztz.shouru" maxlength="16" id="shouru" onblur="checkFloat(this);"/>
					    </td>
					    <td class="td_zxy01" >净利润（元）：</td>
					    <td class="td_form02">
					    	<r:textfield  cssClass="input" name="czstcztz.jlr" maxlength="16" id="jlr" onblur="checkFloat(this);"/>
					    </td>
	  				</tr>
	  			</table>
		  	</div>
		<table width="100%" class="newtable" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td align="right">
					<div id="gdzc" style="display:block">
						<table id="gdzc_list"></table>
					</div>
					<div id="gdzc1" style="display:none">
						<table id="gdzc1_list"></table>
					</div>
					<div id="qita" style="display:none">
						<table id="qita_List"></table>
					</div>
				</td>
			</tr>
		</table>
	</s:form>
</body>
<div id="dialogZzqk" icon="icon-save" style="padding:5px;width:400px;height:200px;">
</div>
<div id="dialogGqgc" icon="icon-save" style="padding:5px;width:400px;height:200px;">
</div>
</html>
<script type="text/javascript">
	jQuery("#gdzc_list").jqGrid({
		url:"<%=basePath %>cjtz/czCztzfaXxAction_getGdzcList.do?headId=${czstcztz.id}",
		datatype: "json",
		colNames: ['id','资产编号', '资产名称', '主卡片编号', '主卡片名称','原值(元)','已使用年限','尚可使用年限','申请总金额(元)','审定总金额(元)'],
		colModel:[
			{name:'id',index:'id',hidden:true},	
			{name:'azcbh',index:'name'},
			{name:'azcmc',index:'htqsrq'},
			{name:'azkpbh',index:'htzzrq'},
			{name:'azkpmc',index:'htje'},
			{name:'azmyz',index:'grzye'},
			{name:'aysynx',index:'bj'},	
			{name:'asksynx',index:'lx'},
			{name:'asqje',index:'bj'},	
			{name:'asdje',index:'lx'}
		],
		rownumbers:true,
		autowidth:true,
		height:'auto',
		multiselect: true,
		rowNum:0,
		caption: '资产信息',
		loadComplete:function(data){
			if(data && data.rows.length>0){
				jQuery("#gdzc_list").setGridHeight(data.rows.length * 22 + 18);
			}else{
				jQuery("#gdzc_list").setGridHeight(0);
			}
		},
		shrinkToFit:false,
		jsonReader : {
			records: "records",
			repeatitems: false,
			id: "0"
		}
	});
	
	jQuery("#gdzc1_list").jqGrid({
		url:"<%=basePath %>cjtz/czCztzfaXxAction_getGdzcList.do?headId=${czstcztz.id}",
		datatype: "json",
		mtype:"POST",  
	    colNames: ['id','azcid','资产编号', '资产名称','资产类型', '预估租赁起始日期', '预估租赁到期日期','资产承租（承办）人','意向租期','意向租金总额'],
	    colModel: [
	    	{name:'id',index:'id',editable:true,hidden:true},
	    	{name:'azcid',index:'azcid',editable:true,hidden:true},
			{name:'azcbh',index:'azcbh',editable:true},
	  		{name:'azcmc',index:'azcmc',editable:true},
	  		{name:'zclb',index:'zclb',editable:true},
	  		{name:'zlqsrq',index:'zlqsrq',editable:true},
			{name:'zldqrq',index:'zldqrq',editable:true},
	  		{name:'czr',index:'czr',editable:true},
	  		{name:'yxzq',index:'yxzq',editable:true},
	  		{name:'yxzjzje',index:'yxzjzje',editable:true}
	  	],
	  	loadComplete:function(data){
			if(data && data.rows.length>0){
				jQuery("#gdzc1_list").setGridHeight(data.rows.length * 22 + 18);
			}else{
				jQuery("#gdzc1_list").setGridHeight(0);
			}
		},
		shrinkToFit:false,
	  	rownumbers:true,
	  	height: 'auto',
		autowidth: true,
		rowNum:0,
		multiselect: true,
    	ondblClickRow:function(gr){
		},
    	caption: '出租资产列表',
		viewrecords:true,
		jsonReader : {
			root:"rows",
			page: "page",
			total: "total",
			records: "records",
			repeatitems: false,
			id: "0"
		}
	});
			
	jQuery("#qita_List").jqGrid({
		url:"<%=basePath %>cjtz/cjtzBodyAction_showOtherBodyJson.do",
		postData:{
			'cldId' : '<%=headId%>'
		},
		datatype: "json",
		colNames:['id','资产分类','资产ID','资产编号','资产名称','管理部门','地址'],
		colModel:[
			{name:'id',index:'id',hidden:true},
			{name:'zclb',index:'zclb',hidden:true},
			{name:'tzzcid',index:'tzzcid',hidden:true},
			{name:'zcbh',index:'zcbh'},
			{name:'zcmc',index:'zcmc'},
			{name:'zcglbmmc',index:'zcglbmmc'},
			{name:'shengfen',index:'shengfen'}
		],
		loadComplete:function(data){
			if(data && data.rows.length>0){
				jQuery("#qita_List").setGridHeight(data.rows.length * 22 + 18);
			}else{
				jQuery("#qita_List").setGridHeight(0);
			}
		},		
		rownumbers:true,
    	ondblClickRow:function(gr){
    		dbClickOtherList(gr);
		},		
		autowidth:true,
		rowNum:0,
		height:'auto',
		multiselect: true,
		caption: '资产信息',
		jsonReader : {
			records: "records",
			repeatitems: false,
			id: "0"
		}
	});
	
	function dbClickOtherList(gr){
		var rowData = $("#qita_List").getRowData(gr);
		var zcid = rowData['tzzcid'];
		if(rowData['zclb']=='0'){//经营性固定资产
			window.open('<%=basePath%>jygdzc/AssetManageBody_viewAsset.do?sheettype=assetXxInfo&zcId='+zcid,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
		}else if(rowData['zclb']=='1'){//实体内资产_____________________(双击事件未加)
			window.open('<%=basePath %>stgl/weihu_newEntity.do?fslx=3&look=1&stid=' + zcid,'',winOpenStr);
		}else if(rowData['zclb']=='2'){//委贷抵债物_____________________(双击事件未加)
			window.open('<%=basePath %>stgl/weihu_newEntity.do?fslx=3&look=1&loansId=' + zcid,'',winOpenStr);
		}else if(rowData['zclb']=='3'){//实体__________________________(双击事件未加)
			$.post("<%=basePath %>cjtz/cjtzBodyAction_getStlxByStid.do",{
				"stid" : "" + zcid
			},function(stlx){
				if(stlx == "1"){
					window.open('<%=basePath %>stgl/weihu_newNonEntity.do?stid=' + zcid  + '&look=1','',winOpenStr);
				}
				if(stlx == "0" || stlx == "3"){
					window.open('<%=basePath %>stgl/weihu_newEntity.do?stid=' + zcid  + '&look=1','',winOpenStr);
				}
			});
		}else if(rowData['zclb']=='4'){//自用资产
			window.open('<%=basePath%>/zyzc/ZCManageBody_viewGoodDetail.do?bodyId=' + zcid+"&sheettype=zcBook_swtz_view",
				'',winOpenStr);
		}else if(rowData['zclb']=='5'){//待处置类资产
			window.open('<%=basePath%>jygdzc/AssetManageBody_viewAsset.do?sheettype=assetXxInfo&zcId='+zcid,'',winOpenStr);
		}else if(rowData['zclb']=='7'){//债券
			window.open('stock/maintain_detailInfo.do?saveSign='+1+'&stockId='+ zcid,'',winOpenStr);
		}
	}
	
	//资质情况
	function viewZzqk(){
		var zzqkViewObj = $("#zzqk").val();
		if(zzqkViewObj != null && zzqkViewObj.length > 1 ){				
			var zzqkarray = zzqkViewObj.split('<#>');
			var i = 0;
			var htmlObj = "<table >";
			htmlObj += '<tr><td width=80>资质名称</td><td width=100>实体资质等级</td><td width=100>发证单位</td><td>资质到期日期</td></tr>';
			for(i = 0; i< zzqkarray.length; i++){
				var row = zzqkarray[i].split("#%#");
				htmlObj += '<tr>';
				htmlObj += "<td>" + row[0] + "</td>";
				htmlObj += "<td>" + row[1] + "</td>";
				htmlObj += "<td>" + row[2] + "</td>";
				htmlObj += "<td>" + row[3] + "</td>";
				htmlObj += '</tr>';
			}
			htmlObj += '</table>'
			$('#dialogZzqk').html(htmlObj);
			$('#dialogZzqk').dialog('open');
		}else{
			alert("没有资质情况信息！");
		}
	}
	
	//股权情况
	function viewGqgc(){
		var gqgcViewObj = $("#gqgc").val();
		if(gqgcViewObj != null && gqgcViewObj.length > 1 ){				
			var gqgcarray = gqgcViewObj.split('<#>');
			var i = 0;
			var htmlObj = "<table >";
			htmlObj += '<tr><td width=80>股东名称</td><td width=100>股东性质</td><td width=100>持股比例（%）</td><td>报告日期</td><td>持股数量</td><td>本部是否控股</td></tr>';
			for(i = 0; i< gqgcarray.length; i++){
				var row = gqgcarray[i].split("#%#");
				htmlObj += '<tr>';
				htmlObj += "<td>" + row[0] + "</td>";
				htmlObj += "<td>" + row[1] + "</td>";
				htmlObj += "<td>" + row[2] + "</td>";
				htmlObj += "<td>" + row[3] + "</td>";
				htmlObj += "<td>" + row[4] + "</td>";
				htmlObj += "<td>" + row[5] + "</td>";
				htmlObj += '</tr>';
			}
			htmlObj += '</table>'
			$('#dialogZzqk').html(htmlObj);
			$('#dialogZzqk').dialog('open');
		}else{
			alert("没有股权构成信息！");
		}
	}
	
	//日期转换和资质情况
	$(function(){
		$('#dialogZzqk').dialog({title:'资质情况'});
		$('#dialogZzqk').dialog('close');
		$('#dialogGqgc').dialog({title:'股权构成'});
		$('#dialogGqgc').dialog('close');
	});
</script>

