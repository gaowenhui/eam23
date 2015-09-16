//Author: <a href="fangbaling@tansun.com.cn">Baitin.Fong</a>

//
function getViewParams(id){
    var params = jQuery("#" + id).getGridParam('colModel');
    var names = jQuery("#" + id).getGridParam('colNames');
    var jsonStr = '{';
    var i = 1;
    for(i = 1; i< params.length; i++){
        var hv = params[i].hidden;
        if(hv == null || !hv){
            jsonStr += '\"' + params[i].name + '\":\"' + names[i] + '\",';
        }
    }
    jsonStr = jsonStr.substring(0, jsonStr.length - 1);
    jsonStr += '}';
    jsonStr = encodeURI(jsonStr);
    return jsonStr;
}

function exportExcel(id, urlStr, param, fileName, excludes){
    var jsonStr = getViewParams(id);
    if(fileName != null)
        fileName  = encodeURI(fileName);
    if(excludes != null)
        excludes = encodeURI(excludes);
    if(param != null)
        param = encodeURI(param);
    exportExcelViaJqGridForm.reset();
    exportExcelViaJqGridForm.exportExcelTitle.value = fileName;
    exportExcelViaJqGridForm.exportExcelPath.value = urlStr;
    exportExcelViaJqGridForm.exportExcelModel.value = jsonStr;
    exportExcelViaJqGridForm.exportExcelParams.value = param;
    exportExcelViaJqGridForm.exportExcelExcludeKeys.value = excludes;
	//var url = basePathJs+'log/excel_export.do?exportExcelTitle='+fileName+'&exportExcelPath='+urlStr+'&exportExcelModel='+jsonStr+'&exportExcelParams='+param+'&exportExcelExcludeKeys='+excludes;
    //alert(url);
    //window.open(url,'_self');
    exportExcelViaJqGridForm.submit();
    return false;
    //$.post(basePathJs + "word.jspa",{COMMAND:'exportExcelViaJqGrid', title:'' + fileName,path:'' + urlStr,model:jsonStr, params:param, excludeKeys:'' + excludes});
   // $.ajax({type:'POST', url:basePathJs + 'word.jspa', error:function(){
   //     alert('error');
   // },success:function(msg){
   //     alert(msg);
   // },data:{COMMAND:'exportExcelViaJqGrid', title:'' + fileName,path:'' + urlStr,model:jsonStr, params:param, excludeKeys:'' + excludes}, dataType:'application/vnd.ms-excel'});
}

function exportExcelJqGrid(jsonStr, urlStr, param, fileName, excludes){
    if(jsonStr != null)
        jsonStr  = encodeURI(jsonStr);
    if(fileName != null)
        fileName  = encodeURI(fileName);
    if(excludes != null)
        excludes = encodeURI(excludes);
    if(param != null)
        param = encodeURI(param);
    exportExcelViaJqGridForm.reset();
    exportExcelViaJqGridForm.exportExcelTitle.value = fileName;
    exportExcelViaJqGridForm.exportExcelPath.value = urlStr;
    exportExcelViaJqGridForm.exportExcelModel.value = jsonStr;
    exportExcelViaJqGridForm.exportExcelParams.value = param;
    exportExcelViaJqGridForm.exportExcelExcludeKeys.value = excludes;
    exportExcelViaJqGridForm.submit();
    return false;
}

Array.prototype.remove = function(obj){
	var index = this.indexOf(obj);
	this.splice(index, 1);
}
Array.prototype.removeAt = function(index){
	this.splice(index, 1);
}
Array.prototype.insert = function(index, obj){
	 this.splice(index,0,obj);
}
