<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@page import="com.tansun.eam2.common.model.orm.bo.CzXmSpwYj"%>
<%@page import="com.tansun.eam2.common.model.orm.bo.CzStcztz"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/inc/word.inc"%>
<%
	CzXmSpwYj czXmSpwYj = (CzXmSpwYj)request.getAttribute("czXmSpwYj");
	CzStcztz head = (CzStcztz)request.getAttribute("head");
	String todoId = request.getParameter("todoId");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
	<head>
		<base href="<%=basePath %>" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>实体人员安置</title>
		<script type="text/javascript">
			var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";
			$(function(){
				$("#personInfo").panel({width:$("#conditions").width(),collapsible:true});
				jQuery("#blyj_reason_list").setGridWidth($("#conditions").width());
				jQuery("#file_hgsc_endlist").setGridWidth($("#conditions").width());
				jQuery("#file_list").setGridWidth($("#conditions").width());
				jQuery("#file_huiqianlist").setGridWidth($("#conditions").width());
				
				$(window).bind('resize', function(){
					$("#personInfo").panel({width:$("#conditions").width(),collapsible:true});
					jQuery("#blyj_reason_list").setGridWidth($("#conditions").width());
					jQuery("#file_hgsc_endlist").setGridWidth($("#conditions").width());
					jQuery("#file_list").setGridWidth($("#conditions").width());
					jQuery("#file_huiqianlist").setGridWidth($("#conditions").width());
					
				});
				setRenyuanInfo();
				
				$("#butongyi").val($("#tongyi").val() == '0'?'1':'0');
				
				$("#conditions input").attr("readonly","readonly");
				$("#conditions select").attr("disabled","disabled");
				$("#stxx input,#stxx textarea").attr("readonly","readonly");
				$("#stxx select").attr("disabled","disabled");
				
				<%if(StringUtils.equals("0",czXmSpwYj.getSftjspyj())){%>
					var buttonsString0 = '[{"buttonHandler":"submitApp","buttonIcon":"icon-ok","buttonText":"提交"}]';
					addButtons($("#submitTd"),buttonsString0);
				<%}%>
				
				<%if(StringUtils.equals("1",czXmSpwYj.getSfwzcr())){%>
					var buttonsString2 = '[{"buttonHandler":"viewWyYj","buttonIcon":"icon-ok","buttonText":"查看委员汇总意见"}]';
					addButtons($("#submitTd"),buttonsString2);
				<%}%>	
								
				var buttonStr_zhengwen = '[{"buttonHandler":"viewzhengwen()","buttonIcon":"icon-viewFile","buttonText":"查看处置报告"}]';
					addButtons($("#submitTd"),buttonStr_zhengwen);
				
				if($("#gszmnsfyysfzje").val() == '无'){
					$("#gszmnsfyysfzjeDiv").hide();
				}else{
					$("#gszmnsfyysfzjeDiv").show();
				}
				if($("#ryazfysfxjtdf").val() == '0'){
					$("#ryazfysfxjtdfDiv").hide();
				}else{
					$("#ryazfysfxjtdfDiv").show();
				}
				if($("#fzje").val() == '无'){
					$("#fzjeDiv").hide();
				}else{
					$("#fzjeDiv").show();
					<%					  
		             if(head!=null&&head.getFzje()!=null&&!"".equals(head.getFzje())){
	                %>
					   $("#fzje").val(${head.fzje}.toFixed(2));
					<%
					   } 
					%>
					
				}
				
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
			
			function viewWyYj(){
				var url = "<%=basePath %>zccz/dealTrace1Head_viewSummaryInfo2.do?cldId=<%=head.getId()%>";
				window.open(url);
			}
			
			//查看处置报告
			function viewzhengwen(){
				wordTemplate('bank_Template', document.getElementById("myform"),true,false,"资产处置报告"); 
			}
			
			function changeBty(obj){
				$("#butongyi").val($(obj).val() == '0'?'1':'0');
			}
			
			function setRenyuanInfo(){
				$.post("<%=basePath %>zccz/personDealHead_setRyFyInfo.do",{
					"head.id" : '' + $("#id").val()
				},function(returnStr){
					var returnObj = eval('(' + returnStr + ')');
					//alert(returnObj.azrs + ":" + returnObj.azfy);
					$("#azrs").val(returnObj.azrs);
					$("#azfy").val(returnObj.azfy);
				});
			}
			
			function feiyongDetail(authority){
				window.open('<%=basePath %>zccz/personDealHead_feiyongDetail.do'
				+ '?authority=' + authority 
				+ '&headId=' + $("#id").val(),'',winOpenStr);
			}
			
			function renyuanDetail(authority){
				if($("#stid").val() == null || $("#stid").val() == ""){
					alert("请先选择实体");
					return false;
				}
				window.open('<%=basePath %>zccz/personDealHead_renyuanDetail.do?' 
				+ 'authority=' + authority 
				+ '&stid=' + $("#stid").val() 
				+ '&headId=' + $("#id").val(),'',winOpenStr);
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
		</script>
	</head>
	<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
		
		<!-- 意见域、 依据和文件上传需要表单id -->
		<s:hidden id="id" name="head.id" value="%{#request.head.id}"/>
		<s:hidden id="lcId" name="head.lcId" />
		<s:hidden id="headId" name="headId" value="%{#request.head.id}"/>
		<s:hidden id="lcmc" name="head.lcmc" value="实体人员安置"/>
		<s:hidden id="fblsj" name="head.fblsj" />
		<s:set name="biaodanid" value="head.id" />
		<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
		
		<br>
		<br>
		<div align="center">
			<span class="STYLE7 STYLE1">资产处置审批意见表</span>
		</div>
		<br>
		<table width="100%" border="0" cellpadding="2" cellspacing="0" align="center">
			<tr>
				<td align="right">当前环节：拟稿 &nbsp;&nbsp;</td>
				<td width="150" align="right">当前处理人：<s:property value="%{#request.user.username}"/></td>
			</tr>
		</table>
		<hr />
		<table width="100%" id="conditions" class="newtable" border="0" cellpadding="2" cellspacing="0" align="center">
			<tr>
				<td class="td_zxy01">处置项目名称：</td>
				<td class="td_zxy02" colspan="3">
					<s:textfield cssClass="input" id="czxmmc" name="head.czxmmc" required="true"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">呈送：</td>
				<td colspan="3" class="td_zxy02">
					<s:textfield cssClass="input" id="chengsong" name="head.chengsong"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">编号：</td>
				<td class="td_zxy02">
					<s:textfield cssClass="input" id="bianhao" name="head.bianhao" readonly="true"/>
				</td>
				<td class="td_zxy01">急缓程度：</td>
				<td class="td_zxy02">
					<s:select cssClass="input" list="#{'0':'一般','1':'急','2':'特急'}" />
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">拟稿日期：</td>
				<td class="td_zxy02">
					<s:date name="head.ngrq" format="yyyy-MM-dd" var="draftDate"/>
					<s:textfield cssClass="input" id="ngrq" name="head.ngrq" value="%{#draftDate}" readonly="true"/>
				</td>
				<td class="td_zxy01" width="120">拟稿部门：</td>
				<td class="td_zxy02">
					<s:hidden id="ngbm" name="head.ngbm" />
					<s:textfield cssClass="input" id="ngbmmc" name="head.ngbmmc" readonly="true"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">拟稿人：</td>
				<td class="td_zxy02">
					<s:hidden id="ngr" name="head.ngr"/>
					<s:textfield cssClass="input" id="ngrxm" name="head.ngrxm" readonly="true"/>
				</td>
				<td class="td_zxy01">联系电话：</td>
				<td class="td_zxy02">
					<s:textfield cssClass="input" id="lxdh" name="head.lxdh"/>
				</td>
			</tr>
			<tr>
				<td class="td_zxy01">是否上会：</td>
				<td class="td_zxy02">
					<s:select id="sfsh" cssClass="input" name="head.sfsh" list="{'是','否'}" />
				</td>
				<td class="td_zxy01">&nbsp;</td>
				<td class="td_zxy02">&nbsp;</td>
			</tr>
			<tr>
				<td class="td_zxy01">会签部门：</td>
				<td class="td_zxy02" colspan="2">
					<s:hidden id="" name="" />
					<s:textfield cssClass="input" id="" name="" />
				</td>
				<td class="td_zxy02" id="buttonTd_huiqian">&nbsp;</td>
			</tr>
		</table>
		<div id="personInfo" title="人员安置信息" collapsible="true">
			<table id="stxx" width="100%" class="newtable" border="0" cellpadding="2" cellspacing="0" align="center">
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
					<td class="td_zxy01">实体有无有效资产：</td>
					<td class="td_zxy02">
						<s:select cssClass="input" id="stywyxzc" name="head.stywyxzc" list="{'无','有'}" />
					</td>
					<td class="td_zxy01">对建投是否有负债：</td>
					<td class="td_zxy02">
						<s:select cssClass="input" id="djtstyzr" onchange="showFzje(this)" name="head.djtstyzr" list="{'无','有'}" />
						<s:div id="fzjeDiv" cssStyle="display:none;"><s:textfield cssClass="input" id="fzje" name="head.fzje" />(元)</s:div>
						<script type="text/javascript">
							function showFzje(obj){
								if($(obj).val() == '无'){
									$("#fzjeDiv").hide();
								}else{
									$("#fzjeDiv").show();
								}
							}
						</script>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						人员安置费用是否需建投垫付：
					</td>
					<td class="td_zxy02">
						<s:select cssClass="input" onchange="showDfje(this)" id="ryazfysfxjtdf" name="head.ryazfysfxjtdf" list="#{'0':'否','1':'是'}" />
						<s:div id="ryazfysfxjtdfDiv" cssStyle="display:none;"><s:textfield cssClass="input" id="dfje" name="head.dfje" />(元)</s:div>
					</td>
					<td class="td_zxy01">公司账面内是否有预计负债金额：</td>
					<td class="td_zxy02">
						<s:select cssClass="input" list="{'无','有'}" onchange="showGszmnsfyysfzjeDiv(this)" id="gszmnsfyysfzje" name="head.gszmnsfyysfzje" />
						<s:div id="gszmnsfyysfzjeDiv" cssStyle="display:none;"><s:textfield cssClass="input" id="yjfzje" name="head.yjfzje"/>(元)</s:div>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						安置人员明细：
					</td>
					<td class="td_zxy02" id="renyuanTd">
						<a href="javascript:void(0);" plain="true" onclick="renyuanDetail('r');return false;" icon="icon-search" class="easyui-linkbutton">安置人员明细</a>
					</td>
					<td class="td_zxy01">
						安置费用明细：
					</td>
					<td class="td_zxy02" id="feiyongTd">
						<a href="javascript:void(0);" plain="true" onclick="feiyongDetail('r');return false;" icon="icon-search" class="easyui-linkbutton">安置费用明细</a>
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						安置人数：
					</td>
					<td class="td_zxy02">
						<s:textfield cssClass="input" id="azrs" name="head.azrs" readonly="true" />
					</td>
					<td class="td_zxy01">
						安置总费用(元)：
					</td>
					<td class="td_zxy02">
						<s:textfield cssClass="input" id="azfy" name="head.azfy" readonly="true" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						处置申报方式：
					</td>
					<td class="td_zxy02">
						<s:select cssClass="input" id="czsbfs" name="head.czsbfs" list="#{'0':'首次','1':'重报','2':'变更'}" />
					</td>
					<td class="td_zxy01">
						合规审查次数:
					</td>
					<td class="td_zxy02">
						<s:textfield cssClass="input" id="hgsccs" name="head.hgsccs" />
					</td>
				</tr>
				<tr>
					<td class="td_zxy01">
						安置说明：
					</td>
					<td colspan="3" class="td_zxy02">
						<s:textarea cssClass="input2" cols="4" id="azsm" name="head.azsm" />
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
		<%@ include file="/inc/according.inc"%>
		<e:opinion id="test" width="100%">
			<e:opinionPart viewArea="false" biaodanid="%{#request.biaodanid}" id="LEADER" name="LEADER" value="" text="批示意见："></e:opinionPart>
			<e:opinionPart viewArea="false" biaodanid="%{#request.biaodanid}" id="OPERATION_GROUP" name="OPERATION_GROUP" value="" text="业务运营组意见："></e:opinionPart>
			<e:opinionPart viewArea="false" id="MEETING_DEPT" biaodanid="%{#request.biaodanid}"  name="MEETING_DEPT" value="" text="会签部门意见："></e:opinionPart>
			<e:opinionPart viewArea="false" biaodanid="%{#request.biaodanid}" id="DRAFT_DEPT" name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
			<e:opinionPart viewArea="false" id="CHECK" biaodanid="%{#request.biaodanid}"  name="CHECK" value="" text="合规审查意见："></e:opinionPart>
		</e:opinion>
		<%@ include file="/inc/file.inc"%>
		<%@ include file="/inc/file_heguishencha_end.inc"%>
		
		<s:form action="zccz/appAdviceAction_submitAdvice.do" id="myForm">
		
	
<!-- 意见域、 依据和文件上传需要表单id -->
		<s:set name="biaodanid" value="head.Id" />
		<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
		
		<r:userhidden id="userid" name="userid"/>
		<r:depthidden view="N" name="deptnameshow" />
		<r:depthidden view="N" name="deptid" /> 
		
		<input type="hidden" id="todoId" name="todoId" value="<%=todoId %>" />
		<s:hidden id="czXmSpwYjId" name="czXmSpwYj.id" />
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