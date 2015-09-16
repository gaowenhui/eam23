<!-- style.css -->
<link rel="stylesheet" type="text/css" href="<s:url value="/resource/css/style.css" />">
<link rel="stylesheet" type="text/css" href="<s:url value="/resource/ProjectJQuery/themes/jquery-ui-1.8.1.custom.css" />">
<link rel="stylesheet" type="text/css" href="<s:url value="/resource/ProjectJQuery/themes/ui.jqgrid.css" />">
<link rel="stylesheet" type="text/css" href="<s:url value="/resource/ProjectJQuery/themes/ui.multiselect.css" />">
<link rel="stylesheet" type="text/css" href="<s:url value="/resource/ProjectJQuery/themes/easyui.css" />">
<link rel="stylesheet" type="text/css" href="<s:url value="/resource/ProjectJQuery/themes/icon.css" />">
<link rel="stylesheet" type="text/css" href="<s:url value="/resource/ProjectJQuery/themes/demos.css" />">
<link rel="stylesheet" type="text/css" href="<s:url value="/resource/js/DHtmlXTree/dhtmlxtree.css" />">
<!-- JQuery.js -->
<script type="text/javascript" src="<s:url value="/resource/ProjectJQuery/js/jquery.js" />"></script>
<script type="text/javascript" src="<s:url value="/resource/ProjectJQuery/js/jquery.form.js" />"></script>
<!-- JQuery.UI.js -->
<script type="text/javascript" src="<s:url value="/resource/ProjectJQuery/js/external/jquery.bgiframe-2.1.1.js" />"></script>
<script type="text/javascript" src="<s:url value="/resource/ProjectJQuery/js/jquery-ui-1.8.1.custom.min.js" />"></script>
<!-- JQgrid.js -->
<script type="text/javascript" src="<s:url value="/resource/ProjectJQuery/js/i18n/grid.locale-en.js" />"></script>
<script type="text/javascript" src="<s:url value="/resource/ProjectJQuery/js/jquery.jqGrid.min.js" />"></script>
<script type="text/javascript" src="<s:url value="/resource/ProjectJQuery/js/jquery.tablednd.js" />"></script>
<!-- easyUI.js -->
<script type="text/javascript" src="<s:url value="/resource/ProjectJQuery/js/jquery.easyui.min.js" />"></script>
<!-- jquery-ui-timepicker-addon.js -->
<script type="text/javascript" src="<s:url value="/resource/ProjectJQuery/js/jquery-ui-timepicker-addon.js" />"></script>
<!-- DHtmlTree.js -->
<script type="text/javascript" src="<s:url value="/resource/js/DHtmlXTree/dhtmlxcommon.js" />"></script>
<script type="text/javascript" src="<s:url value="/resource/js/DHtmlXTree/dhtmlxtree.js" />"></script>
<script type="text/javascript" src="<s:url value="/resource/js/DHtmlXTree/ext/dhtmlxtree_ed.js" />"></script>

<!--  -->
<script language="JavaScript" type="text/javascript" src="/resource/js/win_center.js"></script>
<script type="text/javascript" language="JavaScript1.2" src="/resource/js/select.js"></script>
<script type="text/javascript" language="JavaScript1.2" src="/resource/js/value.js"></script>
<script type="text/javascript" src="<s:url value="/resource/js/tab.js" />"></script>
<script type="text/javascript" src="<s:url value="/resource/js/exportExcel.js" />"></script>
<script type="text/javascript" src="<s:url value="/resource/js/word.js" />"></script>
<script type="text/javascript" src="<s:url value="/resource/js/ValidatePages.js" />"></script>
<script type="text/javascript">
//<!--
//-->
function formatDate(date){
	var year = date.getFullYear();
	var month = date.getMonth()+1;
	var day = date.getDate();
	month = month<10?"0"+month:month;
	day = day<10?"0"+day:day;

	var hour = date.getHours();
	var minute = date.getMinutes();
	var second = date.getSeconds();
	hour = hour<10?"0"+hour:hour;
	minute = minute<10?"0"+minute:minute;
	second = second<10?"0"+second:second;
	// + " " + hour + ":" + minute + ":" + second
	return year + "-" + month + "-" + day;
}
  	
function addButtons(obj, buttonsJSonString){
	var jsonObj = $.parseJSON(buttonsJSonString);
	var text,icon,handler,menuId,id;
	var insertButtons = '';
	var linkIds = new Array();
	var menuIds = new Array();
	for (var i = 0; i < jsonObj.length; i++) {
		if(jsonObj[i] != null && jsonObj[i] != ""){
			text = jsonObj[i].buttonText==null?'':jsonObj[i].buttonText;
			icon = jsonObj[i].buttonIcon==null?'':jsonObj[i].buttonIcon;
			handler = jsonObj[i].buttonHandler==null?'':jsonObj[i].buttonHandler;
			menuId = jsonObj[i].buttonMenuId==null?'':jsonObj[i].buttonMenuId;
			id = jsonObj[i].id==null?Math.random()*Math.random():jsonObj[i].id;
			if(menuId == ''){
				linkIds.push(id);
				insertButtons += '<a '
					 + ' id="' + id + '"' 
					 + ' href="#"' ;
					 if(handler.indexOf('(') != -1){
					 	insertButtons += ' onclick="' + handler + ';return false;"'
					 }else{
					 	insertButtons += ' onclick="' + handler + '();return false;"'
					 }
				insertButtons += ' plain="true" class="easyui-linkbutton" ' 
					 + ' iconCls="' + icon + '">' 
					 + text + '</a>';
			}else{
				menuIds.push(id);
				insertButtons += '<a '
					 + ' id="' + id + '"' 
					 + ' href="#"' 
					 + ' onclick="return false;"'
					 + ' name="#' + menuId + '"'
					 + ' href="#"' 
					 + ' plain="true" class="easyui-menubutton" ' 
					 + ' iconCls="' + icon + '">' 
					 + text + '</a>\
				';
			}
		}
	}
	
	$(obj).append('\
		<table cellspacing="0" cellpadding="0" border="0" style="margin-right:20;float: right; table-layout: auto;" class="ui-pg-table navtable">\
		<tbody>\
		<tr>\
		<td>' + insertButtons + '</td>\
		</tr>\
		</tbody>\
		</table>\
	');
	$(linkIds).each(function(i,id){
		$(document.getElementById(id)).linkbutton({
		//$("#" + id).linkbutton({
	        duration: 9999999999,
			plain:true
		});
	});
	$(menuIds).each(function(i,id){
		$(document.getElementById(id)).menubutton({
            duration: 9999999999,
            menu: "" + $(document.getElementById(id)).attr("name"),
			plain:true
		});
	});
}

function addButtonIframe(obj, buttonsJSonString){
	var jsonObj = $.parseJSON(buttonsJSonString);
	var text,icon,handler,menuId,id;
	var insertButtons = '';
	var linkIds = new Array();
	var menuIds = new Array();
	for (var i = 0; i < jsonObj.length; i++) {
	if(jsonObj[i] != null && jsonObj[i] != ""){
		text = jsonObj[i].buttonText==null?'':jsonObj[i].buttonText;
		icon = jsonObj[i].buttonIcon==null?'':jsonObj[i].buttonIcon;
		handler = jsonObj[i].buttonHandler==null?'':jsonObj[i].buttonHandler;
		menuId = jsonObj[i].buttonMenuId==null?'':jsonObj[i].buttonMenuId;
		id = jsonObj[i].id==null?text+i:jsonObj[i].id;
		if(menuId == ''){
			linkIds.push(id);
			insertButtons += '<a '
				 + ' id="' + id + '"' 
				 + ' href="#"' 
				 + ' onclick="' + handler + ';return false;"'
				 + ' plain="true" class="easyui-linkbutton" ' 
				 + ' iconCls="' + icon + '">' 
				 + text + '</a>';
		}else{
			menuIds.push(id);
			insertButtons += '<a '
				 + ' id="' + id + '"' 
				 + ' href="#"' 
				 + ' onclick="return false;"'
				 + ' name="#' + menuId + '"'
				 + ' href="#"' 
				 + ' plain="true" class="easyui-menubutton" ' 
				 + ' iconCls="' + icon + '">' 
				 + text + '</a>\
			';
		}
		}
	}
	$(obj).append('\
		<table cellspacing="0" cellpadding="0" border="0" style="margin-right:20;float: right; table-layout: auto;" class="ui-pg-table navtable">\
		<tbody>\
		<tr>\
		<td>' + insertButtons + '</td>\
		</tr>\
		</tbody>\
		</table>\
	');

	$(linkIds).each(function(i,id){
		$(document.getElementById(id)).linkbutton({
		//$("#" + id).linkbutton({
	        duration: 9999999999,
			plain:true
		});
	});
	$(menuIds).each(function(i,id){
		$(document.getElementById(id)).menubutton({
            duration: 9999999999,
            menu: "" + $(document.getElementById(id)).attr("name"),
			plain:true
		});
	});
}

function appendButtons(obj, buttonsJSonString){
	var jsonObj = $.parseJSON(buttonsJSonString);
	var text,icon,handler,menuId,id;
	var insertButtons = '';
	var linkIds = new Array();
	var menuIds = new Array();
	for (var i = 0; i < jsonObj.length; i++) {
	if(jsonObj[i] != null && jsonObj[i] != ""){
		text = jsonObj[i].buttonText==null?'':jsonObj[i].buttonText;
		icon = jsonObj[i].buttonIcon==null?'':jsonObj[i].buttonIcon;
		handler = jsonObj[i].buttonHandler==null?'':jsonObj[i].buttonHandler;
		menuId = jsonObj[i].buttonMenuId==null?'':jsonObj[i].buttonMenuId;
		id = jsonObj[i].id==null?text+i:jsonObj[i].id;
		if(menuId == ''){
			linkIds.push(id);
			insertButtons += '<a '
				 + ' id="' + id + '"' 
				 + ' href="#"' ;
				 if(handler.indexOf('(') != -1){
				 	insertButtons += ' onclick="' + handler + ';return false;"'
				 }else{
				 	insertButtons += ' onclick="' + handler + '();return false;"'
				 }
			insertButtons += ' plain="true" class="easyui-linkbutton" ' 
				 + ' iconCls="' + icon + '">' 
				 + text + '</a>';
		}else{
			menuIds.push(id);
			insertButtons += '<a '
				 + ' id="' + id + '"' 
				 + ' href="#"' 
				 + ' onclick="return false;"'
				 + ' name="#' + menuId + '"'
				 + ' href="#"' 
				 + ' plain="true" class="easyui-menubutton" ' 
				 + ' iconCls="' + icon + '">' 
				 + text + '</a>\
			';
		}
	}
	}
	tdStr = $(obj).find("table.ui-pg-table").find("td").html();
	if(tdStr != null)
		$(obj).find("table.ui-pg-table").find("td").append(insertButtons);
	else{
		$(obj).append('\
			<table cellspacing="0" cellpadding="0" border="0" style="margin-right:20;float: right; table-layout: auto;" class="ui-pg-table navtable">\
			<tbody>\
			<tr>\
			<td>' + insertButtons + '</td>\
			</tr>\
			</tbody>\
			</table>\
		');
	}
	$(linkIds).each(function(i,id){
		$(document.getElementById(id)).linkbutton({
		//$("#" + id).linkbutton({
	        duration: 9999999999,
			plain:true
		});
	});
	$(menuIds).each(function(i,id){
		$(document.getElementById(id)).menubutton({
            duration: 9999999999,
            menu: "" + $(document.getElementById(id)).attr("name"),
			plain:true
		});
	});
	/**
	$(obj).find('.easyui-linkbutton').linkbutton({
                duration: 9999999999,
				plain:true
	});	

	$(obj).find('.easyui-menubutton').each(function(i,obj){
		//alert($(obj).attr("name"));
		$(obj).menubutton({
            duration: 9999999999,
            menu: "" + $(obj).attr("name"),
			plain:true
		});
	});
	**/
}

function prependButtons(obj, buttonsJSonString){
	var jsonObj = $.parseJSON(buttonsJSonString);
	var text,icon,handler,menuId,id;
	var insertButtons = '';
	var linkIds = new Array();
	var menuIds = new Array();
	for (var i = 0; i < jsonObj.length; i++) {
	if(jsonObj[i] != null && jsonObj[i] != ""){
		text = jsonObj[i].buttonText==null?'':jsonObj[i].buttonText;
		icon = jsonObj[i].buttonIcon==null?'':jsonObj[i].buttonIcon;
		handler = jsonObj[i].buttonHandler==null?'':jsonObj[i].buttonHandler;
		menuId = jsonObj[i].buttonMenuId==null?'':jsonObj[i].buttonMenuId;
		id = jsonObj[i].id==null?text+i:jsonObj[i].id;
		if(menuId == ''){
			linkIds.push(id);
			insertButtons += '<a '
				 + ' id="' + id + '"' 
				 + ' href="#"' ;
				 if(handler.indexOf('(') != -1){
				 	insertButtons += ' onclick="' + handler + ';return false;"'
				 }else{
				 	insertButtons += ' onclick="' + handler + '();return false;"'
				 }
			insertButtons += ' plain="true" class="easyui-linkbutton" ' 
				 + ' iconCls="' + icon + '">' 
				 + text + '</a>';
		}else{
			menuIds.push(id);
			insertButtons += '<a '
				 + ' id="' + id + '"' 
				 + ' href="#"' 
				 + ' onclick="return false;"'
				 + ' name="#' + menuId + '"'
				 + ' href="#"' 
				 + ' plain="true" class="easyui-menubutton" ' 
				 + ' iconCls="' + icon + '">' 
				 + text + '</a>\
			';
		}
	}
	}
	tdStr = $(obj).find("table.ui-pg-table").find("td").html();
	if(tdStr != null)
		$(obj).find("table.ui-pg-table").find("td").prepend(insertButtons);
	else{
		$(obj).append('\
			<table cellspacing="0" cellpadding="0" border="0" style="margin-right:20;float: right; table-layout: auto;" class="ui-pg-table navtable">\
			<tbody>\
			<tr>\
			<td>' + insertButtons + '</td>\
			</tr>\
			</tbody>\
			</table>\
		');
	}
		

	$(linkIds).each(function(i,id){
		$(document.getElementById(id)).linkbutton({
		//$("#" + id).linkbutton({
	        duration: 9999999999,
			plain:true
		});
	});
	$(menuIds).each(function(i,id){
		$(document.getElementById(id)).menubutton({
            duration: 9999999999,
            menu: "" + $(document.getElementById(id)).attr("name"),
			plain:true
		});
	});
}

function isNotNull(str){
	if(str != null && str != undefined){
		var testStr = $.trim(str);
		if(testStr != ""){
			return true;
		}
	}
	return false;
}
</script>
