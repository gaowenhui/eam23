<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%@ page import=" com.tansun.eam2.common.model.orm.bo.StJbxx"%>
<%@ page import=" org.apache.commons.lang.StringUtils"%>
<%@ include file="/pages/eam2/stgl/checkJS.inc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<%
	String fslx = (String)request.getAttribute("fslx");
	String id = (String)request.getAttribute("id");
	String stlx = (String)request.getSession().getAttribute("stlx");
	String zzqks = (String)request.getAttribute("zzqks");
	String rework = request.getParameter("rework");
	String khyhs = (String)request.getAttribute("khyhs");
	String look = (String)request.getAttribute("look");
	StJbxx st = (StJbxx)request.getAttribute("st");
	String newAdd = request.getParameter("newAdd");
	String areaRO = "";
	if(StringUtils.isNotEmpty(st.getZcbh())){
		areaRO = "1";
	}
	
 %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<base href="<%=basePath %>"/>
<title>实体查询及维护</title>
<SCRIPT language=JavaScript type=text/JavaScript>
	var addStr;
	$(function(){
		$("#clsj,#yjhtzrq, input[name='zzdqrq']").datebox({
	    	formatter:function(date){
	    		return formatDate(date);
	    	}
	    });
	    addStr = $("#TableBox_bank").html();
	    addEntity = $("#TableBox").html();
		if("1" == "<%=rework %>"){
			if($.trim("<%=khyhs %>") != "" && "<%=khyhs %>" != null){
				$("#TableBox_bank").html("<%=khyhs %>");
			}
			if($.trim("<%=zzqks%>") !="" && "<%=zzqks %>" != null){
				$("#TableBox").html("<%=zzqks %>");
			}
		}
		$("#myform").ajaxForm({
    		beforeSubmit:checkPageInput
		}); 
		$("#myform").ajaxForm({
		   	success: function(responseText){
		   		var reStr = eval('(' + responseText + ')');
		   		document.getElementById("zcbh").value = reStr.result[0].stzcbh;
		   		$("#CShengfenName").attr("disabled","disabled");
		   		alert("保存成功!"); 
		   		window.parent.opener.reloadGrid();
		   		window.parent.initVar($("#zcbh").val());
		   	}
	   	});
	   	$("#CShengfen").val($("#CShengfenName").val());
	   	if(window.parent.initVar != null){
	   		window.parent.initVar($("#zcbh").val());
	   	}
	   	
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

	function AddTable(tableId){
		$("#TableBox_bank").append(addStr);
	}
	function AddEntityTable(tableId){
		alert(addEntity);
		$("#TableBox").append(addEntity);
		$("input[name='zzdqrq']").datebox({
	    	formatter:function(date){
	    		return formatDate(date);
	    	}
	    });
	}	
	
	function myDeleteRow(hrefObj){
	alert(1);
		var rowObj = hrefObj.parentElement.parentElement;
		$(rowObj).remove();
	}
	
	function deleRow(hrefObj){
		var rowObj = hrefObj.parentElement.parentElement;
		alert($(rowObj).html());
		var nextRowObj = $(rowObj).next();
		alert($(nextRowObj).html());
		$(rowObj).remove();
		$(nextRowObj).remove();
	}
//isNew控制基本信息的日志
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
		function checkPageInput(){
			var stzwmc = document.getElementById("stzwmc");
			if(stzwmc.value == null || stzwmc.value.length == 0){
				alert("实体中文名称不能为空！");
				stzwmc.focus();
		      return false;
		    }
		    return true;
		}
	function ww(){
		$("#CShengfen").val($("#CShengfenName").val());
	}
	
	//....................判断实体名称在数据库中是否存在.........................................
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
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<s:form action="weihu_newEntity" method="post" id="myform" name="myform">
<s:hidden id="id" name="sf.id"></s:hidden>
<s:hidden id="leixing" name="sf.leixing"></s:hidden>
<s:hidden id="stid" name="st.id"></s:hidden>
<s:hidden id="sfbc" name="st.sfbc"></s:hidden>
<s:hidden id="stlx" name="st.stlx" value="%{#session.stlx}"></s:hidden>
<input type="hidden" id="option" name="<%=rework %>"/>
<table width="100%" align="center" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="25" align="center" valign="bottom" class="td06">
		<table width="95%" border="0" cellspacing="3" cellpadding="0">
		  <tr>
			<td width="15"><img src="<%=request.getContextPath() %>/resource/ProjectImages/index_32.gif" width="9" height="9"></td>
			<td valign="bottom" align="left" class="title">实体信息查询及维护</td>
		  </tr>
		</table>
	</td>
  </tr>
</table>

      <table class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td class="td_zxy01">资产编号(自动生成)：</td>
          <td class="td_zxy02"><s:textfield name="st.zcbh" id="zcbh" disabled="true"/></td>
          <td class="td_zxy01">实体性质：</td>
          <td class="td_zxy02">
          <s:select list="#{'':'请选择',0:'非上市实体',1:'上市实体'}"  name="st.stxz" id="stxz" value="%{#request.st.stxz }"></s:select>
          </td>
        </tr>
        <tr>
          <td class="td_zxy01">
          <font color="#FF0000"><strong>*</strong></font>
         	 实体中文名称：</td >
          <td class="td_zxy02"><s:textfield name="st.stzwmc" id="stzwmc" onblur="stshifoucunzai1()"/></td>
          <td class="td_zxy01">实体英文名称：</td>
          <td class="td_zxy02"><s:textfield name="st.stywmc" id="stywmc" /></td>
        </tr>
        <tr>
          <td class="td_zxy01">行&nbsp;&nbsp;&nbsp;&nbsp;业：</td>
          <td class="td_zxy02">
            <e:select parRefKey="ENTITY_TRADE" list="#{}"  headerKey="6" name="st.CHangye" id="CHangye" value="%{#request.st.CHangye }"/>
            </td>
          <td class="td_zxy01">实体状态：</td>
          <td class="td_zxy02">
          <e:select parRefKey="ENTITY_STATUS" headerKey=""  headerValue="请选择" list="#{}" name="st.CStzt" id="CStzt" value="%{#request.st.CStzt }" />
          </td>
        </tr>
         <tr>
		 <td class="td_zxy01">地&nbsp;&nbsp;&nbsp;&nbsp;区：</td>
          <td class="td_zxy02">
          <s:hidden name="st.CShengfen" id="CShengfen" />
          <%if(!"1".equals(rework)){ %>
          <e:select parRefKey="PROVIENCE" onchange="ww();" list="#{}" id="CShengfenName" value="%{#request.st.CShengfen }" />
          <%}else{ %>
          <e:select parRefKey="PROVIENCE" onchange="ww();" list="#{}" id="CShengfenName" value="%{#request.st.CShengfen }" disabled="true"/>
          <% }%>
          </td>
          <td class="td_zxy01">&nbsp;</td>
          <td class="td_zxy02">&nbsp;</td>
        </tr>
         <tr>
          <td class="td_zxy01">实体处置方式：</td>
          <td class="td_zxy02"><e:select parRefKey="ENTITY_DISPOSE_METHOD" headerKey=""  headerValue="请选择" list="#{}" name="st.CCzfs" id="CCzfs" value="%{#request.st.CCzfs }"/></td>
          <td class="td_zxy01">管理部门：</td>
          <td class="td_zxy02"><s:select list="#{'':'请选择管理部门',1:'委托代理业务部',2:'资产管理处置部'}" name="st.CGlbm" id="CGlbm" value="%{#request.st.CGlbm }"/></td>
        </tr>
        <tr>
          <td class="td_zxy01">委托管理机构：</td>
          <td class="td_zxy02"><s:textfield name="st.CWtgljg" id="CWtgljg" /></td>
          <td class="td_zxy01">
          <%if("0".equals(stlx)) {%>
         	 经营分类：
         	 <%}else{ %>
         	 	&nbsp;&nbsp;
         	 <%} %>
          </td>
          <td class="td_zxy02">
          <%if("0".equals(stlx)) {%>
            <s:select id="jyfl" list="#{'':'请选择',0:'持续经营类',1:'处置类'}" name="st.jyfl" value="%{#request.st.jyfl }"></s:select>
         <%}else{ %>
         	&nbsp;
         <%} %>
          </td>
        </tr>
        <tr>
          <td class="td_zxy01">目前经营状态：</td>
          <td class="td_zxy02"><s:textfield name="st.mqjyzt" id="mqjyzt" /></td>
          <td class="td_zxy01">实际控制单位：</td>
          <td class="td_zxy02"><s:textfield id="sjkzdw" name="st.sjkzdw"></s:textfield></td>
        </tr>
        <tr>
          <td class="td_zxy01">法人代表：</td>
          <td class="td_zxy02"><s:textfield name="st.frdb" id="frdb" /></td>
          <td class="td_zxy01">注册地址：</td>
          <td class="td_zxy02"><s:textfield name="st.zcdz" id="scdz" /></td>
        </tr>
        <tr>
          <td class="td_zxy01">注册日期：</td>
          <td class="td_zxy02">
	 	    <s:date name="%{#request.st.clsj}" format="yyyy-MM-dd" var="zcrq"/>
			<s:textfield id="clsj" name="st.clsj"  value="%{#zcrq}" readonly="true"  />          
           <!-- <s:textfield name="st.clsj" id="clsj" readonly="true"  /> --> 
          </td>
          <td class="td_zxy01">注册资金(万元)：</td>
          <td class="td_zxy02"><s:textfield name="st.zczj" id="zczj"  onblur="checkFloat(this);"/></td>
        </tr>
	    <tr>
          <td class="td_zxy01">名义持有人：</td>
          <td class="td_zxy02"><s:textfield name="st.mycyr" id="mycyr" /></td>
          <td class="td_zxy01">总经理：</td>
          <td class="td_zxy02"><s:textfield name="st.zjl" id="zjl" /></td>
        </tr>
	    <tr>
          <td class="td_zxy01" >开户银行：</td>
          <td class="td_zxy02" colspan="3"><table border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td >
                <%if(!"1".equals(look)) {%>
                <a href="javascript:AddTable()">&nbsp;+ &nbsp;</a>
                <%} %>
                开户银行明细 </td>
              </tr>
            </table>
              <table  border="0" cellpadding="0" cellspacing="0" id="TableBox_bank"  >
             
                <tr>
                  <td >
                  <%if(!"1".equals(look)) {%>
                  <a href="#" onclick="myDeleteRow(this);return false;">&nbsp;x&nbsp;</a>
               	 <%} %>  
                  开户银行:</td>
                  <td><s:textfield name="khyh" id="khyh" /></td>
                  <td>账户:</td>
                  <td><s:textfield name="zh" id="zh" /></td>
                </tr>
            </table></td>
        </tr>
        <tr>
          <td class="td_zxy01">营业执照号：</td>
          <td class="td_zxy02"><s:textfield name="st.yezxh" id="yezxh" /></td>
          <td class="td_zxy01">营业执照有效期：</td>
          <td class="td_zxy02"><!--<input type="text" name="D_licence_validate">（日期格式：yyyymmdd）-->
             <s:textfield name="st.yezzyxq" id="yezzyxq" />
            <a onMouseOver="window.status='Date Picker';return true;" onMouseOut="window.status='';return true;"                          
href="javascript:show_calendar('form1.D_licence_validate');"></a> </td>
        </tr>
        <tr>
          <td class="td_zxy01">税务登记编号：</td>
          <td class="td_zxy02"><s:textfield name="st.swdjbh" id="swdjbh" /></td>
          <td class="td_zxy01">股票代码：</td>
          <td class="td_zxy02"><s:textfield name="st.gpdm" id="gpdm" /></td>
        </tr>
        <tr>
          <td class="td_zxy01">原建行投资日期：</td>
          <td class="td_zxy02">
          	 <s:date name="%{#request.st.yjhtzrq}" format="yyyy-MM-dd" var="yjhtzrq"/>
			 <s:textfield name="st.yjhtzrq" id="yjhtzrq"  value="%{#yjhtzrq}" readonly="true"  />
              
            <a onMouseOver="window.status='Date Picker';return true;" onMouseOut="window.status='';return true;"                          
href="javascript:show_calendar('form1.D_ccb_invest_date');"></a> 
		  </td>
          <td class="td_zxy01">原投资公司：</td>
          <td class="td_zxy02"><s:textfield name="st.ytzgs" id="ytzgs" /></td>
        </tr>
        <tr>
          <td class="td_zxy01">账面投资（万元）：</td>
          <td class="td_zxy02"><s:textfield name="st.zmtz"  onblur="checkFloat(this);"  id="zmtz" /></td>
          <td class="td_zxy01">实际投资（万元）：</td>
          <td class="td_zxy02"><s:textfield name="st.sjtz" id="sjtz"  onblur="checkFloat(this);" /></td>
        </tr>
         <tr>
          <td class="td_zxy01">联系人：</td>
          <td class="td_zxy02"><s:textfield name="st.lxr" id="lxr" /></td>
          <td class="td_zxy01">联系电话：</td>
          <td class="td_zxy02"><s:textfield name="st.lxdh" id="lxdh" /></td>
        </tr>
        <tr>
          <td class="td_zxy01">传真：</td>
          <td class="td_zxy02"><s:textfield name="st.chuanzhen" id="chuanzhen" /></td>
          <td class="td_zxy01">主页地址：</td>
          <td class="td_zxy02"><s:textfield name="st.zydz" id="zydz" /></td>
        </tr>
        <tr>
          <td class="td_zxy01">办公地址：</td>
          <td class="td_zxy02"><s:textfield name="st.bgdz" id="bgdz" /></td>
          <td class="td_zxy01">邮政编码：</td>
          <td class="td_zxy02"><s:textfield name="st.yzbm" id="yzbm" /></td>
        </tr>		
        <tr>
          <td class="td_zxy01">电子邮箱：</td>
          <td class="td_zxy02"><s:textfield name="st.dzyx" id="dzyx" /></td>
          <td class="td_zxy01">经济性质：</td>
          <td class="td_zxy02">
          <e:select parRefKey="ENTITY_PROPERTY" headerKey=""  headerValue="请选择" list="#{}" name="st.jjxz" id="jjxz" value="%{#request.st.jjxz }"/>
         </td>
        </tr>
        <tr>
          <td class="td_zxy01">主营业务：</td>
          <td class="td_zxy02" colspan="3"><s:textarea name="st.zyyw" id="zyyw" rows="3" cols="100" style="width: 85%;"></s:textarea></td>
        </tr>
        <tr>
         <td class="td_zxy01">兼营业务：</td>
          <td class="td_zxy02" colspan="3"><s:textarea name="st.jyyw" id="jyyw" rows="3" cols="100" style="width: 85%;"></s:textarea></td>
        </tr>
		
        <tr>
          <td class="td_zxy01" >资质情况：</td>
          <td class="td_zxy02" colspan="3">
          <table   border="0" cellspacing="0" cellpadding="0"   >
              <tr>
                <td >
                <%if(!"1".equals(look)) {%>
                <a href="javascript:AddEntityTable()">&nbsp;+ &nbsp;</a>
              	<%} %>  
                实体资质明细:</td>
              </tr>
          </table>
          <table  border="0" cellpadding="0" cellspacing="0" id="TableBox"  >
          
                <tr>
                  <td >
                 <%if(!"1".equals(look)) {%>
                  <a href="#" onClick="deleRow(this);return false;">&nbsp;x&nbsp;</a>
                 <%} %>  
                  资质名称:</td>
                  <td><s:textfield name="zzmc" id="zzmc" />&nbsp;</td>
                  <td>实体资质等级:</td>
                  <td><s:textfield name="stzzdj" id="stzzdj"/></td>
                 </tr>
                 <tr>
                 	<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;发证单位:</td>
                 	<td><s:textfield name="fzdw" id="fzdw" /></td>
                 	<td>资质到期日期:</td>
                    <td><s:textfield name="zzdqrq" readonly="true"/></td>
                </tr>
             </table>
            </td>
        </tr>
        <tr>
          <td class="td_zxy01">出资与工商年审情况：</td>
          <td colspan="3" class="td_zxy02"><s:textarea name="st.czygsnsqk" id="czygsnsqk" rows="3" cols="100"></s:textarea>
          </td>
        </tr>
        <tr>
          <td class="td_zxy01">实体简介：</td>
          <td class="td_zxy02" colspan="3"><s:textarea name="st.stjj" id="stjj" rows="3" cols="100"></s:textarea>
          </td>
       </tr>
       </table>   
       <table class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <td align="right">
          <%if(!"1".equals(look)) {%>
            <input name="submit2" type="button" value="确定" onClick="saveSt();"/>
            <input type="reset" value="重置" name="B2" />
            <%} %>
            </td>
      </table>
</s:form>
</body>
</html>
