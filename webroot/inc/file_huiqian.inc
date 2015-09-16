<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<table id="file_huiqianlist"></table>
<s:hidden name="FILE_UPDATE_DEL" value="Y" />
<script language="javascript">
	jQuery("#file_huiqianlist").jqGrid({
		url:"<%=basePath%>file/file_queryFile_HQFJ.do?bdid=<s:property value="#request.biaodanid"/>&fjlx=<s:property value="#request.type"/>",
		datatype: "json",
		colNames:['序号','文件标题','上传人','上传部门','上传日期','文件类型','文件大小','下载','sessionid','是否最终附件'],
		colModel:[
			{name:'idx',index:'idx',hidden:true},
			{name:'fjbt',index:'fjbt',sortable:false,align:'center'},
			{name:'scr',index:'scr',sortable:false,align:'center'},
			{name:'scbm',index:'scbm',sortable:false,align:'center'},
			{name:'scsj',index:'scsj',sortable:false,align:'center'},
			{name:'wjlx',index:'wjlx',hidden:true,sortable:false,align:'center'},
			{name:'wjdx',index:'wjdx',hidden:true,sortable:false,align:'center'},
			{name:'download',index:'download',hidden:true,sortable:false},
			{name:'sessionid',index:'sessionid',hidden:true},
			{name:'zzfj',index:'zzfj',editable:true,edittype:'checkbox',sortable:false,align:'center'}
		],
		onSelectRow1: function(id){
				jQuery('#file_huiqianlist').jqGrid('editRow',id,true);
				$("#" + id + "_zzfj").change(function(){
					jQuery('#file_huiqianlist').jqGrid('saveRow',id);
				});
			},
		editurl:"<%=basePath%>file/file_queryFile_HQFJ.do",
		multiselect:true,
		rownumbers:false,
		autowidth:true,
		height:'auto',
		viewrecords:true,
		caption: '会签附件',
		sortname:"idx",
		sortorder: "asc",
		rowNum:0,
	<%
	String isDid_huiqian="";
	if(request.getAttribute("isDid")!=null){
		isDid_huiqian = (String)request.getAttribute("isDid");
	}
	if(!"Y".equals(isDid_huiqian)){
	%>
		gridComplete:function(){  
	     	//jQuery("#file_huiqianlist").tableDnDUpdate();
	     },
	<%
	}
	%>
		ondblClickRow:function(rowid){
			downfile(rowid);
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
	$("#file_huiqianlist").tableDnD({
		onDrop: function(table, row) {
			var posturl= '<%=basePath%>file/file_sortOrder.do';
			var orderstring =$.tableDnD.serialize() ;   
		$.post( posturl, orderstring, function(message,status){
			if(status !== 'success') {
				alert(message);
			}
		})
		}
	});
	function delFileAss_huiqian_old(){
		var gr = jQuery("#file_huiqianlist").jqGrid('getGridParam','selarrrow');
		if(gr == ''){
			//alert(gr);
			alert("请选择要删除的记录!"); 		
		}else if(confirm("确认删除！")){
			//alert(gr);
			var delblyjurl ="<%=basePath%>file/file_deleAttach.do?id="+gr;
			$.post(delblyjurl,{yjids:"" + gr + ""}, function(data){
				jQuery("#file_huiqianlist").trigger("reloadGrid");
			});
		}
	}
	
	function delFileAss_huiqian(){
		var gr = jQuery("#file_huiqianlist").jqGrid('getGridParam','selarrrow');
		var scr= jQuery("#file_list").getCell(gr,'scr');
		var sessionid= jQuery("#file_huiqianlist").getCell(gr,'sessionid');
			if(gr == ''){
				//alert(gr);
				alert("请选择要删除的记录!"); 		
			}else if(isSession_huiqian(sessionid)||isMyFile(scr)){
				if(confirm("确认删除！")){
					var delblyjurl ="<%=basePath%>file/file_deleAttach.do?id="+gr;
				$.post(delblyjurl,{yjids:"" + gr + ""}, function(data){
					jQuery("#file_huiqianlist").trigger("reloadGrid");
				});
			}
		}else{
			alert("本人上传的附件才可以删除！");
		}
	}
	
	
	function isMyFile(scr){
		var me='<%=com.tansun.rdp4j.common.util.UserThreadLocal.get().getUsername()%>';
		//alert(me);
		if(scr==me){
		return true;
		}
		return false;
	
	}
	function isSession_huiqian(sessionid){
		var thissessionid='<%=session.getId()%>';
		if(thissessionid==sessionid){
			return true;
		}else{
			return false;
		}
	}
	
	function isSession_huiqian(sessionid){
		var thissessionid='<%=session.getId()%>';
		if(thissessionid==sessionid){
			return true;
		}else{
			return false;
		}
	}
	
	function addFileAss_huiqian(){
		var rdBasicWidth = "400px";
		var rdBasicHeight = "100px";
		var _g_privateDialogFeatures = "status=no;center=yes;help=no;dialogWidth="+rdBasicWidth+";dialogHeight="+rdBasicHeight+";scroll=yes;resize=yes";
		var x=(screen.width-800)/2; 
		var y=(screen.height-400)/2;
		window.open('<%=basePath%>file/file_selectfile.do?type=<s:property value="#request.type"/>&bdid=<s:property value="#request.biaodanid"/>','','height=400, width=800, top=' + y + ', left=' + x + ', toolbar=no, menubar=no, scrollbars=yes, resizable=yes,location=no, status=no');
	}
	function reloadFileGrid_huiqian(){
		jQuery("#file_huiqianlist").trigger("reloadGrid");
	}
</script>
