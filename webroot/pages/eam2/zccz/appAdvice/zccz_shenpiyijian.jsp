<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.tansun.eam2.common.model.orm.bo.CzXmSpwYj"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.tansun.eam2.zccz.vo.CztzfaXxVO"%>
<%@include file="/inc/taglibs.inc"%>
<%@include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/inc/word.inc"%>
<%
	CzXmSpwYj czXmSpwYj = (CzXmSpwYj)request.getAttribute("czXmSpwYj");
	CztzfaXxVO disposeHead = (CztzfaXxVO)request.getAttribute("disposeHead");
	String todoId = request.getParameter("todoId");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<base href="<%=basePath %>" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>资产处置</title>
		<script type="text/javascript">
			var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";
			$(function(){
				//设置资产grid宽度
				jQuery("#jygdzcList").setGridWidth($("#form").width());
				jQuery("#dczzcList").setGridWidth($("#form").width());
				jQuery("#stzcList").setGridWidth($("#form").width());
				jQuery("#entity_asset_list").setGridWidth($("#form").width());
				jQuery("#loan_pledge_asset_list").setGridWidth($("#form").width());
				jQuery("#zyzc_asset_list").setGridWidth($("#form").width());
				jQuery("#zqList").setGridWidth($("#form").width());
				jQuery("#file_list").setGridWidth($("#form").width());
				jQuery("#blyj_reason_list").setGridWidth($("#form").width());
				jQuery("#file_hgsc_endlist").setGridWidth($("#form").width());
				$(window).bind('resize', function(){
					jQuery("#jygdzcList").setGridWidth($("#form").width());
					jQuery("#dczzcList").setGridWidth($("#form").width());
					jQuery("#stzcList").setGridWidth($("#form").width());
					jQuery("#entity_asset_list").setGridWidth($("#form").width());
					jQuery("#loan_pledge_asset_list").setGridWidth($("#form").width());
					jQuery("#zyzc_asset_list").setGridWidth($("#form").width());
					jQuery("#zyzc_asset_list").setGridWidth($("#form").width());
					jQuery("#zqList").setGridWidth($("#form").width());					
					jQuery("#file_list").setGridWidth($("#form").width());
					jQuery("#blyj_reason_list").setGridWidth($("#form").width());
					jQuery("#file_hgsc_endlist").setGridWidth($("#form").width());
				});
				$("#butongyi").val($("#tongyi").val() == '0'?'1':'0');
				$("#form input").attr("readonly","readonly");
				$("#form select").attr("disabled","disabled");
				$("#stxx input").attr("readonly","readonly");
				$("#stxx select").attr("disabled","disabled");
				
			<%if(StringUtils.equals("0",czXmSpwYj.getSftjspyj())){%>
				var buttonsString0 = '[{"buttonHandler":"submitApp","buttonIcon":"icon-ok","buttonText":"提交"}]';
				addButtons($("#submitTd"),buttonsString0);
			<%}%>
			
			<%if(StringUtils.equals("1",czXmSpwYj.getSfwzcr())){%>
				var buttonsString1 = '[{"buttonHandler":"viewWyYj","buttonIcon":"icon-ok","buttonText":"查看委员汇总意见"}]';
				addButtons($("#submitTd"),buttonsString1);
			<%}%>			

				$("#myForm").ajaxForm({
					success:function(returnStr){
						if("SUCCESS" == returnStr){
							alert("提交成功！");
							window.opener.reloadGrid();
							window.close();
						}else{
							alert("提交意见出现异常,请联系管理员！");
						}
					}
				});
				//查看正文按钮
				var buttonStr_zhengwen = '[{"buttonHandler":"viewzhengwen","buttonIcon":"icon-viewFile","buttonText":"查看处置报告"}]';
				addButtons($("#stInfoButton"),buttonStr_zhengwen);
			});
			
			function viewWyYj(){
				var url = "<%=basePath %>zccz/dealTrace1Head_viewSummaryInfo2.do?cldId=<%=disposeHead.getId()%>";
				window.open(url);
			}
			
			function changeBty(obj){
				$("#butongyi").val($(obj).val() == '0'?'1':'0');
			}
			
			function submitApp(){
				var tongyi = document.getElementById("tongyi").value;
				var spyjjy = document.getElementById("spyjjy").value;
				if(tongyi == "0"){
					if(spyjjy == ""){
						alert("请填写审批意见!");
					}else{
						$(myForm).submit();
					}
				}else{
						$(myForm).submit();
				}
			}
			
			function fillExpensesDetail(){
				window.open('<%=basePath %>zccz/personDealHead_feiyongDetail.do?headId=<%=disposeHead.getId()%>&authority=r','','');
			}
			//查看处置报告
			function viewzhengwen(){
				wordTemplate('bank_Template', document.getElementById("myform"),true,false,"资产处置报告"); 
			}
			//双击查看资产
			function lookAsset(gr){
				//window.open('<%=basePath%>jygdzc/AssetManageBody_viewAsset.do?sheettype=assetXxInfo&zcId='+gr,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
				window.open('<%=basePath%>jygdzc/AssetManageBody_viewAsset.do?sheettype=assetXxInfo&zcId='+gr);
			}		
			//双击查看实体内资产
			function lookdblclickAss(gr){
				var fsxxId = jQuery("#entity_asset_list").getCell(gr,"bstid");
				var zixunType = jQuery("#entity_asset_list").getCell(gr,"stlx");
				if("0" == zixunType || "3" == zixunType){
					window.open('<%=basePath %>stgl/weihu_newEntity.do?stid='+fsxxId+'&stlx='+0+'&rework='+1+'&look='+1);
				}else if("1" == zixunType){
					window.open('<%=basePath %>stgl/weihu_newNonEntity.do?rework='+1+'&stid='+fsxxId+'&stlx='+1+'&look='+1);
				}
			}										
		</script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		<!-- 意见域、 依据和文件上传需要表单id
			<s:hidden name="deptid" value="11318" />
		 -->
		<!-- 意见域、 依据和文件上传需要表单id -->
		<br/>
		<br/>
		<div align="center">
			<span class="STYLE7 STYLE1">资产处置审批意见表
			<span style="width:100%; z-index: 9;position: fixed;" id="stInfoButton"></span>
			</span>
		</div>
		<br/>
		<hr color="#6600CC" align="center" width="100%" />
		<table width="99%" border="0" cellspacing="0" cellpadding="0" id="form">
			<tr>
				<td class="td_zxy01">
					<font color="#FF0000"><strong>*</strong></font>处置项目名称：</td>
				<td class="td_form02" colspan="3">
					<s:textfield name="disposeHead.cztzxmmc" size="126" cssClass="input"/></td>						
			</tr>
			<tr>
			  <td height="24"  class="td_zxy01" align="center">编号：</td>
			  <td class="td_form02"><s:textfield name="disposeHead.bianhao" size="35" cssClass="input" readonly="true"/></td>
			  <td class="td_zxy01"> 急缓程度：</td>
			  <td class="td_form02"><s:select list="{'一般','急','特急'}" name="disposeHead.jhcd"/></td>
		  	</tr>
			<tr>
				<td height="24" class="td_zxy01" align="center">
					<font color="#FF0000"><strong>*</strong></font>拟稿日期：</td>
				<td class="td_form02">
					<s:date name="disposeHead.ngrq" format="yyyy-MM-dd" var="ngrq"/>
					<s:textfield id="ngrq" name="disposeHead.ngrq" value="%{#ngrq}" size="35" cssClass="input" readonly="true"/></td>
				<td  align="center" class="td_zxy01">
					<font color="#FF0000"><strong>*</strong></font>拟稿部门：</td>
				<td  class="td_form02">
					<s:hidden name="disposeHead.ngbm" />
					<s:textfield name="disposeHead.ngbmmc" size="35" cssClass="input" readonly="true"/></td>
			</tr>
			<tr>
				<td height="24" class="td_zxy01">
					<font color="#FF0000"><strong>*</strong></font>拟稿人：</td>
				<td class="td_form02">
					<s:hidden name="disposeHead.ngr"/>
					<s:textfield name="disposeHead.ngrxm" size="35" readonly="true" cssClass="input"/>
				</td>
				<td class="td_zxy01">
					<font color="#FF0000"><strong>*</strong></font>联系电话：</td>
				<td class="td_form02">
					<s:textfield name="disposeHead.lxdh" size="35" cssClass="input"/></td>
			</tr>
			<tr>
				<td class="td_zxy01">
					<font color="#FF0000"><strong>*</strong></font>资产所在位置：</td>
				<td colspan="3"  class="td_form02">
					<s:textfield name="disposeHead.zcszwz" size="126" cssClass="input"/></td>
			</tr>
			<tr>
				<td class="td_zxy01" >
					<font color="#FF0000"><strong>*</strong></font>处置资产类别：
				</td>
			    <td class="td_zxy02" colspan="3">
			    	<s:checkboxlist name="disposeHead.zclbList" id="zclb" list="#{0:'经营性固产',1:'实体内资产',2:'委贷抵债物',4:'自用资产','5':'待处置资产','6':'受托资产','7':'债券'}" disabled="true"/>
			    </td>				
			</tr>
			<tr>
				<td class="td_zxy01" height="24">评估机构名称：</td>
			    <td class="td_form02" colspan="3"><r:textfield name="disposeHead.pgjgmc"  id="pgjgmc" size="126" cssClass="input" readonly="true"/></td>  
			</tr>	
			<tr>
				<td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>建议处置回收金额（元）：</td>
				<td class="td_form02"><r:textfield name="disposeHead.yjczhsjewy" id="yjczhsje"  size="35" cssClass="input" readonly="true"/></td>
				<td class="td_zxy01" height="24"><font color="#FF0000"><strong>*</strong></font>预计处置费用（元）：</td>
			    <td class="td_form02"><r:textfield name="disposeHead.yjczfy" id="yjczfy" readonly="true"></r:textfield>
					<e:pc id="expensesDetail_button">
				    	<input type="button" id="expensesDetail" style="width:25%" value="费用明细" onclick="fillExpensesDetail()" />
					</e:pc>				    
			    </td>  
			</tr>	
			<tr>
				<td class="td_zxy01" height="24"><font color="#FF0000"><strong>*</strong></font>预计损失金额（元）：</td>
			    <td class="td_form02">
			    	<r:textfield name="disposeHead.yjssjewy" size="35" cssClass="input" id="yjssje" readonly="true"/>
			    </td>  	
				<td class="td_zxy01">预计损失率：</td>
			    <td class="td_form02">
			    	<r:textfield  name="disposeHead.yjssl" size="35"  readonly="true" cssClass="input"/>
			    </td>
			</tr>	
			<tr>
				<td class="td_zxy01" height="24">重报次数：</td>
			    <td class="td_form02"><s:textfield name="disposeHead.cbcs" size="35" cssClass="input" id="cbcs" readonly="true"></s:textfield>
			    </td>  
			    <td class="td_zxy01"><font color="#FF0000"><strong>*</strong></font>处置申报方式：</td>
	            <td class="td_form02"><r:select list="#{'':'--请选择--',0:'首次',1:'变更',2:'重报'}" name="disposeHead.czsbfs" id="czsbfs"  value="%{#request.disposeHead.czsbfs}" disabled="true"></r:select></td>
			</tr>	
			<tr>
				<td class="td_zxy01" height="24">是否经过评估审查：</td>
			    <td class="td_form02">
			    <s:radio name="disposeHead.sfjpgsc"  list="#{0:'否',1:'是'}" id="sfjpgsc"  value="%{#request.disposeHead.sfjpgsc}" disabled="true"></s:radio>
			    </td>  
				<td class="td_zxy01">评估报告失效期截止日期：</td>
		        <td class="td_form02">
		        	<s:date name="disposeHead.pgbgsxqjzrq" format="yyyy-MM-dd" var="reportDeadline"/>
					<r:textfield name="disposeHead.pgbgsxqjzrq" value="%{#reportDeadline}" id="reportDeadline" cssClass="input" readonly="true"/>
		        </td>
			</tr>	
			<tr>
			 <td class="td_zxy01" height="24">
			  <font color="#FF0000"><strong>*</strong></font>申报材料清单：</td>
			    <td colspan="3" class="td_form02">  
			     <table>
	               <tbody>					  
	                  <tr>   
	                     <td><s:checkbox name="disposeHead.sfysbd" id="sfysbd"  disabled="true"/>资产处置申报单</td>
	                     <td><s:checkbox name="disposeHead.sfyczfa" id="sfyczfa"  disabled="true"/>资产处置方案</td>
	                     <td><s:checkbox name="disposeHead.sfysjqk" id="sfysjqk"  disabled="true"/>财务审计情况</td>
	                     <td><s:checkbox name="disposeHead.sfypgbg" id="sfypgbg"  disabled="true"/>资产评估报告</td>
	                  </tr>   
	            	</tbody>
			     </table>
			    </td>
		    </tr> 
		    <tr> 
			   <td class="td_zxy01">其他申报材料：</td>
			   <td class="td_form02" colspan="3"><r:textfield name="disposeHead.qtsbcl" id="qtsbcl"  cssClass="input" readonly="true"/></td>
			</tr>
        	<tr>
        		<td class="td_zxy01">申报日期：</td>
        		<td class="td_zxy02">
        			<s:date name="disposeHead.sbrq" var="sbrqDate" format="yyyy-MM-dd"/>
        			<r:textfield cssClass="input" id="sbrq" name="disposeHead.sbrq" value="%{#sbrqDate}" readonly="true"/>
        		</td>
        		<td class="td_zxy01">受理序号：</td>
        		<td class="td_zxy02">
        			<r:textfield cssClass="input" id="slxh" name="disposeHead.slxh" readonly="true"/>
        		</td>
        	</tr>
			<tr>
	      		<td class="td_zxy01">会议时间：</td>
	      		<td class="td_zxy02">
	      			<s:textfield cssClass="input" id="spsj" name="xmxxLsb.spsj"/>
	      		</td>
	      		<td class="td_zxy01">会议或会签次数：</td>
	      		<td class="td_zxy02">
	      			<s:textfield cssClass="input" id="hycs" name="xmxxLsb.hycs"/>
	      		</td>
      		</tr>		
		</table>
		<!--	经验性固定资产		-->
		<div style="display:<%=disposeHead.getZclb()!=null?(disposeHead.getZclb().contains("0")?"block":"none"):"none" %>" id="jygdzcListDiv"><table id="jygdzcList"></table></div>
		<!--	待处置资产		-->
		<div style="display:<%=disposeHead.getZclb()!=null?(disposeHead.getZclb().contains("5")?"block":"none"):"none" %>" id="dczzcListDiv"><table id="dczzcList"></table></div>
		<!--	受托资产		
		<div style="display:<%=disposeHead.getZclb()!=null?(disposeHead.getZclb().contains("6")?"block":"none"):"none" %>" id="stzcListDiv"><table id="stzcList"></table></div>
		-->
		<!--	实体内资产		-->
		<div style="display:<%=disposeHead.getZclb()!=null?(disposeHead.getZclb().contains("1")?"block":"none"):"none" %>" id="entity_asset"><table id="entity_asset_list"></table></div>
		<!--	委贷抵债物		-->
		<div style="display:<%=disposeHead.getZclb()!=null?(disposeHead.getZclb().contains("2")?"block":"none"):"none" %>" id="loan_pledge_asset"><table id="loan_pledge_asset_list"></table></div>
		<!--	自用资产			-->
		<div style="display:<%=disposeHead.getZclb()!=null?(disposeHead.getZclb().contains("4")?"block":"none"):"none" %>" id="zyzc_asset"><table id="zyzc_asset_list"></table></div>
		<!--	债券		-->
		<div style="display:<%=disposeHead.getZclb()!=null?(disposeHead.getZclb().contains("7")?"block":"none"):"none" %>" id="zqListDiv"><table id="zqList"></table></div>
		<s:form action="zccz/appAdviceAction_submitAdvice.do" id="myForm">
		<r:userhidden id="userid" />
		<r:depthidden view="N" name="deptnameshow" />
		<r:depthidden view="N" name="deptid"  /> 
		<s:hidden name="head.ngbm" id="ngbm"  value="%{#request.disposeHead.ngbm}" />
		<s:set name="biaodanid" value="disposeHead.id" />
		<s:hidden name="biaodanid" value="%{#request.disposeHead.id}" />
		<%@ include file="/inc/according.inc"%>
		<e:opinion id="test" width="100%">
			<e:opinionPart viewArea="false" id="LEADER" name="LEADER" biaodanid="%{#request.disposeHead.id}" value="" text="批示意见："></e:opinionPart>
			<e:opinionPart viewArea="false" id="OPERATION_GROUP" biaodanid="%{#request.disposeHead.id}" name="OPERATION_GROUP" value="" text="业务运营组意见："></e:opinionPart>
			<e:opinionPart viewArea="false" id="DRAFT_DEPT" biaodanid="%{#request.disposeHead.id}" name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
			<e:opinionPart viewArea="false" id="CHECK" biaodanid="%{#request.disposeHead.id}"  name="CHECK" value="" text="合规审查意见："></e:opinionPart>
		</e:opinion>
		<%@ include file="/inc/file.inc"%>
		<%@ include file="/inc/file_heguishencha_end.inc"%>		
		<s:hidden id="czXmSpwYjId" name="czXmSpwYj.id" />
		<input type="hidden" id="todoId" name="todoId" value="<%=todoId %>" />
		<table class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
	      		<td class="td_zxy01">审批结论：</td>
	      		<td class="td_zxy02">
	      		<table width="100%">
	      			<tr>
	      				<td style="width: 20%;">
	      					<s:hidden id="butongyi" name="czXmSpwYj.butongyi" />
	      					<%if(StringUtils.equals("1",czXmSpwYj.getSftjspyj())){%>
	      						<s:select id="tongyi" name="czXmSpwYj.tongyi" list="#{'1':'同意','0':'不同意'}" onchange="changeBty(this)" disabled="true" />
	      					<%}else{ %>
	      						<s:select id="tongyi" name="czXmSpwYj.tongyi" list="#{'1':'同意','0':'不同意'}" onchange="changeBty(this)" />
	      					<%} %>
	      				</td>
	      				<td align="right" style="width: 20%;">
	      					<s:hidden id="tyyjsj" name="czXmSpwYj.tyyjsj" value="%{#tyyjsj}"/>
	      				</td>
	      				<td id="submitTd"></td>
	      			</tr>
	      		</table>
	      		</td>
	     	</tr>
	     	<tr>
	      		<td class="td_zxy01">其它情况：</td>
	      		<td class="td_zxy03" >
				<%if(StringUtils.equals("1",czXmSpwYj.getSftjspyj())){%>
					<s:textarea id="qtqk" name="czXmSpwYj.qtqk" cssClass="input" rows="4" readonly="true" />
				<%}else{ %>
					<s:textarea id="qtqk" name="czXmSpwYj.qtqk" cssClass="input" rows="4" />
				<%} %>      		
	      		</td>
	     	</tr>
	     	<tr>
	      		<td class="td_zxy01">审批意见和建议：</td>
	      		<td class="td_zxy03" >
				<%if(StringUtils.equals("1",czXmSpwYj.getSftjspyj())){%>
					<s:textarea id="spyjjy" name="czXmSpwYj.spyjjy" cssClass="input" rows="4" readonly="true" />
				<%}else{ %>
	      			<s:textarea id="spyjjy" name="czXmSpwYj.spyjjy" cssClass="input" rows="4" />
	      		<%} %>
	      		</td>
	     	</tr>
		</table>
		</s:form>
	</body>
</html>
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
			colNames:['id','azcid','资产名称','资产权属','主卡片编号','主卡片名称', '账面原值', '账面净值','评估价值','上会次数','处置方式'],
			colModel:[	
				{name:'id',index:'id',hidden:true},
				{name:'azcid',index:'azcid',hidden:true},
				{name:'azcmc',index:'azcmc',sortable:true},
				{name:'zcqs',index:'zcqs',sortable:true},
				{name:'azkpbh',index:'azkpbh',sortable:true},
				{name:'azkpmc',index:'azkpmc',sortable:true},
				{name:'zmyz',index:'zmyz',formatter:'number',sortable:true},
				{name:'zmjz',index:'zmjz',formatter:'number',sortable:true},
				{name:'apgjz',index:'apgjz',sortable:true},
				{name:'dqshcs',index:'dqshcs',sortable:true},
				{name:'CCzfs',index:'CCzfs',formatter:"select",editable: true,edittype:"select",editoptions:{
						value:"${czfsJson}"
					},sortable:true
				}		
			],
			height:'auto',
			rowNum:0,
			autowidth:true,
			multiselect: true,
			caption: '经营性固定资产（单位：元）',
			footerrow : true, 
			userDataOnFooter : true, 
			viewrecords:true,
			ondblClickRow:function(gr){
				var id  = jQuery("#jygdzcList").getCell(gr,'azcid');
				lookAsset(id);
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
			colNames:['id','资产名称','主卡片编号','主卡片名称', '账面原值', '账面净值','评估价值','上会次数','处置方式'],
			colModel:[
				{name:'id',index:'id',hidden:true},
				{name:'azcmc',index:'azcmc',sortable:false},
				{name:'azkpbh',index:'azkpbh',sortable:false},
				{name:'azkpmc',index:'azkpmc',sortable:false},
				{name:'zmyz',index:'zmyz',formatter:'number',sortable:false},
				{name:'azmjz',index:'azmjz',sortable:false},
				{name:'apgjz',index:'apgjz',sortable:false},
				{name:'dqshcs',index:'dqshcs',sortable:false},
				{name:'CCzfs',index:'CCzfs',formatter:"select",editable: true,edittype:"select",editoptions:{
						value:"${czfsJson}"
					},sortable:false
				}								
			],
			height:'auto',
			autowidth:true,
			rowNum:0,
			multiselect: true,
			caption: '待处置资产（单位：元）',
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
			colNames:['id','实体Id','实体类型','实体名称','资产编号','资产名称','资产类型', '实际占有人', '评估价值','存放位置','上会次数','处置方式'],
			colModel:[
				{name:'id',index:'id',hidden:true},
				{name:'bstid',index:'bstid',hidden:true},
				{name:'stlx',index:'stlx',hidden:true},
				{name:'bstmc',index:'bstmc',sortable:true},
				{name:'bzcbh',index:'bzcbh',sortable:true},
				{name:'bzcmc',index:'bzcmc',sortable:true},
				{name:'entityAssetType',index:'entityAssetType',sortable:true},
				{name:'bsjzyr',index:'bsjzyr',sortable:true},
				{name:'entityPgjz',index:'entityPgjz',formatter:'number',sortable:true},
				{name:'bcfwz',index:'bcfwz',sortable:true},
				{name:'dqshcs',index:'dqshcs',sortable:true},
				{name:'CCzfs',index:'CCzfs',formatter:"select",editable: true,edittype:"select",editoptions:{
						value:"${czfsJson}"
					},sortable:true
				}
			],
			height:'auto',
			autowidth:true,
			rowNum:0,
			multiselect: true,
			caption: '实体内资产（单位：元）',
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
			colNames:['id','资产编号','资产名称','资产类型', '实际占有人', '评估价值','存放位置','上会次数','处置方式'],
			colModel:[
				{name:'id',index:'id',hidden:true},
				{name:'czcbh',index:'czcbh',sortable:false},
				{name:'czcmc',index:'czcmc',sortable:false},
				{name:'czclx',index:'czclx',sortable:false},
				{name:'csjzyr',index:'csjzyr',sortable:false},
				{name:'loanPledgePgjz',index:'loanPledgePgjz',sortable:false},
				{name:'ccfwz',index:'ccfwz',sortable:false},
				{name:'dqshcs',index:'dqshcs',sortable:false},
				{name:'CCzfs',index:'CCzfs',formatter:"select",editable: true,edittype:"select",editoptions:{
						value:"${czfsJson}"
					},sortable:false
				}							
			],
			height:'auto',
			autowidth:true,
			rowNum:0,
			multiselect: true,
			caption: '委贷抵债物（单位：元）',
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
			colNames:['id','资产编号','资产名称','卡片编号','卡片名称','财产原值','保管地点', '上会次数','处置方式'],
			colModel:[
				{name:'id',index:'id',hidden:true},
				{name:'zyzcbh',index:'zyzcbh',sortable:false},
				{name:'zyzcmc',index:'zyzcmc',sortable:false},
				{name:'zykpbh',index:'zykpbh',sortable:false},
				{name:'zykpmc',index:'zykpmc',sortable:false},
				{name:'zyccyzWy',index:'zyccyzWy',sortable:false},
				{name:'zybgdd',index:'zybgdd',sortable:false},
				{name:'dqshcs',index:'dqshcs',sortable:false},
				{name:'CCzfs',index:'CCzfs',formatter:"select",editable: true,edittype:"select",editoptions:{
						value:"${czfsJson}"
					},sortable:false
				}							
			],
			height:'auto',
			autowidth:true,
			multiselect: true,
			caption: '自用资产（单位：元）',
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
			cldId:"<%=disposeHead.getId()%>",
			cscldid:"<%=disposeHead.getCscldid()%>",
			assetType:"7"
		},
		datatype: "json",
		multiselect:true,
		colNames:['id','项目名称','债券种类','债券名称','行名','到期日','处置方式'],
		colModel:[
			{name:'id',index:'id',hidden:true},
			{name:'fzqxmmc',index:'fzqxmmc',sortable:false},
			{name:'zqzlmc',index:'zqzlmc',sortable:false},
			{name:'zqmc',index:'zqmc',sortable:false},
			{name:'jhfhmc',index:'jhfhmc',sortable:false},
			{name:'dqr',index:'DQR',sortable:false},
			{name:'CCzfs',index:'CCzfs',formatter:"select",editable: true,edittype:"select",editoptions:{
					value:"${czfsJson}"
				},sortable:false
			}
		],
		rownumbers:true,
		autowidth:true,
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