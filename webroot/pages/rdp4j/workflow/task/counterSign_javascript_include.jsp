<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page language="java" import="com.tansun.rdp4j.common.util.ucc.*"%>
<%
if(isInCounterSign){
%>
<script>
	function trim(str){  //删除左右两端的空格   
		return str.replace(/(^\s*)|(\s*$)/g, "");   
	}
	function counterSignUserList(){
		window.showModalDialog("<%=request.getContextPath()%>/countersign/countersign_findCSPartUserList.do?taskId=<%=taskId%>","_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:800px;dialogHeight:600px;center:yes");
	}
	function choiceUser(){
		var result = window.showModalDialog("<%=request.getContextPath()%>/countersign/countersign_getParticipants.do?counterSignId=<%=counterSign.getTid()%>&deptId=<%=dept.getTid()%>","_blank","help:no;scroll:yes;resizable:no;status:0;dialogWidth:1050px;dialogHeight:600px;center:yes");
		if(typeof(result)!='undefined'){
			document.<%=formName%>.users.value = result;
			document.<%=formName%>.pdName.value = "countersign";
			document.<%=formName%>.outCome.value = "加签";
			document.<%=formName%>.didUrl.value = "countersign/countersign_toDid.do";
			document.<%=formName%>.nextTaskUrl.value = "countersign/countersign_todo.do";
			document.<%=formName%>.newParticipantTaskUrl.value = "countersign/countersign_todo.do";
			document.<%=formName%>.action = "<%=request.getContextPath()%>/countersign/countersign_addCounterSignParticipants.do";
			document.<%=formName%>.submit();
		}
	}
	function commitZHGCContent(){
		var content = trim(document.<%=formName%>.content.value);
		if(content==''){
			document.<%=formName%>.content.focus();
			alert('请填写过程意见！');
			return;
		}
		if(confirm("确定要提交过程意见？")){
			document.<%=formName%>.outCome.value = "综合过程意见";
			document.<%=formName%>.contentSetType.value = "<%=CommonGlobal.OPINION_YJYLX_MEETING%>";
			document.<%=formName%>.didUrl.value = "countersign/countersign_toDid.do";
			document.<%=formName%>.nextTaskUrl.value = "countersign/countersign_todo.do";
			document.<%=formName%>.action = "<%=request.getContextPath()%>/countersign/countersign_commitZHGCContent.do";
			document.<%=formName%>.submit();
		}
	}
	function commitLDGCContent(){
		var content = trim(document.<%=formName%>.content.value);
		if(content==''){
			document.<%=formName%>.content.focus();
			alert('请填写过程意见！');
			return;
		}
		if(confirm("确定要提交过程意见？")){
			document.<%=formName%>.outCome.value = "领导过程意见";
			document.<%=formName%>.contentSetType.value = "<%=CommonGlobal.OPINION_YJYLX_MEETING%>";
			document.<%=formName%>.didUrl.value = "countersign/countersign_toDid.do";
			document.<%=formName%>.nextTaskUrl.value = "countersign/countersign_todo.do";
			document.<%=formName%>.action = "<%=request.getContextPath()%>/countersign/countersign_commitZHGCContent.do";
			document.<%=formName%>.submit();
		}
	}
	function commitJBGCContent(){
		var content = trim(document.<%=formName%>.content.value);
		if(content==''){
			document.<%=formName%>.content.focus();
			alert('请填写过程意见！');
			return;
		}
		if(confirm("确定要提交过程意见？")){
			document.<%=formName%>.outCome.value = "经办过程意见";
			document.<%=formName%>.contentSetType.value = "<%=CommonGlobal.OPINION_YJYLX_MEETING%>";
			document.<%=formName%>.didUrl.value = "countersign/countersign_toDid.do";
			document.<%=formName%>.action = "<%=request.getContextPath()%>/countersign/countersign_commitJBGCContent.do";
			document.<%=formName%>.submit();
		}
	}
	function commitSendBackContent(){
		var content = trim(document.<%=formName%>.sendBackContent.value);
		if(content==''){
			alert('请填写退回意见！');
			document.<%=formName%>.sendBackContent.focus();
			return;
		}
		if(confirm("确定要提交退回意见？")){
			document.<%=formName%>.outCome.value = "退回";
			document.<%=formName%>.contentSetType.value = "<%=CommonGlobal.OPINION_YJYLX_HQTH%>";
			document.<%=formName%>.contentType.value = "<%=CommonGlobal.OPINION_YJLX_BACK%>";
			document.<%=formName%>.didUrl.value = "countersign/countersign_toDid.do";
			document.<%=formName%>.action = "<%=request.getContextPath()%>/countersign/countersign_commitSendBackContent.do";
			copyFile2Form();//过程意见转换为最终附件
			document.<%=formName%>.submit();
		}
	}
	function commitFinalContent(){
		var content = trim(document.<%=formName%>.finalContent.value);
		if(content==''){
			alert('请填写最终意见！');
			document.<%=formName%>.finalContent.focus();
			return;
		}
		if(confirm("确定要提交最终意见？")){
			document.<%=formName%>.outCome.value = "最终意见";
			document.<%=formName%>.contentSetType.value = "<%=CommonGlobal.OPINION_YJYLX_HQZZ%>";
			document.<%=formName%>.contentType.value = "<%=CommonGlobal.OPINION_YJLX_FINAL%>";
			document.<%=formName%>.didUrl.value = "countersign/countersign_toDid.do";
			document.<%=formName%>.action = "<%=request.getContextPath()%>/countersign/countersign_commitFinalContent.do";
			copyFile2Form();//过程意见转换为最终附件			
			document.<%=formName%>.submit();
		}
	}
	function copyFile2Form(){
		var obj=document.getElementsByName("checkfile");
		var strsel = "";
		for (var i=0;i<=obj.length-1;i++){
			if (obj[i].checked){
				strsel = strsel +","+ obj[i].value;
			}
		}
		if(strsel==""){
			//alert("请选择正式附件!");
			//return true;
		}else { //if(confirm('确定将过程附件转换为正式表单的附件?')) //不用提示
			var fileurl="/eam2/file/file_copyFile2Form.do?zzid=<%=counterSign.getHeadId()%>&ids="+strsel;
			$.post(fileurl,{}, function(data){
				jQuery("#file_huiqianlist").trigger("reloadGrid");
				//return true;
			});
		}
	}
	function zhuanhuan(){
		copyFile2Form();
	}
	function clearPanelTool(){
		//iframe 页面调用 window.parent.clearPanelTool();
		//无此方法会报js错误
	}
	function prependButtonsFromChildren(a,b){
	}
</script>
<%
}
%>