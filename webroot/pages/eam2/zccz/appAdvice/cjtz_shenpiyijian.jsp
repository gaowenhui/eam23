<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.tansun.eam2.common.model.orm.bo.CzXmSpwYj"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.tansun.eam2.common.model.orm.bo.CzStcztz"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	CzXmSpwYj czXmSpwYj = (CzXmSpwYj) request.getAttribute("czXmSpwYj");
	String todoId = request.getParameter("todoId");
	CzStcztz head = (CzStcztz) request.getAttribute("head");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<base href="<%=basePath%>" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>实体整体处置</title>
		<script type="text/javascript">
			var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";
			$(function(){
				jQuery("#gdzc_list").setGridWidth($("#widthRule").width());
				jQuery("#gdzc1_list").setGridWidth($("#widthRule").width());
				jQuery("#cjst_list").setGridWidth($("#widthRule").width());
				jQuery("#qita_List").setGridWidth($("#widthRule").width());
				jQuery("#blyj_reason_list").setGridWidth($("#widthRule").width());
				jQuery("#file_list").setGridWidth($("#widthRule").width());
				$(window).bind('resize', function(){
					jQuery("#gdzc_list").setGridWidth($("#widthRule").width());
					jQuery("#gdzc1_list").setGridWidth($("#widthRule").width());
					jQuery("#cjst_list").setGridWidth($("#widthRule").width());
					jQuery("#qita_List").setGridWidth($("#widthRule").width());
					jQuery("#blyj_reason_list").setGridWidth($("#widthRule").width());
					jQuery("#file_list").setGridWidth($("#widthRule").width());
				});
				
				$("#butongyi").val($("#tongyi").val() == '0'?'1':'0');
				
				$("#widthRule input").attr("readonly","readonly");
				$("#widthRule select").attr("disabled","disabled");
				$("#widthRule,#myTable2 textarea").attr("disabled","readonly");
				$("#stxx input").attr("readonly","readonly");
				$("#stxx select").attr("disabled","disabled");
				
				<%if(StringUtils.equals("0",czXmSpwYj.getSftjspyj())){%>
				var buttonsString0 = '[{"buttonHandler":"submitApp","buttonIcon":"icon-ok","buttonText":"提交"}]';
				addButtons($("#submitTd"),buttonsString0);
				<%}%>
				
				$("#myForm").ajaxForm({
					success:function(returnStr){
						if("SUCCESS" == returnStr){
							window.opener.reloadGrid();
							window.close();
						}else{
							alert("提交意见出现异常,请联系管理员！");
						}
					}
				});
			});
			
			function changeBty(obj){
				$("#butongyi").val($(obj).val() == '0'?'1':'0');
			}
			
			function submitApp(){
			
				var tongyi = document.getElementById("tongyi").value;
				var spyjjy = document.getElementById("spyjjy").value;
				if(tongyi == "0"){
					if($.trim(spyjjy) == ""){
						alert("请填写审批意见!");
					}else{
						$(myForm).submit();
					}
				}else{
						$(myForm).submit();
				}
				
			}
		</script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<!-- 意见域、 依据和文件上传需要表单id -->
		<s:set name="biaodanid" value="head.Id" />
		<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
		<r:depthidden name="deptid" id="deptid" />
		<r:userhidden id="userid" name="userid" />
		<!-- 意见域、 依据和文件上传需要表单id -->
		<s:hidden id="id" name="head.id" />
		<s:hidden id="lcId" name="head.lcId" />
		<s:hidden id="lcmc" name="head.lcmc" value="实体整体处置" />
		<s:hidden id="fblsj" name="head.fblsj" />
		<br>
		<br>
		<div align="center">
			<span class="STYLE7 STYLE1">承继投资审批意见表</span>
		</div>
		<br>
		<hr color="#6600CC" align="center" width="100%" />
		<table id="widthRule" width="100%" class="newtable" border="0"
			align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td class="td_zxy01">
					项目名称：
				</td>
				<td class="td_zxy02" colspan="3">
					<s:textfield id="czxmmc" name="head.czxmmc" cssClass="input" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">
					编号：
				</td>
				<td class="td_zxy02">
					<s:textfield cssClass="input" id="bianhao" name="head.bianhao"
						readonly="true" />
				</td>
				<td class="td_zxy01">
					急缓程度：
				</td>
				<td class="td_zxy02">
					<s:select id="jhcd" name="head.jhcd" cssClass="input"
						list="#{'0':'一般','1':'急','2':'特急'}" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">
					拟稿日期：
				</td>
				<td class="td_zxy02">
					<s:date name="head.ngrq" format="yyyy-MM-dd" var="draftDate" />
					<s:textfield cssClass="input" id="ngrq" name="head.ngrq"
						value="%{#draftDate}" readonly="true" />
				</td>
				<td class="td_zxy01">
					拟稿部门：
				</td>
				<td class="td_zxy02">
					<s:hidden id="ngbm" name="head.ngbm" />
					<s:textfield cssClass="input" id="ngbmmc" name="head.ngbmmc"
						readonly="true" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">
					拟稿人：
				</td>
				<td class="td_zxy02">
					<s:hidden id="ngr" name="head.ngr" />
					<s:textfield cssClass="input" id="ngrxm" name="head.ngrxm"
						readonly="true" />
				</td>
				<td class="td_zxy01">
					联系电话：
				</td>
				<td class="td_zxy02">
					<s:textfield cssClass="input" id="lxdh" name="head.lxdh" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">
					会签部门：
				</td>
				<td class="td_form02" colspan="3">
					<r:textfield name="head.hqbm" id="hqbmvalue" readonly="true"
						cssClass="input2" />
					<s:hidden name="head.hqbmid" id="hqbmids" />
					<e:pc id="xzhq">
						<img
							src="<%=request.getContextPath()%>/resource/ProjectImages/search.gif"
							onclick="openTreeByType();" width="21" height="20"
							align="absmiddle" />
					</e:pc>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">
					业务类型：
				</td>
				<td class="td_zxy02">
					<e:select list="#{}" parRefKey="INVESTMENT_TYPE" id="tzywlx"
						name="head.tzywlx" onclick="chickIndex(this)"
						onchange="getIndex(this)" />
					<span id="fangan" style="display: none">方案类别： <e:select
							list="#{}" id="CFalb" name="head.CFalb" headerKey=""
							headerValue="" parRefKey="RENT_SCHEMA_TYPE" /> </span>
				</td>
				<td class="td_zxy01">
					投资申报方式：
				</td>
				<td class="td_zxy03">
					<s:select cssClass="input" id="czsbfs" name="head.czsbfs"
						list="#{'0':'首次','1':'重报','2':'变更'}" />
				</td>
			</tr>
			<tr id="sqsdje" style="display: block">
				<td class="td_zxy01" width="120">
					申请费用总金额(元)：
				</td>
				<td class="td_zxy02">
					<r:textfield name="head.sqfyzje" readonly="true" id="sqfyzje" />
				</td>
				<td class="td_zxy01" width="120">
					审批费用总金额(元)：
				</td>
				<td class="td_zxy02">
					<r:textfield name="head.spfyzje" readonly="true" id="sdfyzje" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">
					申报日期：
				</td>
				<td class="td_zxy02">
					<s:date name="head.sbrq" var="sbrpFormat" format="yyyy-MM-dd" />
					<s:textfield name="head.sbrq" cssClass="input" id="sbrq"
						value="%{#sbrpFormat}" readonly="true" />
				</td>
				<td class="td_zxy01">
					受理序号：
				</td>
				<td class="td_zxy02">
					<s:textfield id="slxh" name="head.slxh" cssClass="input"
						readonly="true" />
				</td>
			</tr>
		</table>
		<table>
			<tr id="cjst" style="display: none">
				<td>
					<div>
						<table width="100%" class="newtable" border="0" align="center"
							cellpadding="0" cellspacing="0">
							<tr id="touzi" style="display: block">
								<td class="td_zxy01">
									投资方式：
								</td>
								<td class="td_form02">
									<r:textfield name="head.tzfs" id="head.tzfs" label="" />
								</td>
								<td class="td_zxy01">
									投资金额（元）：
								</td>
								<td class="td_form02">
									<r:textfield name="head.tzje" id="head.tzje" label=""
										onblur="checkFloat(this);" />
								</td>
							</tr>

							<tr id="chezi" style="display: none">
								<td class="td_zxy01">
									撤资方式：
								</td>
								<td class="td_form02">
									<r:textfield name="head.czfs" id="head.czfs" label="" />
								</td>
								<td class="td_zxy01">
									撤资金额（元）：
								</td>
								<td class="td_form02">
									<r:textfield name="head.czje" id="head.czje" label=""
										onblur="checkFloat(this);" />
								</td>
							</tr>
						</table>

						<table width="100%" class="newtable" border="0" align="center"
							cellpadding="0" cellspacing="0">
							<tr>
								<td width="150">
									<a
										onClick="javascript:div11.style.display=div11.style.display=='none'?'block':'none';">
										<img
											src="<%=request.getContextPath()%>/resource/ProjectImages/icon-import.gif"
											id="top_8" /> <font class="td_title">实体信息</font>
									</a>
								</td>
								<td width="1128" colspan="3">
									<div align="right">
										<e:pc id="xzst">
											<input type="button" class="buttonface" value="选择实体"
												onClick="selectEntity();" />
										</e:pc>
									</div>
								</td>
							</tr>
						</table>

						<div id="div11" style="display: block">
							<table width="100%" class="newtable" border="0" align="center"
								cellpadding="0" cellspacing="0">
								<tr>
									<td class="td_zxy01">
										资产编号：
									</td>
									<td class="td_form02">
										<s:textfield name="head.zcbh" id="zcbh" readonly="true" />
									</td>
									<td class="td_zxy01">
										实体名称：
									</td>
									<td class="td_form02">
										<s:textfield name="head.stmc" id="stmc" readonly="true" />
									</td>
								</tr>
								<tr>
									<td class="td_zxy01">
										股权构成：
									</td>
									<td class="td_form02">
										<s:hidden name="head.gqgc" id="gqgc" />
										<input name="gqqk" type="button" onclick="viewGqgc();"
											value="查看" />
									</td>
									<td class="td_zxy01">
										资质情况：
									</td>
									<s:hidden name="head.zzqk" id="zzqk" />
									<td class="td_form02">
										<input name="zzqk" type="button" onclick="viewZzqk();"
											value="查看" />
									</td>
								</tr>
								<tr>
									<td class="td_zxy01">
										地区：
									</td>
									<td class="td_form02">
										<s:textfield name="head.stscsf" id="stscsf"
											readonly="true" />
									</td>
									<td class="td_zxy01">
										办公地址：
									</td>
									<td class="td_form02">
										<s:textfield name="head.bgdz" id="bgdz" readonly="true" />
									</td>
								</tr>
								<tr>
									<td class="td_zxy01">
										人数：
									</td>
									<td class="td_form02">
										<s:textfield name="head.strs" id="strs" readonly="true" />
									</td>
									<td class="td_zxy01">
										账面投资（元）：
									</td>
									<td class="td_form02">
										<s:textfield name="head.zmtz" id="zmtz" readonly="true" />
									</td>
								</tr>
								<tr>
									<td class="td_zxy01">
										委托管理机构：
									</td>
									<td class="td_form02">
										<s:textfield name="head.CWtgljg" id="CWtgljg"
											readonly="true" />
									</td>
									<td class="td_zxy01">
										&nbsp;
									</td>
									<td class="td_form02">
										&nbsp;
									</td>
								</tr>
								<tr>
									<td class="td_zxy01">
										出资与工商年审情况：
									</td>
									<td colspan="3" class="td_form02">
										<s:textfield name="head.czygsnsqk" id="czygsnsqk"
											readonly="true" cssClass="input" />
									</td>
								</tr>
								<tr>
									<td class="td_zxy01">
										主营业务：
									</td>
									<td colspan="3" class="td_form02">
										<s:textfield name="head.zyyw" id="zyyw" readonly="true"
											cssClass="input" />
									</td>
								</tr>
								<tr>
									<td class="td_zxy01">
										最近一期经审计报告：
									</td>
									<td class="td_form02" colspan="3">
										<e:filebutton fjlx="single" biaodanId="%{#request.biaodanid}"
											isview="Y" />
									</td>
								</tr>
								<tr>
									<td colspan="6" class="td_zxy01">
										<div align="left">
											最近一个月未经审计的报表的主要数据
										</div>
									</td>
								</tr>
								<tr>
									<td class="td_zxy01">
										总资产(元)：
									</td>
									<td class="td_form02">
										<r:textfield name="head.zzc" id="zzc" maxlength="16"
											onblur="checkFloat(this);" />
									</td>
									<td class="td_zxy01">
										负债（元）：
									</td>
									<td class="td_form02">
										<r:textfield name="head.fuzhai" id="fuzhai" maxlength="16"
											onblur="checkFloat(this);" />
									</td>
								</tr>
								<tr>
									<td class="td_zxy01">
										股本（元）：
									</td>
									<td class="td_form02">
										<r:textfield name="head.guben" id="guben"
											onblur="checkFloat(this);" />
									</td>
									<td class="td_zxy01">
										净资产（元）：
									</td>
									<td class="td_form02">
										<r:textfield name="head.jzc" id="jzc" maxlength="16"
											onblur="checkFloat(this);" />
									</td>
								</tr>
								<tr>
									<td class="td_zxy01">
										收入（元）：
									</td>
									<td class="td_form02">
										<r:textfield name="head.shouru" maxlength="16" id="shouru"
											onblur="checkFloat(this);" />
									</td>
									<td class="td_zxy01">
										净利润（元）：
									</td>
									<td class="td_form02">
										<r:textfield name="head.jlr" maxlength="16" id="jlr"
											onblur="checkFloat(this);" />
									</td>
								</tr>
							</table>
						</div>
					</div>
				</td>
			</tr>
		</table>
		<table width="100%" class="newtable" border="0" align="center"
			cellpadding="0" cellspacing="0">
			<tr>
				<td align="right">
					<div id="gdzc" style="display: block">
						<table id="gdzc_list"></table>
					</div>
					<div id="gdzc1" style="display: none">
						<table id="gdzc1_list"></table>
					</div>
					<div id="qita" style="display: none">
						<table id="qita_List"></table>
					</div>
				</td>
			</tr>
		</table>
		<%@ include file="/inc/according.inc"%>
		<table width="100%" border="0" align="center" cellpadding="0"
			cellspacing="0">
			<e:opinion id="test" width="100%">
				<e:opinionPart biaodanid="%{#request.biaodanid}" id="LEADER"
					name="LEADER" value="" viewArea="false" text="批示意见："></e:opinionPart>
				<e:opinionPart biaodanid="%{#request.biaodanid}"
					id="OPERATION_GROUP" viewArea="false" name="OPERATION_GROUP" value=""
					text="业务运营组意见："></e:opinionPart>
				<e:opinionPart id="MEETING_DEPT" biaodanid="%{#request.biaodanid}"
					name="MEETING_DEPT" value="" viewArea="false" text="会签部门意见：">
					<!-- ==========================工作流信息项======================================= -->
					<%@ include
						file="/pages/rdp4j/workflow/task/counterSignDeptList.jsp"%>
					<!-- =========================================================================== -->
				</e:opinionPart>
				<e:opinionPart biaodanid="%{#request.biaodanid}" id="DRAFT_DEPT"
					name="DRAFT_DEPT" viewArea="false" value="" text="拟稿部门意见："></e:opinionPart>
			</e:opinion>
		</table>
		<table width="100%" id="myTable2" class="newtable" border="0" align="center"
			cellpadding="0" cellspacing="0">
			<tr>
				<td class="td_zxy01">
					备注：
				</td>
				<td class="td_zxy03" colspan="5">
					<r:textarea name="head.beizhu" id="beizhu" cssClass="input"
						style="width:94%;" rows="4" />
				</td>
			</tr>
		</table>
		<%@ include file="/inc/file.inc"%>
		<div id="dialogZzqk" icon="icon-save"
			style="padding: 5px; width: 400px; height: 200px;">
		</div>
		<div id="dialogGqgc" icon="icon-save"
			style="padding: 5px; width: 400px; height: 200px;">
		</div>
		<s:form action="zccz/appAdviceAction_submitAdvice.do" id="myForm">
			<s:hidden id="czXmSpwYjId" name="czXmSpwYj.id" />
			<input type="hidden" id="todoId" name="todoId" value="<%=todoId%>" />
			<table class="newtable" width="100%" border="0" align="center"
				cellpadding="0" cellspacing="0">
				<tr>
					<td class="td_zxy01">
						审批结论：
					</td>
					<td class="td_zxy02">
						<table width="100%">
							<tr>
								<td style="width: 20%;">
									<s:hidden id="butongyi" name="czXmSpwYj.butongyi" />
									<%
										if (StringUtils.equals("1", czXmSpwYj.getSftjspyj())) {
									%>
									<s:select id="tongyi" name="czXmSpwYj.tongyi"
										list="#{'1':'同意','0':'不同意'}" onchange="changeBty(this)"
										disabled="true" />
									<%
										} else {
									%>
									<s:select id="tongyi" name="czXmSpwYj.tongyi"
										list="#{'1':'同意','0':'不同意'}" onchange="changeBty(this)" />
									<%
										}
									%>
								</td>
								<td align="right" style="width: 20%;">
									<s:hidden id="tyyjsj" name="czXmSpwYj.tyyjsj"
										value="%{#tyyjsj}" />
								</td>
								<td id="submitTd"></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						其它情况：
					</td>
					<td class="td_zxy03">
						<%
							if (StringUtils.equals("1", czXmSpwYj.getSftjspyj())) {
						%>
						<s:textarea id="qtqk" name="czXmSpwYj.qtqk" cssClass="input"
							rows="4" readonly="true" />
						<%
							} else {
						%>
						<s:textarea id="qtqk" name="czXmSpwYj.qtqk" cssClass="input"
							rows="4" />
						<%
							}
						%>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						审批意见和建议：
					</td>
					<td class="td_zxy03">
						<%
							if (StringUtils.equals("1", czXmSpwYj.getSftjspyj())) {
						%>
						<s:textarea id="spyjjy" name="czXmSpwYj.spyjjy" cssClass="input"
							rows="4" readonly="true" />
						<%
							} else {
						%>
						<s:textarea id="spyjjy" name="czXmSpwYj.spyjjy" cssClass="input"
							rows="4" />
						<%
							}
						%>
					</td>
				</tr>
			</table>
		</s:form>
		<script type="text/javascript">
			jQuery("#gdzc_list").jqGrid({
			url:"<%=basePath%>cjtz/czCztzfaXxAction_getGdzcList.do?headId=${head.id}",
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
			},
			gridComplete:function(){
				compute1();
			}
		});
	
		jQuery("#gdzc1_list").jqGrid({
			url:"<%=basePath%>cjtz/czCztzfaXxAction_getGdzcList.do?headId=${head.id}",
			datatype: "json",
			mtype:"POST",  
		    colNames: ['id','azcid','资产编号', '资产名称','资产类型', '租赁起始日期', '租赁到期日期','承租人','意向租期','意向租金总额'],
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
			url:"<%=basePath%>cjtz/czCztzfaXxAction_getGdzcList.do?headId=${head.id}",
			datatype: "json",
			colNames: ['id','资产编号','资产名称','省份', '管理部门'],
			colModel:[
				{name:'id',index:'id',hidden:true},	
				{name:'azcbh',index:'name'},
				{name:'azcmc',index:'htqsrq'},
				{name:'aczcdq',index:'htzzrq'},
				{name:'azcglbmmc',index:'htje'}
			],
			loadComplete:function(data){
				if(data && data.rows.length>0){
					jQuery("#qita_List").setGridHeight(data.rows.length * 22 + 18);
				}else{
					jQuery("#qita_List").setGridHeight(0);
				}
			},		
			rownumbers:true,
			autowidth:true,
			height:'auto',
			rowNum:0,
			multiselect: true,
			caption: '资产信息',
			jsonReader : {
				records: "records",
				repeatitems: false,
				id: "0"
			}
		});
				
		//日期转换和资质情况
		$(function(){
			$('#dialogZzqk').dialog({title:'资质情况'});
			$('#dialogZzqk').dialog('close');
			$('#dialogGqgc').dialog({title:'股权构成'});
			$('#dialogGqgc').dialog('close');
		});
		
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
	</script>
	</body>
</html>