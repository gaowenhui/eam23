<%@page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	//boolean isNgbmzhcl = "拟稿部门综合处理".equals(workflowVO.taskName);
	boolean isNgbmzhcl = true;
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>租赁合同</title>
		<SCRIPT language=JavaScript type=text/JavaScript>
    $(window).bind('unload', function(){
   			resetHtbh();
	});
    $(function(){	
    	dateDiff();
       $("select,input,img,textarea,a").attr("disabled","disabled");
       $("#close").attr("disabled",false);
	    jQuery("#purchase_list").setGridWidth($("#widthRule").width());
	    jQuery("#file_list").setGridWidth($("#widthRule").width());
	    $(window).bind('resize', function(){
			jQuery("#purchase_list").setGridWidth($("#widthRule").width());
			jQuery("#file_list").setGridWidth($("#widthRule").width());
		});  
	    $("#mzqsrq").datebox({formatter:function(date){return formatDate(date);}});
		$("#mzdqrq").datebox({formatter:function(date){return formatDate(date);}});
		$("#htqsrq").datebox({formatter:function(date){return formatDate(date);}});
		$("#htdqrq").datebox({formatter:function(date){return formatDate(date);}});
		//if('${operate}'!='isNewHt'){//如果是新增 则，不能修改清算日期
		//	$("#scqsrq").datebox({formatter:function(date){return formatDate(date);}});
		//	$("#scqsjzrq").datebox({formatter:function(date){return formatDate(date);}});
		//}
		// 日期转换
		$(".ss").datebox({
			formatter:function(date){
				return formatDate(date);
			},
			onSelect:function(){
				changeDate2();
				dateDiff();
			}
		});
	});
	var xxx;
	$(function(){
		xxx =  $("#TableBox1").html();
	});
	function myDeleteRow(hrefObj){
		var rowObj = hrefObj.parentElement.parentElement;
		$(rowObj).remove();
		changeDate2();
		dateDiff();
	}
	function AddTable_base(){
		$("#TableBox").append(xxx);
		$(".ss").datebox({formatter:function(date){return formatDate(date);}});
	}
	function changeDate2(){
		
		 var ksrq = document.getElementsByName("ksrq");
		 var jsrq = document.getElementsByName("jsrq");
	     if(ksrq.length>2){
	     	for(var  i=1;i<ksrq.length-1;i++){
	     		var aDate = jsrq[i].value.split("-") 
	     		var aDate1 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]);
	     		var aDate2 = aDate1.getDate();
	     		var ss = aDate2 + 1;
				ksrq[i+1].value = formatDate(new Date(aDate[1] + '-' + ss + '-' + aDate[0])); //转换为12-18-2002格式 
	     	}
	     }
	     var yzj = document.getElementsByName("yzj");
	     var nowDate = new Date()
		 var now = formatDate(nowDate);
	     for (var i=1;i<ksrq.length;i++){
	     	if(ksrq[i].value<=now&&jsrq[i].value>=now){
	     		document.getElementById("zjjg").value = yzj[i].value;
	     	}else{
	     		document.getElementById("zjjg").value = 0;
	     	}
		}
	     
	}
	function changeDate(){
		 var ksrq = document.getElementsByName("ksrq");
		 var jsrq = document.getElementsByName("jsrq");
	     if(ksrq.length==2){
	     	ksrq[1].value = document.getElementById("htqsrq").value; 
	     	jsrq[1].value = document.getElementById("htdqrq").value;
	     }else if(ksrq.length>2){
	     	for(var  i=1;i<ksrq.length-1;i++){
	     		var aDate = jsrq[i].value.split("-") 
	     		var aDate1 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]);
	     		var aDate2 = aDate1.getDate();
	     		var ss = aDate2 + 1;
				ksrq[i+1].value = formatDate(new Date(aDate[1] + '-' + ss + '-' + aDate[0])); //转换为12-18-2002格式 
	     	}
	     }
	     
	}
   	function DeleteTr_base(){
			TableBox.deleteRow();
	}	
	function DeleteTr(){
		var No=TableBox.rows.length;
		for(i=0;i<No;i++)TableBox.deleteRow();
	}
	function showSubimtPage(){
		document.getElementById("subimtPage").style.display="block";
	}
	function cancleSubmit(){
		document.getElementById("subimtPage").style.display="none";
	}
	function applyMoney(){
	return false;
		var values=0.0;
		var inputs = document.getElementsByName('jjzcHtJdzj.yzj');
		for(i=0;i<inputs.length;i++){
			var v = inputs[i].value;
			if(v!=""){
				values = values+parseFloat(v);
			}
		}
		document.getElementById("yzj").value=values;
	}
	 //查询的回调方法
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
		//getCell(rowid,cellName)
		
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
	 function dateDiff(){ //sDate1和sDate2是2002-12-18格式 
		var money = new Number(0);
		var nowDate = new Date();
		var nowYearEnd = new Date();
		nowYearEnd.setMonth(11) ;
		nowYearEnd.setDate(31);
		var	YearEnd = formatDate(nowYearEnd);
		var nowYearStart = new Date();
		nowYearStart.setMonth(0) ;
		nowYearStart.setDate(1);
		var	YearStart = formatDate(nowYearStart);
		var now = formatDate(nowDate);
		var year = nowDate.getFullYear() ;
        var ksrq = document.getElementsByName("ksrq");
        var jsrq = document.getElementsByName("jsrq");
        var yzj = document.getElementsByName("yzj");
        if(ksrq.length==1){
     		document.getElementById("zjjg").value = 0;
     	}
	    for (var i=1;i<ksrq.length;i++){
	     	end = jsrq[i].value.split("-") ;
   			start = ksrq[i].value.split("-") ;
   			ksrq1 = new Date(start[1] + '-' + start[2] + '-' + start[0]);
   			jsrq1 = new Date(end[1] + '-' + end[2] + '-' + end[0]);
	     	if(ksrq[i].value<=now&&jsrq[i].value>=now){
	     		document.getElementById("zjjg").value = yzj[i].value;
	     	}
	     	if(ksrq[i].value<=YearStart){
	     		if(jsrq[i].value!=null&&jsrq[i].value!=""&&jsrq[i].value<YearStart){
	     			
	     		}else if(jsrq[i].value!=null&&jsrq[i].value!=""&&jsrq[i].value>=YearEnd){
	     			//var iDays = parseInt(Math.abs(jsrq1 -nowDate  ) / 1000 / 60 / 60 /24);
	     			if(yzj[i].value!=null&&yzj[i].value!=""){
	     				//money = money + (iDays * yzj[i].value / 30);
	     				money = money + (12 * yzj[i].value);
	     			}
	     		}else if(jsrq[i].value!=null&&jsrq[i].value!=""&&jsrq[i].value<YearEnd){
	     			var iDays = parseInt(Math.abs(jsrq1 -nowYearStart  ) / 1000 / 60 / 60 /24);
	     			if(yzj[i].value!=null&&yzj[i].value!=""){
	     				money = money + (iDays * yzj[i].value / 30);
	     			}
	     		}
	     	}else if(ksrq[i].value>YearStart){
	     		if(ksrq[i].value!=null&&ksrq[i].value!=""&&ksrq[i].value>YearEnd){
	     		
	     		}else if(jsrq[i].value!=null&&jsrq[i].value!=""&&jsrq[i].value<=YearEnd){
	     			var iDays = parseInt(Math.abs(jsrq1 -ksrq1) / 1000 / 60 / 60 /24);
	     			if(yzj[i].value!=null&&yzj[i].value!=""){
	     				money = money + (iDays * yzj[i].value / 30);
	     			}
	     		}else if(jsrq[i].value!=null&&jsrq[i].value!=""&&jsrq[i].value>YearEnd){
	     			var iDays = parseInt(Math.abs(nowYearEnd -ksrq1) / 1000 / 60 / 60 /24);
	     			if(yzj[i].value!=null&&yzj[i].value!=""){
	     				money = money + (iDays * yzj[i].value / 30);
	     			}
	     		}
	     	}
		}
		document.getElementById("nzsj").value=parseFloat(money).toFixed(2);
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
			  myForm.action="<%=request.getContextPath()%>/htqs/ContractManageBody_saveBody.do";
			  myForm.submit();
			  //window.opener.reloadGrid();
			  //window.close();
		 }
		 
		  //生成编号
	function createBianhao(){
		if(document.getElementById("htbh").value!=""){
			alert("已生成编号！");
			return false;
		}
		$.post("<%=basePath%>htqs/ContractManageBody_createNum.do",{
			"code":"zlht"
		},function(data){
			document.getElementById("htbh").value = data;
		});
		}
</SCRIPT>
		<script type="text/javascript">
     function checkEAMFormJSMethod(){
			var biaoti = document.getElementById("biaoti");
			if(biaoti.value == null || biaoti.value.length == 0){
				alert("标题不能为空！");
				biaoti.focus();
		      return false;
		    }
		    var chengsong = document.getElementById("chengsong");
			if(chengsong.value == null || chengsong.value.length == 0){
				alert("呈送不能为空！");
				chengsong.focus();
		      return false;
		    }
		    
		     var bianhao = document.getElementById("bianhao");
			if(bianhao.value == null || bianhao.value.length == 0){
				alert("编号不能为空！");
				bianhao.focus();
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
				alert("开始日期不应该大于结束日期，请重新输入！");
				return false;
			}
		}
			//生成编号
	function createBianhao(){
		var headId=$("#headId").val();
		if(document.getElementById("htbh").value!=""){
			alert("已生成编号！");
			return false;
		}
		$.post("<%=basePath%>htqs/ContractManageBody_createNum.do",{
			"headId":headId,
			"code":"zlht"
		},function(data){
			document.getElementById("htbh").value = data;
		});
		}
	function qitafeiyong(){
		var obj = document.getElementById("zjsfhsdf");
		if(document.getElementById("qita").checked==true){
			obj.disabled = false;
		}else{
			obj.disabled = true;
		}
	}
	$(function(){
		var obj = document.getElementById("zjsfhsdf");
		if(document.getElementById("qita").checked==true){
			obj.disabled = false;
		}else{
			obj.disabled = true;
		}
	});
	function lookAsset(gr){
			window.open('<%=basePath%>jygdzc/AssetManageBody_viewAsset.do?sheettype=assetXxInfo&zcId='+gr,'','height=550, width=1100, top=100, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=yes');
			//window.open('<%=basePath%>jygdzc/AssetManageBody_viewAsset.do?sheettype=assetXxInfo&zcId='+gr);
	}
	</script>
	</head>
	<body>
		<table id="TableBox1" style="display: none" width="100%" border="0"
			cellspacing="0" cellpadding="0" align="center" class="newtable">
			<tr>
				<td nowrap="nowrap">
					<a href="#" onclick="myDeleteRow(this);return false;">&nbsp;x&nbsp;</a>
					开始日期:
					<input type="text" name="ksrq" readonly="readonly" class="ss" />
					结束日期:
					<input type="text" name="jsrq" readonly="readonly" class="ss" />
					月租金(元)：
					<input type="text" name="yzj" onblur="applyMoney();" />
				</td>
			</tr>
		</table>
		<form action="" method="post" name="myForm">
			<table class="newtable" width="100%" border="0" align="center"
				cellpadding="0" cellspacing="0">
				<td align="right">
					<table id="purchase_list" width="100%"></table>
					<div id="pgtoolbar1"></div>
				</td>
			</table>
			<table width="100%" id="widthRule" border="0" cellspacing="0"
				cellpadding="0" align="center" class="newtable">
				<s:hidden name="headId" />
				<s:hidden name="sheettype" />
				<s:hidden name="jjzcHtZlwgjjzcHtZlwgtlx" id="htlx" value="2" />
				<s:hidden name="jjzcHtZlwg.zcid" id="zcid" />
				<s:hidden name="jjzcHtZlwg.zcmc" id="zcmc" />
				<s:hidden name="jjzcHtZlwg.zcbh" id="zcbh" />
				<s:hidden name="ywlx" value="%{#request.ywlx}" />
				<s:hidden name="bussiness" value="addZW" />
				<s:hidden name="jjzcHtZlwg.id" id="htId" />
				<s:set name="biaodanid" value="jjzcHtZlwg.id" />
				<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
				<s:hidden name="operate" />
				<tr>
					<td colspan="4" class="td_top" align="left">
						合同信息
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						合同编号：
					</td>
					<td class="td_form02">
						<s:textfield name="jjzcHtZlwg.htbh" id="htbh" readonly="true" />
					<td class="td_form01">
						实物合同编号：
					</td>
					<td class="td_form02">
						<s:textfield name="jjzcHtZlwg.swhtbh" />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						合同状态：
					</td>
					<td class="td_form02">
						<s:select list="#{'1':'执行中','2':'待执行','3':'执行完毕'}"
							name="jjzcHtZlwg.CHtzt" />
					</td>
					<td class="td_form01">
						承租人：
					</td>
					<td class="td_form02">
						<s:textfield name="jjzcHtZlwg.czr" />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						承租人性质：
					</td>
					<td class="td_form02">
						<e:select parRefKey="RENTER_PROPERTY" headerKey="" headerValue=""
							list="#{}" name="jjzcHtZlwg.CCzrxz" />
					</td>
					<td class="td_form01">
						承租联系人：
					</td>
					<td class="td_form02">
						<s:textfield name="jjzcHtZlwg.czlxr" />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						承租方联系电话：
					</td>
					<td class="td_form02">
						<s:textfield name="jjzcHtZlwg.czflxdh" />
					</td>
					<td class="td_form01">
						交易对象：
					</td>
					<td class="td_form02">
						<s:select list="#{'':'','1':'建行',2:'非建行'}" name="jjzcHtZlwg.jydx" />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						承租数量：
					</td>
					<td class="td_form02">
						<s:textfield name="jjzcHtZlwg.czsl" />
					</td>
					<td class="td_form01">
						租金价格：
					</td>
					<td class="td_form02">
						<s:textfield name="jjzcHtZlwg.zjjg" id = "zjjg" />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						月租金：
					</td>
					<td class="td_form02" colspan="3">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							align="center" class="newtable">
							<tr>
								<td>
									<a href="#" onclick="AddTable_base();return false;">&nbsp;+
										&nbsp;</a>阶段性月租金
								</td>
							</tr>
						</table>
						<table id="TableBox" width="100%" border="0" cellspacing="0"
							cellpadding="0" align="center" class="newtable">
							<s:iterator var="jdzj" value="%{#request.jdzjList}">
								<tr>
									<td nowrap="nowrap">
										<a href="#" onclick="myDeleteRow(this);return false;">&nbsp;x&nbsp;</a>
										开始日期:
										<s:textfield name="ksrq" readonly="readonly" cssClass="ss"
											value="%{#jdzj.ksrq}" />
										结束日期:
										<s:textfield name="jsrq" readonly="readonly" cssClass="ss"
											value="%{#jdzj.jsrq}" />
										月租金(元)：
										<s:textfield name="yzj" onblur="applyMoney();"
											value="%{#jdzj.yzj}" />
									</td>
								</tr>
							</s:iterator>
						</table>
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						费用：
					</td>
					<td class="td_form02" colspan="3" nowrap="nowrap">
						物业费
						<s:checkbox name="feiyong.wuyefei" />
						水电费
						<s:checkbox name="feiyong.shuidianfei" />
						维修费
						<s:checkbox name="feiyong.weixiufei" />
						通讯费
						<s:checkbox name="feiyong.tongxunfei" />
						其他
						<s:checkbox name="feiyong.qitafei" id="qita"
							onclick="qitafeiyong()" />
						<tt id="qitafeiyong"><s:textfield name="jjzcHtZlwg.zjsfhsdf"
								id="zjsfhsdf" disabled="true" />
						</tt>
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						结算方式：
					</td>
					<td class="td_form02">
						<s:select list="#{'1':'月付','2':'季付','3':'年付','4':'其他'}"
							name="jjzcHtZlwg.jsfs" id="way" />
					</td>
					<td class="td_form01">
						年租金价格：
					</td>
					<td class="td_form02">
						<s:textfield name="jjzcHtZlwg.nzjjg" id="nzsj" />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						租金支付方式：
					</td>
					<td class="td_form02">
						<s:select list="#{'1':'期初支付','2':'期末支付'}"
							name="jjzcHtZlwg.CZjjsfs" id="way2" />
					</td>
					<td class="td_form01">
						当地同类房屋的租金价格（元）：
					</td>
					<td class="td_form02">
						<s:textfield name="jjzcHtZlwg.ddtlfwzjjg" />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						本次清算调整金额（元）：
					</td>
					<td class="td_form02">
						<s:textfield name="jjzcHtZlwg.zlqstzje" />
					</td>
					<td class="td_form01">
						&nbsp;
					</td>
					<td class="td_form02">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						累计租金(元)：
					</td>
					<td class="td_form02">
						<s:textfield name="jjzcHtZlwg.ljzj" />
					</td>
					<td class="td_form01">
						租赁收益成本率(%)：
					</td>
					<td class="td_form02">
						<s:textfield name="jjzcHtZlwg.zjsycbl" />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						押金(元)：
					</td>
					<td class="td_form02">
						<s:textfield name="jjzcHtZlwg.yajin" />
					</td>
					<td class="td_form01">
						已收押金(元)：
					</td>
					<td class="td_form02">
						<s:textfield name="jjzcHtZlwg.ysyj" />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						违约金(元)：
					</td>
					<td class="td_form02">
						<s:textfield name="jjzcHtZlwg.wyj" />
					</td>
					<td class="td_form01">
						已收违约金(元)：
					</td>
					<td class="td_form02">
						<s:textfield name="jjzcHtZlwg.yswyj" />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						合同起始日期：
					</td>
					<td class="td_form02">
						<s:date name="%{#request.jjzcHtZlwg.htqsrq}" format="yyyy-MM-dd"
							var="draftDate1" />
						<s:textfield name="jjzcHtZlwg.htqsrq" id="htqsrq"
							value="%{#draftDate1}" readonly="true" />
					</td>
					<td class="td_form01">
						合同到期日期：
					</td>
					<td class="td_form02">
						<s:date name="%{#request.jjzcHtZlwg.htdqrq}" format="yyyy-MM-dd"
							var="draftDate2" />
						<s:textfield name="jjzcHtZlwg.htdqrq" id="htdqrq"
							value="%{#draftDate2}" readonly="true" />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						免租起始日期：
					</td>
					<td class="td_form02">
						<s:date name="%{#request.jjzcHtZlwg.mzqsrq}" format="yyyy-MM-dd"
							var="draftDate3" />
						<s:textfield id="mzqsrq" name="jjzcHtZlwg.mzqsrq"
							value="%{#draftDate3}" readonly="true" />
					</td>
					<td class="td_form01">
						免租到期日期：
					</td>
					<td class="td_form02">
						<s:date name="%{#request.jjzcHtZlwg.mzdqrq}" format="yyyy-MM-dd"
							var="draftDate4" />
						<s:textfield id="mzdqrq" name="jjzcHtZlwg.mzdqrq"
							value="%{#draftDate4}" readonly="true" />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						上次清算日期：
					</td>
					<td class="td_form02">
						<s:date name="%{#request.jjzcHtZlwg.scqsrq}" format="yyyy-MM-dd"
							var="draftDate12" />
						<s:textfield id="scqsrq" name="jjzcHtZlwg.scqsrq" readonly="true"
							value="%{#draftDate12}" />
					</td>
					<td class="td_form01">
						上次清算截止日期：
					</td>
					<td class="td_form02">
						<s:date name="%{#request.jjzcHtZlwg.scqsjzrq}" format="yyyy-MM-dd"
							var="draftDate112" />
						<s:textfield id="scqsjzrq" name="jjzcHtZlwg.scqsjzrq"
							readonly="true" value="%{#draftDate112}" />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						承租人地址：
					</td>
					<td class="td_form02" colspan="3">
						<s:textarea id="czrdz" name="jjzcHtZlwg.czrdz" rows="3"
							style="width:90%" />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						承租人法定地址：
					</td>
					<td class="td_form02" colspan="3">
						<s:textarea id="czrfddz" name="jjzcHtZlwg.czrfddz" rows="3"
							style="width:90%" />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						租赁用途：
					</td>
					<td class="td_form02" colspan="3">
						<s:textarea id="zdyt" name="jjzcHtZlwg.zlyt" rows="3"
							style="width:90%" />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						录入人：
					</td>
					<td class="td_form02">
						<s:textfield name="jjzcHtZlwg.lrr" readonly="true" id="lrr" />
					</td>
					<td class="td_form01">
						录入日期：
					</td>
					<td class="td_form02">
						<s:date name="%{#request.jjzcHtZlwg.lrrq}" format="yyyy-MM-dd"
							var="draftDate" />
						<s:textfield id="lrrq" name="jjzcHtZlwg.lrrq"
							value="%{#draftDate}" readonly="true" />
					</td>
				</tr>
			</table>
			<%@ include file="/inc/file.inc"%>
			<table>
				<tr>
					<td colspan="4">
						<input type="button" value="保存" onclick="addV();">
						<input type="button" value="关闭" id="close" onclick="close1();">
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
<script type="text/javascript">
jQuery("#purchase_list").jqGrid({       
	url:"<%=basePath%>htqs/ContractManageBody_getZc4Ht.do?htlx =${htlx}&htId=${htId}&type=pass",      
	datatype:"json",
	   colNames: ['ID','资产编号', '资产名称','资产类型','主卡片编号','主卡片名称','地区','原币原值'],
	   colModel: [
	{name:'id',index:'id',align:"center",hidden:true},
	{name:'zcbh',index:'zcbh',align:"center"},
	{name:'zcmc',index:'zcmc',align:"center"},
	{name:'CZclx',index:'CZclx',align:"center"},
	{name:'zkpbh',index:'zkpbh',align:"center"},
	{name:'kpmc',index:'kpmc',align:"center"},
	{name:'CZcdq',index:'CZcdq',align:"center"},
	{name:'ybyz',index:'ybyz',align:"center"}
	                       	],
	multiselect:true,
	rownumbers:false,
	autowidth:true,
	height:'auto',
	ondblClickRow:function(gr){
		lookAsset(gr);
	},
	prmNames:{},
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