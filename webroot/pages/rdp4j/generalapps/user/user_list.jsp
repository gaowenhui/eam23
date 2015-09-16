<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ include file="/inc/header-standard.inc"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>用户列表</title>
		<script type="text/javascript" src="/rdp4j/resource/js/validate.js"></script>
		<script type="text/javascript">
       function checkAll(val){
		var arr = document.getElementsByName("tids");
		for (i=0;i<arr.length;i++){
			arr(i).checked = val;
		}
	}

	function turnDelete(){
        myForm.action="<%=request.getContextPath()%>/users/users_delete.do";
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
	
	function openDep(){
	//在树上展示显现出来该人员属于哪些部门 对所属部门用check选中的状态
	//用ajax
	  myForm.action="<%=request.getContextPath()%>/users/users_getUserInDepId.do";
	}
	function queryUser(){
	  var userName=document.getElementById("userName").value;
	  myForm.action="<%=request.getContextPath()%>/users/users_getQueryUser.do?userName"+userName;
	  myForm.submit();
	  document.getElementById("userName").value=userName;
	}
	function clearValue(){
	   document.getElementById("userName").value="";
	    myForm.action="<%=request.getContextPath()%>/users/users_toList.do";
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
		alert("delete tr");
    }
   var myRequest;
   function  myAjax(tid){
    myRequest=new ActiveXObject("Msxml2.XMLHTTP");
    myRequest.onreadystatechange=ajaxExe;
    myRequest.open('post','<%=request.getContextPath()%>/dept/dept_getDeptByUserId.do?user.tid='+tid,true);
    myRequest.send(null);
   }
  function ajaxExe(){ 
   if(myRequest.readyState==4){
      var str=myRequest.responseText;
      var temp=eval("("+str+")");
      //表格添加
       for(i=0;i<temp.length;i++){
        var tr=document.all("table"+temp[i].userId).insertRow();
        tr.align="center";
        var c0=tr.insertCell();
        var c1=tr.insertCell();
        var c2=tr.insertCell();
        var c3=tr.insertCell();
        c0.innerText=""+temp[i].userId;
        c1.innerText=""+temp[i].deptId;
        c2.innerText=""+temp[i].deptName;
        c3.innerText=""+temp[i].deptDesc;
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
   
   function turnPage(tid){
     myForm.action="<%=request.getContextPath()%>/users/users_listDept.do?us.tid="+tid;
	 myForm.submit();
   
   }
</script>
	</head>
	<body class='body1'>
		<form id="myForm" name="myForm" method="post" action="">
			<table align="center" cellspacing="1" cellpadding="1"
				class="tabletitle">
				<tr height="25">
					<td class="formtitle">
						&nbsp;
						<img src="<%=request.getContextPath()%>/resource/images/dots1.gif">
						&nbsp;当前位置：用户列表
					</td>
				</tr>
				<tr>
					<td valign="top" align="center">
						<table cellpadding=1 cellspacing=1 class="table1" align=center>
							<tr>
								<td width='25%' colspan=2>
									用户姓名
									<input type='text' name="userName" id="userName"
										value="${userName}" size='20' maxlength='25' class='text1'
										vmode='not null' vdisp='角色名称' vtype='string'>
									<input type="button" class="button1" value="查询"
										onclick="queryUser();" />
									<input type="button" class="button1" value="重置"
										onclick="clearValue();" />
								</td>
							</tr>
						</table>
						<table cellpadding=1 cellspacing=1 class="table1" align=center>
							<tr>
								<th align="center">
									<input type="checkbox" name="cheeck"
										onclick="checkAll(this.checked);" />
									全选
								</th>
								<th align="center">
									序号
								</th>
								<th>
									<a href="#"
										onclick="gosort('${pagebleListName}.paginator.currentPage','${userListP.paginator.currentPage}','DESC','loginId')"><img
											src='<%=request.getContextPath()%>/resource/images/arrow-up.gif'
											border='0' /> </a> 登录名
									<a href="#"
										onclick="gosort('${pagebleListName}.paginator.currentPage','${userListP.paginator.currentPage}','ASC','loginId')"><img
											src='<%=request.getContextPath()%>/resource/images/arrow-down.gif'
											border='0' /> </a>
								</th>
								<th>
									<a href="#"
										onclick="gosort('${pagebleListName}.paginator.currentPage','${userListP.paginator.currentPage}','DESC','username')"><img
											src='<%=request.getContextPath()%>/resource/images/arrow-up.gif'
											border='0' /> </a> 用户姓名
									<a href="#"
										onclick="gosort('${pagebleListName}.paginator.currentPage','${userListP.paginator.currentPage}','ASC','username')"><img
											src='<%=request.getContextPath()%>/resource/images/arrow-down.gif'
											border='0' /> </a>
								</th>
								<th>
									<a href="#"
										onclick="gosort('${pagebleListName}.paginator.currentPage','${userListP.paginator.currentPage}','DESC','statusCd')"><img
											src='<%=request.getContextPath()%>/resource/images/arrow-up.gif' border='0' /> </a> 休假状态
									<a href="#"
										onclick="gosort('${pagebleListName}.paginator.currentPage','${userListP.paginator.currentPage}','ASC','statusCd')"><img
											src='<%=request.getContextPath()%>/resource/images/arrow-down.gif' border='0' /> </a>
								</th>
								<th align="center">
									操作
								</th>
							</tr>
							<s:iterator value="userListP.results" status="st" id="list">
								<s:iterator value="#list" status="ll" id="user">
									<tr>
										<td align="center">
											<input type="checkBox" name="tids"
												value="<s:property value="#user.tid" />" />
										</td>
										<td align="center">
											<s:property value="#st.count" />
										</td>
										<td align="center">
											<a
												href="<%=request.getContextPath()%>/users/users_toUpdate.do?us.tid=<s:property value='#user.tid'/>"
												style="text-decoration: none"><s:property
													value="#user.loginId" /> </a>
										</td>

										<td align="center">
											<s:property value="#user.username" />
										</td>
										<td align="center">
											<s:if test="#user.statusCd=='041001'">
		                                            正常
		                                      </s:if>
											<s:elseif test="#user.statusCd=='041002'">
												<font color="red">禁用</font>
											</s:elseif>
											<s:elseif test="#user.statusCd=='041003'">
												<font color="red">休假</font>
											</s:elseif>
										</td>
										<td align="center">
											<a
												href="<%=request.getContextPath()%>/users/users_toUpdate.do?us.tid=<s:property value='#user.tid' />">编辑</a>
											<a
												href="<%=request.getContextPath()%>/users/userRole_edit.do?tid=<s:property value='#user.tid' />">查看角色</a>
											<a href="javascript:void(0);"
												onclick="turnPage(<s:property value='#user.tid'/>)">查看部门</a>
											<a
												href="<%=request.getContextPath()%>/users/users_deleteOne.do?us.tid=<s:property value='#user.tid'/>">删除</a>
										</td>
									</tr>
									<tr id="tr<s:property value='#user.tid' />"
										style="display: none">
										<td colspan="6" align="center">
											<table cellspacing="1" cellpadding="1" class="table1"
												id="table<s:property value='#user.tid'/>"
												style="display: none">
												<tr align="center">
													<td align="center">
														用户ID
													</td>
													<td align="center">
														部门ID
													</td>
													<td align="center">
														组织部门名称
													</td>
													<td align="center">
														组织机构描述
													</td>
												</tr>
											</table>
										</td>
									</tr>
								</s:iterator>
							</s:iterator>
							<tr>
								<td colspan="6">
									<input type="button" class="button1" value="添加"
										onClick="window.navigate('<%=request.getContextPath()%>/users/users_toAdd.do');">
									<input type="button" class="button1" value="删除"
										onClick="turnDelete();">
								</td>
							</tr>
							<tr>
								<td colspan="6" align="left">
									<div>
										<r:pages pageno="${userListP.paginator.currentPage}"
											total="${userListP.paginator.pageCount}" style="table1"
											listname="userListP" />
									</div>
								</td>
							</tr>
						</table>
					</td>
			</table>
		</form>
	</body>
</html>