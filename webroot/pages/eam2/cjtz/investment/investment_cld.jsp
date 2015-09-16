<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String headId = request.getAttribute("czstcztz.id").toString();
	status = com.tansun.eam2.common.util.WordStatus.getWordStatus(headId, "bank_Template");
	boolean isInCounterSign = false;
%>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>承继投资审批</title>
		<script type="text/javascript">
		var isQiChaoCzbg = false;
		var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";
			$(function(){
				jQuery("#blyj_reason_list").setGridWidth($("#widthRule").width());
				jQuery("#file_list").setGridWidth($("#widthRule").width());
				jQuery("#file_huiqian_endlist").setGridWidth($("#widthRule").width());
				jQuery("#file_huiqianlist").setGridWidth($("#widthRule").width());				
				$(window).bind('resize', function(){
					jQuery("#blyj_reason_list").setGridWidth($("#widthRule").width());
					jQuery("#file_list").setGridWidth($("#widthRule").width());
					jQuery("#file_huiqian_endlist").setGridWidth($("#widthRule").width());
					jQuery("#file_huiqianlist").setGridWidth($("#widthRule").width());
				});
			var buttonStr_stztcz = '[{"buttonHandler":"qicaoClbg()","buttonIcon":"icon-viewFile","buttonText":"查看投资方案"}]';
			addButtons($("#cldInfoButton"),buttonStr_stztcz);
			check1();
			$("input").attr("disabled",true);
			$("select").attr("disabled",true);
			$("textarea").attr("disabled",true);
		});
		
		function check1(){
			var y=document.getElementById("tzywlx").value;
			if(y==10){
			 	fangan.style.display="inline-block";
			}else{
			 	fangan.style.display="none";
			}
			if(y==2 || y==1 ){
				sqsdje.style.display = "block";
			}else if(y ==10){
				sqsdje.style.display = "none";
			}else{
				sqsdje.style.display = "none";
			}
		}
		
		function qicaoClbg(){
			wordTemplate('bank_Template', document.getElementById("myForm"),true,false,"投资方案");
		}
		</script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<div class="panel-header" style="width: 100%;">
			<div class="panel-title">处理单信息</div>
			<div class="panel-tool" id="cldInfoButton"></div>
		</div>
	<%@ include file="/inc/word.inc"%>
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
		<br>
		<br>
		<div align="center">
			<span class="STYLE1">中国建银投资有限责任公司承继业务投资审批处理单</span>
		</div>
		<br>
		<hr color="#6600CC" align="center" width="100%">
		<table id="widthRule" width="100%" class="newtable" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td class="td_zxy01">项目名称：</td>
				<td class="td_zxy02" colspan="3">
					<r:textfield id="czxmmc" name="czstcztz.czxmmc" cssClass="input2" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">编号：</td>
				<td class="td_zxy02">
					<r:textfield cssClass="input" id="bianhao" name="czstcztz.bianhao" readonly="true"/>
				</td>
				<td class="td_zxy01">急缓程度：</td>
				<td class="td_zxy02">
					<r:select id="jhcd" name="czstcztz.jhcd" cssClass="input" list="#{'0':'一般','1':'急','2':'特急'}" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">拟稿日期：</td>
				<td class="td_zxy02">
					<s:date name="czstcztz.ngrq" format="yyyy-MM-dd" var="draftDate"/>
					<r:textfield cssClass="input" id="ngrq" name="czstcztz.ngrq" value="%{#draftDate}" readonly="true"/>
				</td>
				<td class="td_zxy01">拟稿部门：</td>
				<td class="td_zxy02">
					<s:hidden id="ngbm" name="czstcztz.ngbm" />
					<r:textfield cssClass="input" id="ngbmmc" name="czstcztz.ngbmmc" readonly="true"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">拟稿人：</td>
				<td class="td_zxy02">
					<s:hidden id="ngr" name="czstcztz.ngr"/>
					<r:textfield cssClass="input" id="ngrxm" name="czstcztz.ngrxm" readonly="true"/>
				</td>
				<td class="td_zxy01">联系电话：</td>
				<td class="td_zxy02">
					<r:textfield cssClass="input" id="lxdh" name="czstcztz.lxdh"/>
				</td>
			</tr>
			<tr>
			<td class="td_zxy01">会签部门：</td>
		  	<td class="td_form02" colspan="3" >
		  		<r:textfield name="czstcztz.hqbm" id="hqbmvalue" readonly="true" cssClass="input2"/>
		   	 	<s:hidden name="czstcztz.hqbmid" id="hqbmids"/>
			</td>
		 </tr>
			<tr>
				<td class="td_zxy01">业务类型：</td>
				<td class="td_zxy02">
					<e:select cssClass="input" list="#{}" parRefKey="INVESTMENT_TYPE" id="tzywlx" name="czstcztz.tzywlx"/>
					<span id="fangan" style="display: none">方案类别： 
						<e:select list="#{}" id="CFalb" name="czstcztz.CFalb" headerKey="" headerValue="" parRefKey="RENT_SCHEMA_TYPE" />
					</span>
				</td>
				<td class="td_zxy01">投资申报方式：</td>
				<td class="td_zxy03">
					<r:select cssClass="input" id="czsbfs" name="czstcztz.czsbfs" list="#{'0':'首次','1':'重报','2':'变更'}" />
				</td>
			</tr>
			<tr id="sqsdje" style="display:block">
				<td class="td_zxy01" width="120">申请费用总金额(元)：</td>
				<td class="td_zxy02" >
					<r:textfield cssClass="input" name="czstcztz.sqfyzje" readonly="true" id="sqfyzje" />
				</td>
				<td class="td_zxy01" width="120">审批费用总金额(元)：</td>
				<td class="td_zxy02">
					<r:textfield cssClass="input" name="czstcztz.spfyzje" readonly="true" id="sdfyzje"/>
				</td>
			 </tr>
			<tr>
	    		<td class="td_zxy01">申报日期：</td>
	    		<td class="td_zxy02">
	    			<s:date name="czstcztz.sbrq" var="sbrpFormat" format="yyyy-MM-dd"/>
	    			<r:textfield name="czstcztz.sbrq" cssClass="input" id="sbrq" value="%{#sbrpFormat}" readonly="true"/>
	    		</td>
	    		<td class="td_zxy01">受理序号：</td>
	    		<td class="td_zxy02">
	    			<r:textfield id="slxh" name="czstcztz.slxh" cssClass="input" readonly="true"/>
	    		</td>
	    	</tr>		  			
 		</table>
		<%@ include file="/inc/according.inc"%> 
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<e:opinion id="test" width="100%">
				<e:opinionPart id="LEADER" viewArea="false" biaodanid="%{#request.biaodanid}" name="LEADER" value="" text="批示意见："></e:opinionPart>
				<e:opinionPart id="OPERATION_GROUP" viewArea="false" biaodanid="%{#request.biaodanid}" name="OPERATION_GROUP" value="" text="业务运营组意见："></e:opinionPart>
				<e:opinionPart id="MEETING_DEPT" viewArea="false" biaodanid="%{#request.biaodanid}"  name="MEETING_DEPT" value="" text="会签部门意见："></e:opinionPart>
				<e:opinionPart id="DRAFT_DEPT" viewArea="false" biaodanid="%{#request.biaodanid}" name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
			</e:opinion>
		</table>
		<table width="100%" class="newtable" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr> 
	        <td class="td_zxy01">备注：</td>
				<td class="td_zxy03" colspan="5">
					<r:textarea name="czstcztz.beizhu" id="beizhu" cssClass="input" style="width:94%;" rows="4"/>
				</td>
	 		</tr> 
		</table>
		<%@ include file="/inc/file.inc"%>		
		<%@ include file="/inc/file_huiqian_end.inc"%>
		<%@ include file="/inc/listMessage.inc"%>
	</s:form>
	<div style="display: none;">
		<div id="mm2" style="width: 150px;">
			<div onClick="selectCom('0');return false;" >咨询类实体</div>
			<div onClick="selectCom('1');return false;" >非咨询处置类实体</div>
			<div onClick="selectCom('3');return false;" >非咨询持续经营类实体</div>
		</div>
	</div>
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
		},
		gridComplete:function(){
			compute1();
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
	  	rowNum:0,
	  	rownumbers:true,
	  	height: 'auto',
		autowidth: true,
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
	
	function compute1(){
		var sqvalues=0;
		$("td[aria-describedby='gdzc_list_asqje']").each(function(i,obj){
			var r=$(obj).text();
			sqvalues=sqvalues+parseFloat(r);
		}); 
		document.getElementById("sqfyzje").value=sqvalues;
		var sdvalues=0;
		$("td[aria-describedby='gdzc_list_asdje']").each(function(i,obj){
		    var r=$(obj).text();
		    sdvalues=sdvalues+parseFloat(r);
		}); 
		document.getElementById("sdfyzje").value=sdvalues;
	}
	
	//选择实体	
	function selectEntity(){
		window.open('<%=basePath %>stgl/weihu_listEntities.do?' 
		 + 'option=stgl&multiselect=true&' 
		 + 'entityStid=' + $("#stid").val() 
		 + '&zixunType=' + "0");
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
	//选择实体
	
	function selectEntity(){
		var zixunType ='0';
		window.open('<%=basePath %>stgl/weihu_listEntities.do?' 
		 + 'option=stgl&multiselect=true&' 
		 + 'entityStid=' + $("#stid").val() 
		 + '&zixunType=' + zixunType);
	}
	
	//回调函数
	function setComMessage(stId){
		$.post("<%=basePath%>zccz/personDealHead_setStJbxxToHead.do",{
			"head.stid" : "" + stId,
			"oldStid" : "" + $("#stid").val(),
			"head.id" : "" + $("#id").val(),
			"head.fafl" : "1"
		},function(returnStr){
			var returnObj = eval('(' + returnStr + ')');
			$("#strs").val(returnObj.strs);
			$("#zcbh").val(returnObj.zcbh);
			$("#stmc").val(returnObj.stmc);
			$("#stid").val(returnObj.stid);
			$("#bgdz").val(returnObj.bgdz);
			$("#zmtz").val(returnObj.zmtz);
			$("#CWtgljg").val(returnObj.CWtgljg);
			$("#stscsf").val(returnObj.stscsf);
			$("#sfName").val(returnObj.sfName);
			$("#czygsnsqk").val(returnObj.czygsnsqk);
			$("#zyyw").val(returnObj.zyyw);
			$("#zzqk").val(returnObj.zzqk);
			$("#gqgc").val(returnObj.gqgc);
			$("#stlx").val(returnObj.stlx);
		});
	}
	//日期转换和资质情况
	$(function(){
		$('#dialogZzqk').dialog({title:'资质情况'});
		$('#dialogZzqk').dialog('close');
		$('#dialogGqgc').dialog({title:'股权构成'});
		$('#dialogGqgc').dialog('close');
	});
	function reloadGrid(){
		$("#qita_List").trigger("reloadGrid");
		$("#gdzc_list").trigger("reloadGrid");
		$("#gdzc1_list").trigger("reloadGrid");
	}
	
	function reloadOtherGrid(){
		$("#qita_List").trigger("reloadGrid");
	}
</script>

