<%@ page language="java" contentType="text/html;charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ include file="/inc/taglibs.inc" %>
<%@ include file="/inc/ProjectJQuery.inc" %>
<%@ include file="/inc/word.inc"%>
<%@page import="com.tansun.eam2.common.model.orm.bo.CzCztzfaXx"%>
<%
	CzCztzfaXx disposeHead = (CzCztzfaXx)request.getAttribute("disposeHead");
%>
<html>
	<head>
    	<base href="<%=basePath %>" />
		<title>资产处置方案审批</title>
		<script type="text/javascript" language="JavaScript">
			var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";
			$(function(){
				//设置资产grid宽度
				jQuery("#file_list").setGridWidth($("#form").width());
				jQuery("#blyj_reason_list").setGridWidth($("#form").width());
				jQuery("#file_hgsc_endlist").setGridWidth($("#form").width());
				$(window).bind('resize', function(){
					jQuery("#file_list").setGridWidth($("#form").width());
					jQuery("#file_hgsc_endlist").setGridWidth($("#form").width());
					jQuery("#blyj_reason_list").setGridWidth($("#form").width());
					jQuery("#jygdzcList").setGridWidth($("#form").width());
					jQuery("#dczzcList").setGridWidth($("#form").width());
					jQuery("#stzcList").setGridWidth($("#form").width());
					jQuery("#entity_asset_list").setGridWidth($("#form").width());
					jQuery("#loan_pledge_asset_list").setGridWidth($("#form").width());
					jQuery("#zyzc_asset_list").setGridWidth($("#form").width());
					jQuery("#zqList").setGridWidth($("#form").width());
					
				});
				//查看正文按钮
				var buttonStr_zhengwen = '[{"buttonHandler":"viewzhengwen","buttonIcon":"icon-viewFile","buttonText":"查看处置报告"}]';
				addButtons($("#stInfoButton"),buttonStr_zhengwen);
				
				<%
					if(disposeHead != null && StringUtils.isNotEmpty(disposeHead.getScczfaxxid())){
				%>
					var expensesStr = '[{"buttonHandler":"viewHistoryYj(&quot;<%=disposeHead.getScczfaxxid() %>&quot;)","buttonIcon":"icon-search","buttonText":"合规性审查"}]';
					appendButtons($("#stInfoButton"),expensesStr);
				<%}%>
				
				$(":checkbox").attr("disabled","disabled");
				$(":radio").attr("disabled","disabled");
				$(":text").attr("readonly","readonly");
				$("select").attr("disabled","disabled");
			});
			//查看处置报告
			function viewzhengwen(){
				wordTemplate('bank_Template', document.getElementById("myform"),true,false,"资产处置报告"); 
			}
		
			function viewHistoryYj(id){
				window.open("<%=basePath %>zccz/bldAction_openAdvice.do?"
					+ "head.id=" + id
					,"",winOpenStr);
			}
			
			function fillExpensesDetail(){
				window.open('<%=basePath %>zccz/personDealHead_feiyongDetail.do?headId=<%=disposeHead.getId()%>&authority=r','',winOpenStr);
			}
			
			function lookdblclickAss(gr){
				var fsxxId = jQuery("#entity_asset_list").getCell(gr,"bstid");
				var zixunType = document.getElementById("zixunType").value;
				if("0" == zixunType || "3" == zixunType){
					window.open('<%=basePath %>stgl/weihu_newEntity.do?stid='+fsxxId+'&stlx='+0+'&rework='+1+'&look='+1);
				}else if("1" == zixunType){
					window.open('<%=basePath %>stgl/weihu_newNonEntity.do?rework='+1+'&stid='+fsxxId+'&stlx='+1+'&look='+1);
				}
			}
			//双击查看资产
			function lookAsset(gr){
				//window.open('<%=basePath%>jygdzc/AssetManageBody_viewAsset.do?sheettype=assetXxInfo&zcId='+gr,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				window.open('<%=basePath%>jygdzc/AssetManageBody_viewAsset.do?sheettype=assetXxInfo&zcId='+gr);
			}
     	</script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
	<s:form id="myform">
		<s:set name="biaodanid" value="%{#request.disposeHead.id}" />	 
		<s:hidden name="biaodanid" value="%{#request.disposeHead.id}" />
		<r:depthidden name="deptid" id="deptid"/>
		<r:userhidden id="userid" name="userid"/>
		<div class="panel-header" style="width: 100%; z-index: 9;position: fixed;" id="stInfoButton">
		</div>
		<table width="100%" class="newtable" border="0" cellspacing="0" cellpadding="0" id="form">
			<tr>
				<td class="td_zxy01">
					<font color="#FF0000"><strong>*</strong></font>处置项目名称：</td>
				<td class="td_zxy02" colspan="3">
					<r:textfield name="disposeHead.cztzxmmc" id="cztzxmmc" cssClass="input2"/></td>						
			</tr>
			<tr>
			  <td class="td_zxy01" align="center">编号：</td>
			  <td class="td_zxy02"><r:textfield name="disposeHead.bianhao" id="bianhao" cssClass="input" readonly="true"/>
			  </td>
			  <td class="td_zxy01"> 急缓程度：</td>
			  <td class="td_zxy02"><r:select list="{'一般','急','特急'}" name="disposeHead.jhcd" id="jhcd"/></td>
		  	</tr>
			<tr>
				<td  class="td_zxy01" align="center">拟稿日期：</td>
				<td class="td_zxy02">
					<s:date name="disposeHead.ngrq" format="yyyy-MM-dd" var="ngrq"/>
					<r:textfield id="ngrq" name="disposeHead.ngrq" value="%{#ngrq}" cssClass="input" readonly="true"/></td>
				<td  align="center" class="td_zxy01">拟稿部门：</td>
				<td  class="td_zxy02">
					<s:hidden name="disposeHead.ngbm" />
					<r:textfield name="disposeHead.ngbmmc" id="ngbmmc" cssClass="input" readonly="true"/></td>
			</tr>
			<tr>
				<td  class="td_zxy01">拟稿人：</td>
				<td class="td_zxy02">
					<s:hidden name="disposeHead.ngr"/>
					<r:textfield name="disposeHead.ngrxm" id="ngrxm" readonly="true" cssClass="input"/>
				</td>
				<td class="td_zxy01">
					<font color="#FF0000"><strong>*</strong></font>联系电话：</td>
				<td class="td_zxy02">
					<r:textfield name="disposeHead.lxdh" id="lxdh" cssClass="input"/></td>
			</tr>
			<tr>
				<td class="td_zxy01">
					<font color="#FF0000"><strong>*</strong></font>资产所在位置：</td>
				<td colspan="3"  class="td_zxy02">
					<r:textfield name="disposeHead.zcszwz" id="zcszwz" cssClass="input2"/></td>
			</tr>
			<tr>
				<td class="td_zxy01" >
					<font color="#FF0000"><strong>*</strong></font>处置资产类别：
				</td>
			    <td class="td_zxy02" colspan="3">
			    	<s:checkboxlist name="disposeHead.zclb" value="%{#request.zclbList}" id="zclb" list="#{0:'经营性固产',1:'实体内资产',2:'委贷抵债物',4:'自用资产','5':'待处置资产','6':'受托资产','7':'债券'}" onclick="changeAssetList(this)"/>
			    </td>
			</tr>
			<tr>
				<td class="td_zxy01" >评估机构名称：</td>
			    <td class="td_zxy02" colspan="3"><r:textfield name="disposeHead.pgjgmc" id="pgjgmc" cssClass="input2"/></td>  
			</tr>
			<tr>
				<td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>建议处置回收金额（元）：</td>
			    <td class="td_form02"><r:textfield name="disposeHead.yjczhsjewy" id="yjczhsje"  size="35" cssClass="input" readonly="true"/></td>
				<td class="td_zxy01" height="24"><font color="#FF0000"><strong>*</strong></font>预计处置费用（元）：</td>
			    <td class="td_zxy02">
			    	<r:textfield name="disposeHead.yjczfy" readonly="true" />
				    <input type="button" id="expensesDetail" style="width:25%" value="费用明细" onclick="fillExpensesDetail()" />
			    </td> 
			</tr>	
			<tr>
				<td class="td_zxy01" ><font color="#FF0000"><strong>*</strong></font>预计损失金额（元）：</td>
			    <td class="td_zxy02">
			    	<r:textfield name="disposeHead.yjssjewy" size="35" cssClass="input" id="yjssje" readonly="true"/>
			    </td>  	
				<td class="td_zxy01">预计损失率：</td>
			    <td class="td_zxy02">
			    	<r:textfield name="disposeHead.yjssl"  readonly="true" cssClass="input" id="yjssl"/>
			    </td>			    
			</tr>	
			<tr>
				<td class="td_zxy01" >重报次数：</td>
			    <td class="td_zxy02"><r:textfield name="disposeHead.cbcs" cssClass="input" id="cbcs"></r:textfield></td> 
			    <td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>处置申报方式：</td>
	            <td class="td_zxy02"><r:select list="#{'':'--请选择--',0:'首次',1:'变更',2:'重报'}" name="disposeHead.czsbfs" id="czsbfs" value="%{#request.disposeHead.czsbfs}"></r:select></td>
			</tr>	
			<tr>
				<td class="td_zxy01" >是否经过评估审查：</td>
			    <td class="td_zxy02">
			    <s:radio name="disposeHead.sfjpgsc" id="sfjpgsc" list="#{0:'否',1:'是'}" value="%{#request.disposeHead.sfjpgsc}"></s:radio>
			    </td>  
				<td class="td_zxy01">评估报告失效期截止日期：</td>
		        <td class="td_zxy02">
		        	<s:date name="disposeHead.pgbgsxqjzrq" format="yyyy-MM-dd" var="reportDeadline"/>
					<r:textfield name="disposeHead.pgbgsxqjzrq" value="%{#reportDeadline}" id="reportDeadline" cssClass="input"/>
		        </td>
			</tr>
			<tr>
			 <td class="td_zxy01" >申报材料清单：</td>
			    <td colspan="3" class="td_zxy02">  
			     <table>
	               <tbody>					  
	                  <tr>   
	                     <td><s:checkbox name="disposeHead.sfysbd"  id="sfysbd"/>资产处置申报单</td>
	                     <td><s:checkbox name="disposeHead.sfyczfa" id="sfyczfa"/>资产处置方案</td>
	                     <td><s:checkbox name="disposeHead.sfysjqk" id="sfysjqk"/>财务审计情况</td>
	                     <td><s:checkbox name="disposeHead.sfypgbg" id="sfypgbg"/>资产评估报告</td>
	                  </tr>   
	            	</tbody>
			     </table>
			    </td>
		    </tr> 
		    <tr> 
			   <td class="td_zxy01">其他申报材料：</td>
			   <td class="td_zxy02" colspan="3"><r:textfield name="disposeHead.qtsbcl" id="qtsbcl" cssClass="input2"/></td>
			</tr>	
			<tr>
				<td class="td_zxy01">申报日期：
				</td>	
				<td class="td_zxy02">
					<r:textfield name="disposeHead.sbrq"  readonly="true" cssClass="input" id="sbrq"/>
				</td>
				<td class="td_zxy01">受理序号：
				</td>	
				<td class="td_zxy02">
					<r:textfield name="disposeHead.slxh" readonly="true" cssClass="input" id="slxh"/>
				</td>
			</tr>
			<!--	经验性固定资产		-->
			<div style="display:<%=disposeHead.getZclb()!=null?(disposeHead.getZclb().contains("0")?"block":"none"):"none" %>" id="jygdzcListDiv"><table id="jygdzcList"></table></div>
			<!--	待处置资产		-->
			<div style="display:<%=disposeHead.getZclb()!=null?(disposeHead.getZclb().contains("5")?"block":"none"):"none" %>" id="dczzcListDiv"><table id="dczzcList"></table></div>
			<!--	受托资产		-->
			<div style="display:<%=disposeHead.getZclb()!=null?(disposeHead.getZclb().contains("6")?"block":"none"):"none" %>" id="stzcListDiv"><table id="stzcList"></table></div>
			<!--	实体内资产		-->
			<div style="display:<%=disposeHead.getZclb()!=null?(disposeHead.getZclb().contains("1")?"block":"none"):"none"%>" id="entity_asset"><table id="entity_asset_list"></table></div>
			<!--	委贷抵债物		-->
			<div style="display:<%=disposeHead.getZclb()!=null?(disposeHead.getZclb().contains("2")?"block":"none"):"none" %>" id="loan_pledge_asset"><table id="loan_pledge_asset_list"></table></div>
			<!--	自用资产			-->
			<div style="display:<%=disposeHead.getZclb()!=null?(disposeHead.getZclb().contains("4")?"block":"none"):"none" %>" id="zyzc_asset"><table id="zyzc_asset_list"></table></div>
			<!--	债券		-->
			<div style="display:<%=disposeHead.getZclb()!=null?(disposeHead.getZclb().contains("7")?"block":"none"):"none" %>" id="zqListDiv"><table id="zqList"></table></div>
			<br>
			<%@ include file="/inc/according.inc"%>  
			<br>
			<e:opinion id="test" width="100%">
				<e:opinionPart id="LEADER" name="LEADER" viewArea="false" biaodanid="%{#request.disposeHead.id}" value="" text="批示意见："></e:opinionPart>
				<e:opinionPart id="OPERATION_GROUP" viewArea="false" biaodanid="%{#request.disposeHead.id}" name="OPERATION_GROUP" value="" text="业务运营组意见："></e:opinionPart>
				<e:opinionPart id="DRAFT_DEPT" viewArea="false" biaodanid="%{#request.disposeHead.id}" name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
				<e:opinionPart id="CHECK" viewArea="false" biaodanid="%{#request.biaodanid}"  name="CHECK" value="" text="合规审查意见："></e:opinionPart>
			</e:opinion>
			<%@ include file="/inc/file.inc"%>
			<%@ include file="/inc/file_heguishencha_end.inc"%>
			<br>
		<%@ include file="/inc/exportExcel.inc"%>
		</table>
		</s:form>
		<script type="text/javascript" language="javascript">
//--------------------------------------------------经营性固定资产------------------------------------------------------
		jQuery("#jygdzcList").jqGrid({
			url:"<%=basePath %>zccz/assetDealBody_vidwBody.do",
			datatype: "json",
			mtype:"POST",
			postData:{
				cldId:"<%=disposeHead.getId() %>",
				cscldid:"<%=disposeHead.getCscldid() %>",
				assetType:"0"
			},
			colNames:['id','zcId','资产名称','主卡片编号','主卡片名称', '账面原值（元）', '账面净值（元）','评估价值（元)','上会次数','处置方式','是否处置完毕'],
			colModel:[
				{name:'id',index:'id',hidden:true},
				{name:'azcid',index:'azcid',hidden:true},
				{name:'azcmc',index:'azcmc',sortable:false},
				{name:'azkpbh',index:'azkpbh',sortable:false},
				{name:'azkpmc',index:'azkpmc',sortable:false},
				{name:'zmyz',index:'zmyz',formatter:'number',sortable:false},
				{name:'azmjz',index:'azmjz',sortable:false},
				{name:'apgjz',index:'apgjz',sortable:false},
				{name:'dqshcs',index:'dqshcs',sortable:false},
				{name:'CCzfs',index:'CCzfs',formatter:"select",editable: false,edittype:"select",editoptions:{
						value:"${czfsJson}"
					},sortable:false
				},
				{name:'sfczwb',index:'sfczwb',sortable:false}
			],
			height:'auto',
			rowNum:0,
			autowidth:true,
			viewrecords:true,
			ondblClickRow:function(gr){
				var id  = jQuery("#jygdzcList").getCell(gr,'azcid');
				lookAsset(id);
			},
			editurl:'<%=basePath %>zccz/assetDealBody_updateBodyCzfs.do',
			multiselect: true,
			caption: '经营性固定资产33',
			footerrow : true, 
			userDataOnFooter : true, 
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false,
				id: "0"
			},
			loadComplete:function(data){			
				if(data != null && data.rows.length>0){
					jQuery("#jygdzcList").setGridHeight(data.rows.length * 22 + 18);	
				}else{
					jQuery("#jygdzcList").setGridHeight(0);
				}		
			},			
			shrinkToFit:false	
		});
//--------------------------------------------------待处置资产------------------------------------------------------
		jQuery("#dczzcList").jqGrid({
			url:"<%=basePath %>zccz/assetDealBody_vidwBody.do",
			datatype: "json",
			mtype:"POST",
			postData:{
				cldId:"<%=disposeHead.getId() %>",
				cscldid:"<%=disposeHead.getCscldid() %>",
				assetType:"5"
			},
			colNames:['id','zcId','资产名称','主卡片编号','主卡片名称', '账面原值（元）', '账面净值（元）','评估价值（元)','上会次数','处置方式','是否处置完毕'],
			colModel:[
				{name:'id',index:'id',hidden:true},
				{name:'azcid',index:'azcid',hidden:true},
				{name:'azcmc',index:'azcmc',sortable:false},
				{name:'azkpbh',index:'azkpbh',sortable:false},
				{name:'azkpmc',index:'azkpmc',sortable:false},
				{name:'zmyz',index:'zmyz',formatter:'number',sortable:false},
				{name:'azmjz',index:'azmjz',sortable:false},
				{name:'apgjz',index:'apgjz',sortable:false},
				{name:'dqshcs',index:'dqshcs',sortable:false},
				{name:'CCzfs',index:'CCzfs',formatter:"select",editable: false,edittype:"select",editoptions:{
						value:"${czfsJson}"
					},sortable:false
				},
				{name:'sfczwb',index:'sfczwb',sortable:false}								
			],
			height:'auto',
			onSelectRow: function(id){
				jQuery('#dczzcList').jqGrid('editRow',id,true);
				$("#" + id + "_CCzfs").change(function(){
					jQuery('#dczzcList').jqGrid('saveRow',id);
				});
			},
			autowidth:true,
			rowNum:0,
			editurl:'<%=basePath %>zccz/assetDealBody_updateBodyCzfs.do',
			multiselect: true,
			caption: '待处置资产',
			toolbar: [false,"top"],
			footerrow : true, 
			userDataOnFooter : true, 
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false,
				id: "0"
			},
			loadComplete:function(data){			
				if(data != null && data.rows.length>0){
					jQuery("#dczzcList").setGridHeight(data.rows.length * 22 + 18);	
				}else{
					jQuery("#dczzcList").setGridHeight(0);
				}		
			},			
			shrinkToFit:false	
		});
//--------------------------------------------------受托资产------------------------------------------------------
		jQuery("#stzcList").jqGrid({
			url:"<%=basePath %>zccz/assetDealBody_vidwBody.do",
			datatype: "json",
			mtype:"POST",
			postData:{
				cldId:"<%=disposeHead.getId() %>",
				cscldid:"<%=disposeHead.getCscldid() %>",
				assetType:"6"
			},
			colNames:['id','zcId','资产名称','主卡片编号','主卡片名称', '账面原值（元）', '账面净值（元）','评估价值（元)','上会次数','处置方式','是否处置完毕'],
			colModel:[
				{name:'id',index:'id',hidden:true},
				{name:'azcid',index:'azcid',hidden:true},
				{name:'azcmc',index:'azcmc',sortable:false},
				{name:'azkpbh',index:'azkpbh',sortable:false},
				{name:'azkpmc',index:'azkpmc',sortable:false},
				{name:'zmyz',index:'zmyz',formatter:'number',sortable:false},
				{name:'azmjz',index:'azmjz',sortable:false},
				{name:'apgjz',index:'apgjz',sortable:false},
				{name:'dqshcs',index:'dqshcs',sortable:false},
				{name:'CCzfs',index:'CCzfs',formatter:"select",editable: false,edittype:"select",editoptions:{
						value:"${czfsJson}"
					},sortable:false
				},
				{name:'sfczwb',index:'sfczwb',sortable:false}								
			],
			height:'auto',
			autowidth:true,
			rowNum:0,
			onSelectRow: function(id){
				jQuery('#stzcList').jqGrid('editRow',id,true);
				$("#" + id + "_CCzfs").change(function(){
					jQuery('#stzcList').jqGrid('saveRow',id);
				});
			},
			multiselect: true,
			caption: '受托资产',
			toolbar: [false,"top"],
			footerrow : true, 
			userDataOnFooter : true, 
			editurl:'<%=basePath %>zccz/assetDealBody_updateBodyCzfs.do',
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false,
				id: "0"
			}
		});
//--------------------------------------------------实体内资产------------------------------------------------------
		jQuery("#entity_asset_list").jqGrid({
			url:"<%=basePath %>zccz/assetDealBody_vidwBody.do",
			datatype: "json",
			mtype:"POST",
			postData:{
				cldId:"<%=disposeHead.getId() %>",
				cscldid:"<%=disposeHead.getCscldid() %>",
				assetType:"1"
			},
			colNames:['id','zcId','实体Id','实体类型','实体名称','资产编号','资产名称','资产类型', '实际占有人', '评估价值（万元)','存放位置','上会次数','处置方式','是否处置完毕'],
			colModel:[
				{name:'id',index:'id',hidden:true},
				{name:'bfsxxid',index:'bfsxxid',hidden:true},//实体附属信息id
				{name:'bstid',index:'bstid',hidden:true},
				{name:'stlx',index:'stlx',hidden:true},
				{name:'bstmc',index:'bstmc',sortable:false},
				{name:'bzcbh',index:'bzcbh',sortable:false},
				{name:'bzcmc',index:'bzcmc',sortable:false},
				{name:'entityAssetType',index:'entityAssetType',sortable:false},
				{name:'bsjzyr',index:'bsjzyr',sortable:false},
				{name:'bpgz',index:'bpgz',sortable:false},
				{name:'bcfwz',index:'bcfwz',sortable:false},
				{name:'dqshcs',index:'dqshcs',sortable:false},
				{name:'CCzfs',index:'CCzfs',formatter:"select",editable: false,edittype:"select",editoptions:{
						value:"${czfsJson}"
					},sortable:false
				},
				{name:'sfczwb',index:'sfczwb',sortable:false}
			],
			height:'auto',
			autowidth:true,
			rowNum:0,
			onSelectRow: function(id){
				jQuery('#entity_asset_list').jqGrid('editRow',id,true);
				$("#" + id + "_CCzfs").change(function(){
					jQuery('#entity_asset_list').jqGrid('saveRow',id);
				});
			},
			editurl:'<%=basePath %>zccz/assetDealBody_updateBodyCzfs.do',
			multiselect: true,
			caption: '实体内资产',
			toolbar: [false,"top"],
			ondblClickRow:function(rowid){
				lookdblclickAss(rowid);
			},
			footerrow : true, 
			userDataOnFooter : true, 
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false,
				id: "0"
			},
			loadComplete:function(data){			
				if(data != null && data.rows.length>0){
					jQuery("#entity_asset_list").setGridHeight(data.rows.length * 22 + 18);	
				}else{
					jQuery("#entity_asset_list").setGridHeight(0);
				}		
			},			
			shrinkToFit:false	
		});
//--------------------------------------------------委托贷款抵债物资产------------------------------------------------------
		jQuery("#loan_pledge_asset_list").jqGrid({
			url:"<%=basePath %>zccz/assetDealBody_vidwBody.do",
			datatype: "json",
			mtype:"POST",
			postData:{
				cldId:"<%=disposeHead.getId() %>",
				cscldid:"<%=disposeHead.getCscldid() %>",
				assetType:"2"
			},
			colNames:['id','贷款账号','资产编号','资产名称','资产类型', '实际占有人', '评估价值（万元)','存放位置','上会次数','处置方式','是否处置完毕'],
			colModel:[
				{name:'id',index:'id',hidden:true},
				{name:'cdkzh',index:'cdkzh',hidden:true},
				{name:'czcbh',index:'czcbh',sortable:false},
				{name:'czcmc',index:'czcmc',sortable:false},
				{name:'czclx',index:'czclx',sortable:false},
				{name:'csjzyr',index:'csjzyr',sortable:false},
				{name:'loanPledgePgjz',index:'loanPledgePgjz',sortable:false},
				{name:'ccfwz',index:'ccfwz',sortable:false},
				{name:'dqshcs',index:'dqshcs',sortable:false},
				{name:'CCzfs',index:'CCzfs',formatter:"select",editable: false,edittype:"select",editoptions:{
						value:"${czfsJson}"
					},sortable:false
				},
				{name:'sfczwb',index:'sfczwb',sortable:false}							
			],
			height:'auto',
			autowidth:true,
			rowNum:0,
			multiselect: true,
			onSelectRow: function(id){
				jQuery('#loan_pledge_asset_list').jqGrid('editRow',id,true);
				$("#" + id + "_CCzfs").change(function(){
					jQuery('#loan_pledge_asset_list').jqGrid('saveRow',id);
				});
			},
			editurl:'<%=basePath %>zccz/assetDealBody_updateBodyCzfs.do',
			caption: '委贷抵债物',
			toolbar: [false,"top"],
			footerrow : true, 
			userDataOnFooter : true, 
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false,
				id: "0"
			},
			loadComplete:function(data){			
				if(data != null && data.rows.length>0){
					jQuery("#loan_pledge_asset_list").setGridHeight(data.rows.length * 22 + 18);	
				}else{
					jQuery("#loan_pledge_asset_list").setGridHeight(0);
				}		
			},			
			shrinkToFit:false	
		});
//--------------------------------------------------自用资产------------------------------------------------------
		jQuery("#zyzc_asset_list").jqGrid({
			url:"<%=basePath %>zccz/assetDealBody_vidwBody.do",
			datatype: "json",
			mtype:"POST",
			postData:{
				cldId:"<%=disposeHead.getId() %>",
				cscldid:"<%=disposeHead.getCscldid() %>",
				assetType:"4"
			},
			colNames:['id','zcid','资产编号','资产名称','资产类型', '实际占有人', '评估价值（万元)','存放位置','上会次数','处置方式','是否处置完毕'],
			colModel:[
				{name:'id',index:'id',hidden:true},
				{name:'zyzcid',index:'zyzcid',hidden:true},
				{name:'zyzcbh',index:'zyzcbh',sortable:false},
				{name:'zyzcmc',index:'zyzcmc',sortable:false},
				{name:'zyzclx',index:'zyzclx',sortable:false},
				{name:'csjzyr',index:'csjzyr',sortable:false},
				{name:'loanPledgePgjz',index:'loanPledgePgjz',sortable:false},
				{name:'ccfwz',index:'ccfwz',sortable:false},
				{name:'dqshcs',index:'dqshcs',sortable:false},
				{name:'CCzfs',index:'CCzfs',formatter:"select",editable: false,edittype:"select",editoptions:{
						value:"${czfsJson}"
					},sortable:false
				},
				{name:'sfczwb',index:'sfczwb',sortable:false}							
			],
			height:'auto',
			autowidth:true,
			multiselect: true,
			caption: '自用资产',
			onSelectRow: function(id){
				jQuery('#zyzc_asset_list').jqGrid('editRow',id,true);
				$("#" + id + "_CCzfs").change(function(){
					jQuery('#zyzc_asset_list').jqGrid('saveRow',id);
				});
			},
			editurl:'<%=basePath %>zccz/assetDealBody_updateBodyCzfs.do',
			rowNum:0,
			footerrow : true, 
			userDataOnFooter : true, 
			jsonReader : {
				root:"rows",
				page: "page",
				total: "total",
				records: "records",
				repeatitems: false,
				id: "0"
			},
			loadComplete:function(data){			
				if(data != null && data.rows.length>0){
					jQuery("#zyzc_asset_list").setGridHeight(data.rows.length * 22 + 18);	
				}else{
					jQuery("#zyzc_asset_list").setGridHeight(0);
				}		
			},			
			shrinkToFit:false	
		});
//--------------------------------------------------债券------------------------------------------------------		
	jQuery("#zqList").jqGrid({
		url:"<%=basePath%>zccz/assetDealBody_vidwBody.do",
		postData:{
			cldId:"<%=disposeHead.getId() %>",
			cscldid:"<%=disposeHead.getCscldid() %>",
			assetType:"7"
		},
		datatype: "json",
		multiselect:true,
		colNames:['id','债券id','项目名称','债券种类','债券名称','行名','到期日','处置方式','是否处置完毕'],
		colModel:[
			{name:'id',index:'id',hidden:true},
			{name:'fzqId',index:'fzqId',hidden:true},
			{name:'fzqxmmc',index:'fzqxmmc',sortable:false},
			{name:'zqzlmc',index:'zqzlmc',sortable:false},
			{name:'zqmc',index:'zqmc',sortable:false},
			{name:'jhfhmc',index:'jhfhmc',sortable:false},
			{name:'dqr',index:'DQR',sortable:false},
			{name:'CCzfs',index:'CCzfs',formatter:"select",editable: false,edittype:"select",editoptions:{
					value:"${czfsJson}"
				},sortable:false
			},
			{name:'sfczwb',index:'sfczwb',sortable:false}
		],
		rownumbers:true,
		autowidth:true,
		onSelectRow: function(id){
			jQuery('#zqList').jqGrid('editRow',id,true);
			$("#" + id + "_CCzfs").change(function(){
				jQuery('#zqList').jqGrid('saveRow',id);
			});
		},
		editurl:'<%=basePath %>zccz/assetDealBody_updateBodyCzfs.do',
		rowNum:0,
		height:'auto',
		caption:'债券',
		jsonReader : {
			root:"rows",
			page: "page",
			total: "total",
			records: "records",
			repeatitems: false,
			id: "0"
		},
		loadComplete:function(data){			
			if(data != null && data.rows.length>0){
				jQuery("#zqList").setGridHeight(data.rows.length * 22 + 18);	
			}else{
				jQuery("#zqList").setGridHeight(0);
			}		
		},			
		shrinkToFit:false	
	});
</script>
	</body>
</html>