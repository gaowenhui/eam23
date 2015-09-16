<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<base href="<%=basePath %>" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>实体整体处置</title>
		<script type="text/javascript">
			var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";
			$(function(){
				if($("#CCzfs").val() == '2'){
					$("#jydx,#jydxLable").show();
				}else{
					$("#jydx,#jydxLable").hide();
				}
				if($("#stywyxzc").val() == '有'){
					$("#aaa,#bbb").show();
				}else{
					$("#aaa,#bbb").hide();
				}
				$("#stInfo").panel({width:$("#widthRule").width(),collapsible:true});
				jQuery("#claims_list").setGridWidth($("#widthRule").width());
				jQuery("#blyj_reason_list").setGridWidth($("#widthRule").width());
				jQuery("#file_list").setGridWidth($("#widthRule").width());
				$(window).bind('resize', function(){
					jQuery("#claims_list").setGridWidth($("#widthRule").width());
					$("#stInfo").panel('resize',$("#widthRule").width());
					jQuery("#blyj_reason_list").setGridWidth($("#widthRule").width());
					jQuery("#file_list").setGridWidth($("#widthRule").width());
				});
				
				
				$("#widthRule input").attr("readonly","readonly");
				$("#widthRule select").attr("disabled","disabled");
				$("#stxx input").attr("readonly","readonly");
				$("#stxx select").attr("disabled","disabled");
			});
		</script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<!-- 意见域、 依据和文件上传需要表单id -->
		<s:set name="biaodanid" value="head.Id" />
		<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
		<s:hidden name="deptid" value="11318" />
		<!-- 意见域、 依据和文件上传需要表单id -->
		<s:hidden id="id" name="head.id" />
		<table class="newtable" id="widthRule" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>处置项目名称：</td>
				<td class="td_zxy02" colspan="3">
					<s:textfield cssClass="input" id="czxmmc" name="head.czxmmc" required="true"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01" align="center">编号：</td>
				<td class="td_zxy02">
					<s:textfield cssClass="input" id="bianhao" name="head.bianhao" readonly="true"/>
				</td>
				<td class="td_zxy01">急缓程度：</td>
				<td class="td_zxy02">
					<s:select cssClass="input" list="#{'0':'一般','1':'急','2':'特急'}" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01" align="center"><font color="#FF0000"><strong>*</strong></font>拟稿日期：</td>
				<td class="td_zxy02">
					<s:date name="head.ngrq" format="yyyy-MM-dd" var="draftDate"/>
					<s:textfield cssClass="input" id="ngrq" name="head.ngrq" value="%{#draftDate}" readonly="true"/>
				</td>
				<td class="td_zxy01" align="center"><font color="#FF0000"><strong>*</strong></font>拟稿部门：</td>
				<td class="td_zxy02">
					<s:hidden id="ngbm" name="head.ngbm" />
					<s:textfield cssClass="input" id="ngbmmc" name="head.ngbmmc" readonly="true"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>拟稿人：</td>
				<td class="td_zxy02">
					<s:hidden id="ngr" name="head.ngr"/>
					<s:textfield cssClass="input" id="ngrxm" name="head.ngrxm" readonly="true"/>
				</td>
				<td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>联系电话：</td>
				<td class="td_zxy02">
					<s:textfield cssClass="input" id="lxdh" name="head.lxdh"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">处置方式：</td>
				<td class="td_zxy02">
					<e:select onchange="changeJydx()" cssClass="input" list="#{}" parRefKey="ENTITY_DISPOSE_METHOD" id="CCzfs" name="head.CCzfs" />
				</td>
				<td class="td_zxy01">
						处置申报方式：
				</td>
				<td class="td_zxy02">
					<s:select cssClass="input" id="czsbfs" name="head.czsbfs" list="#{'0':'首次','1':'重报','2':'变更'}" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">
					<font color="#FF0000"><strong>*</strong></font>有无人员：
				</td>
				<td class="td_zxy02">
					<s:select list="{'有','无'}" name="head.stywry" id="stywry" cssClass="input" />
				</td>
				<td class="td_zxy01">
					<label id="jydxLable"><font color="#FF0000"><strong>*</strong></font>交易对象：</label>
				</td>
				<td class="td_zxy02">
					<s:textfield name="head.jydx" id="jydx" cssClass="input"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">实体有无有效资产：</td>
				<td class="td_zxy02">
					<s:select onchange="stywyxzcChange()" cssClass="input" id="stywyxzc" name="head.stywyxzc" list="{'无','有'}" />
				</td>
				<td class="td_zxy01">是否上会：</td>
				<td class="td_zxy02">
					<s:select id="sfsh" cssClass="input" name="head.sfsh" list="{'是','否'}" />
				</td>
			</tr>
			<tr id="bbb">
				<td class="td_zxy01">资产评估值(万元)：</td>
				<td class="td_zxy02" colspan="3">
					<s:textfield name="head.zcpgz" id="zcpgz" cssClass="input" />
				</td>
			</tr>
			<tr id="aaa">
				<td class="td_zxy01">实体评估值(万元)：</td>
				<td class="td_zxy02">
					<s:textfield name="head.stpgz" id="stpgz" cssClass="input" />
				</td>
				<td class="td_zxy01">评估机构：</td>
				<td class="td_zxy02">
					<s:textfield name="head.pgjg" id="pgjg" cssClass="input" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">重报次数：</td>
				<td class="td_zxy02">
					<s:textfield name="head.cbcs" id="cbcs" cssClass="input" readonly="true" />
				</td>
				<td class="td_zxy01">合规审查次数：</td>
				<td class="td_zxy02">
					<s:textfield cssClass="input" id="hgsccs" name="head.hgsccs" readonly="true" />
				</td>
			</tr>
		</table>
		<div id="stInfo" title="实体信息" collapsible="true">
		<table id="stxx" class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td class="td_zxy01">资产编号：</td>
				<td class="td_zxy02">
					<s:textfield cssClass="input" id="zcbh" name="head.zcbh" readonly="true"/>
				</td>
				<td class="td_zxy01">实体名称：</td>
				<td class="td_zxy02">
					<s:hidden id="stid" name="head.stid" />
					<s:textfield cssClass="input" id="stmc" name="head.stmc" readonly="true" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">实体现状：</td>
				<td class="td_zxy02">
					<s:hidden id="stxz" name="head.stxz" />
					<e:vc codeType="ENTITY_CURRENT_STATUS" style="input" id="stxzName" codeKey="head.stxz" input="true"/>
				</td>
				<td class="td_zxy01">实体所处省份：</td>
				<td class="td_zxy02">
					<s:hidden id="stscsf" name="head.stscsf" />
					<e:vc codeType="PROVIENCE" style="input" id="sfName" codeKey="head.stscsf" input="true"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">账面资产总额：</td>
				<td class="td_zxy02">
					<s:textfield name="head.zmzcze" id="zmzcze" cssClass="input" readonly="true" />
				</td>
				<td class="td_zxy01">账面资产负债：</td>
				<td class="td_zxy02">
					<s:textfield name="head.zmzcfz" id="zmzcfz" cssClass="input" readonly="true" />
				</td>
			</tr>
			<tr>
	      		<td class="td_zxy01">申报日期：</td>
	      		<td class="td_zxy02">
	      			<s:textfield cssClass="input" id="sbrq" name="head.sbrq"/>
	      		</td>
	      		<td class="td_zxy01">受理序号：</td>
	      		<td class="td_zxy02">
	      			<s:textfield cssClass="input" id="slxh" name="head.slxh"/>
	      		</td>
      		</tr>
			<tr>
	      		<td class="td_zxy01">审批时间：</td>
	      		<td class="td_zxy02">
	      			<s:textfield cssClass="input" id="spsj" name="xmxxLsb.spsj"/>
	      		</td>
	      		<td class="td_zxy01">会议或会签次数：</td>
	      		<td class="td_zxy02">
	      			<s:textfield cssClass="input" id="hycs" name="xmxxLsb.hycs"/>
	      		</td>
      		</tr>
		</table>
		</div>
		<table id="claims_list"></table>
		<div id="pgtoolbarclaims"></div>
		<script type="text/javascript">
			jQuery("#claims_list").jqGrid({
				url:"<%=basePath %>zccz/entityDealHead_showDebtList.do",
				postData:{
					"stId" : "${head.stid}"
				},
				datatype: "json",
				colNames:['id','债务人名称','起始日期','终止日期','合同金额','购入债权余额','本金','利息','担保类型','担保合同金额','担保物类别'],
				colModel:[
					{name:'id',index:'id',hidden:true},	
					{name:'zwrmc',index:'zwrmc'},
					{name:'htqsrq',index:'htqsrq'},
					{name:'htzzrq',index:'htzzrq'},
					{name:'htje',index:'htje'},
					{name:'grzye',index:'grzye'},
					{name:'bj',index:'bj'},	
					{name:'lx',index:'lx'},
					{name:'dblxmc',index:'dblxmc'},	
					{name:'dbhtje',index:'dbhtje'},							
				    {name:'dbwzlbmc',index:'dbwzlbmc'}
				],
				rownumbers:true,
				autowidth:true,
				height:'auto',
				//pager: '#pgtoolbarclaims',
				multiselect: true,
				caption: '债权信息',
				jsonReader : {
					root:"rows",
					page: "page",
					total: "total",
					records: "records",
					repeatitems: false,
					id: "0"
				}
		});
	</script>
	<%@ include file="/inc/according.inc"%>
	<e:opinion id="test" width="100%">
		<e:opinionPart biaodanid="%{#request.biaodanid}" id="LEADER" name="LEADER" value="" text="批示意见："></e:opinionPart>
		<e:opinionPart biaodanid="%{#request.biaodanid}" id="OPERATION_GROUP" name="OPERATION_GROUP" value="" text="业务运营组意见："></e:opinionPart>
		<e:opinionPart biaodanid="%{#request.biaodanid}" id="DRAFT_DEPT" name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
		<e:opinionPart id="CHECK" biaodanid="%{#request.biaodanid}"  name="CHECK" value="" text="合规审查意见："></e:opinionPart>
	</e:opinion>
	<%@ include file="/inc/file.inc"%>
	<table width="100%" class="newtable" border="0" cellpadding="2" cellspacing="0" align="center">		
	     <tr>
       		<td class="td_zxy01">申报日期：</td>
       		<td class="td_zxy02">
				<s:date name="head.sbrq" format="yyyy-MM-dd" var="shenbaoRQ"/>
        		<s:textfield cssClass="input" id="sbrq" name="head.sbrq" value="%{#shenbaoRQ}"/>
       		</td>
       		<td class="td_zxy01">受理序号：</td>
       		<td class="td_zxy02">
       			<s:textfield cssClass="input" id="slxh" name="head.slxh"/>
       		</td>
       	</tr>
       </table>
	</body>
</html>