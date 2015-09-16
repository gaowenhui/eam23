<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%String SuccessReturn = request.getAttribute("SuccessReturn").toString();%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>"/>
        <title>固定资产实物台账</title>
        <script type="text/javascript">
        	//当前分类是否可以删除
        	var DQFLSFKYSC = false;
        	//SuccessReturn：保存成功后的页面的弹出窗口的值
        	//页面刷新后执行的操作
        	$(function(){
        		var successReturn = "<%=SuccessReturn%>";
	        	ejflRefresh($("#yjflbm"));
	        	if(successReturn != ""){
	        		alert(successReturn);
	        	}
	        	window.parent.clearPanelTool();
	        });
        	
        	//隐藏所有Div
        	function hiddenCondition(){
				$("#yjfl").attr("style","display:none");
				$("#ejfl").attr("style","display:none");
				$("#sjfl").attr("style","display:none");
			}
        	
        	//主控制JS，根据9个按钮传给buttonType和fljb的值选择不同的分支执行，如果选择的当前分类含有子分类
        	//则弹出提示框，提示不能删除当前分类
			function JsFunManage(buttonType,fljb){
				//var DQFLSFKYSC = false;
				var prefix = "<%=request.getContextPath()%>/zyzc/DicAppAssetType_";
				if(buttonType == "add" && fljb == "yjfl"){
					hiddenCondition();
					AddYJFLOperRefresh();
					$("#yjflTitle").html("增加一级分类");
					$("#yjfl").attr("style","display:block");
					$("#flForm").attr("action",prefix + "addFL.do?fljb=" + fljb);
				}
				if(buttonType == "add" && fljb == "ejfl"){
					if($("#yjflbm").val() == 0){
						hiddenCondition();
						alert("请先选择一级分类！");
					}else{
						hiddenCondition();
						AddEJFLOperRefresh();
						$("#ejflTitle").html("增加二级分类");
						$("#ejfl").attr("style","display:block");
						var yjflbm = $("#yjflbm").val();
						$("#flForm").attr("action",prefix + "addFL.do?fljb=" + fljb + "&yjflbm=" + yjflbm);
					}
				}
				if(buttonType == "add" && fljb == "sjfl"){
					if($("#yjflbm").val() == 0 || $("#ejflbm").val() == 0){
						hiddenCondition();
						alert("请先选择一、二级分类！");
					}else{
						hiddenCondition();
						AddSJFLOperRefresh();
						$("#sjflTitle").html("增加三级分类");
						$("#sjfl").attr("style","display:block");
						var yjflbm = $("#yjflbm").val();
						var ejflbm = $("#ejflbm").val();
						$("#flForm").attr("action",prefix + "addFL.do?fljb=" + fljb + "&yjflbm=" + yjflbm + "&ejflbm=" + ejflbm);
					}
				}
				if(buttonType == "del" && fljb == "yjfl"){
					if($("#yjflbm").val() == 0){
						hiddenCondition();
						alert("请选择要删除一级分类！");
					}else{
						var yjvl = $("#yjflbm").val();
						var flag = "";
						var checkUrl = '<%=basePath%>zyzc/DicAppAssetType_yjflDelCheck.do';
						$.post(checkUrl,{yjvl:"" + yjvl + ""}, function(data){
							if(data!="" && data!=null){
								flag = data;
								if(flag == "no"){
									hiddenCondition();
									alert("当前分类含有子分类，不可以被删除！");
									return false;
								}else{
									hiddenCondition();
									$("#yjflTitle").html("删除一级分类");
									YJFLOperRefresh();
									$("#yjfl").attr("style","display:block");
									$("#flForm").attr("action",prefix + "delFL.do?yjflbm=" + $("#yjflbm").val());
								}
							}
						});
					}
				}
				if(buttonType == "del" && fljb == "ejfl"){
					if($("#yjflbm").val() == 0 || $("#ejflbm").val() == 0){
						hiddenCondition();
						alert("请先选择一级分类，然后选择要删除的二级分类！");
					}else {
						var ejvl = $("#ejflbm").val();
						var flag = "";
						var checkUrl = '<%=basePath%>zyzc/DicAppAssetType_ejflDelCheck.do';
						$.post(checkUrl,{ejvl:"" + ejvl + ""}, function(data){
							if(data!="" && data!=null){
								flag = data;
								if(flag == "no"){
									hiddenCondition();
									alert("当前分类含有子分类，不可以被删除！");
								}else{
									hiddenCondition();
									EJFLOperRefresh();
									$("#ejflTitle").html("删除二级分类");
									$("#ejfl").attr("style","display:block");
									$("#flForm").attr("action",prefix + "delFL.do?ejflbm=" + $("#ejflbm").val());
								}
							}
						});
					}
				}
				if(buttonType == "del" && fljb == "sjfl"){
					var isFLCanBeDelete = true;
					if($("#yjflbm").val() == 0 || $("#ejflbm").val() == 0 || $("#sjflbm").val() == 0){
						hiddenCondition();
						alert("请先选择一、二级分类，然后选择要删除的三级分类！");
						return false;
					}
					var sjfl = $("#sjflbm").val();
					var checkUrl = '<%=basePath%>zyzc/DicAppAssetType_sjflDelCheck.do';
					$.post(checkUrl,{sjfl:"" + sjfl + ""}, function(data){
						if(data!="" && data!=null){
							flag = data;
							if(flag == "no"){
								hiddenCondition();
								alert("当前分类下含有物品，不能被删除！");
								return false;
							}else{
								hiddenCondition();
								SJFLOperRefresh();
								$("#sjflTitle").html("删除三级分类");
								$("#sjfl").attr("style","display:block");
								$("#flForm").attr("action",prefix + "delFL.do?sjflbm=" + $("#sjflbm").val());
							}
						}
					});
				}
				if(buttonType == "mod" && fljb == "yjfl"){
					if($("#yjflbm").val() == 0){
						hiddenCondition();
						alert("请选择要修改的一级分类！");
					}else{
						YJFLOperRefresh();
						hiddenCondition();
						$("#yjflTitle").html("修改一级分类");
						$("#yjfl").attr("style","display:block");
						$("#flForm").attr("action",prefix + "modFL.do?yjflbm=" + $("#yjflbm").val());
					}
				}
				if(buttonType == "mod" && fljb == "ejfl"){
					if($("#yjflbm").val() == 0 || $("#ejflbm").val() == 0){
						hiddenCondition();
						alert("请先选择一级分类，然后选择要修改的二级分类！");
					}else{
						EJFLOperRefresh();
						hiddenCondition();
						$("#ejflTitle").html("修改二级分类");
						$("#ejfl").attr("style","display:block");
						$("#flForm").attr("action",prefix + "modFL.do?ejflbm=" + $("#ejflbm").val() +"&yjflbm=" + $("#yjflbm").val());
					}
				}
				if(buttonType == "mod" && fljb == "sjfl"){
					if($("#yjflbm").val() == 0 || $("#ejflbm").val() == 0 || $("#sjflbm").val() == 0){
						hiddenCondition();
						alert("请先选择一、二级分类，然后选择要修改的三级分类！");
					}else{
						SJFLOperRefresh();
						hiddenCondition();
						$("#sjflTitle").html("修改三级分类");
						$("#sjfl").attr("style","display:block");
						var param = "sjflbm=" + $("#sjflbm").val() + "&ejflbm=" + $("#ejflbm").val() +"&yjflbm=" + $("#yjflbm").val();
						$("#flForm").attr("action",prefix + "modFL.do?" + param);
					}
				}
			}
			
			//当一级分类改变时触发此方法，显示出二级分类供选择
			function ejflRefresh(fl){
				hiddenCondition();
				$.post("<%=basePath%>zyzc/DicAppAssetType_ejflRefresh.do",{
					"queryPurVo.yjflbm" : $(fl).val()
				},function(returnStr){
					var returnObj = eval('(' + returnStr + ')');
					if(returnObj.ejfls.length>=1){
						for(var i=0; i<returnObj.ejfls.length; i++){
							$("#ejflbm").append("<option value='" + returnObj.ejfls[i].ejflbm + "'>" + returnObj.ejfls[i].ejflmc + "</option>");
						}
					}else{
						DQFLSFKYSC = true;
					}
				});
				$("#sjflbm").html("<option value='0'>--请选择--</option>");
				$("#ejflbm").html("<option value='0'>--请选择--</option>");
			}
			
			//当二级分类改变时触发此方法，显示出三级分类供选择（如果有三级分类）
			function sjflRefresh(fl){
				hiddenCondition();
				$.post("<%=basePath%>zyzc/DicAppAssetType_sjflRefresh.do",{
					"queryPurVo.ejflbm" : $(fl).val()
				},function(returnStr){
					var returnObj = eval('(' + returnStr + ')');
					if(returnObj.sjfls.length>=1){
						for(var i=0; i<returnObj.sjfls.length; i++){
							$("#sjflbm").append("<option value='" + returnObj.sjfls[i].sjflbm + "'>" + returnObj.sjfls[i].sjflmc + "</option>");
						}
					}else{
						DQFLSFKYSC = true;
					}
				});
				$("#sjflbm").html("<option value='0'>--请选择--</option>");
			}
			
			//点击增加分类按钮时把一级分类Div所有输入框置空
			function AddYJFLOperRefresh(){
				$.post("<%=basePath%>zyzc/DicAppAssetType_AddOperRefresh.do",{
				},function(returnStr){
					var returnObj = eval('(' + returnStr + ')');
					$("#1typecode").val(returnObj.del[0].typecode);
					$("#1typename").val(returnObj.del[0].typename);
					$("#1typeorder").val(returnObj.del[0].typeorder);
					$("#1typearea").val(returnObj.del[0].typearea);
					$("#1memo1").val(returnObj.del[0].memo1);
					$("#1memo2").val(returnObj.del[0].memo2);
				});
			}
			
			//点击增加分类按钮时把二级分类Div所有输入框置空
			function AddEJFLOperRefresh(){
				$.post("<%=basePath%>zyzc/DicAppAssetType_AddOperRefresh.do",{
				},function(returnStr){
					var returnObj = eval('(' + returnStr + ')');
					$("#2typecode").val(returnObj.del[0].typecode);
					$("#2typename").val(returnObj.del[0].typename);
					$("#2typeorder").val(returnObj.del[0].typeorder);
					$("#2typearea").val(returnObj.del[0].typearea);
					$("#2memo1").val(returnObj.del[0].memo1);
					$("#2memo2").val(returnObj.del[0].memo2);
				});
			}
			
			//点击增加分类按钮时把三级分类Div所有输入框置空
			function AddSJFLOperRefresh(){
				$.post("<%=basePath%>zyzc/DicAppAssetType_AddOperRefresh.do",{
				},function(returnStr){
					var returnObj = eval('(' + returnStr + ')');
					$("#3typecode").val(returnObj.del[0].typecode);
					$("#3typename").val(returnObj.del[0].typename);
					$("#3typeorder").val(returnObj.del[0].typeorder);
					$("#3typearea").val(returnObj.del[0].typearea);
					$("#3memo1").val(returnObj.del[0].memo1);
					$("#3memo2").val(returnObj.del[0].memo2);
				});
			}
			
			//点击一级分类修改和删除按钮时发送一个请求把要修改或删除的信息从数据库中查询出来
			function YJFLOperRefresh(){
				$.post("<%=basePath%>zyzc/DicAppAssetType_YJFLOperRefresh.do",{
					"queryPurVo.yjflbm" : $("#yjflbm").val()
				},function(returnStr){
					var returnObj = eval('(' + returnStr + ')');
					$("#1typecode").val(returnObj.del[0].typecode);
					$("#1typename").val(returnObj.del[0].typename);
					$("#1typeorder").val(returnObj.del[0].typeorder);
					$("#1typearea").val(returnObj.del[0].typearea);
					$("#1memo1").val(returnObj.del[0].memo1);
					$("#1memo2").val(returnObj.del[0].memo2);
				});
			}
			
			//点击二级分类修改和删除按钮时发送一个请求把要修改或删除的信息从数据库中查询出来
			function EJFLOperRefresh(){
				$.post("<%=basePath%>zyzc/DicAppAssetType_EJFLOperRefresh.do",{
					"queryPurVo.ejflbm" : $("#ejflbm").val()
				},function(returnStr){
					var returnObj = eval('(' + returnStr + ')');
					$("#2typecode").val(returnObj.del[0].typecode);
					$("#2typename").val(returnObj.del[0].typename);
					$("#2typeorder").val(returnObj.del[0].typeorder);
					$("#2orgid").val(returnObj.del[0].orgid);
					$("#2memo1").val(returnObj.del[0].memo1);
					$("#2memo2").val(returnObj.del[0].memo2);
				});
			}
			
			//点击三级分类修改和删除按钮时发送一个请求把要修改或删除的信息从数据库中查询出来
			function SJFLOperRefresh(){
				$.post("<%=basePath%>zyzc/DicAppAssetType_SJFLOperRefresh.do",{
					"queryPurVo.sjflbm" : $("#sjflbm").val()
				},function(returnStr){
					var returnObj = eval('(' + returnStr + ')');
					$("#3typecode").val(returnObj.del[0].typecode);
					$("#3typename").val(returnObj.del[0].typename);
					$("#3typeorder").val(returnObj.del[0].typeorder);
					$("#3orgid").val(returnObj.del[0].orgid);
					$("#3memo1").val(returnObj.del[0].memo1);
					$("#3memo2").val(returnObj.del[0].memo2);
				});
			}
      	</script>
    </head>
    <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
    	<s:form id="flForm">
        <table id="gridTable" class="newtable" width="100%" align="center" cellpadding="0" cellspacing="0">
            <tr>
	              <td class="td_zxy01">一级分类： </td>
	              <td class="td_zxy02">
						<s:select name="queryPurVo.yjflbm" id="yjflbm" cssClass="input" 
						 list="%{#request.yjMap}" id="yjflbm" onchange="ejflRefresh(this)"/>
				  </td>
	              <td class="td_zxy02" colspan="4" style="text-align:right">
	              	<input type="button" class="buttonface" value="增加一级分类" onclick="JsFunManage('add','yjfl');"/>
	              	<input type="button" class="buttonface" value="删除分类" onClick="JsFunManage('del','yjfl');"/>
	              	<input type="button" class="buttonface" value="修改分类" onClick="JsFunManage('mod','yjfl');"/>
	              </td>
			</tr>	              
            <tr>
				  <td class="td_zxy01">二级分类： </td>
	              <td class="td_zxy02">
						<s:select name="queryPurVo.ejflbm" id="ejflbm" cssClass="input"
						 list="%{#request.ejMap}" id="ejflbm" onchange="sjflRefresh(this)"/>
				  </td>
				  <td class="td_zxy02" colspan="4" style="text-align:right">
	              	<input type="button" class="buttonface" value="增加二级分类" onclick="JsFunManage('add','ejfl');"/>
	              	<input type="button" class="buttonface" value="删除分类" onClick="JsFunManage('del','ejfl');"/>
	              	<input type="button" class="buttonface" value="修改分类" onClick="JsFunManage('mod','ejfl');"/>
	              </td>
			</tr>
			<tr>
				  <td class="td_zxy01">三级分类：</td>
				  <td class="td_zxy02">
						<s:select name="queryPurVo.sjflbm" id="sjflbm" cssClass="input" 
						 list="%{#request.sjMap}" id="sjflbm"/>
				  </td>
	              <td class="td_zxy02" colspan="4" style="text-align:right">
	              	<input type="button" class="buttonface" value="增加三级分类" onclick="JsFunManage('add','sjfl');"/>
	              	<input type="button" class="buttonface" value="删除分类" onClick="JsFunManage('del','sjfl');"/>
	              	<input type="button" class="buttonface" value="修改分类" onClick="JsFunManage('mod','sjfl');"/>
	              </td>
            </tr>
         </table>
         <div id="yjfl" style="display: none">
         <table id="gridTable" class="newtable" width="100%" align="center" cellpadding="0" cellspacing="0">
         	<tr>
	              <td class="td_zxy01" colspan="4" id="yjflTitle" style="font-size:15pt;font-weight:bolder;"></td>
			</tr>	
           	<tr>
              <td class="td_zxy01">一级分类名称：</td>
              <td class="td_zxy02">
              	<s:textfield name="dicAppAssettype1.typename" id="1typename"  cssClass="input"/>
			  </td>
              <td class="td_zxy01">管理分类部门：</td>
              <td class="td_zxy02">
				<s:select name="dicAppAssettype1.typearea" id="1typearea"  cssClass="input" list="#{1:'信息技术处',0:'安全保障处'}"></s:select>
			  </td>
			</tr>
			<tr>
			  <td class="td_zxy02" colspan="4" style="text-align:right">
              	<s:submit value="确定"></s:submit>
			  </td>
            </tr>
   		</table>
   		</div>
   		<div id="ejfl" style="display: none">
         <table id="gridTable" class="newtable" width="100%" align="center" cellpadding="0" cellspacing="0">
			<tr>
	              <td class="td_zxy01" colspan="4" id="ejflTitle" style="font-size:15pt;font-weight:bolder;"></td>
			</tr>	
			<tr>
              <td class="td_zxy01">二级分类名称：</td>
              <td class="td_zxy02">
              	<s:textfield name="dicAppAssettype2.typename" id="2typename"  cssClass="input" cssClass="input"/>
			  </td>
			  <td class="td_zxy01">管理分类部门：</td>
              <td class="td_zxy02">
				<s:select name="dicAppAssettype2.orgid" id="2orgid" cssClass="input" list="{'信息技术处','安全保障处'}"></s:select>
			  </td>
			</tr>
            <tr>
			  <td class="td_zxy02" colspan="4" style="text-align:right">
              	<s:submit value="确定"></s:submit>
			  </td>
            </tr>
   		</table>
   		</div>
   		<div id="sjfl" style="display: none">
         <table id="gridTable" class="newtable" width="100%" align="center" cellpadding="0" cellspacing="0">
           <tr>
	           <td class="td_zxy01" colspan="4" id="sjflTitle" style="font-size:15pt;font-weight:bolder;"></td>
		   </tr>	
           <tr>
              <td class="td_zxy01">三级分类名称：</td>
              <td class="td_zxy02">
              	<s:textfield name="dicAppAssettype3.typename" id="3typename" cssClass="input"/>
			  </td>
			  <td class="td_zxy01">管理分类部门：</td>
              <td class="td_zxy02">
				<s:select name="dicAppAssettype3.orgid" id="3orgid" cssClass="input" list="{'信息技术处','安全保障处'}"></s:select>
			  </td>
			</tr>
			<tr class="td_zxy02">
              <td class="td_zxy01">预警库存数量：</td>
              <td class="td_zxy02">
              	<s:textfield name="dicAppAssettype3.memo1" id="3memo1" cssClass="input"/>
			  </td>
			  <td class="td_zxy01">&nbsp;</td>
              <td class="td_zxy02">&nbsp;</td>
			</tr>
            <tr>
			  <td class="td_zxy02" colspan="4" style="text-align:right">
              	<s:submit value="确定"></s:submit>
			  </td>
            </tr>
   		</table>
   		</div>
   		</s:form>
	</body>
</html>