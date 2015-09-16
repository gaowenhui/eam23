<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<table id="file_hgsc_endlist"></table>
<s:hidden name="FILE_UPDATE_DEL" value="Y" />
<script language="javascript">
	jQuery("#file_hgsc_endlist").jqGrid({			
		url:"<%=basePath%>file/file_queryFile_HQFJ_END.do?bdid=<s:property value="#request.biaodanid"/>&fjlx=heguishencha",
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
			{name:'zzfj',index:'zzfj',editable:true,edittype:'checkbox',sortable:false,align:'center',hidden:true}
		],
		onSelectRow1: function(id){
				jQuery('#file_hgsc_endlist').jqGrid('editRow',id,true);
				$("#" + id + "_zzfj").change(function(){
					jQuery('#file_hgsc_endlist').jqGrid('saveRow',id);
				});
			},
		editurl:"<%=basePath%>file/file_queryFile_HQFJ.do",
		multiselect:true,
		rownumbers:false,
		autowidth:true,
		height:'auto',
		viewrecords:true,
		caption: '合规审查最终附件',
		sortname:"idx",
		sortorder: "asc",
		rowNum:0,
	<%

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
	
</script>