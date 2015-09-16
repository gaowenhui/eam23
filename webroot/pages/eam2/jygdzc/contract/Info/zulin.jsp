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
		<title>租赁合同</title>
		<SCRIPT language=JavaScript type=text/JavaScript>
		$(window).bind('unload', function(){
   			resetHtbh();
		});
    $(function(){	
    	dateDiff();
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
		$("#htzzrq").datebox({formatter:function(date){return formatDate(date);}});
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
		$(".htrq").datebox({
			formatter:function(date){
				return formatDate(date);
			},
			onSelect:function(){
				checkHTRQ();
			}
		});
		 if("${view}"=="disabled"){
    		$("select,input,img,textarea").attr("disabled","disabled");
    		$("#close").attr("disabled",false);
   		 }else{
			//在列表的标题右端添加按钮，最后一个按钮距右端20px
			if(!("change"=='${operate}'||"zhongzhi"=='${operate}')){
				var buttonJSonString = '[{"buttonHandler":"add_card","buttonIcon":"icon-add","buttonText":"增加"},\
										{"buttonHandler":"delete_card","buttonIcon":"icon-remove","buttonText":"删除"}\
				]';
				addButtons(jQuery("#gview_purchase_list> .ui-jqgrid-titlebar"),buttonJSonString);
			}
			var buttonFileJSonString = '[{"buttonHandler":"addFileAss","buttonIcon":"icon-add","buttonText":"增加"},\
										{"buttonHandler":"delFileAss","buttonIcon":"icon-remove","buttonText":"删除"},\
										{"buttonHandler":"up","buttonIcon":"icon-up","buttonText":"上移"},\
                                        {"buttonHandler":"down","buttonIcon":"icon-down","buttonText":"下移"}\
			]';
			addButtons(jQuery("#gview_file_list > .ui-jqgrid-titlebar"),buttonFileJSonString);
		}
		if($("#htbh").val()!=""&&$("#htbh").val()!=null){
			$("#scbh").remove();
		}
	});
	function delete_card(){
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
	};
	function add_card(){
		var zcIds = jQuery("#purchase_list").getDataIDs();
		var bmbh = document.getElementById("bmbh").value;
		bmbh = encodeURI(bmbh);
		if(zcIds.length>0){
			alert("已添加资产，不能添加多条资产信息!");
			return false;
		}
		var url = '<%=request.getContextPath()%>/jygdzc/AssetQuery_init.do?returnValue=true&bmbh='+bmbh+'&isModal=true&mulSelect=false&sheettype=check&headId=${headId}';
	  	var g_ = 'height=600, width=1000, top=10, left=100, toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no';
		// window.open(url,'',g_);
		var vReturnValue=window.showModalDialog(url,'_blank','help:no;scroll:yes;resizable:no;status:0;dialogWidth:1050px;dialogHeight:600px;center:yes');
		if(typeof(vReturnValue)!='undefined'){
			addValue(vReturnValue);
		}
		 //window.open(url);
	  	return false;
	};
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
		var htqsrq = document.getElementById("htqsrq").value; 
     	var htdqrq = document.getElementById("htdqrq").value;
     	var ksrq = document.getElementsByName("ksrq");
     	var jsrq = document.getElementsByName("jsrq");
		if(htqsrq==null||htqsrq==""){
			alert("请先输入合同起始日期");
			document.getElementById("htqsrq").focus();
			return false;
		}
		if(htdqrq==null||htdqrq==""){
			alert("请先输入合同到期日期");
			document.getElementById("htdqrq").focus();
			return false;
		}
		if(jsrq.length>2){
			if(jsrq[jsrq.length-1].value==null||jsrq[jsrq.length-1].value==""){
				alert("结束日期不能为空");
				jsrq[jsrq.length-1].focus();
				return false;
			}
		}
		for(var  i=1;i<ksrq.length;i++){
	     		if(ksrq[i].value>jsrq[i].value&&jsrq[i].value!=null&&jsrq[i].value!=""){
	     			alert("结束日期不能小于开始日期");
	     			jsrq[i].focus();
	     			return false;
	     		}
     	 }
		$("#TableBox").append(xxx);
		$(".ss").datebox({
			formatter:function(date){
			return formatDate(date);
		 	},
			onSelect:function(){
				changeDate2();
				dateDiff();
			}
		});
		changeDate();
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
	//
	function changeDate2(){
		
		 var ksrq = document.getElementsByName("ksrq");
		 var jsrq = document.getElementsByName("jsrq");
		 for(var  i=1;i<ksrq.length;i++){
	     		if(ksrq[i].value>jsrq[i].value&&jsrq[i].value!=null&&jsrq[i].value!=""){
	     			alert("结束日期不能小于开始日期");
	     			jsrq[i].focus();
	     			return false;
	     		}
     	 }
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
	function change(){
		
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
			   myForm.action="<%=request.getContextPath()%>/htqs/ContractManageBody_saveBody.do";
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
			$.post("<%=basePath%>htqs/ContractManageBody_createNum.do",{
				"code":"zlht"
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
					"code":"zlht"
				})
			}
		}
	 function listDays(monthNumber) {
	  var days = [], 
	  today = new Date(),
	   d = new Date(today.getFullYear(), monthNumber, 1); 
	   while (d.getMonth() == monthNumber) { 
	   days.push({ "date": d.getDate(), "weekday": d.getDay()}); 
	   d.setDate(d.getDate() + 1); 
	   } 
	   return days; 
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
	     			var iDays = parseInt(Math.abs(jsrq1 -nowYearStart) / 1000 / 60 / 60 /24);
	     			if(yzj[i].value!=null&&yzj[i].value!=""){
	     				//money = money + (iDays * yzj[i].value / 30);
	     				money = money + (12 * yzj[i].value);
	     			}
	     		}
	     	}else if(ksrq[i].value>YearStart){
	     		if(ksrq[i].value!=null&&ksrq[i].value!=""&&ksrq[i].value>YearEnd){
	     		}else if(jsrq[i].value!=null&&jsrq[i].value!=""&&jsrq[i].value<=YearEnd){
	     			var iDays = parseInt(Math.abs(jsrq1 -ksrq1) / 1000 / 60 / 60 /24);
	     			if(yzj[i].value!=null&&yzj[i].value!=""){
	     				//money = money + (iDays * yzj[i].value / 30);
	     				money = money + (12 * yzj[i].value);
	     			}
	     		}else if(jsrq[i].value!=null&&jsrq[i].value!=""&&jsrq[i].value>YearEnd){
	     			var iDays = parseInt(Math.abs(nowYearEnd -ksrq1) / 1000 / 60 / 60 /24);
	     			if(yzj[i].value!=null&&yzj[i].value!=""){
	     				//money = money + (iDays * yzj[i].value / 30);
	     				money = money + (12 * yzj[i].value);
	     			}
	     		}
	     	}
		}
		document.getElementById("nzsj").value=parseFloat(money).toFixed(2);
	} 
     function checkEAMFormJSMethod(){
			var htbh = document.getElementById("htbh");
			if(htbh.value == null || htbh.value.length == 0){
				alert("合同编号不能为空！");
				htbh.focus();
		      return false;
		    }
	        //阶段月租金的控制
		     var ksrq = document.getElementsByName("ksrq");
		     var jsrq = document.getElementsByName("jsrq");
		     var yzj = document.getElementsByName("yzj");
		     var htjsrq = document.getElementById("htdqrq").value;
		     var str = true;
		     for (var i=1;i<ksrq.length;i++){
				 var data1=ksrq[i].value;
				 if(ksrq[i].value==null||ksrq[i].value==""){
					alert("阶段月租金开始日期不能为空！");
					ksrq[i].focus();
					str = false;
					return str;
				}
				if(jsrq[i].value==null||jsrq[i].value==""){
					alert("阶段月租金结束日期不能为空！");
					jsrq[i].focus();
					str = false;
					return str;
				}
			  	if(i ==ksrq.length-1 ){
				  	if(jsrq[i].value!=htjsrq){
				  		alert("阶段租金结束日期应为合同结束日期");
				  		jsrq[i].focus();
				  		str = false;
						return str;
				  	}
			  	}
			  	if(yzj[i].value==null||yzj[i].value==""){
					alert("月租金不能为空！");
					yzj[i].focus();
					str = false;
					return str;
			  	}
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
		   //数字校验
		    var htdqrq = document.getElementById("htdqrq");
			if(htdqrq.value == null || htdqrq.value.length == 0){
				alert("合同到期不能为空!");
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
				alert("合同结束日期不应该大于合同开始日期，请重新输入！");
				return false;
			}
		    
		    return true;
		}
	function checkHTRQ(){
		var htqsrq = document.getElementById("htqsrq").value;
	    var htdqrq = document.getElementById("htdqrq").value;
	    document.getElementById("htzzrq").value = htdqrq;
	    if(htqsrq!='' && htdqrq!='' && htqsrq > htdqrq){
			alert("合同结束日期不应该大于合同开始日期，请重新输入！");
			document.getElementById("htdqrq").focus();
			return false;
		}
	}	
	function checkPhone(czflxdh){
			var czflxdhs = czflxdh.value;
			if(!czflxdhs.isMobile() && !czflxdhs.isPhone()){
				alert("电话号码不正确，请重新输入。");
				czflxdh.focus();
			}
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
	}
	</script>
	</head>
	<body>
		<table id="TableBox1" style="display: none" width="100%" border="0"
			cellspacing="0" cellpadding="0" align="center" class="newtable">
			<tr>
				<td nowrap="nowrap">
					<a href="#" onclick="myDeleteRow(this);return false;">&nbsp;x&nbsp;</a>
					<font color="red">*</font>开始日期:
					<input type="text" name="ksrq" disabled="true"  class="ss" />
					<font color="red">*</font>结束日期:
					<input type="text"   name="jsrq" readonly="readonly" class="ss" />
					<font color="red">*</font>月租金(元)：
					<input type="text" name="yzj" id = "yzj" onblur="checkFloat(this);dateDiff();" />
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
				<input type="hidden" id="bmbh" name="bmbh" value="${bmbh}" />
				<s:hidden name="headId" />
				<s:hidden name="sheettype" />
				<s:hidden name="jjzcHtZlwgLsb.cldId" />
				<s:hidden name="jjzcHtZlwgLsb.CHtlx" id="htlx" value="2" />
				<s:hidden name="jjzcHtZlwgLsb.zcid" id="zcid" />
				<s:hidden name="jjzcHtZlwgLsb.zcmc" id="zcmc" />
				<s:hidden name="jjzcHtZlwgLsb.zcbh" id="zcbh" />
				<s:hidden name="ywlx" value="%{#request.ywlx}" />
				<s:hidden name="bussiness" value="addZW" />
				<s:hidden name="jjzcHtZlwgLsb.id" id="htId" />
				<s:set name="biaodanid" value="jjzcHtZlwgLsb.id" />
				<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
				<s:hidden name="operate" />
				<tr>
					<td colspan="4" class="td_top" align="left">
						合同信息
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						<font color="red">*</font>合同编号：
					</td>
					<td class="td_form02">
						<s:textfield name="jjzcHtZlwgLsb.htbh" id="htbh" readonly="true" />
						<input type="button" id="scbh" value="生成编号"
							onclick="createBianhao();" />
					</td>
					<td class="td_form01">
						实物合同编号：
					</td>
					<td class="td_form02">
						<s:textfield name="jjzcHtZlwgLsb.swhtbh" />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						合同状态：
					</td>
					<td class="td_form02">
						<s:select list="#{'1':'执行中','2':'待执行','3':'执行完毕'}" name="jjzcHtZlwgLsb.CHtzt" />
					</td>
					<td class="td_form01">
						承租人：
					</td>
					<td class="td_form02">
						<s:textfield name="jjzcHtZlwgLsb.czr" />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						承租人性质：
					</td>
					<td class="td_form02">
						<e:select parRefKey="RENTER_PROPERTY" headerKey="" headerValue=""
							list="#{}" name="jjzcHtZlwgLsb.CCzrxz" />
					</td>
					<td class="td_form01">
						承租联系人：
					</td>
					<td class="td_form02">
						<s:textfield name="jjzcHtZlwgLsb.czlxr" />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						承租方联系电话：
					</td>
					<td class="td_form02">
						<s:textfield name="jjzcHtZlwgLsb.czflxdh" id="czflxdh"
							onblur="checkPhone(this);" />
					</td>
					<td class="td_form01">
						交易对象：
					</td>
					<td class="td_form02">
						<s:select list="#{'1':'建行',2:'非建行'}" name="jjzcHtZlwgLsb.jydx" />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
					<!--租金价格 = 月租金除以承租数量-->
						承租数量：
					</td>
					<td class="td_form02">
						<s:textfield name="jjzcHtZlwgLsb.czsl" id="czsl" onblur="checkMoney(this);"/>
					</td>
					<td class="td_form01">
						租金价格(元)：
					</td>
					<td class="td_form02">
						<s:textfield name="jjzcHtZlwgLsb.zjjg" id="zjjg" disabled="true"/>
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
										<font color="red">*</font>开始日期:
										<s:textfield name="ksrq" disabled="true" cssClass="ss"
											value="%{#jdzj.ksrq}" />
										<font color="red">*</font>结束日期:
										<s:textfield name="jsrq" readonly="readonly"  cssClass="ss"
											value="%{#jdzj.jsrq}" />
										<font color="red">*</font>月租金(元)：
										<s:textfield name="yzj" id="yzj" 
											value="%{#jdzj.yzj}" onblur="checkFloat(this);dateDiff(); " />
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
						<tt id="qitafeiyong"><s:textfield
								name="jjzcHtZlwgLsb.zjsfhsdf" id="zjsfhsdf" disabled="true" />
						</tt>
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						结算方式：
					</td>
					<td class="td_form02">
						<s:select list="#{'1':'月付','2':'季付','3':'年付','4':'其他'}"
							name="jjzcHtZlwgLsb.jsfs" id="way" />
					</td>
					<td class="td_form01">
						年租金价格(元)：
					</td>
					<td class="td_form02">
						<s:textfield name="jjzcHtZlwgLsb.nzjjg" id="nzsj" disabled="true" />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						租金支付方式：
					</td>
					<td class="td_form02">
						<s:select list="#{'1':'期初支付','2':'期末支付'}"
							name="jjzcHtZlwgLsb.CZjjsfs" id="way2" />
					</td>
					<td class="td_form01">
						当地同类房屋的租金价格（元）：
					</td>
					<td class="td_form02">
						<s:textfield name="jjzcHtZlwgLsb.ddtlfwzjjg"
							onblur="checkFloat(this);" />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						本次清算调整金额（元）：
					</td>
					<td class="td_form02">
						<s:textfield name="jjzcHtZlwgLsb.zlqstzje"
							onblur="checkFloat(this);" />
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
						<s:textfield name="jjzcHtZlwgLsb.ljzj" onblur="checkFloat(this);" />
					</td>
					<td class="td_form01">
						租赁收益成本率(%)：
					</td>
					<td class="td_form02">
						<s:textfield name="jjzcHtZlwgLsb.zjsycbl"
							onblur="checkPresent1(this);" />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						押金(元)：
					</td>
					<td class="td_form02">
						<s:textfield name="jjzcHtZlwgLsb.yajin" onblur="checkFloat(this);" />
					</td>
					<td class="td_form01">
						已收押金(元)：
					</td>
					<td class="td_form02">
						<s:textfield name="jjzcHtZlwgLsb.ysyj" onblur="checkFloat(this);" />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						违约金(元)：
					</td>
					<td class="td_form02">
						<s:textfield name="jjzcHtZlwgLsb.wyj" onblur="checkFloat(this);" />
					</td>
					<td class="td_form01">
						已收违约金(元)：
					</td>
					<td class="td_form02">
						<s:textfield name="jjzcHtZlwgLsb.yswyj" onblur="checkFloat(this);" />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						<font color="red">*</font>合同起始日期：
					</td>
					<td class="td_form02">
						<s:date name="%{#request.jjzcHtZlwgLsb.htqsrq}"
							format="yyyy-MM-dd" var="draftDate1" />
						<s:textfield name="jjzcHtZlwgLsb.htqsrq" cssClass="htrq" id="htqsrq"
							value="%{#draftDate1}" readonly="true" />
					</td>
					<td class="td_form01">
						<font color="red">*</font>合同到期日期：
					</td>
					<td class="td_form02">
						<s:date name="%{#request.jjzcHtZlwgLsb.htdqrq}"
							format="yyyy-MM-dd" var="draftDate2" />
						<s:textfield name="jjzcHtZlwgLsb.htdqrq" cssClass="htrq" id="htdqrq"
							value="%{#draftDate2}" readonly="true" />
						<s:hidden name="jjzcHtZlwgLsb.htzzrq"  id="htzzrq"
							value="%{#draftDate2}" readonly="true" />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						免租起始日期：
					</td>
					<td class="td_form02">
						<s:date name="%{#request.jjzcHtZlwgLsb.mzqsrq}"
							format="yyyy-MM-dd" var="draftDate3" />
						<s:textfield id="mzqsrq" name="jjzcHtZlwgLsb.mzqsrq"
							value="%{#draftDate3}" readonly="true" />
					</td>
					<td class="td_form01">
						免租到期日期：
					</td>
					<td class="td_form02">
						<s:date name="%{#request.jjzcHtZlwgLsb.mzdqrq}"
							format="yyyy-MM-dd" var="draftDate4" />
						<s:textfield id="mzdqrq" name="jjzcHtZlwgLsb.mzdqrq"
							value="%{#draftDate4}" readonly="true" />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						上次清算日期：
					</td>
					<td class="td_form02">
						<s:date name="%{#request.jjzcHtZlwgLsb.scqsrq}"
							format="yyyy-MM-dd" var="draftDate41" />
						<s:textfield id="scqsrq" name="jjzcHtZlwgLsb.scqsrq"
							readonly="true" value="%{#draftDate41}"/>
					</td>
					<td class="td_form01">
						上次清算截止日期：
					</td>
					<td class="td_form02">
						<s:date name="%{#request.jjzcHtZlwgLsb.scqsjzrq}"
							format="yyyy-MM-dd" var="draftDate42" />
						<s:textfield id="scqsjzrq" name="jjzcHtZlwgLsb.scqsjzrq"
							readonly="true" value="%{#draftDate42}"/>
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						承租人地址：
					</td>
					<td class="td_form02" colspan="3">
						<s:textarea id="czrdz" name="jjzcHtZlwgLsb.czrdz" rows="3"
							style="width:90%" />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						承租人法定地址：
					</td>
					<td class="td_form02" colspan="3">
						<s:textarea id="czrfddz" name="jjzcHtZlwgLsb.czrfddz" rows="3"
							style="width:90%" />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						租赁用途：
					</td>
					<td class="td_form02" colspan="3">
						<s:textarea id="zdyt" name="jjzcHtZlwgLsb.zlyt" rows="3"
							style="width:90%" />
					</td>
				</tr>
				<tr>
					<td class="td_form01">
						录入人：
					</td>
					<td class="td_form02">
						<s:textfield name="jjzcHtZlwgLsb.lrr" readonly="true" id="lrr" />
					</td>
					<td class="td_form01">
						录入日期：
					</td>
					<td class="td_form02">
						<s:date name="%{#request.jjzcHtZlwgLsb.lrrq}" format="yyyy-MM-dd"
							var="draftDate" />
						<s:textfield id="lrrq" name="jjzcHtZlwgLsb.lrrq"
							value="%{#draftDate}" readonly="true" />
					</td>
				</tr>
			</table>
			<%@ include file="/inc/file.inc"%>
			<table>
				<tr>
					<td colspan="4" align="center">
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