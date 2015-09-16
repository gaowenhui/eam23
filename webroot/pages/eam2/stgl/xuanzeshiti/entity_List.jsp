<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
String zixunType = (String)request.getAttribute("zixunType");


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<base href="<%=basePath %>"/>
        <title>实体查询</title>

<style>
	.STYLE1 {
		font-size: 20px;
		font-family: "simsun";
		font-weight: bold;
		color: #0000ff;
	}
</style>
		<script type="text/javascript">

      $(document).ready(function(){
			//添加按钮
			var buttonJSonString = '[{"buttonHandler":"addAss","buttonIcon":"icon-add","buttonText":"增加"},\
										{"buttonHandler":"modifyAss","buttonIcon":"icon-save","buttonText":"修改"}\
									]';
			addButtons(jQuery("#gview_entity_list > .ui-jqgrid-titlebar"),buttonJSonString);
	        $(window).bind('resize', function(){
				jQuery("#entity_list").setGridWidth($("#tableWidth").width());
	        });

		});
	
	
		function addAss(){
	
			var rdBasicWidth = "1000px";
			var rdBasicHeight = "800px";
			var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
//			alert(<%=zixunType%>);
			if("0" == <%=zixunType%>){
//				var returnValue = window.showModalDialog('stgl/weihu_newEntity.do', window, _g_privateDialogFeatures);
				window.open('stgl/weihu_newEntity.do');
			}else if("1" == <%=zixunType%>){
				//var returnValue = window.showModalDialog('stgl/weihu_newNonEntity.do', window, _g_privateDialogFeatures);
				window.open('stgl/weihu_newNonEntity.do');
			}
			return false;
		}
		

			function query(){
				var entityvoassertNumber = document.getElementById("assertNumber").value;
				var entityvoentityName = document.getElementById("entityName").value ;

				var CGlbm = document.getElementById("CGlbm").value ;
				
				if(<%=zixunType%> == 0){
					var typeCode = document.getElementById("typeCode").value;
					var CWtgljg = document.getElementById("CWtgljg").value;
//					var Ywlsylwt = document.getElementById("Ywlsylwt").value ;
					
				jQuery("#entity_list").setGridParam({postData:{
					'entityvo.assertNumber':'' + entityvoassertNumber,
					'entityvo.entityName':'' + entityvoentityName,
					'entityvo.typeCode':'' + typeCode,
					'entityvo.CGlbm':'' + CGlbm,
					'entityvo.CWtgljg':'' + CWtgljg
//					'entityvo.Ywlsylwt':'' + Ywlsylwt
				}}).trigger("reloadGrid");
				}else if(<%=zixunType%> == 1){
						
					jQuery("#entity_list").setGridParam({postData:{
						'entityvo.assertNumber':'' + entityvoassertNumber,
						'entityvo.entityName':'' + entityvoentityName,
						'entityvo.CGlbm':'' + CGlbm
					}}).trigger("reloadGrid");
				}
			}
		

        </script>
    </head>
    <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table id="tableWidth" width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="25" align="center" valign="bottom" class="td06">
    	
	<table width="98%" border="0" cellspacing="3" cellpadding="0">
      <tr>
        <td width="15"><img src="resource/ProjectImages/index_32.gif" width="9" height="9"></td>
        <td valign="bottom" class="title"><div align="left">实体查询</div></td>
      </tr>
    </table>
	</td>
  </tr>
</table>
       
        <table class="newtable" width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td  class="td_form01">资产编号： </td>
            <td   class="td_form02"><s:textfield name="entityvo.assertNumber" id="assertNumber" /></td>
            <td   class="td_form01">实体名称（中文）：</td>
            <td   class="td_form02"><s:textfield name="entityvo.entityName" id="entityName"/></td>
            
            <td   class="td_form01">
            <%if("0".equals(zixunType)) { %>
           		 经营分类：
             <%}else if("1".equals(zixunType)) {%> 
            	 地区：
             <%} %>
            </td>
            <td  class="td_form02">     
            <%if("0".equals(zixunType)) { %>
            <s:select list="{'','持续经营类','处置类'}" name="entityvo.typeCode" id="typeCode"></s:select>
             <%}else if("1".equals(zixunType)) {%> 
             <select name="entityvo.province" id="s1" >
	             	 <option>省份</option>
	           		 </select>
	             	 <select name="entityvo.area" id="s2" >
	                 <option>地级市</option>
	              	 </select>
             <%} %>   
                </td>
            
          </tr>
          <tr>
            <td class="td_form01">管理部门：</td>
            <td class="td_form02"><s:textfield name="entityvo.CGlbm" id="CGlbm"/></td>
             <%if("0".equals(zixunType)) {%>       
                <td class="td_form01">委托管理机构：</td>
            	<td class="td_form02"><s:textfield name="entityvo.CWtgljg" id="CWtgljg"/></td>
            <%}else if("1".equals(zixunType)) {%> 
                 <td class="td_form01">有无历史遗留问题：</td>
				  <td class="td_form02"><s:select list="{'有','无'}" name="entityvo.Ywlsylwt" id="Ywlsylwt"></s:select></td>
              <%} %>
              <%if("0".equals(zixunType)) {%>    
	            <td class="td_form01">地区：</td>
	            <td class="td_form02"><select name="entityvo.province" id="s1" >
              		<option>省份</option>
            		</select>
              		<select name="entityvo.area" id="s2" >
                	<option>地级市</option>
              		</select>     
              	</td>
              <%}else if("1".equals(zixunType)){ %>
               <td class="td_form01">&nbsp;</td>
               <td class="td_form02">&nbsp;</td>
              <%} %>
          </tr>
		  <tr>
             <td class="td_form02" colspan="6" >
			    <div align="right">
			    <input type='button'  value='查询'  onClick="query()" style='height:20px;font-size:-3'/>
			    <input type='button'  value='重置'  style='height:20px;font-size:-3'/>
	        </div></td>		  
		  </tr>		
        </table>
        <br/>
	<table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
       <tr>
         <td height="5" align="right">
                <table id="entity_list"> </table>
				<div id="pgtoolbar1"></div>
       </td>
     </tr>
    </table>
 
	<script type="text/javascript">
	   <%if("0".equals(zixunType)) {%>
				jQuery("#entity_list").jqGrid({
				url:"<%=basePath %>stgl/weihu_listEntities.do?zixunType=" + <%=zixunType%>,
					datatype: "json",
					mtype:"POST",
					colNames:['id','资产编号','实体中文名称','经营分类','管理部门','委托管理机构','地区','行业','注册地址','营业执照号'],
					colModel:[	
						{name:'id',index:'id',hidden:true},
						{name:'zcbh',index:'assertNumber'},
						{name:'stzwmc',index:'entityName'},
						{name:'jyfl',index:'classification'},
						{name:'CGlbm',index:'dept'},
						{name:'CWtgljg',index:'adress'},
						{name:'area',index:'area'},	
						{name:'CHangye',index:'industry'},	
						{name:'zcdz',index:'adressRegistration'},
						{name:'yezxh',index:'businessLicenseNum'}
						],
					pager:'pgtoolbar1',
					multiselect:true,
					rownumbers:true,
					autowidth:true,
					height:'auto',
					viewrecords:true,
					prmNames:{page:"paginator.currentPage",rows:"paginator.pageCount"},
					caption:'实体查询',
					toolbar:[true,"top"],
					jsonReader : {
						root:"rows",
						page: "page",
						total: "total",
						records: "records",
						repeatitems: false,
						id: "0"
					}
				});

			jQuery("#entity_list").setGridWidth($("#tableWidth").width());
		    $(window).bind('resize', function(){
				jQuery("#entity_list").setGridWidth($("#tableWidth").width());
		       });
					
	<%} else if ("1".equals(zixunType)){%>

				jQuery("#entity_list").jqGrid({
				url:"<%=basePath %>stgl/weihu_listEntities.do?zixunType=" + <%=zixunType%>,
					datatype: "json",
					mtype:"POST",
					colNames:['id','资产编号','实体名称','地区','管理部门','实体现状','历史遗留问题','尚有人员数','原值（万元）','账面资产总额（万元）','账面资产负债（万元）'],
					colModel:[	
						{name:'id',index:'id',hidden:true},
						{name:'zcbh',index:'assertNumber'},
						{name:'stzwmc',index:'entityName'},
						{name:'area',index:'classification'},
						{name:'CGlbm',index:'dept'},
						{name:'stxz2',index:'stxz2'},
						{name:'ywlsylwt',index:'Ywlsylwt'},	
						{name:'syrys',index:'syrys'},	
						{name:'yuanzhi',index:'yuanzhi'},
						{name:'zmzcze',index:'zmzcze'},
						{name:'zmzcfz',index:'zmzcfz'}
						],
					pager:'pgtoolbar1',
					multiselect:true,
					rownumbers:true,
					autowidth:true,
					height:'auto',
					viewrecords:true,
					prmNames:{page:"paginator.currentPage",rows:"paginator.pageCount"},
					caption:'实体查询',
					toolbar:[true,"top"],
					jsonReader : {
						root:"rows",
						page: "page",
						total: "total",
						records: "records",
						repeatitems: false,
						id: "0"
					}
				});

			jQuery("#entity_list").setGridWidth($("#tableWidth").width());
		    $(window).bind('resize', function(){
				jQuery("#entity_list").setGridWidth($("#tableWidth").width());
		       });
		<%} %>
		</script>

</body>
</html>
				