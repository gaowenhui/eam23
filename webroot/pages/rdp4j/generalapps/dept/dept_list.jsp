<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<#escape x as ((x!)?html)!> <#include "../../common/paginator.html"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>部门列表</title>
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="this is my page">
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="${request.contextPath}/resource/css/maincss.css" type="text/css">
		<script type="text/javascript" 	src="${request.contextPath}/resource/js/validate.js"></script>
		<script type="text/javascript">
  function checkAll(val){
		var arr = document.getElementsByName("tids");
		for (i=0;i<arr.length;i++){
			arr(i).checked = val;
		}
	}
	function turnDelete(){
        myForm.action=" ${request.contextPath}/dept/dept_delete.do";
		if(confirm("确认删除吗?")){
			var flag=false;
			var arr=document.getElementsByName("tids");
			for(i=0;i<arr.length;i++){
				if(arr(i).checked){
					flag=true;
					break;
				}
			}
				if(!flag){
					alert("至少选择一个");
				}else{
			    	myForm.submit();		
				}
		}
	}
	function queryDep(){
	  var depName=document.getElementById("depName").value;
	  myForm.action="${request.contextPath}/dept/dept_getQueryDep.do?depName"+depName;
	  myForm.submit();
	  document.getElementById("depName").value=depName;
	}
	function clearValue(){
	   document.getElementById("depName").value="";
	    myForm.action="${request.contextPath}/dept/dept_toList.do";
	    myForm.submit();
	}
	
	
	function showtable(tid){
	whichEl = eval("table" + tid);
	//控制表是否显
	if (whichEl.style.display == "none"){
		eval("table" + tid + ".style.display=\"\";");
		eval("tr" + tid + ".style.display=\"\";");
		//取数据
		myAjax(tid);
		}
	else{
		eval("table" + tid + ".style.display=\"none\";");
		eval("tr" + tid + ".style.display=\"none\";");
		//删除表格
		deleteTr(tid);
		}
    }
    
    var myRequest;
   function  myAjax(tid){
    myRequest=new ActiveXObject("Msxml2.XMLHTTP");
    myRequest.onreadystatechange=ajaxExe;
    myRequest.open('post','${request.contextPath}/dept/dept_getUsersByDepId.do?depId='+tid,true);
    myRequest.send(null);
   }
  function ajaxExe(){ 
   if(myRequest.readyState==4){
      var str=myRequest.responseText;
     // alert("ddddd"+str);
      var temp=eval("("+str+")");
      //表格添加
     // alert("ddddd"+temp.length);
       for(i=0;i<temp.length;i++){
        var tr=document.all("table"+temp[i].depId).insertRow();
        tr.align="center";
        var c0=tr.insertCell();
        var c1=tr.insertCell();
        var c2=tr.insertCell();
        var c3=tr.insertCell();
        c0.innerText=""+temp[i].depId;
        c1.innerText=""+temp[i].userId;
        c2.innerText=""+temp[i].userLonginId;
        c3.innerText=""+temp[i].userPassword;
      }
    }
   }
   //删除联动出来的Table
   function deleteTr(tid){
     var deleteObj=eval("table"+tid);
     for(i=deleteObj.rows.length-1;i>0;i--){
        deleteObj.deleteRow(i);
     }
   }
   function deleteSingle(tid){
     myForm.action="${request.contextPath}/dept/dept_deleteOne.do?dep.tid="+tid;
     myForm.submit();
   }	
</script>
</head>
	<body class='body1'>
	<form action="" method="post" id="myForm" name="myForm">
				<table align="center" cellspacing="1" cellpadding="1"	class="tabletitle">
				<tr height="25">
					<td class="formtitle">
						&nbsp;
						<img src="${request.contextPath}/resource/images/dots1.gif"> 
						&nbsp;当前位置：部门列表 
					</td>
				</tr>
				<tr>
					<td valign="top" align="center">
					<table cellpadding=1 cellspacing=1 class="table1"  align=center>
					<tr>
			<td width='25%' colspan=2>
				部门名称或描述	<input type='text' name="depName" id="depName" value="${depName}" size='20' maxlength='25' class='text1' vmode='not null' vdisp='角色名称' vtype='string'>
					<input type="button" class="button1"  value="查询"  onclick="queryDep();"/>
                    <input type="button" class="button1" value="重置" onclick="clearValue();"/>
			</td>
	</tr>
		  </table>
      <table cellspacing="1" cellpadding="1" class="table1">
     <tr><td colspan="4" align="center" >部门列表显示</td></tr>
	     <tr>
	     <th align="center" >&nbsp;</th>
	     <th align="center">组织机构名称</th>
	     <th align="center">组织结构描述</th>
	     <th align="center">操作</th>
	    </tr>
       <#list deptListP.results! as PtTDeptBO>
         <tr>
         <td><input type="checkBox" name="tids" value='${PtTDeptBO.tid }'/></td>
		 <td><a href="${request.contextPath}/dept/dept_getSelf.do?dep.tid=#{PtTDeptBO.tid}" style="text-decoration:none">${PtTDeptBO.deptName}</a></td>
		 <td>${PtTDeptBO.deptDesc}</td>
		 <td><a href="#" onclick="showtable(#{PtTDeptBO.tid})">查看人员</a>
		    <a href="#" onclick="deleteSingle(#{PtTDeptBO.tid})">删除</a>
		 </td>
		 </tr>
         <tr id="tr#{PtTDeptBO.tid}" style="display: none">
      <td colspan="5" align="center">
      <table cellspacing="1" cellpadding="1" class="table1" id="table#{PtTDeptBO.tid}" style="display: none">
         <tr align="center">
          <td align="center">部门编码</td>
           <td align="center">人员名称</td>
           <td align="center">登录名</td>
           <td align="center">登录密码</td>
         </tr>
      </table>
      </td>
      </tr>
      </#list>
      <tr>
        <td colspan="4" align="left"><input type="checkbox" name="cheeck" onclick="checkAll(this.checked);"/>
         <input type="button" class="button1" value="添加" onClick="window.navigate('${request.contextPath}/dept/dept_toAdd.do');">
         <input type="button" class="button1" value="删除" onClick="turnDelete();">
        </td>
      </tr>
      <tr>
        <td  colspan="4">
      <div align="center"> 
	<@showPageField actionAndMethod="depttoList"  pageableList=deptListP  pagebleListName="deptListP" />
	   </div>
	   </td>
	  </tr>
 </table>
 </td>
 </tr>
 </table>
 </form>
</body>
</html>
</#escape>