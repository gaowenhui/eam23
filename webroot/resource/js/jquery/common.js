function setFormValue(formname,currobjname,currvalue){ 
	var formobj=eval("document."+formname);    
	if(formobj == null){                                                    
		return;                                         
	}     
	for(i=0;i<formobj.length;i++){ 	                                                  
		currobj = formobj[i]; 	 
		if(currobj.name.toLowerCase() != currobjname.toLowerCase()){                                               
			continue;                                  
		} 	    
		if(currobj.type == 'radio'){  
			if(currobj.value ==currvalue){                                         
				currobj.checked=true;                
			}                                         
		}else{                                               
			if(currobj.type == 'checkbox'){                                         
				if(currobj.value ==currvalue){                                 
					currobj.checked=true;
				}else{                                 
					currobj.checked=false;    
				}                                 
			}else{                                         
				currobj.value=currvalue;          
			}                                         
		}	                                          
	} 	                                                  
} 
function openWin(name,url,v_width,v_height) 
{ 
	var name=name;
	var url= url;
	var v_width =v_width;
	var v_height = v_height;
	var v_left = (window.screen.availWidth - v_width) / 2;
	var v_top = (window.screen.availHeight - v_height) / 2;
	var para = "top=" + v_top + ",left=" + v_left + ",width=" + v_width +",height=" + v_height + ",alwaysRaised=yes,scrollbars=yes,resizable=no,status=yes,toolbar=no,menubar=no,titlebar=no"; 
	window.open(url, name, para); 

//showModalDialog
	//showModelessDialog(url,window1,"status:false;dialogWidth:"+v_width+"px;dialogHeight:"+v_height+"px;edge:Raised;center: Yes; help: No; resizable: yes; status: No");
}
//获得checkbox或者option类型的表单域的内容
function getOptionVal(fieldName){
	var opts1=document.getElementsByName(fieldName)
	if(opts1!=null){
		for(i=0;i<opts1.length;i++){
			if(opts1(i).checked){
				//alert(opts1(i))
				return opts1(i).value;
			}
		}
	}else{
		return "";
	}
	return "";
}

//设置checkbox或者option类型的表单域
function setOptionVal(fieldName,fieldValue){
	var opts1=document.getElementsByName(fieldName)
	var i;
	if(opts1!=null){
		for(i=0;i<opts1.length;i++){
			if(opts1(i).value==fieldValue){
				opts1(i).checked=true;
				return true;
			}
		}
	}else{
		return false;
	}
	return false;
}
//清除checkbox或者option类型的表单域内容
function clearOptionVal(fieldName){
	var opts1=document.getElementsByName(fieldName)
	var i;
	if(opts1!=null){
		for(i=0;i<opts1.length;i++){
			opts1(i).checked=false;
		}
		return true;
	}else{
		return false;
	}
	return false;
}