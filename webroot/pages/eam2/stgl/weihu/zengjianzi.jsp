<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String zixunType = (String)request.getParameter("zixunType");
	zixunType = zixunType==null?"":zixunType;
	//String reobj = (String)request.getAttribute("reobj");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<base href="<%=basePath %>"/>
<title>增资减资</title>
<style>
	.STYLE1 {
		font-size: 20px;
		font-family: "simsun";
		font-weight: bold;
		color: #0000ff;
	}
</style>

<SCRIPT language=JavaScript type=text/JavaScript>
		//窗口打开方式
		var winOpenStr = "toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no";	
		function ywlxFun(){
			var index=document.getElementById("ywlx").selectedIndex
			if(index==0){
			   document.getElementById("touzi").style.display="block"
	         	   document.getElementById("chezi").style.display="none"
			}else if(index==1){
			   document.getElementById("touzi").style.display="none"
	           document.getElementById("chezi").style.display="block"
			}
		}
		//提交表单
		function saveHead(){
		    var headId=$("#headId").val();
		    var stId = document.getElementById("stId").value;	    
		    if(stId==null||stId==""){
		    	alert("请选择实体！")}
	    	else{
			    var zcbh = document.getElementById("zcbh").value;
			    var stzwmc = document.getElementById("stzwmc").value;
			    var gqgc = document.getElementById("gqgc").value;
			    var zzqk = document.getElementById("zzqk").value;
			    var diqu = document.getElementById("diqu").value;
			    var bgdz = document.getElementById("bgdz").value;
			    var renshu = document.getElementById("renshu").value;
			    var zmtz = document.getElementById("zmtz").value;
			    var CWtgljg = document.getElementById("CWtgljg").value;
			    var czygsnsqk = document.getElementById("czygsnsqk").value;
			    var zyyw = document.getElementById("zyyw").value;
				document.myform.action="<%=basePath %>stgl/zengjianzi_saveHead.do?headId="+headId+"&stId="+stId+"&zcbh="+zcbh+"&stzwmc="+stzwmc+"&gqgc="+gqgc+"&zmtz="+zmtz+"&diqu="+diqu+"&bgdz="+bgdz+"&renshu="+renshu+"&zmtz="+zmtz+"&CWtgljg="+CWtgljg+"&czygsnsqk="+czygsnsqk+"&zyyw="+zyyw;
				alert(document.myform.action);
				myform.submit();
				alert("保存成功！");
			}
		}			
 		//日期转换和资质情况
		$(function(){
			$("#ngrq").datebox({
			    	formatter:function(date){
			    		return formatDate(date);
			    	}
			    });			    
			$('#dialogZzqk').dialog({title:'资质情况'});
			$('#dialogZzqk').dialog('close');
			$('#dialogGqgc').dialog({title:'股权构成'});
			$('#dialogGqgc').dialog('close');
		});
		
	 	//选择实体	
		function selectEntity(){
			var zixunType =$("#zixunType").val();
			alert(zixunType);
			window.open('<%=basePath %>stgl/weihu_listEntities.do?' 
			 + 'option=stgl&multiselect=true&' 
			 + 'entityStid=' + $("#stid").val() 
			 + '&zixunType=' + zixunType,'',winOpenStr);
		}
		
		//回调函数
		
		function setLinkEntitiesRel(objString){
			reobj = eval('(' + objString + ')');
			document.getElementById("stId").value = reobj.LinkEntitiesRel[0].id == null?"":reobj.LinkEntitiesRel[0].id;
			document.getElementById("zcbh").value = reobj.LinkEntitiesRel[0].zcbh == null?"":reobj.LinkEntitiesRel[0].zcbh;
			document.getElementById("stzwmc").value = reobj.LinkEntitiesRel[0].stzwmc == null?"":reobj.LinkEntitiesRel[0].stzwmc;
			document.getElementById("renshu").value = reobj.LinkEntitiesRel[0].renshu == null?"":reobj.LinkEntitiesRel[0].renshu;
			document.getElementById("diqu").value = reobj.LinkEntitiesRel[0].diqu == null?"":reobj.LinkEntitiesRel[0].diqu;
			document.getElementById("bgdz").value = reobj.LinkEntitiesRel[0].bgdz == null?"":reobj.LinkEntitiesRel[0].bgdz;
			document.getElementById("zmtz").value = reobj.LinkEntitiesRel[0].zmtz == null?"":reobj.LinkEntitiesRel[0].zmtz;
			document.getElementById("CWtgljg").value = reobj.LinkEntitiesRel[0].CWtgljg == null?"":reobj.LinkEntitiesRel[0].CWtgljg;
			document.getElementById("czygsnsqk").value = reobj.LinkEntitiesRel[0].czygsnsqk == null?"":reobj.LinkEntitiesRel[0].czygsnsqk;
			document.getElementById("zyyw").value = reobj.LinkEntitiesRel[0].zyyw == null?"":reobj.LinkEntitiesRel[0].zyyw;
			document.getElementById("zzqk").value = reobj.LinkEntitiesRel[0].zzqk == null?"":reobj.LinkEntitiesRel[0].zzqk;
			document.getElementById("gqgc").value = reobj.LinkEntitiesRel[0].gqgc == null?"":reobj.LinkEntitiesRel[0].gqgc;
		}
		//资质情况
		function viewZzqk(){
			var zzqkViewObj = $("#zzqk").val();
			if(zzqkViewObj != null && zzqkViewObj.length > 1 ){				
				var zzqkarray = zzqkViewObj.split('<#>');
				var i = 0;
				var htmlObj = "<table >";
				htmlObj += '<tr><td width=80>资质名称</td><td width=100>实体资质等级</td><td width=100>发证单位</td><td>资质到期日期</td></tr>';
				for(i = 0; i< zzqkarray.length; i++){
					var row = zzqkarray[i].split("#%#");
					htmlObj += '<tr>';
					htmlObj += "<td>" + row[0] + "</td>";
					htmlObj += "<td>" + row[1] + "</td>";
					htmlObj += "<td>" + row[2] + "</td>";
					htmlObj += "<td>" + row[3] + "</td>";
					htmlObj += '</tr>';
				}
				htmlObj += '</table>'
				$('#dialogZzqk').html(htmlObj);
				$('#dialogZzqk').dialog('open');
			}else{
				alert("没有资质情况信息！");
			}
		}
		//股权情况
		function viewGqgc(){
			//gqqkViewObj = '21321321#%#21312#%#21312#%#2010-11-09<#>435436543#%#43643643#%#434346#%#2010-11-29';
			var gqgcViewObj = $("#gqgc").val();
			if(gqgcViewObj != null && gqgcViewObj.length > 1 ){				
				var gqgcarray = gqgcViewObj.split('<#>');
				var i = 0;
				var htmlObj = "<table >";
				htmlObj += '<tr><td width=80>股东名称</td><td width=100>股东性质</td><td width=100>持股比例（%）</td><td>报告日期</td><td>持股数量</td><td>本部是否控股</td></tr>';
				for(i = 0; i< zzgcarray.length; i++){
					var row = zzqkarray[i].split("#%#");
					htmlObj += '<tr>';
					htmlObj += "<td>" + row[0] + "</td>";
					htmlObj += "<td>" + row[1] + "</td>";
					htmlObj += "<td>" + row[2] + "</td>";
					htmlObj += "<td>" + row[3] + "</td>";
					htmlObj += "<td>" + row[4] + "</td>";
					htmlObj += "<td>" + row[5] + "</td>";
					htmlObj += '</tr>';
				}
				htmlObj += '</table>'
				$('#dialogZzqk').html(htmlObj);
				$('#dialogZzqk').dialog('open');
			}else{
				alert("没有股权构成信息！");
			}
		}
		
		function openzhengwen(){
			wordTemplate('bank_Template', document.getElementById("myform"),false,true, "增资减资正文"); 
		}
		
		//点击保存时 标题不能为空
	function checkEAMFormTitle(){ 		
	   var biaoti = document.getElementById("head.biaoti"); 		
		   if(biaoti.value == null || biaoti.value.trim().length == 0){ 			
		   alert("标题不能为空！"); 			
		   biaoti.focus(); 	      
		   return false; 	    
		   } 	     
	   return true; 	
	}	 
</script>
<style>
.mouseover{
	abc:expression(this.onmouseout=mouseout);
	efg:expression(this.onmouseover=mouseover);
	opq:expression(this.onclick=releaseFunction);
	font-family : Verdana;
	font-size: 12;
	cursor:hand;
	height: 18;
	border:1px groove orange;
	border-bottom-style: groove;
	border-width : think;
	padding-left: 3px;
	text-align:center;
	
	background-color="orange";
	font-weight : italic;
}

.mouseout{
	abc:expression(this.onmouseout=mouseout);
	efg:expression(this.onmouseover=mouseover);
	opq:expression(this.onclick=releaseFunction);
	font-family : Verdana;
	font-size: 12;
	cursor:hand;
	height: 18;
	border:1px groove orange;
	border-bottom-style: groove;
	border-width : think;
	padding-left: 3px;
	text-align:center;
	
	background-color="white";
	font-weight : normal;
}


.clicked
{
abc:expression(this.onmouseout=mouseout);
efg:expression(this.onmouseover=mouseover);
opq:expression(this.onclick=releaseFunction);
font-family : Verdana;
font-size: 12;
cursor:hand;
height: 18;
border:1px groove orange;
border-bottom-style: groove;
border-width : think;
padding-left: 3px;
text-align:center;

background-color="#C3DAF2";
font-weight : bold;
border-bottom-style : none;

}

.ttd {
abc:expression(this.onmouseout=mouseout);
efg:expression(this.onmouseover=mouseover);
opq:expression(this.onclick=releaseFunction);
font-family : Verdana;
font-size: 12;
cursor:hand;
height: 18;
border:1px groove orange;
border-bottom-style: groove;
border-width : think;
padding-left: 3px;
text-align:center;
}



.panelUpper{
border-width: 1px;
border-style: solid ;
width: 98%;
height:90%;
z-index: 1;
overflow: auto;
}


.panelLower{
border-width: 1px;
border-style: solid ;
width: 98%;
height:90%;

z-index: 1;
overflow: auto;
}
</style>

</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
 <%@ include file="/inc/word.inc"%>
<s:form   name="myform" id="myform" action="">
<input   type="button"  value="保存" onclick="saveHead();"/> 
<input type="text"  name="head.id" id="headId" value="${headId}" />
<input type="text"  name="zixunType" id="zixunType" value="<%=zixunType %>"/>
<input name="stId"  id="stId"/>
<!-- 意见域、 依据和文件上传需要表单id -->
<s:set name="biaodanid" value="head.Id" />
<s:hidden name="biaodanid" value="%{#request.biaodanid}" />
<s:hidden name="userid" value="80" />
<s:hidden name="deptid" value="11318" />
<!-- 意见域、 依据和文件上传需要表单id -->
<table width="100%" border="0" cellpadding="2" cellspacing="0" align="center">
  <tr align="right">
	    <td align="right" colspan="7">
		  <input name="Submit2" type="button" class="buttonface02" onclick="openzhengwen();" value=" 新建正文 "/>
		   &nbsp;&nbsp;&nbsp;&nbsp;
		  <input name="Submit" type="submit" class="buttonface02" value="  查看流程信息  " 
		 onClick="javascript:openwindow('process.html','',600,500)"/>
		 &nbsp;&nbsp;&nbsp;&nbsp;
		  <input name="Submit" type="submit" class="buttonface02" value="  保存为草稿  " onClick="javascript:alert('保存成功！');"/>		
		  &nbsp;&nbsp;&nbsp;&nbsp;
		  <input name="Submit" type="submit" class="buttonface02" value="  提交  " onClick="showSubimtPage();"/>		
			<div style="display:none; float:right" id="subimtPage">
				<table width="10%" border="1" cellpadding="0" cellspacing="0" align="right">
					<tr align="right">
						<td colspan="2"> <a href="#" class="a03" onClick="cancleSubmit();" style="color:#0000FF">取消</a></td>	
					</tr>
					<tr>
						<td align="center">组审核</td>	
						<td align="right">
						<img src="resource/ProjectImages/tree_08.gif" width="19" height="20" 
						onClick="javascript:window.openwindow('submit.html','',700,500);document.getElementById('subimtPage').style.display='none';"/>
						</td>	
					</tr>
				</table>
			</div>
    </td>
  </tr>
</table>
	
	<br/>	    
	  <div align="center">
        <span class="STYLE7 STYLE1">中国建银投资有限责任公司实体增资（减资）申请处理单</span>
      </div>
	  <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
	<tr> 
	<td  align="right">当前环节：拟稿 &nbsp;&nbsp;</td>
	<td  width="150"align="right">当前处理人：张三&nbsp;&nbsp;</td></tr>
	</table>
	  <hr/>
	 <table width="100%" border="0" cellpadding="2" cellspacing="0" align="center">
        <tr>
          <td  width="120" class="td_zxy01">标题：</td>
          <td class="td_form02"  colspan="3"><s:textfield name="head.biaoti"   cssClass="input"  value="%{#request.head.biaoti}"/></td>
        </tr>
        <tr>
          <td  width="120" class="td_zxy01">呈送：</td>
          <td class="td_form02"  colspan="3"><s:textfield name="head.chengsong"   cssClass="input" value="%{#request.head.chengsong}" /></td>
        </tr>
        <tr>
          <td  width="120" class="td_zxy01">编号：</td>
          <td class="td_form02" ><s:textfield   name="head.bianhao" label=""  value="%{#request.head.bianhao}"></s:textfield></td>
          <td  width="120" class="td_zxy01">急缓程度：</td>
          <td class="td_form02"><s:select theme="simple" list="{'一般','急','特急'}" name="head.jhcd" /></td>
        </tr>
        <tr>
          <td  width="120" class="td_zxy01">拟稿人：</td>
          <td class="td_form02">
			<!--<s:hidden name="head.ngr"></s:hidden>-->
			<s:textfield name="head.ngrxm"  id="ngrxm"  value="%{#request.head.ngrxm}" readonly="true"/>
		  </td>
          <td  width="120" class="td_zxy01">联系电话：</td>
          <td class="td_form02"><s:textfield name="head.lxdh"   class="input" /></td>
        </tr>
      <tr>
		<td class="td_zxy01">拟稿日期：</td>
	    <td  class="td_form02">
	 	    <s:date name="%{#request.head.ngrq}" format="yyyy-MM-dd" var="draftDate"/>
			<s:textfield id="ngrq" name="head.ngrq"  value="%{#request.head.ngrq}" readonly="true" /></td>
        <td  width="120"  class="td_zxy01">拟稿部门：</td>
        <td class="td_form02">
			<!-- <s:hidden name="head.ngbm"></s:hidden> -->
			<s:textfield name="head.ngbmmc"   id="head.ngbmmc" value="%{#request.head.ngbmmc}"  readonly="true"/>
		</td>
      </tr> 
        <tr>
          <td  width="120" class="td_zxy01">业务类型：</td>
          <td  class="td_form02" colspan="3"><s:select name="head.ywlx"  id="ywlx"  theme="simple" list="#{'0':'增资','1':'减资' }"  value="0" label="" onChange="ywlxFun()"></s:select></td>
        </tr>
        <tr id="touzi" style="display:block">
	    <td  width="120" class="td_zxy01" >投资方式：</td>
	    <td  class="td_form02"><s:textfield name="stGlbt.tzfs" label=""></s:textfield></td>
		<td  width="120" class="td_zxy01">投资金额（万元）：</td>
	    <td  class="td_form02"><s:textfield name="stGlbt.tzje" label=""></s:textfield></td>
	   </tr>	
	   
		<tr id="chezi" style="display:none">
	    <td  width="120" class="td_zxy01">撤资方式：</td>
	    <td  class="td_form02"><s:textfield name="stGlbt.czfs" label=""></s:textfield></td>
		<td  width="120" class="td_zxy01">撤资金额（万元）：</td>
	    <td  class="td_form02"><s:textfield name="stGlbt.czje" label=""></s:textfield></td>
	   </tr>	
	  
	   <tr>
	    <td  width="120" class="td_zxy01">会签部门：</td>
	    <td class="td_form02" colspan="3"><s:textfield name="head.hqbm"   cssClass="input" />
	      <input name="button" type="button" class="buttonface02" value="选择会签"><input name="button" type="button" class="buttonface02" value="清除"></td>
       </tr>
		<tr>
          <td  width="120" class="td_zxy01">附件标题：</td>
          <td class="td_form02" colspan="3"><s:textarea name="" cols="150" rows="4"/></td>
        </tr>
      </table>
	  <table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">        
        <tr>
          <td width="150"  ><img  src="resource/ProjectImages/icon-import.gif" id="top_8" onClick="menu1('div11','top_8');"/> 
		  <a onClick="javascript:div11.style.display=div11.style.display=='none'?'block':'none';"	> 
		  <font class="td_title">实体信息</font></a></td>
          <td width="1128" colspan="3" ><div align="right">
 
            <input type="button" class="buttonface" value="选择实体"	 onClick="selectEntity()"  />
          </div></td>
        </tr>
        <tr>
      </table>
      
	<div id="div11" style="display:block" >
	  <table width="100%" border="0" cellpadding="2" cellspacing="0" align="center" id="gdzc" style="display:block">
	  	<tr>
          <td width="120" class="td_zxy01">资产编号：</td>
          <td   class="td_form02"><s:textfield name="head.zcbh" id="zcbh"  readonly="true" label=""/></td>
          <td  width="120"  class="td_zxy01">实体名称：</td>
          <td class="td_form02"><s:textfield name="head.stzwmc" id="stzwmc" readonly="true" label=""/></td>
        </tr>
        <tr>
          <td  class="td_zxy01">股权构成：</td>
          <td class="td_form02">
          <s:hidden name="head.gqgc" id="gqgc"  />
          <input name="gqqk" type="button" onclick="viewGqgc();"   value="查看" /></td>
          <td class="td_zxy01">资质情况：</td>
          <s:hidden name="head.zzqk" id="zzqk"  />
          <td class="td_form02"><input name="zzqk" type="button" onclick="viewZzqk();"   value="查看" /></td>
        </tr>
		<tr>
          <td   class="td_zxy01">地区：</td>
          <td   class="td_form02"><s:textfield name="head.diqu" id="diqu"  readonly="true" label=""/></td>
          <td    class="td_zxy01">办公地址：</td>
          <td class="td_form02"><s:textfield name="head.bgdz" id="bgdz" readonly="true"   label=""/></td>
        </tr>
		 <tr>
          <td   class="td_zxy01">人数：</td>
          <td  class="td_form02"><s:textfield name="head.renshu"  id="renshu"  readonly="true"   label=""/></td>
          <td     class="td_zxy01">账面投资（万元）：</td>
          <td class="td_form02"><s:textfield name="head.zmtz"  id="zmtz"  readonly="true" label=""/></td>
        </tr>
		<tr>
          <td  class="td_zxy01">委托管理机构：</td>
          <td  class="td_form02"><s:textfield name="head.CWtgljg"  id="CWtgljg"    readonly="true" label=""/></td>
          <td    class="td_zxy01">&nbsp;</td>
          <td class="td_form02">&nbsp;</td>
        </tr>
		 <tr>
		   <td  class="td_zxy01">出资与工商年审情况：</td>
		   <td colspan="3" class="td_form02"><s:textfield name="head.czygsnsqk"  id="czygsnsqk"  readonly="true" cssClass="input" /></td>
	    </tr>
		<tr>
		   <td  class="td_zxy01">主营业务：</td>
		   <td colspan="3" class="td_form02"><s:textfield name="head.zyyw" id="zyyw"   readonly="true"  cssClass="input" /></td>
		</tr>
	  	<!--  <tr>
        <td nowrap class="td_zxy01">最近一期经审计报告：</td>
        <td colspan="5">
			<table width="100%" height="100%" border="0" align="center" cellpadding="5" cellspacing="0" id="fileTable44">

				<tr>
					 <td colspan="2" align="right" class="td03">
					  <input type="file" name="file44" id="file44" style="display: none;" onChange="addRow(this,'fileTable44')"/>
					  <input type="button" class="buttonface" value="上传" onClick="file44.click();" name="optionButton44" />		          </td>
				</tr>
			</table>		</td>
      </tr>	
       --> 
	  <tr>
        <td colspan="6" class="td_zxy01"><div align="left">最近一个月未经审计的报表的主要数据</div></td>
      </tr>	
      <tr>
		  <td class="td_zxy01">总资产(万元)：</td>
          <td class="td_form02"><s:textfield   name="head.zzc" label=""></s:textfield></td>
          <td  class="td_zxy01" >负债（万元）：</td>
          <td class="td_form02"><s:textfield   name="head.fuzhai" label=""></s:textfield></td>
        </tr>
		 <tr>
		  <td class="td_zxy01">股本（万元）：</td>
          <td class="td_form02"><s:textfield   name="head.guben" label=""></s:textfield></td>
          <td  class="td_zxy01" >净资产（万元）：</td>
          <td class="td_form02"><s:textfield   name="head.jzc" label=""></s:textfield></td>
        </tr>
		  <tr>
		   <td class="td_zxy01">收入（万元）：</td>
	        <td class="td_form02"><s:textfield   name="head.stsr" label=""></s:textfield></td>
	        <td  class="td_zxy01" >净利润（万元）：</td>
	        <td class="td_form02"><s:textfield   name="head.jlr" label=""></s:textfield></td>
	    </tr>
      </table>
     </div>
     
    <%@ include file="/inc/according.inc"%>  
    <e:opinion id="test" width="100%">
        <e:opinionPart id="LEADER" name="LEADER" biaodanid="%{#request.biaodanid}" value="" text="批示意见："></e:opinionPart>
        <e:opinionPart id="OPERATION_GROUP"  biaodanid="%{#request.biaodanid}" name="OPERATION_GROUP" value="" text="业务运营组意见："></e:opinionPart>
        <e:opinionPart id="MEETING_DEPT"  biaodanid="%{#request.biaodanid}" name="MEETING_DEPT" value="" text="会签部门意见："></e:opinionPart>
        <e:opinionPart id="DRAFT_DEPT"  biaodanid="%{#request.biaodanid}" name="DRAFT_DEPT" value="" text="拟稿部门意见："></e:opinionPart>
    </e:opinion>	 
	  
	   <table width="100%" border="0" cellpadding="2" cellspacing="0" align="center">  
	   <tr> 
	    <td   width="11%"  class="td_zxy01">备注：</td>
	    <td class="td_form02" colspan="5"><s:textarea name="head.spbmyj" rows="3" style="width:90%"></s:textarea></td>
	  </tr>	
	 
	</table>
<%@ include file="/inc/file.inc"%>
	<br/>
</s:form>
</body>
<div id="dialogZzqk" icon="icon-save" style="padding:5px;width:400px;height:200px;">
</div>
<div id="dialogGqgc" icon="icon-save" style="padding:5px;width:400px;height:200px;">
</div>
</html>

