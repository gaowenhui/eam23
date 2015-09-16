<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<div id="blyj_tableWidth"  width="100%">
</div>
<s:hidden name="BLYJ_UPDATE_DEL" value="Y" />
<table id="xglc_reason_list"></table>
		<script type="text/javascript">
				jQuery("#xglc_reason_list").jqGrid({				
					url:"<%=basePath %>blyj/according_query4View.do?bdid=<s:property value="biaodanid" />&fenlei=<s:property value="fenlei" />",
					datatype: "json",
				   	colNames:['id','表单id','编号','标题','拟稿人','拟稿日期','提交人','流程名称', '来源'],
				   	colModel:[
				   		{name:'id',index:'id',editable:true,hidden:true},
				   		{name:'bdid',index:'bdid',editable:true,hidden:true},
				   		{name:'bh',index:'bh',editable:true, align:'center'},
				   		{name:'bt',index:'bt',editable:true},
						{name:'ngrName',index:'ngr',editable:true, align:'center'},
				   		{name:'ngrq',index:'ngrq',editable:true, align:'center'},
						{name:'tjrName',index:'ngr',editable:true, align:'center'},
				   		{name:'lcmc',index:'lcmc', align:"right",editable:true, align:'center'},
				   		{name:'source',index:'source', align:"right",editable:true, align:'center'}
				   	],
					multiselect:true,
					rownumbers:true,
					autowidth:true,
					height:'auto',
                    rowNum:0,
					caption: '相关流程',
					jsonReader : {
						root:"rows",
						repeatitems: false,
						id: "0"
					}
				});
				
		      //需要加到页面 初始化js中。
		      /**
			jQuery("#xglc_reason_list").setGridWidth($("#blyj_tableWidth").width());
		    $(window).bind('resize', function(){
				jQuery("#xglc_reason_list").setGridWidth($("#blyj_tableWidth").width());
		       });
		      **/ 
		       /**下面注释掉的代码是添加办理依据的按钮，请拷贝到自己页面上
		       $(document).ready(function(){	
			    //添加按钮  "#gview_list > .ui-jqgrid-titlebar
				var buttonBlyjJSonString = '[{"buttonHandler":"addblyjAss","buttonIcon":"icon-add","buttonText":"增加"},\
											{"buttonHandler":"delblyjAss","buttonIcon":"icon-cut","buttonText":"删除"},\
											{"buttonHandler":"exportExcelBlyj","buttonIcon":"icon-save","buttonText":"导出"}\
				]';
				addButtons(jQuery("#gview_xglc_reason_list > .ui-jqgrid-titlebar"),buttonBlyjJSonString);
			});
			**/
			
			function exportExcelBlyj(){
			     var urlStr = jQuery("#xglc_reason_list").getGridParam('url');
                 exportExcel("xglc_reason_list", urlStr, '{\"name\":\"value\"}', '办理依据','rn,cb,source');
			}
			
			function delblyjAss(){
				var gr = jQuery("#xglc_reason_list").jqGrid('getGridParam','selarrrow');
				if(gr == ''){
					alert("请选择要删除的记录!"); 		
				}else if(confirm("确认删除！")){
					var delblyjurl ="<%=basePath %>blyj/according_delAccording.do";
					$.post(delblyjurl,{yjids:"" + gr + ""}, function(data){
						jQuery("#xglc_reason_list").trigger("reloadGrid");
					});
				}
			}
			function addblyjAss(){
				var rdBasicWidth = "700px";
				var rdBasicHeight = "400px";
				//
				var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
				var x=(screen.width-800)/2; 
            	var y=(screen.height-400)/2;
            	var ensxms = encodeURI('<s:property value="sxms" />');
				window.open('<%=basePath%>blyj/according_openAccordingView.do?bdid=<s:property value="biaodanid" />&fenlei=<s:property value="fenlei" />','','height=400, width=800, top=' + y + ', left=' + x + ', toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
			}
			function reloadblyjJqGrid(){
				jQuery("#xglc_reason_list").trigger("reloadGrid");
			}
			
		</script>
