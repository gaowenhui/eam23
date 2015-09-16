<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<%@ include file="/inc/ProjectJQuery.inc"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>

<title>例子页面</title>
<SCRIPT type=text/JavaScript>
     function openGzlxd(){
         //wordTempKey,form,readOnly,isOpenFile, wordFileName
       wordTemplate('bank_Template', document.getElementById("MyForm"),false,true, "测试word合并");
    }
     function openGzlxdht(){
         //wordTempKey,form,readOnly,isOpenFile, wordFileName
       MergeWordStart('manager_gzlxdht','bank_Template','manager_gzlxdbj' , document.getElementById("MyForm"), "测试word合并",'testHead()','testBottom()');
    }
	function testHead(){
		MyRangeHead.find.execute("￥￥TITLE",false,false,false,false,false,true,false,false,"标题",2,false,false,false,false);
	}
	function testBottom(){
		MyRangeBottom.find.execute("￥￥NGBM",false,false,false,false,false,true,false,false,"拟稿部门",2,false,false,false,false);
	}
    function gzlxdReplaceWord(){
        var ytwh=document.forms[0].elements["title"].value;
       var ytwh=document.forms[0].elements["ngbm"].value;
       var jbwh=document.forms[0].elements["spbh"].value;
       var yxwh=document.forms[0].elements["blbm"].value;
       document.all.myword.WordSetField("TITLE",ytwh);
       document.all.myword.WordSetField("NGBM",jbwh);
       document.all.myword.WordSetField("SPBH",yxwh);
       document.all.myword.WordSetField("BLBM",yxwh);
       return false;
    }
</SCRIPT>

</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
        <%@ include file="/inc/word.inc"%>
	<a href="#"  onClick="openGzlxd();">打开word</a><br><br><a href="#"  onClick="openGzlxdht();">套红头</a>
	<form id="MyForm" name="MyForm" action="/eam2/fileupload.jsp"  enctype="multipart/form-data" method="post">
	<input type="file" name="file1"/><br/>
	<input name="MyForm:createdate" type="text" value="2010-11-26" />
	 <input type="hidden" name="jsessionid" value="<%=request.getRequestedSessionId() %>"/>
	 <input name="MyForm:id" type="text" value="111" />
	 
	<input name="biaodanid" type="text" value="111" />
	<input name="title" type="text" value="标题" />
	<input name="ngbm" type="text" value="拟稿部门" />
	<input name="spbh" type="text" value="审批编号" />
	<input name="blbm" type="text" value="办理部门" />
	<input name="userid" type="text" value="80" />
	<input name="deptid" type="text" value="80" />
	
	<input name="MyForm:temp" type="text" value="cheapGoodsStock_table" />
	<input name="MyForm:appdepartment" type="text" value="appdepartment" />
	<input name="MyForm:appperson" type="text" value="appperson" />
	<input name="MyForm:signdate" type="text" value="2010-11-26" />
	<input name="MyForm:apppersonphone" type="text" value="apppersonphone"/>
	<input name="MyForm:urgency_gen" type="text" value="urgency_gen"/>
	<input name="MyForm:ytjxq" type="text" value="ytjxq"/>
	<input name="MyForm:jbrr" type="text" value="jbrr"/>
	<input name="MyForm:ytjxqrq" type="text" value="2010-11-26"/>
	<input type="submit" value="Upload File"><br>
	</form>
</body>
</html>



