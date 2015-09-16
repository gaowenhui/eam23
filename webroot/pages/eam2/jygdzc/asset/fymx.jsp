<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ page import="com.tansun.eam2.common.model.orm.bo.*"%>
<%@page import="java.util.Map.Entry"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/ProjectJQuery.inc"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
<title></title>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
 <table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr>
       <td align="right">
           <table id="shareholder_list"> </table>
			<div id="pgtoolbar21"></div>

   	   </td>
  	</tr>
	<tr><td align="right"><input type="button" value="确定" /><input type="button" value="关闭" /></td></tr>
</table>

</body>
</html>
<script type="text/javascript">
				   var vshareholder
				jQuery("#shareholder_list").jqGrid({
					datatype: "local",
					colNames:['项目名称','申请金额', '审定金额','实际花费'],
					colModel:[	
						{name:'feiyong',index:'feiyong'},
						{name:'type',index:'type'},
						{name:'share_ratio',index:'share_ratio'},
						{name:'is_hold',index:'is_hold',editable:true}						
					],
					onSelectRow: function(id){
		               if(id && id!==vshareholder){
		                 jQuery('#shareholder_list').jqGrid('restoreRow',vshareholder);
			             jQuery('#shareholder_list').jqGrid('editRow',id,true);
			             vshareholder=id;}
						 },
					editurl:"entity-info-alter.html",
					autowidth:true,
					height:'auto',
				//	multiselect: true,
					caption: '费用明细列表'
				//	pager: '#pgtoolbar21'
						});
				var mydata = [ 
				{feiyong:'',type:'',share_ratio:'',is_hold:''},
				{feiyong:'',type:'',share_ratio:'',is_hold:''},
				{feiyong:'',type:'',share_ratio:'',is_hold:''}, 
				{feiyong:'',type:'',share_ratio:'',is_hold:''}];
				for(var i=0;i<=mydata.length;i++)
					jQuery("#shareholder_list").jqGrid('addRowData',i+1,mydata[i]);
					jQuery("#shareholder_list").jqGrid('navGrid','#pgtoolbar21',{edit:true,add:true,del:true});
				
				$(window).bind('resize', function() {  
						// resize the datagrid to fit the page properly: 
						var size = getWidthAndHeigh(true);
						jQuery("#shareholder_list").setGridWidth(size.width * 0.98); 
						
					}); 
					</script>		