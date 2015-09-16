	function windowOpen(theURL,winName,features,width,hight,scrollbars,top,left){
	  var parameter="top="+top+",left="+left+",width="+width+",height="+hight;
	  if(scrollbars=="no") {
	  	parameter+=",scrollbars=no";
	  }  else {
	  	parameter+=",scrollbars=yes";  	
	  }
	  window.open(theURL,winName,parameter);
	}
	function showSubimtPage(){
		document.getElementById("subimtPage").style.display="block";
	}
	function cancleSubmit(){
		document.getElementById("subimtPage").style.display="none";

	}
function getWidthAndHeigh(resize){
			var iframeHeight = document.body.clientHeight;
			var iframeWidth = document.body.clientWidth;
			var browser = navigator.appName;
			// chrome
			if (browser == "chrome") {
				iframeWidth -= 16;
				iframeHeight -= 85;
			}
			// firefox
			else 
				if (browser == "firefox") {
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
			return {
				width: iframeWidth,
				height: iframeHeight
			};
		}

			function submit(action,taskId,outCome){
		if(doValidate(form1)){
			form1.action = action;
			form1.taskId.value=taskId;
			form1.outCome.value=outCome;
			form1.submit();
			}
}
		
		
		