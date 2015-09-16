<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<%
	String sheettype = (String)request.getAttribute("sheettype");
	String headId = (String)request.getAttribute("headId");
	String stid = (String)request.getAttribute("stid");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html>
<head>
<title>日志信息</title>
<SCRIPT type="text/JavaScript">
	$(function(){
		jQuery("#table_log").setGridWidth($("#tableWidth").width());
		$(window).bind('resize', function(){
			jQuery("#table_log").setGridWidth($("#tableWidth").width());
		});
            $("#updateStart").datebox({
		    	formatter:function(date){
		    		return formatDate(date);
		    	}
		    });
		    $("#updateEnd").datebox({
		    	formatter:function(date){
		    		return formatDate(date);
		    	}
		    });
	});
   function query(){
         jQuery("#table_log").setGridParam({
                url:"<%=basePath %>log/log_query4View.do",
                postData:{
                    "updateStart"	:	$("#updateStart").val(),
                    "updateEnd"		:	$("#updateEnd").val(),
                    "upobjId"		:	"<%=stid%>",
                    "tableName"		:	"StJbxx",
                    "tableIdName"	:	"id",
                    "subSys"		:	"3",
                    "assetColName"	:	"stzwmc",
                    "username"		:	$("#username").val()
                }
        }).trigger("reloadGrid");
   }
    function resetForm(){
       $("#updateStart") .val('');
       $("#updateEnd") .val('');
       $("#username") .val('');
    }
</SCRIPT>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
    <br>
    <table class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td  class="td_form01">修改时间： </td>
            <td   class="td_form02">从<s:textfield name="updateStart" id="updateStart" />到<s:textfield name="updateEnd" id="updateEnd" /></td>
            <td   class="td_form01">修改人：</td>
            <td   class="td_form02"><s:textfield name="username" id="username"/></td>
			</tr>
            <tr>
            <td   class="td_form02" colspan="4" >
                 <div align="right">
			    <input type='button'  value='查询'  onClick="query()" />
			    <input type='button'  value='重置'   onClick="resetForm()" />
                 </div>
	        </td>
		  </tr>
     </table>
        <div id="tableWidth" name="tableWidth" width="100%" />
		<table id="table_log" ></table>
        <div id="pgtoolbar1"></div>
</body>
</html>
<script type="text/javascript">
		jQuery("#table_log").jqGrid({
                url:"<%=basePath %>log/log_query4View.do?upobjId=<%=stid%>&tableName=StJbxx&tableIdName=id&subSys=3&assetColName=stzwmc",
                datatype: "json",
				mtype:"POST",
				colNames:['id', '实体名称','编码', '修改人','修改时间','操作类型', '修改页签','修改属性','修改前值','修改后值'],
				colModel:[
					{name:'id',index:'id',hidden:true,sortable:false},
					{name:'assetName',index:'assetName', sortable:false},
					{name:'upobjcode',index:'upobjcode',align:"center"},
					{name:'personName',index:'personName',align:"center"},
					{name:'updatedate',index:'updatedate',align:"center"},
					{name:'updatetype',index:'updatetype',align:"center"},
					{name:'upsheet',index:'upsheet',align:"center"},
					{name:'upproper',index:'upproper',align:"center"},
					{name:'upbefovalue',index:'upbefovalue'},
					{name:'upaftervalue',index:'upaftervalue'}
					],
				multiselect:false,
				rownumbers:true,
				autowidth:true,
				height:'auto',
				viewrecords:true,
                pager:'#pgtoolbar1',
				prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
				caption:'维护日志',
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