<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="com.tansun.rdp4j.workflow.task.action.*" %>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/resource/js/menu.js"></script>
<script>
	function choiceDept(){
		if('beforeCounterSign' in window){
			if(beforeCounterSign instanceof Function){
                var result = beforeCounterSign();
                if(!result) return;				
			}
		}
		
		var hqbmids = ""; 
		if('getCallBack4Tree' in window){
			hqbmids = document.getElementById("hqbmids").value;
		} else if ('getCallBack4Tree1' in window){
			hqbmids = document.getElementById("hqbmids1").value;
		}
		var bizPiId = document.getElementById("piId").value;
		var counterSignTitle = document.getElementById("counterSignTitle").value;
		var taskId = document.getElementById("taskId").value;
		var counterSignUrl = document.getElementById("counterSignUrl").value;
		var headId = document.getElementById("headId").value;
		var result = window.showModalDialog("<%=request.getContextPath()%>/countersign/startcountersign_init.do?bizPiId="+bizPiId+"&hqbmids="+hqbmids,"_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:800px;dialogHeight:600px;center:yes");
		if(typeof(result)!='undefined'){
			document.<%=formName%>.dept_user.value = result;
			document.<%=formName%>.pdk.value = "countersign";
			$.post("<%=request.getContextPath()%>/countersign/startcountersign_start.do",{
						"dept_user" 		: result,
						"pdk" 				: "countersign",
						"bizPiId" 			: bizPiId,
						"counterSignTitle" 	: counterSignTitle,
						"taskId" 			: taskId,
						"counterSignUrl"	: counterSignUrl,
						"headId"			: headId
					},function(data){	
						if(data.length > 0 && data != "_"){
							var dept = data.split("_");
							var deptids = dept[0];
							var deptnames = dept[1];
							if('getCallBack4Tree' in window){
								getCallBack4Tree(deptids, deptnames);
							} else if ('getCallBack4Tree1' in window){
								getCallBack4Tree1(deptids, deptnames);
							}
							counterSaveTodo();
						}
					});
		}
	}
	function bldCommit(){
		if('checkEAMFormJSMethod' in window){
            if(checkEAMFormJSMethod instanceof Function){
                var result = checkEAMFormJSMethod();
                if(!result) return;
            }
        }
		var blbmbh = document.getElementById("blbmbh").value;
		// if('getCallBack4Tree' in window){
		//	blbmbh = 
		// }
		var bizPiId = document.getElementById("piId").value;
		var bldTitle = document.getElementById("bldTitle").value;
		var taskId = document.getElementById("taskId").value;
		var bldUrl = document.getElementById("bldUrl").value;
		var headId = document.getElementById("headId").value;
		var result = "";
		$.ajaxSetup({async: false});
		if(typeof(blbmbh)!='undefined'){
			$.post("<%=request.getContextPath()%>/countersign/startcountersign_getDeptUser.do",{
						"blbmbh" 		: blbmbh
					},function(data){	
						if(data.length > 0 && data != "_"){
							result = data;
						}
					});
		}
		// var result = window.showModalDialog("<%=request.getContextPath()%>/countersign/startcountersign_init.do?bizPiId="+bizPiId+"&hqbmids="+hqbmids,"_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:800px;dialogHeight:600px;center:yes");
		if(typeof(result)!='undefined'){
			document.<%=formName%>.dept_user.value = result;
			document.<%=formName%>.pdk.value = "countersign";
			$.post("<%=request.getContextPath()%>/countersign/startcountersign_start.do",{
						"dept_user" 		: result,
						"pdk" 				: "countersign",
						"bizPiId" 			: bizPiId,
						"counterSignTitle" 	: bldTitle,
						"taskId" 			: taskId,
						"counterSignUrl"	: bldUrl,
						"headId"			: headId
					},function(data){	
						if(data.length > 0 && data != "_"){
							counterSaveTodo();
						}
					});
		}
		$.ajaxSetup({async: true});
	}
	function selectMeeting(){
		var headId = document.getElementById("headId").value;
		window.open("<%=request.getContextPath()%>/countersign/startcountersign_query.do?headId="+headId,
				"","scroll:yes;resizable:no;status:0;dialogWidth:800px;dialogHeight:600px;center:yes");
	}
	function commit(taskId,outCome){
		if('checkEAMFormJSMethod' in window){
            if(checkEAMFormJSMethod instanceof Function){
                var result = checkEAMFormJSMethod();
                if(!result) return;
            }
        }
		if('checkEAMFormJSMethod2' in window){
            if(checkEAMFormJSMethod2 instanceof Function){
                var result = checkEAMFormJSMethod2(taskId,outCome);
                if(!result) return;
            }
        }
        if('commitWorkflow' in window){
			if(commitWorkflow instanceof Function){
				if(!commitWorkflow(taskId,outCome)){
					return;
				}
			}
		}
		if(outCome=="作废"){
			if(confirm('确定要作废处理单吗？')){
				document.<%=formName%>.action = document.getElementById("abandonUrl").value;
				document.<%=formName%>.url.value = document.getElementById("abandonViewUrl").value;
				document.<%=formName%>.taskId.value = taskId;
				document.<%=formName%>.outCome.value = outCome;
				if('beforeWorkFlowSubmit' in window){//在提交之前调用beforeWorkFlowSubmit()
		            if(beforeWorkFlowSubmit instanceof Function){
		                var result = beforeWorkFlowSubmit(taskId,outCome);
		                if(!result) return;
		            }
	        	}
				document.<%=formName%>.submit();
				return;
			}
			return;
		}
		if(outCome=="流程办结"||
		   outCome=="结束"||
		   outCome=="生成台账结束"||
		   outCome=="不生成台账结束"||
		   outCome=="提交意见触发会议纪要整理"||
		   outCome=="整理会议纪要结束"
		){
			// if(confirm('确定要办结处理单吗？')){
				document.<%=formName%>.action = document.getElementById("endUrl").value;
				document.<%=formName%>.url.value = document.getElementById("endViewUrl").value;
				document.<%=formName%>.taskId.value = taskId;
				document.<%=formName%>.outCome.value = outCome;
				if('beforeWorkFlowSubmit' in window){//在提交之前调用beforeWorkFlowSubmit()
		            if(beforeWorkFlowSubmit instanceof Function){
		                var result = beforeWorkFlowSubmit(taskId,outCome);
		                if(!result) return;
		            }
	        	}
				document.<%=formName%>.submit();
				return;
			// }
			// return;
		}
		var nowTaskName = "<%=workflowVO.taskName%>";
		var urlpush = encodeURI(document.getElementById("participationUrl").value+"?taskId="+taskId+"&outCome="+outCome+"&multiple=false&taskName="+nowTaskName);
		var result = window.showModalDialog(urlpush,"_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:1050px;dialogHeight:600px;center:yes");
		if(typeof(result)!='undefined'){
			document.<%=formName%>.result.value = '<%=WorkflowAction.TO_COMPLETETASK%>';
			document.<%=formName%>.action = document.getElementById("commitUrl").value;
			document.<%=formName%>.nextTodoUrl.value = document.getElementById("commitNextTodoUrl").value;
			document.<%=formName%>.didUrl.value = document.getElementById("commitDidUrl").value;
			document.<%=formName%>.taskId.value = taskId;
			document.<%=formName%>.outCome.value = outCome;
			document.<%=formName%>.assignId.value = result;
			if('beforeWorkFlowSubmit' in window){//在提交之前调用beforeWorkFlowSubmit()
	            if(beforeWorkFlowSubmit instanceof Function){
	                var result = beforeWorkFlowSubmit(taskId,outCome);
	                if(!result) return;
	            }
        	}
			document.<%=formName%>.submit();
		}
	}
	function commitDraft(processDefinitionKey,outCome){
		if('checkEAMFormJSMethod' in window){
            if(checkEAMFormJSMethod instanceof Function){
                var result = checkEAMFormJSMethod();
                if(!result) return;
            }
        }
        if('checkEAMFormJSMethod2' in window){
            if(checkEAMFormJSMethod2 instanceof Function){
                var result = checkEAMFormJSMethod2(processDefinitionKey,outCome);
                if(!result) return;
            }
        }
		var urlpush = encodeURI(document.getElementById("draftParticipationUrl").value+"?pdk="+processDefinitionKey+"&outCome="+outCome+"&multiple=false");
		var result = window.showModalDialog(urlpush,"_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:1050px;dialogHeight:600px;center:yes");
		if(typeof(result)!='undefined'){
			document.<%=formName%>.action = document.getElementById("commitDraftUrl").value;
			document.<%=formName%>.outCome.value = outCome;
			document.<%=formName%>.assignId.value = result;
			document.<%=formName%>.result.value = '<%=WorkflowAction.TO_DRAFTCOMMIT%>';
			document.<%=formName%>.url.value = document.getElementById("draftCommitUrl").value;
			document.<%=formName%>.todoUrl.value = document.getElementById("draftCommitTodoUrl").value;
			document.<%=formName%>.nextTodoUrl.value = document.getElementById("draftCommitNextTodoUrl").value;
			document.<%=formName%>.didUrl.value = document.getElementById("commitDidUrl").value;
			if('beforeWorkFlowSubmit' in window){//在提交之前调用beforeWorkFlowSubmit()
	            if(beforeWorkFlowSubmit instanceof Function){
	                var result = beforeWorkFlowSubmit(processDefinitionKey,outCome);
	                if(!result) return;
	            }
        	}
			document.<%=formName%>.submit();
		}
	}
	function saveDraft(){
		if('checkEAMFormTitle' in window){
            if(checkEAMFormTitle instanceof Function){
                var result = checkEAMFormTitle();
                if(!result) return;
            }
        }
		if(confirm('确定要保存吗？ee')){
			document.<%=formName%>.result.value = '<%=WorkflowAction.TO_SAVEDRAFT%>';
			document.<%=formName%>.url.value = document.getElementById("draftCommitUrl").value;
			document.<%=formName%>.action = encodeURI(document.getElementById("saveDraftUrl").value);
			alert(document.getElementById("saveDraftUrl").value+"sssssssssss");
			if('beforeWorkFlowSubmit' in window){//在提交之前调用beforeWorkFlowSubmit()
	            if(beforeWorkFlowSubmit instanceof Function){
	                var result = beforeWorkFlowSubmit("saveDraft","");
	                if(!result) return;
	            }
        	}
			document.<%=formName%>.submit();
		}
	}
	function saveTodo(){
		if('checkEAMFormJSMethod' in window){
            if(checkEAMFormJSMethod instanceof Function){
                var result = checkEAMFormJSMethod();
                if(!result) return;
            }
        }
        if('checkEAMFormJSMethod2' in window){
            if(checkEAMFormJSMethod2 instanceof Function){
                var result = checkEAMFormJSMethod2("saveTodo","");
                if(!result) return;
            }
        }
		if(confirm('确定要保存吗？')){
			document.<%=formName%>.result.value = '<%=WorkflowAction.TO_SAVE_TODO%>';
			document.<%=formName%>.action = encodeURI(document.getElementById("saveTodoUrl").value);
			if('beforeWorkFlowSubmit' in window){//在提交之前调用beforeWorkFlowSubmit()
	            if(beforeWorkFlowSubmit instanceof Function){
	                var result = beforeWorkFlowSubmit("saveTodo","");
	                if(!result) return;
	            }
        	}
			document.<%=formName%>.submit();
		}
	}
	
	function counterSaveTodo(){
		if('checkEAMFormJSMethod' in window){
            if(checkEAMFormJSMethod instanceof Function){
                var result = checkEAMFormJSMethod();
                if(!result) return;
            }
        }
        if('checkEAMFormJSMethod2' in window){
            if(checkEAMFormJSMethod2 instanceof Function){
                var result = checkEAMFormJSMethod2("saveTodo","");
                if(!result) return;
            }
        }
		document.<%=formName%>.result.value = '<%=WorkflowAction.TO_SAVE_TODO%>';
		document.<%=formName%>.action = encodeURI(document.getElementById("saveTodoUrl").value);
		if('beforeWorkFlowSubmit' in window){//在提交之前调用beforeWorkFlowSubmit()
            if(beforeWorkFlowSubmit instanceof Function){
                var result = beforeWorkFlowSubmit("saveTodo","");
                if(!result) return;
            }
       	}
		document.<%=formName%>.submit();
	}
	function directCirculation(){
		document.getElementById("commitUrl").value = '<%=actionSpaceName%>/<%=actionPath%>_unSaveCirculation.do';
		circulation();
	}
	function draftCirculation(){
		// if(!confirm('确定要传阅处理单吗？')) return;
		var urlpush = encodeURI(document.getElementById("circulationParticipation").value);
		var result = window.showModalDialog(urlpush,"_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:1050px;dialogHeight:600px;center:yes");
		if(typeof(result)!='undefined'){
			document.<%=formName%>.result.value = 'draftCirculation';
			document.<%=formName%>.action = document.getElementById("commitUrl").value;
			document.<%=formName%>.url.value = document.getElementById("circulationUrl").value;
			document.<%=formName%>.param.value = document.getElementById("circulationparam").value;
			document.<%=formName%>.assignId.value = result;
			if('beforeWorkFlowSubmit' in window){//在提交之前调用beforeWorkFlowSubmit()
	            if(beforeWorkFlowSubmit instanceof Function){
	                var result = beforeWorkFlowSubmit("circulation","");
	                if(!result) return;
	            }
        	}
			document.<%=formName%>.submit();
		}
	}
	function circulation(){
		// if(!confirm('确定要传阅处理单吗？')) return;
		var urlpush = encodeURI(document.getElementById("circulationParticipation").value);
		var result = window.showModalDialog(urlpush,"_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:1050px;dialogHeight:600px;center:yes");
		if(typeof(result)!='undefined'){
			document.<%=formName%>.result.value = '<%=WorkflowAction.TO_CIRCULATION%>';
			document.<%=formName%>.action = document.getElementById("commitUrl").value;
			document.<%=formName%>.url.value = document.getElementById("circulationUrl").value;
			document.<%=formName%>.param.value = document.getElementById("circulationparam").value;
			document.<%=formName%>.assignId.value = result;
			if('beforeWorkFlowSubmit' in window){//在提交之前调用beforeWorkFlowSubmit()
	            if(beforeWorkFlowSubmit instanceof Function){
	                var result = beforeWorkFlowSubmit("circulation","");
	                if(!result) return;
	            }
        	}
			document.<%=formName%>.submit();
		}
	}
	function backto(){
		if(confirm('确定要收回任务吗？')){
			var taskId = document.<%=formName%>.taskId.value;
			var result = window.showModalDialog("<%=request.getContextPath()%>/workflow/workflow_backto.do?taskId="+taskId+"&BACK_OPERATION=BACK_OPERATION","_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:300px;dialogHeight:150px;center:yes");
			if(typeof(result)!='undefined'){
				document.<%=formName%>.action = "<%=request.getContextPath()%>/workflow/userTask_findMyTodo.do";
				if('beforeWorkFlowSubmit' in window){//在提交之前调用beforeWorkFlowSubmit()
		            if(beforeWorkFlowSubmit instanceof Function){
		                var result = beforeWorkFlowSubmit(taskId,"");
		                if(!result) return;
		            }
	        	}
				document.<%=formName%>.submit();
			}
		}
	}
</script>
<%@ include file="/pages/rdp4j/workflow/task/counterSign_javascript_include.jsp"%>
