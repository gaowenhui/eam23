<%@ page language="java" import="java.util.*,com.tansun.rdp4j.common.util.*" pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ include file="/inc/ProjectJQuery.inc"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>">
<title>流程选择</title>
<% 
	String bdid = (String)request.getParameter("bdid");
	String sxms = (String)request.getParameter("sxms");
	String fenlei = (String)request.getParameter("fenlei");
%>
<SCRIPT language=JavaScript type=text/JavaScript>

		function confirm(){
			var gr = jQuery("#purchase_list").jqGrid('getGridParam','selarrrow');
			var mainids = "";
			for(var i=0;i<gr.length;i++){
				var	source = $("#purchase_list").getCell(gr[i],"source");
				if(source=="OA"){
					mainids = mainids + gr[i] + "######";
				}
			}
			var url = "<%=basePath%>countersign/blyj2oa_sendOAmainid.do";
			$.post(url,{mainids:"" + mainids + ""},function(data){
					
				}
			);
			
				if(gr == ''){
					alert("请选择数据");  	
				}else{
					var blyjurl ="<%=basePath%>blyj/according_addAccording.do?bdid=<%=bdid%>&sxms=<%=sxms%>&fenlei=<%=fenlei%>";
					$.post(blyjurl,{lcids:"" + gr + ""}, function(data){
						if(data == "success"){
							window.opener.reloadblyjJqGrid();
							window.returnValue = "success";
							window.close();
						}
					});
				}
			
		}
		function confirm2(){
			var gr = jQuery("#purchase_list2").jqGrid('getGridParam','selarrrow');
				if(gr == ''){
					alert("请选择数据"); 	
				}else{
					var blyjurl ="<%=basePath%>blyj/according_addAccording.do?bdid=<%=bdid%>&sxms=<%=sxms%>&fenlei=<%=fenlei%>";
					$.post(blyjurl,{lcids:"" + gr + ""}, function(data){
						if(data == "success"){
							window.opener.reloadblyjJqGrid();
							window.returnValue = "success";
							window.close();
						}
					});
				}
			
		}
		function confirm3(){
			var gr = jQuery("#purchase_list3").jqGrid('getGridParam','selarrrow');
			var mainids = "";
			for(var i=0;i<gr.length;i++){
				var	source = $("#purchase_list3").getCell(gr[i],"source");
				if(source=="OA"){
					mainids = mainids + gr[i] + "######";
				}
			}
			var url = "<%=basePath%>countersign/blyj2oa_sendOAmainid.do";
			$.post(url,{mainids:"" + mainids + ""},function(data){
					
				}
			);
			
				if(gr == ''){
					alert("请选择数据"); 	
				}else{
					var blyjurl ="<%=basePath%>blyj/according_addAccording.do?bdid=<%=bdid%>&sxms=<%=sxms%>&fenlei=<%=fenlei%>";
					$.post(blyjurl,{lcids:"" + gr + ""}, function(data){
						if(data == "success"){
							window.opener.reloadblyjJqGrid();
							window.returnValue = "success";
							window.close();
						}
					});
				}
			
		}
		function query(){
				var gr = document.getElementById("title").value;
				gr = encodeURI(gr);
				var url1 = "<%=basePath %>blyj/according_queryWorkflow.do";
				alert("url1==="+url1);
				var oaModule = document.getElementById("oaModule").value;
				oaModule =encodeURI(oaModule);
				jQuery("#purchase_list").setGridParam({url:url1 + "?title=" + gr+"&isEAM1=fasle&oaModule="+oaModule}).trigger("reloadGrid");
				jQuery("#purchase_list2").setGridParam({url:url1 + "?title=" + gr+"&isEAM1=true&oaModule="+oaModule}).trigger("reloadGrid");
				jQuery("#purchase_list3").setGridParam({url:url1 + "?title=" + gr+"&isEAM1=OA&oaModule="+oaModule}).trigger("reloadGrid");
		}
</SCRIPT>
</head>

<body>
<br/>
<div id="tableWidth"  class="ui-jqdialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix" width="100%" style="cursor: move;">
	<span class="ui-jqdialog-title" style="float: left;">流程查询</span>
</div>
<table class="newtable" align="center" width="100%" cellspacing="0" cellpadding="0">

	      <tr>
	      <td class="td_zxy01">
            标题(支持模糊查询)222
            </td>
	        <td class="td_zxy02" >
	        <s:textfield name="title" class="input"/></td>
	        <td  class="td_zxy01">
            OA模块
            </td>
             <td class="td_zxy02">
             <s:select list="{'发文','收文','签报','法律性文件','工作联系单'}" id="oaModule"/>&nbsp;<input name="button" type="button"  value="搜索" onclick="query()"/>
	        </td>
	      </tr>
</table>
<table  class="newtable" width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
	<td align="right">
	<table id="purchase_list"></table>
	  <div id="yjcxListPager"></div>
	</td>
  </tr>
  <tr>
	<td align="right">
	<table id="purchase_list3"></table>
	  <div id="yjcxListPager3"></div>
	</td>
  </tr>
  <tr>
	<td align="right">
	<table id="purchase_list2"></table>
	  <div id="yjcxListPager2"></div>
	</td>
  </tr>
</table>
</body>
</html>
	  <script type="text/javascript">
              jQuery("#purchase_list").jqGrid({    
                datatype: "json",
                url:"<%=basePath %>blyj/according_queryWorkflow.do?bdid=<%=bdid%>&isEAM1=fasle", 
                mtype:"POST",
                colNames: ['lcid','id','编号', '标题','拟稿人','拟稿日期','流程名称','来源'],
                colModel: 
                   [
                   	{ name: 'lcid',  index: 'lcid', align: "center" ,hidden:true},
                   	{ name: 'id',  index: 'id', align: "center" ,hidden:true},
                    { name: 'bh',  index: 'bh', align: "center" ,width:'100'},
                    { name: 'bt',  index: 'bt', align: "center" }, 
                    { name: 'ngrName',  index: 'ngrName', align: "center" ,width:'80'},
                    { name: 'ngrq',  index: 'ngrq', align: "center",width:'60'},
                    { name: 'lcmc',  index: 'lcmc', align: "center",width:'80'},
                    { name: 'source',  index: 'source', align: "center",width:'60'}
                    ],
				height: 'auto',
				rownumbers:true,
                autowidth: true,
                multiselect: true,
                rowNum:10,
                pager:'yjcxListPager',
                prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
                viewrecords:true,
                caption: '流程列表',
			  	jsonReader : {
						root:"rows",
						page: "page",
						total: "total",
						records: "records",
						repeatitems: false,
						id: "0"
					}
              });
             jQuery("#purchase_list3").jqGrid({    
                datatype: "json",
                url:"<%=basePath %>blyj/according_queryWorkflow.do?bdid=<%=bdid%>&isEAM1=OA", 
                mtype:"POST",
                colNames: ['lcid','id','编号', '标题','拟稿人','拟稿日期','流程名称','来源'],
                colModel: 
                   [
                   	{ name: 'lcid',  index: 'lcid', align: "center" ,hidden:true},
                   	{ name: 'id',  index: 'id', align: "center" ,hidden:true},
                    { name: 'bh',  index: 'bh', align: "center" ,width:'100'},
                    { name: 'bt',  index: 'bt', align: "center" }, 
                    { name: 'ngrName',  index: 'ngrName', align: "center" ,width:'80'},
                    { name: 'ngrq',  index: 'ngrq', align: "center",width:'60'},
                    { name: 'lcmc',  index: 'lcmc', align: "center",width:'80'},
                    { name: 'source',  index: 'source', align: "center",width:'60'}
                    ],
				height: 'auto',
				rownumbers:true,
                autowidth: true,
                multiselect: true,
                rowNum:10,
                pager:'yjcxListPager3',
                prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
                viewrecords:true,
                caption: 'OA流程列表',
			  	jsonReader : {
						root:"rows",
						page: "page",
						total: "total",
						records: "records",
						repeatitems: false,
						id: "0"
					}
              });
           $(function(){    
	            //添加按钮  "#gview_list > .ui-jqgrid-titlebar
			    var buttonBlyjJSonString = '[{"buttonHandler":"confirm","buttonIcon":"icon-ok","buttonText":"确定"}\
			    ]';
			    addButtons(jQuery("#gview_purchase_list > .ui-jqgrid-titlebar"),buttonBlyjJSonString);
			     //添加按钮  "#gview_list > .ui-jqgrid-titlebar
			    var buttonBlyjJSonString1 = '[{"buttonHandler":"confirm2","buttonIcon":"icon-ok","buttonText":"确定"}\
			    ]';
			    addButtons(jQuery("#gview_purchase_list2 > .ui-jqgrid-titlebar"),buttonBlyjJSonString1);
			     var buttonBlyjJSonString1 = '[{"buttonHandler":"confirm3","buttonIcon":"icon-ok","buttonText":"确定"}\
			    ]';
			    addButtons(jQuery("#gview_purchase_list3 > .ui-jqgrid-titlebar"),buttonBlyjJSonString1);
				jQuery("#purchase_list").setGridWidth($("#tableWidth").width());
				jQuery("#purchase_list2").setGridWidth($("#tableWidth").width());
				jQuery("#purchase_list3").setGridWidth($("#tableWidth").width());
			    $(window).bind('resize', function(){
					jQuery("#purchase_list").setGridWidth($("#tableWidth").width());
					jQuery("#purchase_list2").setGridWidth($("#tableWidth").width());
					jQuery("#purchase_list3").setGridWidth($("#tableWidth").width());
			       }); 
         });    
         
         jQuery("#purchase_list2").jqGrid({    
                datatype: "json",
                url:"<%=basePath %>blyj/according_queryWorkflow.do?bdid=<%=bdid%>&isEAM1=true", 
                mtype:"POST",
                colNames: ['lcid','id','编号', '标题','拟稿人','拟稿日期','流程名称','来源'],
                colModel: 
                   [
                   	{ name: 'lcid',  index: 'lcid', align: "center" ,hidden:true},
                   	{ name: 'id',  index: 'id', align: "center" ,hidden:true},
                    { name: 'bh',  index: 'bh', align: "center" ,width:'100'},
                    { name: 'bt',  index: 'bt', align: "center" }, 
                    { name: 'ngrName',  index: 'ngrName', align: "center" ,width:'80'},
                    { name: 'ngrq',  index: 'ngrq', align: "center",width:'60'},
                    { name: 'lcmc',  index: 'lcmc', align: "center",width:'80'},
                    { name: 'source',  index: 'source', align: "center",width:'60'}
                    ],
				height: 'auto',
				rownumbers:true,
                autowidth: true,
                multiselect: true,
                rowNum:10,
                pager:'yjcxListPager2',
                prmNames:{page:"paginator.currentPage",rows:"paginator.pageSize"},
                viewrecords:true,
                caption: 'EAM一期流程列表',
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