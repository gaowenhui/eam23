<%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
<%@ include file="/inc/taglibs.inc"%>
<%@ taglib uri="/struts-tags" prefix="s" %>

<%@ include file="/inc/ProjectJQuery.inc"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html>
<head>

<title>例子页面</title>
<SCRIPT type=text/JavaScript>
		    
</SCRIPT>

</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">



<% request.setAttribute("code", "huiqian"); %>
<% request.setAttribute("userid", "16390"); %>
<% request.setAttribute("parentId", "438"); %>
	取CODE表中的数据：<e:select parRefKey="ENTITY_TRADE" list="#{}" name="head.jhcd" id="jhcd" value="3"/>
	取P_T_REFERENCE表中的数据：
	用户ID转用户名：<r:user userId="#request.userid"/>
	部门ID转部门名：<r:dept deptId="11315"/>
	
	单个文件上传  isSingle=Y  默认多个文件上传
<e:filebutton fjlx="single" biaodanId="333" isview="Y"  isSingle="Y"/>
    <e:vc id="iddd" codeKey="2" codeType="ENTITY_TRADE" />

根据处理单编号取会签中正在办理的部门，办理完成的部门 
isJianTou 是否是建投会签 Y：是 N：否
biaodanId 处理单编号
<e:countersign biaodanId="%{#request.biaodanid}" isJianTou="N" />
当前用户名称： <r:userhidden/>
当前用户部门下拉：<r:deptselect/>

  <r:userhidden  view="N" />默认 userid
       Y <r:userhidden id="自定义ID" name="自定义NAME" style="style='width:30px'" view="Y" />
       N <r:userhidden id="只自定义IDNAME=ID" view="N" /> 
       N <r:userhidden name="只自定义NAME,ID=NAME名称" view="N" />
       view =N      ： 用户ID的HIDDEN
       view =Y      :  用户NAME的TEXT
       
       
       	<r:depthidden  view="N" />默认 deptid
       Y <r:depthidden id="自定义ID" name="自定义NAME" style="style='width:100px'" view="Y" />
       N <r:depthidden id="只自定义IDNAME=ID" view="N" /> 
       N <r:depthidden name="只自定义NAME,ID=NAME名称" view="N" />  
       
       
	<e:select parRefKey="ENTITY_TRADE" parentId="#request.parentId" list="#{}" name="head.jhcd" id="jhcd" value="3"/><br>
	<table>
		<tr>
			<td valign="top">
				取individualtree表中的数据：<e:itree imagePath="/resource/js/DHtmlXTree/imgs" width="100%" height="100%" multipe="true" threeState="true"  treetype="department" nodevalue="2" id="dddd" skin="csh_vista" style="width:200;height:200"></e:itree>
				<e:itree imagePath="/resource/js/DHtmlXTree/imgs" width="100%" height="100%" multipe="true" threeState="true" dataUrl="/deptData.jspa?tid=1&parid=0" id="dddd" skin="csh_vista" style="width:200;height:200"></e:itree>
			</td>
			<td  style="padding-left:25" valign="top">
			
			Two state checkboxes<br><br>
			<a href="javascript:void(0);" onClick="ddddTree.setCheck(ddddTree.getSelectedItemId(),true);">Check item</a><br><br>
			<a href="javascript:void(0);" onClick="ddddTree.setCheck(ddddTree.getSelectedItemId(),false);">UnCheck item</a><br><br>
			<a href="javascript:void(0);" onClick="ddddTree.setSubChecked(ddddTree.getSelectedItemId(),true);">Check branch</a><br><br>
			<a href="javascript:void(0);" onClick="ddddTree.setSubChecked(ddddTree.getSelectedItemId(),false);">UnCheck branch</a><br><br>
			
			<a href="javascript:void(0);" onClick="alert(ddddTree.getAllChecked());">Get list of checked</a><br><br>
			<a href="javascript:void(0);" onClick="alert(ddddTree.getSelectedItemText());">Get list of selected</a><br><br>
			</td>
			<td valign="top">
			取individualtree表中的数据：<e:itree imagePath="/resource/js/DHtmlXTree/imgs" width="100%" height="100%" multipe="true" threeState="false"  treetype="%{#request.code}" id="ddd" skin="csh_vista" style="width:200;height:200"></e:itree>
			</td>
		</tr>
	</table>	
</body>
</html>