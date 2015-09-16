<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/wtdk/checkJS.inc"%>
<% 
  //boolean isNgbmzhcl = "拟稿部门综合处理".equals(workflowVO.taskName);
	   boolean isNgbmzhcl = true;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>委管合同</title>
    <script type="text/javascript">
    jQuery("#purchase_list").setGridWidth($("#widthRule").width());
    jQuery("#file_list").setGridWidth($("#widthRule").width());
    $(window).bind('resize', function(){
		jQuery("#purchase_list").setGridWidth($("#widthRule").width());
		jQuery("#file_list").setGridWidth($("#widthRule").width());
	});  
    $(window).bind('unload', function(){
   			resetHtbh();
	});
    $(function(){	
	    $("#htqsrq").datebox({formatter:function(date){return formatDate(date);}});
		$("#htdqrq").datebox({formatter:function(date){return formatDate(date);}});
		$("#htzzrq").datebox({formatter:function(date){return formatDate(date);}});
		//if('${operate}'!='isNewHt'){//如果是新增 则，不能修改清算日期
		//	$("#scqsrq").datebox({formatter:function(date){return formatDate(date);}});
		//	$("#scqsjzrq").datebox({formatter:function(date){return formatDate(date);}});
		//}
		 if("${view}"=="disabled"){
    		$("select,input,img,textarea").attr("disabled","disabled");
    		$("#close").attr("disabled",false);
   		 }else{
			//在列表的标题右端添加按钮，最后一个按钮距右端20px
			if(!("change"=='${operate}'||"zhongzhi"=='${operate}')){
				$("#gview_purchase_list> .ui-jqgrid-titlebar").append("\
					<a href='#' id='add_card' class='easyui-linkbutton' iconCls='icon-add'>增加</a>\
					<a href='#' id='delete_card' class='easyui-linkbutton' iconCls='icon-remove'  style='margin-right:20px'>删除</a>\
				");
			}
			var buttonFileJSonString = '[{"buttonHandler":"addFileAss","buttonIcon":"icon-add","buttonText":"增加"},\
										{"buttonHandler":"delFileAss","buttonIcon":"icon-remove","buttonText":"删除"},\
										{"buttonHandler":"up","buttonIcon":"icon-up","buttonText":"上移"},\
                                        {"buttonHandler":"down","buttonIcon":"icon-down","buttonText":"下移"}\
			]';
			addButtons(jQuery("#gview_file_list > .ui-jqgrid-titlebar"),buttonFileJSonString);
			$('#add_card,#delete_card,#update_card').linkbutton({
		                  duration: 9999999999,
					plain:true
		    });
			$("#delete_card").click(function(){
				var zcIds = jQuery("#purchase_list").getDataIDs();
				if(zcIds.length<1){
					alert("没有能删除的资产信息！");
					return false;
				}
				if(confirm("确认要删除吗")){
					var htId = document.getElementById('htId').value;
					var htlx = document.getElementById('htlx').value;
					var url ="<%=request.getContextPath()%>/htqs/ContractManageBody_deleteZc4Ht.do";
					$.post(url,{zcIds:"" + zcIds + "",htId:"" + htId + "",htlx:"" + htlx + ""}, function(data){
						jQuery("#purchase_list").trigger("reloadGrid");
					});
					return false;
				}else{return false;}
			});
			$("#add_card").click(function(){
				var zcIds = jQuery("#purchase_list").getDataIDs();
				var bmbh = document.getElementById("bmbh").value;
				bmbh = encodeURI(bmbh);
				if(zcIds.length>0){
					alert("已添加资产，不能添加多条资产信息!");
					return false;
				}
				var url = '<%=request.getContextPath()%>/jygdzc/AssetQuery_init.do?returnValue=true&isModal=true&bmbh='+bmbh+'&mulSelect=false&sheettype=check&headId=${headId}';
			  	var g_ = 'height=600, width=1000, top=10, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no';
				// window.open(url,'',g_);
				var vReturnValue=window.showModalDialog(url,'_blank','help:no;scroll:yes;resizable:no;status:0;dialogWidth:1050px;dialogHeight:600px;center:yes');
				if(typeof(vReturnValue)!='undefined'){
					addValue(vReturnValue);
				}
				 //window.open(url);
			  	return false;
			});
			var zcqueryid = document.getElementById("zcid").value;
			if(zcqueryid != null && zcqueryid.length != 0){
				addValue(zcqueryid);
			}
		}
	});
    //查询的回调方法
      var myId;
	  function addValue(gr){
			document.getElementById("zcid").value=gr;
			var hh=document.getElementById("zcid").value;
			$.post("<%=basePath%>htqs/ContractManageBody_getZcList.do",{
				zcIds: '' + hh,
				htId: document.getElementById("htId").value,
				htlx: document.getElementById('htlx').value
			},function(data){
				jQuery("#purchase_list").trigger("reloadGrid");
			});
		}
		function submitValue(){
			var zcId=document.getElementById("zcid").value;
			if(zcId==""){
				alert("请选择资产！");
				return false;
			}
			  $("#zcmc").val(jQuery("#purchase_list").getCell(''+ zcId,'zcmc'));
			  $("#zcbh").val(jQuery("#purchase_list").getCell(''+ zcId,'zcbh'));
		    //addValue(zcId);
			return true;
		}
		
		function close1(){
		   window.parent.close();
		 }
		 function addV(){
		 	var zcIds = jQuery("#purchase_list").getDataIDs();
			if(zcIds.length<1){
				alert("您还没有选择资产信息！");
				return false;
			}
			  var returnValue = submitValue();//保存之前需要给相应的隐藏域赋值
			  if(returnValue == false){
			  	return false;
			  }
			  
			  var jiaoyan = checkEAMFormJSMethod();
		    if(jiaoyan){
			   $("select,input").attr("disabled",false);
			     myForm.action="<%=request.getContextPath() %>/htqs/ContractManageBody_saveBody.do";
			     myForm.submit();
			   }
			  //window.opener.reloadGrid();
			  //window.close();
		 }
		 
		 //生成编号
	function createBianhao(){
		if(document.getElementById("htbh").value!=""){
			alert("已生成编号！");
			return false;
		}
		$.post("<%=basePath %>htqs/ContractManageBody_createNum.do",{
			"code":"wght"
		},function(data){
			document.getElementById("htbh").value = data;
			$("#scbh").remove();
		});
	}
	function resetHtbh(){
			var htbh = $("#htbh").val();
			if(""!=htbh&&htbh!=null&&"null"!=htbh){
				$.post("<%=basePath %>htqs/ContractManageBody_regainNum.do",{
					"htbh":""+htbh,
					"headId":"${headId}",
					"code":"wght"
				})
			}
	}	
    function checkEAMFormJSMethod(){
			var htbh = document.getElementById("htbh");
			if(htbh.value == null || htbh.value.length == 0){
				alert("合同编号不能为空！");
				htbh.focus();
		      return false;
		    }
		    var htqsrq = document.getElementById("htqsrq");
			if(htqsrq.value == null || htqsrq.value.length == 0){
				alert("合同起始日期不能为空！");
				htqsrq.focus();
		      return false;
		    }
		    
		     var htdqrq = document.getElementById("htdqrq");
			if(htdqrq.value == null || htdqrq.value.length == 0){
				alert("合同到期不能为空！");
				htdqrq.focus();
		      return false;
		    }
		    var sd = document.getElementById('htqsrq').value;
			var ed = document.getElementById('htdqrq').value;
			var flags = true;
			var flage = true;
			if(sd!=''&&sd!=null){
				flags = isDate(sd);
			}
			if(ed!=''&&ed!=null){
				flage = isDate(ed);
			}
			if(flags==false||flage==false){
				alert('请输入正确的日期格式，例如：2010-01-01');
				return false;
			}
			if(sd!='' && ed!='' && sd > ed){
				alert("合同开始日期不应该大于合同结束日期，请重新输入！");
				return false;
			}
		    
		    
		    return true;
		}	
		function lookAsset(gr){
				window.open('<%=basePath%>jygdzc/AssetManageBody_viewAsset.do?sheettype=assetXxInfo&zcId='+gr,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=yes');
				//window.open('<%=basePath%>jygdzc/AssetManageBody_viewAsset.do?sheettype=assetXxInfo&zcId='+gr);
		}	
	</script>
  </head>
  <body>
  <form action="" method="post" name="myForm"> 
     <table  class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
	<td align="right">
	<table id="purchase_list" width="100%"></table>
	  <div id="pgtoolbar1"></div>
	</td>
  </tr>
</table>
<table width="100%" id="widthRule" cellpadding="0" cellspacing="0"  border="0" align="center"  class="newtable" >
<input type="hidden" id="bmbh" name = "bmbh" value="${bmbh}"/> 
<s:hidden name="headId"/>
<s:hidden name="sheettype" value="%{#request.sheettype}"/>
<s:hidden name="jjzcHtZlwgLsb.cldId"/>
<s:hidden name="jjzcHtZlwgLsb.CHtlx" id="htlx" value="1"/>
<s:hidden name="jjzcHtZlwgLsb.zcid" id="zcid" />
<s:hidden name="jjzcHtZlwgLsb.zcmc" id="zcmc"/>
<s:hidden name="jjzcHtZlwgLsb.zcbh" id="zcbh"/>
<s:hidden name="ywlx" value="%{#request.ywlx}"/>
<s:hidden name="bussiness" value="addZW"/>
<s:hidden name="jjzcHtZlwgLsb.id" id="htId"/>
<s:set name="biaodanid" value="jjzcHtZlwgLsb.id" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<s:hidden name="operate"/>
	<tr>
      <td colspan="4" class="td_top" align="left" >合同信息</td>
    </tr>
	<tr>
	   <td class="td_form01"><font color="red">*</font>合同编号：</td>
       <td class="td_form02"><s:textfield name="jjzcHtZlwgLsb.htbh"   id="htbh"   readonly="true"/>
			<input type="button" id="scbh"  value="生成编号" onclick="createBianhao();"/>
			  </td>
       <td class="td_form01">交易对象：</td>
      <td class="td_form02">
	 <s:select list="#{'':'','1':'建行','2':'非建行'}" name="jjzcHtZlwgLsb.jydx" id="jydx"/></td>
	</tr> 
	 <tr>
	   <td  class="td_form01">合同状态：</td>
       <td  class="td_form02"  ><s:select list="#{'':'','1':'执行中','2':'待执行','3':'执行完毕'}" name="jjzcHtZlwgLsb.CHtzt" id="CHtzt"/></td>
   	   <td class="td_form01">一级分行：</td>
       <td class="td_form02">
	   <e:select parRefKey="ENTITY_TRADE" headerKey="" headerValue="" parentId="438" list="#{}" name="jjzcHtZlwgLsb.CYjfh" id="CYjfh"/>
	    </td>
 </tr>
	 <tr>
	  <td class="td_form01">委托管理单位：</td>
      <td class="td_form02">
	  	<s:textfield name="jjzcHtZlwgLsb.CWtgldw" value="建行" id="CWtgldw" readonly="true"/>
	  </td>
	   <td class="td_form01">委托管理原值(元)：</td>
       <td class="td_form02"  ><s:textfield name="jjzcHtZlwgLsb.wtglyz" id="wtglyz" onblur = "checkFloat(this);" /></td>
	</tr>
	<tr>
		<td class="td_form01">委托费用比例(%)：</td>
      <td class="td_form02"  ><s:textfield name="jjzcHtZlwgLsb.wtfybi" id="wtfybi" onblur="checkPresent(this);"/></td>
      
	  <td class="td_form01">委托管理价格(元)：</td>
      <td class="td_form02"  ><s:textfield name="jjzcHtZlwgLsb.wtgljg" id="wtgljg" onblur = "checkFloat(this);"/></td>
    </tr>
	<tr>
      <td class="td_form01">委托管理数量：</td>
      <td class="td_form02"  ><s:textfield name="jjzcHtZlwgLsb.wtglsl" id="wtglsl" onblur = "checkFloat(this);"/></td>
	  <td class="td_form01">月委托管理费(元)：</td>
      <td class="td_form02"  ><s:textfield name="jjzcHtZlwgLsb.ywtglf" id="ywtglf" onblur = "checkFloat(this);"/></td>
    </tr>
	<tr>
	 <td class="td_form01">累计实收委管费(元)：</td>
      <td class="td_form02"  ><s:textfield name="jjzcHtZlwgLsb.ljsswgf" id="ljsswgf" onblur = "checkFloat(this);"/></td>
      <td class="td_form01">累计应收委管费(元)：</td>
      <td class="td_form02"  ><s:textfield name="jjzcHtZlwgLsb.ljyswgf" id="ljyswgf" onblur = "checkFloat(this);"/></td>
    </tr>
    <tr>
	 <td class="td_form01">租金价格是否含物业费：</td>
      <td class="td_form02"  ><s:select list="#{'':'','0':'否','1':'是'}" name="jjzcHtZlwgLsb.zjsfhwyf" id="zjsfhwyf"/></td>
      <td class="td_form01">租金价格是否含水电费：</td>
      <td class="td_form02"  ><s:select list="#{'':'','0':'否','1':'是'}" name="jjzcHtZlwgLsb.zjsfhsdf" id="zjsfhsdf"/></td>
    </tr>
	<tr>
      <td class="td_form01"><font color="red">*</font>合同起始日期：</td>
      <td class="td_form02"  >
      	<s:date name="%{#request.jjzcHtZlwgLsb.htqsrq}" format="yyyy-MM-dd" var="draftDate1"/>
      	<s:textfield name="jjzcHtZlwgLsb.htqsrq"  id="htqsrq" value="%{#draftDate1}" readonly="true"/></td>
      <td class="td_form01"><font color="red">*</font>合同到期日期：</td>
      <td class="td_form02"  >
      	<s:date name="%{#request.jjzcHtZlwgLsb.htdqrq}" format="yyyy-MM-dd" var="draftDate2"/>
      	<s:textfield name="jjzcHtZlwgLsb.htdqrq" id="htdqrq" value="%{#draftDate2}" readonly="true"/>
      	<s:date name="%{#request.jjzcHtZlwgLsb.htzzrq}" format="yyyy-MM-dd" var="draftDate12"/>
      	<s:hidden name="jjzcHtZlwgLsb.htzzrq" id="htzzrq" value="%{#draftDate2}" readonly="true"/></td>
    </tr>
	<tr>
      <td class="td_form01">上次清算日期：</td>
      <td class="td_form02"  >
      <s:date name="%{#request.jjzcHtZlwgLsb.scqsrq}" format="yyyy-MM-dd" var="draftDate41" />
      <s:textfield name="jjzcHtZlwgLsb.scqsrq"  id="scqsrq"  value="%{#draftDate41}" readonly="true"/></td>
      <td class="td_form01">上次清算截止日期：</td>
      <td class="td_form02"  >
      <s:date name="%{#request.jjzcHtZlwgLsb.scqsjzrq}" format="yyyy-MM-dd" var="draftDate42" />
      <s:textfield name="jjzcHtZlwgLsb.scqsjzrq"  id="scqsjzrq"  readonly="true" value="%{#draftDate42}"/></td>
    </tr>
	<tr>
      <td class="td_form01">本次清算调整金额（元）：</td>
      <td class="td_form02"  ><s:textfield name="jjzcHtZlwgLsb.zlqstzje" id="zlqstzje" onblur = "checkFloat(this);"/></td>
      <td class="td_form01">&nbsp;</td>
      <td class="td_form02" >&nbsp;</td>
    </tr>
	<tr>
      <td class="td_form01">结算方式：</td>
      <td class="td_form02"  ><s:select list="#{'':'','1':'月付','2':'季付','3':'年付','4':'其他'}" name="jjzcHtZlwgLsb.jsfs" id="jsfs"/>
			</td>
      <td class="td_form01">度量单位：</td>
      <td class="td_form02"  >
	 <s:select list="#{'':'','1':'个','2':'平方米'}" name="jjzcHtZlwgLsb.dldw" id="dldw"/>
	 </td>
    </tr>
	<tr>
      <td class="td_form01">录入人：</td>
      <td class="td_form02"  ><s:textfield name="jjzcHtZlwgLsb.lrr" readonly="true"  id="lrr"/></td>
      <td class="td_form01">录入日期：</td> 
      <td class="td_form02"  ><s:date name="%{#request.jjzcHtZlwgLsb.lrrq}" format="yyyy-MM-dd" var="draftDate"/>
		<s:textfield id="lrrq" name="jjzcHtZlwgLsb.lrrq" value="%{#draftDate}" readonly="true"/></td>
    </tr>
    </table>
	   <%@ include file="/inc/file.inc"%>
	   <table>
	     <tr>
	     <td colspan="4" align="center">
	      <input type="button" value="保存" onclick="addV();"  >
	      <input type="button" value="关闭" id="close" onclick="close1();" >
	     </td>
	   </tr>
	   </table>
	</form>
  </body>
</html>
<script type="text/javascript">
			jQuery("#purchase_list").jqGrid({ 
			postData:{
				htId: '' + document.getElementById("htId").value,
				htlx: document.getElementById('htlx').value
			},
			url:"<%=basePath%>htqs/ContractManageBody_getZc4Ht.do",      
			datatype:"json",
			colNames: ['ID','资产编号', '资产名称','资产类型','主卡片编号','主卡片名称','地区','原币原值'],
			colModel: [
				{name:'id',index:'id',align:"center",hidden:true},
				{name:'zcbh',index:'zcbh',align:"center"},
				{name:'zcmc',index:'zcmc',align:"center"},
				{name:'CZclx',index:'CZclx',align:"center"},
				{name:'zkpbh',index:'zkpbh',align:"center"},
				{name:'zkpmc',index:'zkpmc',align:"center"},
				{name:'CZcdq',index:'CZcdq',align:"center"},
				{name:'ybyz',index:'ybyz',align:"center"}],
			    multiselect:true,
				rownumbers:false,
				autowidth:true,
				ondblClickRow:function(gr){
					lookAsset(gr);
				},
				height:'auto',
				viewrecords:true,
				caption:'资产列表',
				jsonReader:{
				records:"records",
				repeatitems:false,
				id:"0"
			}
		});
							 </script>
<SCRIPT LANGUAGE="JavaScript">
	if('${message}' != "") {
		alert("${message}"); 
		if("${ywlx}"!=null&&""!="${ywlx}"){
			window.parent.opener.reloadGrid();
		}else{
			window.opener.reloadGrid();
		}
	}
</SCRIPT>