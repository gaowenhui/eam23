<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ include file="/pages/eam2/stgl/checkJS.inc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%
String id = (String)request.getAttribute("id");
String stid = (String)request.getAttribute("stid");
String rework = (String)request.getAttribute("rework");
String look = (String)request.getAttribute("look");
String newAdd = request.getParameter("newAdd");
String stzwmc = (String)request.getAttribute("stzwmc");
 %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<base href="<%=basePath %>"/>
<title>非造价咨询类实体</title>
<SCRIPT language=JavaScript type=text/JavaScript>
	
	function AddTable(){
	var tr = TableBox1.insertRow();

	var td = tr.insertCell()
	
	td.colSpan = '19';

	td.innerHTML="<a href='#' onclick='DeleteTr()'>&nbsp;x&nbsp;</a>股东名称：<input type='text'>控股比例（%）：<input type='text'>注册资本（元）：<input type='text'>出资方式：<select><option value='1'>货币</option><option value='2'>实物</option><option value='3'>土地（含房屋）</option><option value='4'>无形资产</option><option value='5'>其他（见备注）</option></select>\
                出资情况:\
                  <select>\
                  <option value='1'>出资到位</option>\
                  <option value='2'>出资不实但达到最低出资额</option>\
                  <option value='3'>出资不实未达到最低出资额</option>\
                  <option value='4'>未出资</option>\
                  </select>\
				  <br>出资不实的数额(万元）:<input type='text'>\
                  抽逃出资:\
                  <select >\
                  <option value='1'>存在</option>\
                  <option value='2'>不存在</option>\
                  <option value='3'>无资料</option>\
                  </select>\
                  抽逃数额(元 )：\
                &nbsp;\
                <input ></input>\
                独立法人资格:\
                <select >\
                  <option value='1'>是</option>\
                  <option value='2'>否</option>\
                </select><br><br>";
	
	}	
function AddTable1(tableid){
	
	var tr =  document.getElementById(tableid).insertRow();
	var td = tr.insertCell();
	 td.className = 'td_zxy01_1';
	td.colSpan = '8';
	td.innerHTML="<a href='#' onclick='DeleteTr1(this,\"" + tableid + "\")'>&nbsp;x&nbsp;</a>&nbsp;姓名：<input  style='width:100'>&nbsp;联系方式：<input   style='width:100'>&nbsp;工作单位：<input   style='width:100'>";
	
	}
	function DeleteTr1(r,id){

			 var b=r.parentNode.parentNode.rowIndex
			 document.getElementById(id).deleteRow(b)
 
	}
	function up(){
	var a="启动清算";
	var b="清算报告审批";
	var c="缴销营业执照";
	var huanjie=document.getElementById("dqjd");
				
			if (huanjie.value ==a ){
				alert("已经是起始阶段");
			
			}else{
				if(huanjie.value==b ){
					huanjie.value=a;
					qidong.style.display="block";
					shenpi.style.display="none";
					jiaoxiao.style.display="none";
				}else{
					if(huanjie.value==c ){
						huanjie.value=b;
						qidong.style.display="none";
						shenpi.style.display="block";
						jiaoxiao.style.display="none";
					}
				}
			}
 }	
function down (){
	var a="启动清算";
	var b="清算报告审批";
	var c="缴销营业执照";
	var huanjie=document.getElementById("dqjd");
				
			if (huanjie.value ==a ){
					huanjie.value=b;
					qidong.style.display="none";
					shenpi.style.display="block";
					jiaoxiao.style.display="none";
			
			}else{
				if(huanjie.value==b ){
					huanjie.value=c;
					qidong.style.display="none";
					shenpi.style.display="none";
					jiaoxiao.style.display="block";
				}else{
					if(huanjie.value==c ){
						alert("已经是最后阶段");
					}
				}
			}
 }	
	function DeleteTr(){
			TableBox1.deleteRow();
	}
	function displayUpperLayer(index){
		for(var i=0;i<9;i++){
			if(index==i){
			   document.getElementById("upperLayer"+i).style.display="block";
			}else{
			   document.getElementById("upperLayer"+i).style.display="none";
			}
		}
	}
	function disposalgqzr(){
	gqzrWhole.style.display=gqzrWhole.style.display=='none'?'block':'none';
	nbgb.style.display='none';
	pcqs.style.display='none';

	}
	function disposalnbgb(){
	nbgb.style.display=nbgb.style.display=='none'?'block':'none';
	gqzrWhole.style.display='none';
	pcqs.style.display='none';

	}
	function disposalpcqs(){
	pcqs.style.display=pcqs.style.display=='none'?'block':'none';
	nbgb.style.display='none';
	gqzrWhole.style.display='none';

	}
	
</SCRIPT>

<SCRIPT language=JavaScript type=text/JavaScript>
$(document).ready(function(){
		<%if("1".equals(look)){%>
		//添加按钮
		var buttonJSonString = '[{"buttonHandler":"lookAss","buttonIcon":"icon-search","buttonText":"查看"}]';
		
	   <%}else{%>
	   //添加按钮
		var buttonJSonString = '[{"buttonHandler":"lookAss","buttonIcon":"icon-search","buttonText":"查看"},\
								{"buttonHandler":"affairAddAss","buttonIcon":"icon-add","buttonText":"增加"},\
								{"buttonHandler":"affairModifyAss","buttonIcon":"icon-edit","buttonText":"修改"}\
								]';
		
	   <%}%>
	   addButtons(jQuery("#gview_contributions_list > .ui-jqgrid-titlebar"),buttonJSonString);
		
		jQuery("#contributions_list").setGridWidth($("#widthRule_affair").width());
			$(window).bind('resize', function() {  
			jQuery("#contributions_list").setGridWidth($("#widthRule_affair").width()); 
		}); 
	});
	

	
	
		function save(){
				$("#myform").attr("action","<%=basePath%>stgl/weihu_saveStFsxx.do");
    			$("#myform").submit();
		}
		
	var winVar = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no, directories=no";	
			function lookAss(){
				var gr = jQuery("#contributions_list").jqGrid('getGridParam','selarrrow');
				document.getElementById('id').value = gr ;
				var rdBasicWidth = "500px";
				var rdBasicHeight = "400px";
				var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
				if(gr.length == 0){
					alert("请选择要查看的记录")
				}else if (gr.length > 1){
					alert("只能选择一条要查看的记录")
				}else{				
	//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
				window.open('weihu_newNonList.do?id='+gr+'&fslx='+0+'&pop='+13+'&look='+1,'',winVar);
				}
			}
		
			function affairAddAss(){
//				contributions_information.style.display=contributions_information.style.display=='none'?'block':'none';
				var obj = jQuery("#contributions_list").getDataIDs();
				var rid = 0;
				var bili = 0;
				for(rid=0; rid < obj.length; rid++){
					bili += Number(jQuery("#contributions_list").getCell(obj[rid],'qkgbl'));
				}
				var id = document.getElementById("id").value;
				var stid = '<%=stid%>';
				var rdBasicWidth = "500px";
				var rdBasicHeight = "400px";
				var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
	//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
				window.open('weihu_newNonList.do?id='+id+'&fslx='+0+'&stid='+stid+'&pop='+13+'&newAdd='+1+'&bili=' + bili,'',winVar);
			}
	
			function affairModifyAss(){
				var gr = jQuery("#contributions_list").jqGrid('getGridParam','selarrrow');
				var id = '<%=id%>';
				document.getElementById('id').value = gr ;
				var obj = jQuery("#contributions_list").getDataIDs();
				var rid = 0;
				var bili = 0;
				for(rid=0; rid < obj.length; rid++){
					bili += Number(jQuery("#contributions_list").getCell(obj[rid],'qkgbl'));
				}
				bili -= Number(jQuery("#contributions_list").getCell(gr,'qkgbl'));
				var rdBasicWidth = "500px";
				var rdBasicHeight = "400px";
				var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
				if(gr.length == 0){
					alert("请选择要修改的记录")
				}else if (gr.length > 1){
					alert("只能选择一条要修改的记录")
				}else{				
	//			var returnValue = window.showModalDialog('weihu_newPersonList.do?id='+id+'&fslx='+1, window, _g_privateDialogFeatures);
				window.open('weihu_newNonList.do?id='+gr+'&fslx='+0+'&pop='+13+'&bili=' + bili,'',winVar);
				}
			}
			
			function affairDelAss(){
				var gr = jQuery("#contributions_list").jqGrid('getGridParam','selarrrow');
				if( gr.length > 0 ) {
					if(confirm("确认删除！")){
						$.post("<%=request.getContextPath()%>/stgl/weihu_deleList.do",{
							"fsxxIds":"" + gr
						},function(returnStr){
							alert(returnStr);
							$("#contributions_list").trigger("reloadGrid");
						});
					}
				}
				else{
					alert("请选择要删除的记录!"); 		
					}
			}
		
		
		function reloadGrid(){
			jQuery("#contributions_list").setGridParam({
								}).trigger("reloadGrid");
		}
		
		$("#myform").ajaxForm({
    		beforeSubmit:checkPageInput
		}); 
		$(function(){
			$("#myform").ajaxForm({
			   	success: function(responseText){
			   		window.reloadGrid();
			   		var reStr = eval('(' + responseText + ')');
				   	document.getElementById("zcbh").value = reStr.result[0].stzcbh;
			   		$("#CShengfenName").attr("disabled","disabled");
			   		alert("保存成功!");
			   		window.parent.initVar($("#zcbh").val());
			   	}
		   });
		   $("#CShengfen").val($("#CShengfenName").val());
			$("#clsj").datebox({
				formatter:function(date){
					return formatDate(date);
				}
			});
			window.parent.initVar($("#zcbh").val());
			
			if('1' == '<%=look%>'){
			  var a  = document.getElementsByTagName("input");
			  var b  = document.getElementsByTagName("select");
			  var c  = document.getElementsByTagName("textarea");
				for(var i=0;i<a.length;i++){
					a[i].disabled = "true";
				}
				for(var i=0;i<b.length;i++){
					b[i].disabled = "true";
				}
				for(var i=0;i<c.length;i++){
					c[i].disabled = "true";
				}				
			}
		});
		
		
//控制基本信息的日志
	var isNew = true;
	function saveSt(){
		if(checkPageInput()){
			$("input").removeAttr("disabled"); 
			$("textarea").removeAttr("disabled"); 
			$("select").removeAttr("disabled"); 
			if(isNew){
				$("#myform").attr("action","<%=basePath%>stgl/weihu_saveEntity.do?newAdd=<%=newAdd%>");
			}else{
				$("#myform").attr("action","<%=basePath%>stgl/weihu_saveEntity.do");
			}
	    	$("#myform").submit();
	    	isNew = false;
		}
	}
	
	

	
	function ww(){
		$("#CShengfen").val($("#CShengfenName").val());
	}

		function checkPageInput(){
			var stzwmc = document.getElementById("stzwmc");
			if(stzwmc.value == null || stzwmc.value.length == 0){
				alert("实体名称不能为空！");
				stzwmc.focus();
		      return false;
		    }
		    return true;
		}
	
	

	//判断实体名称在数据库中是否存在
	function stshifoucunzai1(){
	    var stzwmc = document.getElementById("stzwmc").value;
	    var stid = document.getElementById("stid").value;
	     $.post("<%=request.getContextPath()%>/stgl/weihu_ststzwmc.do",{
	     "stzwmc": stzwmc,
	     "stid": stid
	     },function(panduan){
		     if("error"==panduan){
			     alert("实体已经存在");
			     document.getElementById("stzwmc").value="";
	    	 }  
		})	
	}	
</SCRIPT>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" onload="dd();">
<s:form action="stgl/weihu_saveStFsxx.do" method="post" id="myform">
<s:hidden name="sf.id" id="id"></s:hidden>
<s:hidden name="st.id" id="stid"></s:hidden>
<s:hidden name="sf.leixing" id="leixing"></s:hidden>
<s:hidden name="st.stlx" id="stlx" value="1"></s:hidden>
<table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" >
  <tr>
    <td height="25" align="center" valign="bottom" class="td06">
		<table width="100%" border="0" cellspacing="3" cellpadding="0">
		  <tr>
			<td width="15"><img src="<%=request.getContextPath() %>/resource/ProjectImages/index_32.gif" width="9" height="9"></img><br /></td>
			<td valign="bottom" align="left" class="title">非造价咨询类实体信息</td>
		  </tr>
		</table>
	</td>
  </tr>
</table>

  <table id="widthRule_affair" width="100%" border="1" cellpadding="0" cellspacing="0" align="center" >
    <tr>
      <td class="td_zxy01">资产编号(自动生成)：</td>
      <td class="td_zxy02"><s:textfield name="st.zcbh" id="zcbh" readonly="true" disabled="true" style="width: 60%;"/></td>
      <td class="td_zxy01">
      <font color="#FF0000"><strong>*</strong></font>
      	实体名称：</td>
      <td class="td_zxy02"><s:textfield name="st.stzwmc" id="stzwmc" onblur="stshifoucunzai1()"/></td>
   </tr>  
   <tr>
      <td class="td_zxy01">省份：</td>
      <td class="td_zxy02">
      <s:hidden name="st.CShengfen" id="CShengfen"/>
      <%if(!"1".equals(rework)) {%>
      <e:select parRefKey="PROVIENCE" list="#{}"  id="CShengfenName" value="%{#request.st.CShengfen }"  onchange="ww()"/>
      <%}else{ %>
      <e:select parRefKey="PROVIENCE" list="#{}"  id="CShengfenName" value="%{#request.st.CShengfen }"  disabled="true" onchange="ww()"/>
      <%} %>
      </td>
      <td class="td_zxy01">&nbsp;</td>
      <td class="td_zxy02">&nbsp;</td>
    </tr>
    <tr>
      <td class="td_zxy01">成立时间：</td>
      <td class="td_zxy02">
      	 	<s:date name="%{#request.st.clsj}" format="yyyy-MM-dd" var="clsj"/>
			<s:textfield id="clsj" name="st.clsj"  value="%{#clsj}" readonly="true"  />
      </td>
      <td class="td_zxy01">实体现状：</td>
      <td class="td_zxy02"><e:select parRefKey="ENTITY_CURRENT_STATUS" list="#{}" name="st.stxz2" id="stxz2" value="%{#request.st.stxz2 }"/></td>
    </tr>
    <tr>
   	  <td class="td_zxy01">尚有人员数：</td>
      <td class="td_zxy02"><s:textfield name="st.syrys" id="syrys" style="width: 60%;" onblur="checkNumber(this);"/></td>
      <td class="td_zxy01">有无历史遗留问题：</td>
      <td class="td_zxy02"><s:select id="ywlsylwt" list="#{'':'请选择',1:'有',0:'否'}" name="st.ywlsylwt" value="%{#request.st.ywlsylwt }"></s:select></td>
    </tr>
    
    <tr>
     <td class="td_zxy01">实体处置方式：</td>
     <td class="td_zxy02"><e:select parRefKey="ENTITY_DISPOSE_METHOD" headerKey=""  headerValue="请选择" list="#{}" name="st.c_czfs" id="c_czfs" value="%{#request.st.c_czfs }"/></td>
     <td class="td_zxy01">管理部门：</td>
     <td class="td_zxy02"><s:select list="#{'':'请选择管理部门',1:'委托代理业务部',2:'资产管理处置部'}" name="st.CGlbm" id="CGlbm" value="%{#request.st.CGlbm }"/></td>
    </tr>
    
    <tr>
      <td class="td_zxy01">委托管理机构：</td>
      <td class="td_zxy02"><s:textfield name="st.CWtgljg" id="CWtgljg" /></td>
      <td class="td_zxy01">实体状态</td>
      <td class="td_zxy02">
      <e:select parRefKey="ENTITY_STATUS" list="#{}" name="st.CStzt" id="CStzt" value="%{#request.st.CStzt }" />
      </td>
    </tr>
	<tr>
      <td class="td_zxy01">历史遗留问题描述：</td>
      <td colspan="3" class="td_zxy02"><s:textarea name="st.lsylwtms" id="lsylwtms" cols="110" rows="3" style="width: 85%;"/></td>
	</tr>
  </table>
  <br/>
	
<table id="contributions_list"></table>

	<div align="left"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;财务信息</strong></div>
	<table width="100%" border="1" cellpadding="0" cellspacing="0" align="center"  >
    <tr>
      <td class="td_zxy01">原值(万元)：</td>
      <td class="td_zxy02"><s:textfield name="st.yuanzhi" id="yuanzhi" style="width: 60%;" onblur="checkFloat(this);"/></td>
      <td class="td_zxy01">净值(万元)：</td>
      <td class="td_zxy02"><s:textfield name="st.jingzhi" id="jingzhi" style="width: 60%;" onblur="checkFloat(this);"/></td>
    </tr> 
    <tr>
      <td class="td_zxy01">减值准备(万元)：</td>
      <td class="td_zxy02"><s:textfield name="st.jzzb" id="jzzb" onblur="checkFloat(this);"/></td>
      <td class="td_zxy01">对建投是否有负债：</td>
      <td class="td_zxy02"><s:select id="djtsfyfz" list="#{'':'请选择',1:'是',0:'无'}" name="st.djtsfyfz" value="%{#request.st.djtsfyfz }"></s:select></td>
    </tr>
    <tr>
      <td class="td_zxy01">负债金额(万元)：</td>
      <td class="td_zxy02"><s:textfield name="st.fzje" id="fzje" style="width: 60%;"  onblur="checkFloat(this);"/></td>
      <td class="td_zxy01">账面内是否有预计负债：</td>
      <td class="td_zxy02"><s:select id="zmnsfyyjfz" list="#{'':'请选择',1:'是',2:'无'}" name="st.zmnsfyyjfz" value="%{#request.st.zmnsfyyjfz }"></s:select></td>
    </tr>
    <tr>
      <td class="td_zxy01">预计负债金额(万元)：</td>
      <td class="td_zxy02"><s:textfield name="st.yjfzje" id="yjfzje" style="width: 60%;"  onblur="checkFloat(this);"/></td>
   	  <td class="td_zxy01">账面资产总额(万元)：</td>
      <td class="td_zxy02"><s:textfield name="st.zmzcze" id="zmzcze" style="width: 60%;"  onblur="checkFloat(this);"/></td>
    </tr>
  <script type="text/javascript"> 
    function dd(){
    }
</script>
    <tr>
      <td class="td_zxy01">账面资产负债(万元)：</td>
      <td class="td_zxy02"><s:textfield name="st.zmzcfz" id="zmzcfz" style="width: 60%;"  onblur="checkFloat(this);"/></td>
      <td class="td_zxy01">&nbsp;</td>
      <td class="td_zxy02">&nbsp;</td>
    </tr>
    <tr>
      <td class="td_zxy01">备注：</td>
      <td colspan="3" class="td_zxy02"><s:textarea name="st.beizhu" id="beizhu" style="width: 85%;"  rows="3"/>
    </tr>
  </table>
   <table class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0" >
          <td align="right">
          <%if(!"1".equals(look)) {%>
            <input name="submit2" type="submit" value="确定" onClick="saveSt();return false;"/>
            <input type="reset" value="重置" name="B2" />
           <%} %>
           </td>
    </table>
</s:form>
</body>
<script type="text/javascript">
				jQuery("#contributions_list").jqGrid({
					url:"<%=basePath%>stgl/weihu_viewEntity.do",
					postData:{'fslx':0,'stid':'<%=stid%>','id':'<%=id%>','pop':'13'},
					datatype: "json",
					colNames:['id','股东名称','控股比例（%）','注册资本（元）','出资方式','出资情况','出资不实的数额（万元）','抽逃出资','抽逃数额（元）','独立法人资格'],
					colModel:[	
						{name:'id',index:'taxName',hidden:true},
					    {name:'qgdmc',index:'taxName'},
						{name:'qkgbl',index:'name'},
						{name:'qzczb',index:'security'},
						{name:'qcCzfs',index:'claimsaccount',editoptions:{value:"1:货币;2:实物;3:土地（含房屋）;4:无形资产;5:其他（见备注）"},hidden:true},
						{name:'qcCzqk',index:'actulHolder',editoptions:{value:"1:出资到位;2:出资不实但达到最低出资额;3:出资不实未达到最低出资额;4:未出资"},hidden:true},
						{name:'qczbsse',index:'security',hidden:true},	
						{name:'qcCtcz',index:'security',  editable: false,editoptions:{value:"1:存在;2:不存;3:无资料"},hidden:true},
						{name:'qctse',index:'security'},	
						{name:'qdlfrzg',index:'security'}
					],
					editurl:"entity-info-alter.html",
						multiselect:true,
						rownumbers:true,
						autowidth:true,
						height:'auto',
						viewrecords:true,
						prmNames:{page:"paginator.currentPage",rows:"paginator.pageCount"},
						caption:'项目企业出资情况',
						toolbar:[false,"top"],
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
<br/>
</html>
