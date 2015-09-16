<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc" %>
<%@ include file="/inc/ProjectJQuery.inc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>
    	<base href="<%=basePath %>"/>
<title></title>


<script type="text/javascript">
	 function getWidthAndHeigh(resize) {
                var iframeHeight = document.body.clientHeight;
                var iframeWidth = document.body.clientWidth;
                var browser=navigator.appName;
             // chrome
                if (browser == "chrome") {
                        iframeWidth -= 16;
                        iframeHeight -= 85;
                }
                // firefox
                else if (browser == "firefox") {
                        iframeWidth -= 15;
                        iframeHeight -= 85;
                        if (resize) {
                                iframeWidth += 18;
                                iframeHeight += 13;
                        }
                } 
                // IE
                else {

                        iframeWidth -= 12;
                        iframeHeight -= 83;
                        if (resize) {
                                iframeHeight += 15;
                                iframeWidth += 10;
                        }
                }
                return {width: iframeWidth, height: iframeHeight};
        }
		</script>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
 <table width="98%" border="0" cellspacing="0" cellpadding="0" align="center">
                        <tr>
                          <td align="right">
                    <table id="shareholder_list"> </table>
				<div id="pgtoolbar21"></div>

   </td>
  </tr>
</table>

</body>
</html>
<script type="text/javascript">
				   var vshareholder
				jQuery("#shareholder_list").jqGrid({
					datatype: "local",
					colNames:['费用种类','预计花费', '实际支出','备注'],
					colModel:[	
						{name:'feiyong',index:'feiyong',editable:true,edittype:"select",editoptions:{value:"1:评估费;2:尽职调查费;3:拍卖费;4:委托代理费;5:咨询费;6:广告费;7:其他处置费用"}},
						{name:'type',index:'type',editable:true},
						{name:'share_ratio',index:'share_ratio',align:"center",editable:true},
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
					multiselect: true,
					caption: '费用明细列表',
					pager: '#pgtoolbar21'
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