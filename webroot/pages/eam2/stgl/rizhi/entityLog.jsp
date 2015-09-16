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
        <title>实体维护日志查询</title>
<style>
	.STYLE1 {
		font-size: 20px;
		font-family: "simsun";
		font-weight: bold;
		color: #0000ff;
	}
</style>
<SCRIPT language=JavaScript type=text/JavaScript>
	     $(function(){
			$("#startTime").datebox({
		    	formatter:function(date){
		    		return formatDate(date);
		    	}
		    });
		    $("#endTime").datebox({
		    	formatter:function(date){
		    		return formatDate(date);
		    	}
		    });
		});
 </script>
    </head>
    <body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table id="tableWidth" width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="25" align="center" valign="bottom" class="td06">
    	
	<table width="100%" border="0" cellspacing="3" cellpadding="0">
      <tr>
        <td width="15"><img src="resource/ProjectImages/index_32.gif" width="9" height="9"></td>
        <td valign="bottom" class="title"><div align="left">实体查询</div></td>
      </tr>
    </table>
	</td>
  </tr>
</table>
       
    <table class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td  class="td_form01">修改时间： </td>
            <td   class="td_form02">从<s:textfield name="" id="startTime" />到<s:textfield name="" id="endTime" /></td>
            <td   class="td_form01">修改人：</td>
            <td   class="td_form02"><s:textfield name="" id=""/></td>
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

     <table id="entityLog_list"> </table>
 
	<script type="text/javascript">
		jQuery("#entityLog_list").setGridWidth($("#tableWidth").width());
	    $(window).bind('resize', function(){
			jQuery("#entityLog_list").setGridWidth($("#tableWidth").width());
	       });
			jQuery("#entityLog_list").jqGrid({
			url:"<%=basePath %>stgl/rizhi_listMaintainLogs.do",
				datatype: "json",
				mtype:"POST",
				colNames:['修改人','修改时间','修改对象','修改属性','修改前值','修改后值'],
				colModel:[	
					{name:'id',index:'id'},
					{name:'zcbh',index:'assertNumber'},
					{name:'stzwmc',index:'entityName'},
					{name:'area',index:'classification'},
					{name:'CGlbm',index:'dept'},
					{name:'stxz2',index:'stxz2'}
					],
				multiselect:false,
				rownumbers:true,
				autowidth:true,
				height:'auto',
				viewrecords:true,
				prmNames:{page:"paginator.currentPage",rows:"paginator.pageCount"},
				caption:'实体维护日志',
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
		jQuery("#entityLog_list").setGridWidth($("#tableWidth").width());
	    $(window).bind('resize', function(){
			jQuery("#entityLog_list").setGridWidth($("#tableWidth").width());
			})
	</script>

</body>
</html>
				