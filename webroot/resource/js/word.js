	 
	//  basePathJs = "http://how.jic.cn/eam2/";
	  var wordTemplateID = "";
	  var wordFileNameString = "";
	  var formObj
	   function wordTemplate(wordTempKey, formObjParam,readOnly,isOpenFile, wordFileName)
	   {
		   getWordTemplate(wordTempKey, formObjParam,readOnly,isOpenFile, wordFileName, "true");
	   }
	   var isActiveWord = "false";
	  function getWordTemplate(wordTempKey, formObjParam,readOnly,isOpenFile, wordFileName, isActive)
      {     
           	wordFileNameString = wordFileName;
			isActiveWord = isActive;
           	formObj = formObjParam;
      		if(isOpenFile == false)
      			temp1 = "false";
      		else
      			temp1 = "true";
      		if(readOnly == false)
      			temp2 = "false";
      		else
      			temp2 = "true";
	  		var url = basePathJs+"word.jspa";
	  		var pars = "COMMAND=getTemp&WORDKEY="+wordTempKey + "&BIAODANID=" + formObj.elements["biaodanid"].value + "&ISOPENFILE=" +temp1 +"&READONLY="+ temp2 ;
			if(isActive == "true"){
				$.ajax({
				   type: "POST",
				   url: url,
				   data: pars,
				   success: openWord
				});
			}else{
				$.ajax({
				   type: "POST",
				   url: url,
				   data: pars,
				   success: openWordMerge
				});
			}
		  return false;
      }
      
      function openWord(originalRequest)
      {        
            originalRequest = eval('(' + originalRequest + ')');
            
      	  var returnStatus = originalRequest.status;
      	  var returnStr = "";
         	if (originalRequest.status == 200) {    
          		returnStr = originalRequest.responseText
       		}
       		else{	       		
	       		switch (returnStatus) {
					   case 581 :
					   	   //The word template wasn't definition
					       alert("Word\u6a21\u677f\u6ca1\u6709\u5b9a\u4e49\uff01")
					       break;
					   case 582 :
					   		//The operation wasn't definition or error
					       alert("\u64cd\u4f5c\u6ca1\u6709\u5b9a\u4e49\u6216\u6709\u8bef")
   					       break;
					   case 583 :
					   		//The key of word template is null
					       alert("Word\u6a21\u677f\u952e\u503c\u4e3a\u7a7a")
   					       break;
					   case 584 :
					   		//File isn't exist
					       alert("\u5bf9\u4e0d\u8d77\uff0c\u60a8\u67e5\u770b\u7684\u6587\u4ef6\u4e0d\u5b58\u5728\uff01")
   					       break;
						default:
							//error
						   alert("\u51fa\u9519\u4e86")
				           break;
					}
					return false;
       		}  	       		
       		
       		var readOnly = returnStr[0].readOnly;
       		var id = returnStr[0].fileKey;
       		var wordTempID = returnStr[0].wordTemp;
       		var bdid = returnStr[0].biaodanid;
       		var extFunctionName = returnStr[0].extJsFun;
       		var fieldMapping = returnStr[0].field;
       		wordStatus = returnStr[0].wordStatus;
       		try{ 
       		   
       		    if(document.all.myword.WordGetApp()!=null)
				 {
				  alert("\u5df2\u7ecf\u6253\u5f00\u4e86\u5176\u5b83\u516c\u6587\uff0c\u8bf7\u5173\u95ed\u5b83\u518d\u6267\u884c\u672c\u64cd\u4f5c\uff01");
				  document.all.myword.WordGetApp().Activate();
				  return false;
				 }
				if (readOnly == "true")
		  		{
		        	document.all.myword.breadonly=true;
		        	
		    	}else{
		    		document.all.myword.breadonly=false;	
			 	}
		      	wordTemplateID =  wordTempID;
		      	if(wordFileNameString == null || wordFileNameString.length < 1){
		      	    wordFileNameString = wordTempID;
		      	}
		      	
			    var wordPath =  basePathJs;			 
			  	var localname=document.all.myword.GetUserTempFolder()+"\\oatemp\\"+wordFileNameString+".doc";	
				var modelname;
				
				
				if(id != null && id !='')
					modelname=wordPath+"word.jspa?COMMAND=downloadWord&WORDTEMPKEY=" + wordTempID + "&BIAODANID=" + bdid;	
				document.all.myword.MaxFileSize=2000;
				document.all.myword.downloadfile(modelname,localname);
				document.all.myword.OpenWordDoc(localname);	
				var returnStrlength = 0;
				for(var len in returnStr[0]){
				   returnStrlength++;
                }
				if(returnStrlength==3)
					return false;
				
				var app=document.all.myword.WordGetApp();
				var doc=document.all.myword.WordGetDoc();
				if(app!=null && isActiveWord == "true"){
				   app.ActiveDocument.TrackRevisions = true;
				   app.UserName = formObj.username_hidden.value;
				   app.ActiveDocument.ShowRevisions = false;
			       app.Activate();	
				}	
				
				var vars=doc.Variables;
				var var1;
				var wordtype=""		
				
				if(vars.count<=0)
					vars.add("WORDTYPE","TANSUNOA");
				else
				{ 
					for(i=1;i<=vars.count;i++)
					{
						var1=vars.item(i);
						if(var1.name=="WORDTYPE")
						{
							wordtype="TANSUNOA";
							break;
						}
					}
					
					if(wordtype!="TANSUNOA")
						vars.add("WORDTYPE","TANSUNOA");
				}	
				var maplist =  fieldMapping.split(",");					
       		    for(j=0;j<maplist.length;j++)
       		    {
	       		    var arrtemp = maplist[j].split("|");
    	   		    var fieldvalue = "";
       			    if(formObj.elements[arrtemp[1]]!= undefined && formObj.elements[arrtemp[1]]!='')
						fieldvalue = formObj.elements[arrtemp[1]].value;
       		    	document.all.myword.wordsetfield(arrtemp[0],fieldvalue);
       		    }
       		    if(extFunctionName != "")     
	       		    eval(extFunctionName);
       		}catch(e){
 			    alert(e);	
			}
      }

    var wordStatus = 1;
	function wordUpdate()
	{
		try{
			var docname=document.all.myword.closeddocname;
			var realname=document.all.myword.openeddocname;
			var docpath=document.all.myword.closeddocpath;
			var openpath=document.all.myword.GetUserTempFolder()+"oatemp\\"+realname;
			var app=document.all.myword.WordGetApp();
			var doc=document.all.myword.WordGetDoc();
			var localFilePath=docpath+"\\"+docname;
			var localFilePath1=document.all.myword.getusertempfolder() + "\\"+realname;
			if(localFilePath.indexOf(openpath)==-1){
				return;
			}
			
			if(document.all.myword.bReadOnly)
	    	{	
				myword.CloseWordApp();
			}
			
			if(realname!==docname)
			{
				fso = new ActiveXObject("Scripting.FileSystemObject");
				fso.CopyFile (localFilePath,localFilePath1);
				docname=realname;
				localFilePath=localFilePath1;
			}
			window.focus();
			myword.showprogress("\u6b63\u5728\u4fdd\u5b58\u6587\u4ef6\u5230\u670d\u52a1\u5668\uff0c\u8bf7\u7a0d\u5019...");
			myword.ServerUrl='http://' + window.location.host;
			var temfileName = encodeURI(wordFileNameString);
			var sendUrlPath = pathJs + '/word.jspa?wordStatus=' + wordStatus + '&userid=' + formObj.elements["userid"].value + '&deptid=' + formObj.elements["deptid"].value + '&COMMAND=uploadWord&BIAODANID=' + formObj.elements["biaodanid"].value + "&title=" + temfileName;
			myword.ServletAddr= sendUrlPath;
		    myword.DbName="affix";
			myword.dbtype="oracle";
			myword.ClearFileList();
			document.all.myword.maxfilesize=2000;
			myword.DocUnid=wordTemplateID;
			myword.AddToFileList(localFilePath,docname);
				
			if(app!=null)
				app.WindowState=2;
			var ret=false;
			while(!ret)
			{
				if(myword.FileExists(localFilePath))
				{
					var retval=myword.UpdateAttach();
					if(!retval)
					{	
						if(!confirm("\u4e0a\u4f20\u6587\u4ef6\u5230\u670d\u52a1\u5668\u51fa\u9519\uff01\u8981\u91cd\u65b0\u4e0a\u4f20\u5417\uff1f"));
							ret=true;
					}
					else
					{
						ret=true;
					}
				}
			}
			myword.CloseWordApp();
		}
		catch(e){
		  alert(e);
		}
		myword.hideprogress();
	    if('afterWordSubmit' in window){//在提交之前调用beforeWorkFlowSubmit()
                    if(afterWordSubmit instanceof Function){
                        afterWordSubmit();
                    }
           }
	}
	/*
	function gettemppath()
    {
      return document.all.myword.getusertempfolder();
    }
    */
    function getCurrentDate()
    {
        var d = new Date()
        var vYear = d.getFullYear()
        var vMon = d.getMonth() + 1
        var vDay = d.getDate()
//      var vHour = d.getHours()
//      var vMin = d.getMinutes()
//      var vSec = d.getSeconds()
        return vYear+"-"+vMon+"-"+vDay
    }
    
    function getDate(strDate)
    {
	    var arr = strDate.split(" ")
	    return arr[0]
    }
	var myDocApp, myDoc, MyDocApp2,myDoc2;
	var replaceHeadMethod, replaceBottomMethod;
	var MyRangeHead, MyRangeBottom;
      function openWordMerge(originalRequest)
      {
            originalRequest = eval('(' + originalRequest + ')');

      	  var returnStatus = originalRequest.status;
      	  var returnStr = "";
         	if (originalRequest.status == 200) {
          		returnStr = originalRequest.responseText
       		}
       		else{
	       		switch (returnStatus) {
					   case 581 :
					   	   //The word template wasn't definition
					       alert("Word\u6a21\u677f\u6ca1\u6709\u5b9a\u4e49\uff01")
					       break;
					   case 582 :
					   		//The operation wasn't definition or error
					       alert("\u64cd\u4f5c\u6ca1\u6709\u5b9a\u4e49\u6216\u6709\u8bef")
   					       break;
					   case 583 :
					   		//The key of word template is null
					       alert("Word\u6a21\u677f\u952e\u503c\u4e3a\u7a7a")
   					       break;
					   case 584 :
					   		//File isn't exist
					       alert("\u5bf9\u4e0d\u8d77\uff0c\u60a8\u67e5\u770b\u7684\u6587\u4ef6\u4e0d\u5b58\u5728\uff01")
   					       break;
						default:
							//error
						   alert("\u51fa\u9519\u4e86")
				           break;
					}
					return false;
       		}

       		var readOnly = returnStr[0].readOnly;
       		var id = returnStr[0].fileKey;
       		var wordTempID = returnStr[0].wordTemp;
       		var bdid = returnStr[0].biaodanid;
       		var extFunctionName = returnStr[0].extJsFun;
       		var fieldMapping = returnStr[0].field;
       		wordStatus = returnStr[0].wordStatus;
       		try{

       		    if(document.all.myword.WordGetApp()!=null)
				 {
				  alert("\u5df2\u7ecf\u6253\u5f00\u4e86\u5176\u5b83\u516c\u6587\uff0c\u8bf7\u5173\u95ed\u5b83\u518d\u6267\u884c\u672c\u64cd\u4f5c\uff01");
				  document.all.myword.WordGetApp().Activate();
				  return false;
				 }
				if (readOnly == "true")
		  		{
		        	document.all.myword.breadonly=true;

		    	}else{
		    		document.all.myword.breadonly=false;
			 	}
		      	wordTemplateID =  wordTempID;
		      	if(wordFileNameString == null || wordFileNameString.length < 1){
		      	    wordFileNameString = wordTempID;
		      	}

			    var wordPath =  basePathJs;
			  	var localname=document.all.myword.GetUserTempFolder()+"\\oatemp\\"+wordFileNameString+".doc";
				var modelname;


				if(id != null && id !='')
					modelname=wordPath+"word.jspa?COMMAND=downloadWord&WORDTEMPKEY=" + wordTempID + "&BIAODANID=" + bdid;
				document.all.myword.MaxFileSize=2000;
				document.all.myword.downloadfile(modelname,localname);
				document.all.myword.OpenWordDoc(localname);

				var myDocApp1=document.all.myword.WordGetApp();
				var myDoc1=document.all.myword.WordGetDoc();
				var nPara = myDoc.Paragraphs.Count;
                if(wordStatus != '2'){
                     wordStatus = 2;
					 MyRangeHead = myDoc.range(0,myDoc.paragraphs(nPara).Range.End);
				  // GetFileHead(MyRange);  //得到处理单上的信息replaceHeadMethod, replaceBottomMethod;
					if(replaceHeadMethod != null && replaceHeadMethod.length != 0){
						eval(replaceHeadMethod);
					}
					MyRangeHead.copy();   //结束拷贝
			        //把拷贝的内容赋予附件模板中
					var vWordApp = myDoc1.Parent;
					var vSelection = vWordApp.Selection;
					vSelection.HomeKey(6);
					vSelection.paste();
	
			//        //替换版记
			//        //alert("套红成功，请稍候")
							var nPara2 = myDoc2.Paragraphs.Count;
							MyRangeBottom = myDoc2.range(0,myDoc2.paragraphs(nPara2).Range.End);
							//myDocApp2.visible =true;
					//       // GetFileEnd(MyRange2);
							if(replaceBottomMethod != null && replaceBottomMethod.length != 0){
								eval(replaceBottomMethod);
							}
							MyRangeBottom.copy();
							vSelection.EndKey(6);
							vSelection.paste();
				}
					//关闭红头
					myDoc.close(0,1,false);
					myDocApp.quit(0);
			//        //关闭版记
					myDoc2.close(0,1,false);
					myDocApp2.quit(0);
					//结束版记
				
				myDocApp1.visible = true;
				myDocApp1.ActiveDocument.TrackRevisions = true;
                myDocApp1.UserName = formObj.username_hidden.value;
                myDocApp1.ActiveDocument.ShowRevisions = false;
				myDocApp1.activate();
       		}catch(e){
 			    alert("打开word出错，请检查控件是否安装。");
			}
      }

    function  MergeWordStart(wordTaoHongTou, wordTempKey, wordTaoBanJi, formObjParam, wordFileName,replaceHead,replaceBottom)
    {

        //其中参数 atteachname为操作名，设置为“套红”，
        //curName为当前操作者名，Server_Name:服务器地址，
        //localFilePath:文件路径，即urlZ文件所在目录，
        //mainid，同文件名中的.DOC前的一部分。
		var tou = basePathJs + "word.jspa?COMMAND=downloadWord&&WORDTEMPKEY=" + wordTaoHongTou + "&&BIAODANID=WORD_TEMPLATE";
		var ban = basePathJs + "word.jspa?COMMAND=downloadWord&&WORDTEMPKEY=" + wordTaoBanJi + "&&BIAODANID=WORD_TEMPLATE";
		//myDocApp.visible =true;
		 myDocApp =new ActiveXObject("word.Application");
        myDoc = myDocApp.documents.open(tou);
		myDocApp2 =new ActiveXObject("word.Application");
        myDoc2 = myDocApp2.documents.open(ban);
		replaceHeadMethod=replaceHead;
		replaceBottomMethod=replaceBottom;
		getWordTemplate(wordTempKey, formObjParam,false,true, wordFileName, "false");

    }
