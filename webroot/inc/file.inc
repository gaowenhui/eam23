<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<div id="file_tableWidth" width="100%"></div>
<table id="file_list"></table>
<s:hidden name="FILE_UPDATE_DEL" value="Y" />
<div id="pgtoolbar1"></div>
<script type="text/javascript">
jQuery("#file_list").jqGrid({				
	url:"<%=basePath%>file/file_queryFile.do?fjlx=1&bdid=<s:property value="biaodanid" />",
	datatype: "json",
   	colNames:['序号','附件类型','文件标题','上传人','上传部门','上传日期','文件大小','下载','sessionid','sortid','bdid','zzfj'],
   	colModel:[
   		{name:'idx',index:'idx',hidden:true},
		{name:'zzfj',index:'zzfj',hidden:false,align:'center'},
   		{name:'fjbt',index:'fjbt',sortable:false,align:'left'},
   		{name:'scr',index:'scr',  sortable:false,align:'center'},
   		{name:'scbm',index:'scbm' ,sortable:false,align:'center'},
   		{name:'scsj',sortable:false,index:'scsj',align:'center'},
   		{name:'wjdx',index:'wjdx',hidden:true},
   		{name:'download',index:'download',hidden:true},
   		{name:'sessionid',index:'sessitonid',hidden:true},
   		{name:'sortid',index:'sortid',hidden:true},
   		{name:'bdid',sortable:false,index:'bdid',align:'center',hidden:true},
		{name:'zzfj',index:'zzfj',hidden:true}
   	],
	multiselect:true,
	rownumbers:false,
	autowidth:true,
	height:'auto',
	viewrecords:true,
	caption: '文件上传',
	rowNum:0,
	gridComplete:function(gr){
		var ids = $("#file_list").getDataIDs();
		for(var i=0;i<ids.length;i++){
			var gr=ids[i];
			var zzfj = jQuery("#file_list").getCell(gr,'zzfj');
			var fjbt = jQuery("#file_list").getCell(gr,'fjbt');
			if(zzfj=='1'){
				be="会签最终附件";
			}else{
				be="普通附件";
			}
			jQuery("#file_list").jqGrid('setRowData',ids[i],{zzfj:be});
		}
		<%
		String isDid1="";
		if(request.getAttribute("isDid1")!=null){
			isDid1 = (String)request.getAttribute("isDid1");
		}
			if(!"Y".equals(isDid1)){
		%>
				//jQuery("#file_list").tableDnDUpdate();      
		<%
			}
		%>
	},
	jsonReader:{
		root:"rows",
		page: "page",
		total: "total",
		records: "records",
		repeatitems: false,
		id: "0"
	},
	ondblClickRow:function(gr){
		show(gr);
	}
	});
				
$("#file_list").tableDnD({ 
    onDrop: function(table, row) { 
        var posturl= '<%=basePath%>file/file_sortOrder.do';
       	var orderstring =$.tableDnD.serialize() ;   

        $.post( posturl, orderstring, function(message,status) {
            if(status != 'success') {        
				alert(message);        
              }})
		}
  });
function show(gr){
	var url= '<%=basePath%>file/file_download.do?id='+gr;
	window.open(url,'_self');
}
//需要加到页面 初始化js中。
/**
jQuery("#file_list").setGridWidth($("#file_tableWidth").width());
 	 $(window).bind('resize', function(){
	jQuery("#file_list").setGridWidth($("#file_tableWidth").width());
});
 **/
function delFileAss(){
	var grs = jQuery("#file_list").jqGrid('getGridParam','selarrrow');
	//alert("sessionid:="+sessionid);
	//alert("scr:="+scr);
	if(grs == ''){
		alert("请选择要删除的记录!");
	}else{
			var aaa=""+grs;
			var bbb=aaa.split(",");
			for(i=0;i<bbb.length;i++){
			//alert(bbb[i]);
			var gr=bbb[i];
			if(gr!=''){
				var sessionid= jQuery("#file_list").getCell(gr,'sessionid');
				var scr= jQuery("#file_list").getCell(gr,'scr');
				var fjbt= jQuery("#file_list").getCell(gr,'fjbt');
				if(isMyFile(scr)&&isSession(sessionid)){
				//isSession(sessionid)||isMyFile(scr)
									if(confirm("确认删除 《"+fjbt+"》 ！")){
										var delblyjurl ="<%=basePath%>file/file_deleAttach.do?id="+gr;
										$.post(delblyjurl,{yjids:"" + gr + ""}, function(data){
											jQuery("#file_list").trigger("reloadGrid");
										});
									}
						//var cldid='<s:property value="biaodanid" />';
						//var isDaibanurl ="<%=basePath%>file/file_isDaiban.do?cldid="+cldid;
						//$.post(isDaibanurl,{cldid:"" + cldid + ""}, function(data){
						//		alert(data);
						//		if(data=='true'){
						//			if(confirm("确认删除！")){
						//						var delblyjurl ="<%=basePath%>file/file_deleAttach.do?id="+gr;
						//						$.post(delblyjurl,{yjids:"" + gr + ""}, function(data){
						//							jQuery("#file_list").trigger("reloadGrid");
						//						});
						//			}
						//		}else{
						//			alert("该附件不能删除！");
						//		}
						//});
			}else{
				alert("附件 《"+fjbt+"》 不能删除！");
			}
			}
		}
		
		
		
	}
}

function isMyFile(scr){
	var me='<%=com.tansun.rdp4j.common.util.UserThreadLocal.get().getUsername()%>';
	if(scr==me){
		return true;
	}else{
		return false;
	}
}
function isSession(sessionid){
		var thissessionid='<%=session.getId()%>';
		if('null'!=sessionid){
			return true;
		}else{
			return false;
		}
}
function up(){
	if(isSingle()){
		var uporder="";
		var new1 ="";
		var new2 ="";
		var order="";
		var ix= "";
		var upid="";
		var ids = jQuery("#file_list").jqGrid('getGridParam','selarrrow');
		var idsAll = $("#file_list").getDataIDs();
		for(var i=0;i<idsAll.length;i++){
			var gr=idsAll[i];
			if(ids == gr ){
				ix = i ;
			}
		}
		if(ix==0){
			alert("已经是第一条!");
			return ;
		}else{
			upid = idsAll[ix-1];
			uporder = jQuery("#file_list").getCell(upid,'sortid');
			order = jQuery("#file_list").getCell(ids,'sortid');
			new1 = upid + "," + order;
			new2 = ids + "," + uporder;
		}
		var posturl= '<%=basePath%>file/file_sortOrder.do?';
		$.post(posturl,{file_order1:"" + new1 + "",file_order2:"" + new2 + ""}, function(data){
			jQuery("#file_list").trigger("reloadGrid");
		});
	}
}
function down(){
	if(isSingle()){
		var downorder="";
		var new1 ="";
		var new2 ="";
		var order="";
		var ix= "";
		var downid="";
		var ids = jQuery("#file_list").jqGrid('getGridParam','selarrrow');
		var idsAll = $("#file_list").getDataIDs();
		for(var i=0;i<idsAll.length;i++){
			var gr=idsAll[i];
			if(ids == gr ){
				ix = i ;
			}
		}
		if(ix==(idsAll.length-1)){
			alert("已经是最后一条!");
			return ;
		}else{
			downid = idsAll[ix+1];
			downorder = jQuery("#file_list").getCell(downid,'sortid');
			order = jQuery("#file_list").getCell(ids,'sortid');
			new1 = downid + "," + order;
			new2 = ids + "," + downorder;
		}
		var posturl= '<%=basePath%>file/file_sortOrder.do?';
		$.post(posturl,{file_order1:"" + new1 + "",file_order2:"" + new2 + ""}, function(data){
			jQuery("#file_list").trigger("reloadGrid");
		});
	}
}

function isSingle(){
	var ids = jQuery("#file_list").jqGrid('getGridParam','selarrrow');
	if(ids.length < 1){
		alert("请选择一条记录");
		return false;
	}else if(ids.length > 1){
		alert("只能选择一条记录");
		return false;
	}else{
		return true;
	}
}
function addFileAss(){
	var rdBasicWidth = "400px";
	var rdBasicHeight = "100px";
	var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
	var x=(screen.width-800)/2; 
    var y=(screen.height-400)/2;
	window.open('<%=basePath%>file/file_selectfile.do?type=1&bdid=<s:property value="biaodanid" />','','height=400, width=800, top=' + y + ', left=' + x + ', toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
}
function reloadFileGrid(){
	jQuery("#file_list").trigger("reloadGrid");
}
//var buttonFileJSonString = '[{"buttonHandler":"up","buttonIcon":"icon-up","buttonText":"上移"} , {"buttonHandler":"down","buttonIcon":"icon-down","buttonText":"下移"}]';
//addButtons(jQuery("#gview_file_list > .ui-jqgrid-titlebar"),buttonFileJSonString);

function updateCanDel(){
	var gr = jQuery("#file_list").jqGrid('getGridParam','selarrrow');
	var bdid= '<s:property value="biaodanid" />';
	var updateurl ="<%=basePath%>file/file_updateCanFileDel.do?bdid="+bdid;
	$.post(updateurl,{bdid:"" + bdid + ""}, function(data){
			//jQuery("#file_list").trigger("reloadGrid");
	});
}
</script>
<!-- input type='button' value='updateCanDel' onclick="updateCanDel()"  /-->