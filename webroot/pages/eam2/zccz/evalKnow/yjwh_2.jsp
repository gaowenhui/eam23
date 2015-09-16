<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/inc/taglibs.inc" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    	<base href="<%=basePath %>"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Untitled Document</title>

<SCRIPT language=JavaScript type=text/JavaScript>
	 function getWidthAndHeigh(resize) {
                var iframeHeight = document.body.clientHeight;
                var iframeWidth = document.body.clientWidth;
                var browser=navigator.appName;
             // chrome
                if (browser == "chrome") {
                        iframeWidth -= 16;
                        iframeHeight -= 85;
                }
                // firefox
                else if (browser == "firefox") {
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
                return {width: iframeWidth, height: iframeHeight};
        }
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
	function displayUpperLayer(index){
		for(var i=0;i<4;i++){
			if(index==i){
			   document.getElementById("upperLayer"+i).style.display="block";
			}else{
			   document.getElementById("upperLayer"+i).style.display="none";
			}
		}
	}
	function showSubimtPage(){
		document.getElementById("subimtPage").style.display="block";
	}
	function cancleSubmit(){
		document.getElementById("subimtPage").style.display="none";

	}
	
	function qianyi(){
	window.showModalDialog("qianyi2.html",window,'status: No;dialogHeight:300px;dialogWidth:500px;dialogTop:200px;dialogLeft:600px');
	}

</SCRIPT>
<style>
	.STYLE1 {
		font-size: 20px;
		font-family: "simsun";
		font-weight: bold;
		color: #0000ff;
	}
</style>

</head>

<body>
<table width="98%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="25" align="center" valign="bottom" class="td06">
		<table width="95%" border="0" cellspacing="3" cellpadding="0">
		  <tr>
			<td width="15"><img src="../../images/index_32.gif" width="9" height="9"></td>
			<td valign="bottom" class="title" align="left">审查知识库维护</td>
			
		  </tr>
		</table>
	</td>
  </tr>
</table>

 <table class="newtable" width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
   <tr>
     <td  width="11%" class="td_form01">审批项目：</td>
     <td   class="td_form02">
       <select name="select3">
         <option> </option>
         <option> 标 题及文号 </option>
         <option> 评估对象及范围 </option>
       </select></td>
     <td width="11%" class="td_form01">审查要点：</td>
     <td   class="td_form02">
       <select name="select2">
         <option> </option>
         <option> 报告编号不规范 </option>
         <option> 报告资产名称错误 </option>
       </select>     </td>
   </tr>
   <tr>
     <td colspan="6" class="td_form02"><div align="right">
       <input name="Submit222" type="submit"  value="  查询  "  />
       <input name="Submit32" type="submit"   value="  重置  " />
     </div></td>
   </tr>
 </table>
 <br>

 <!--<table width="95%" border="0" cellspacing="0" cellpadding="0"  align="center">
   <tr>
     <td colspan="3" align="left"><input name="button" type="button"  class="buttonface02" onclick="javascript:window.open('tianjia.html','','','')" value="添加一级分类" />
       &nbsp;
       <input name="button" type="button"  class="buttonface02" onclick="javascript:window.open('tianjia2.html','','','')" value="添加二级分类" />
       &nbsp;
       <input name="button" type="button"  class="buttonface02" onclick="javascript:window.open('whsp.html','','','')" value="维护审批">     </td>
     <td colspan="5" align="right"><input name="button" type="button" class="buttonface02" value="批量删除具体意见" />
       &nbsp;
       <input name="button3" type="button"  class="buttonface02" onclick="qianyi()" value="迁移具体意见" />       &nbsp; </td>
   </tr>
   <tr>
     <td class="td_top" align="center" >选择</td>
     <td class="td_top" align="center" >审查项目</td>
     <td class="td_top" align="center" >审查要点</td>
     <td class="td_top" align="center"  >具体意见</td>
     <td class="td_top" align="center"  >标 题</td>
     <td class="td_top" align="center"  >审核状态</td>
     <td class="td_top" align="center"  >操作</td>
   </tr>
   <tr >
     <td class="td_01" align="center"  ><input name="checkbox" type="checkbox" id="checkbox2" />     </td>
     <td class="td_01" align="center"  >标 题及文号</td>
     <td class="td_01" align="center"  >报告名称、格式不规范</td>
     <td class="td_01" align="center"  ><a href="#"  onclick="javascript:window.open('jtyj.html','','','')">查看意见</a></td>
     <td class="td_01" align="center"  >广东茂名百花大厦资产评估报告</td>
     <td class="td_01" align="center"  >已审核</td>
     <td class="td_01" align="center"  ><a href="#" onclick="window.open('update.html','','')">修改</a> &nbsp; <a href="#" onclick="javascript:openwindow('delete1.html','','','')">删除</a> </td>
   </tr>
   <tr >
     <td class="td_01" align="center"  ><input name="checkbox" type="checkbox" id="checkbox2" />     </td>
     <td class="td_01" align="center"  >&nbsp;</td>
     <td class="td_01" align="center"  >报告编号不规范</td>
     <td class="td_01" align="center"  ><a href="#"  onclick="javascript:window.open('jtyj.html','','','')">查看意见</a></td>
     <td class="td_01" align="center"  >河北省沧州市平景儒宿舍房地产估价报告</td>
     <td class="td_01" align="center"  >已审核</td>
     <td class="td_01" align="center"  ><a href="#" onclick="window.open('update1.html','','')">修改</a> &nbsp; <a href="#" onclick="javascript:window.open('delete2.html','',750,300)">删除</a> </td>
   </tr>
   <tr >
     <td class="td_01" align="center"  ><input name="checkbox" type="checkbox" id="checkbox2" />     </td>
     <td class="td_01" align="center"  >&nbsp;</td>
     <td class="td_01" align="center"  >&nbsp;</td>
     <td class="td_01" align="center"  ><a href="#"  onclick="javascript:window.open('jtyj.html','','','')">查看意见</a></td>
     <td class="td_01" align="center"  >内蒙古通辽市扎鲁特旗营业楼等七处房产资产评估报告</td>
     <td class="td_01" align="center"  >未审核</td>
     <td class="td_01" align="center"  ><a href="#" onclick="window.open('update3.html','','')">修改</a> &nbsp; <a href="#" onclick="javascript:window.open('delete3.html','','','')">删除</a> </td>
   </tr>
   <tr >
     <td class="td_01" align="center"  ><input name="checkbox" type="checkbox" id="checkbox2" />     </td>
     <td class="td_01" align="center"  >&nbsp;</td>
     <td class="td_01" align="center"  >报告资产名称错误</td>
     <td class="td_01" align="center"  ><a href="#"  onclick="javascript:window.open('jtyj.html','','','')">查看意见</a></td>
     <td class="td_01" align="center"  >内蒙古通辽市开鲁镇开鲁行营业楼资产报告</td>
     <td class="td_01" align="center"  >审核中</td>
     <td class="td_01" align="center"  ><a href="#" onclick="window.open('update1.html','','')">修改</a> &nbsp; <a href="#" onclick="window.open('delete2.html','','')">删除</a> </td>
   </tr>
   <tr >
     <td class="td_01" align="center"  ><input name="checkbox" type="checkbox" id="checkbox2" />     </td>
     <td class="td_01" align="center"  >内容及格式</td>
     <td class="td_01" align="center"  >报告名称、格式不规范</td>
     <td class="td_01" align="center"  ><a href="#"  onclick="javascript:window.open('jtyj.html','','','')">查看意见</a></td>
     <td class="td_01" align="center"  >河北省沧州市平景儒宿舍房地产估价报告</td>
     <td class="td_01" align="center"  >已审核</td>
     <td class="td_01" align="center"  ><a href="#" onclick="window.open('update.html','','')">修改</a> &nbsp; <a href="#" onclick="window.open('delete1.html','','','')">删除</a> </td>
   </tr>
 </table>-->
 <br  />
 <table width="95%" border="0" cellspacing="0" cellpadding="0"  align="center">
 <tr>
 	<td colspan="3" align="left">
		<input type="button"  class="buttonface02" value="添加一级分类" onClick="javascript:window.open('tianjia.html','','','')">&nbsp;
 		<input type="button"  class="buttonface02" value="添加二级分类" onClick="javascript:window.open('tianjia2.html','','','')">&nbsp;</td>
  	<td colspan="5" align="right"><input name="button32" type="button"  class="buttonface02" onclick="qianyi()" value="迁移具体意见" />
  	  <input name="button2" type="button" class="buttonface02" value="删除" />
  	  &nbsp;
		<input type="button"  class="buttonface02" value="修改" onClick="window.open('update.html','','','')">&nbsp;  </td> 
 </tr></table>
  <table width="95%"  border="0" cellpadding="0" cellspacing="0" class="table02" align="center">
   <tr >

 		 <td colspan="7"  class="td_01"  > <table id="test"  align="right" width="95%"></table></td>
   </tr>
</table> 
 <table width="95%"  border="0" cellpadding="0" cellspacing="0" class="table02" align="center">
   <tr>
     <td height="30" align="right"><img src="../../images/1.gif" width="4" height="5" align="absmiddle"> 首页　 <img src="../../images/2.gif" width="3" height="5" align="absmiddle"> 上一页　 <img src="../../images/2-2.gif" width="3" height="5" align="absmiddle"> 下一页　 <img src="../../images/3.gif" width="4" height="5" align="absmiddle"> 末页　　共 1000 条记录 本页显示第1~10条 第1页/共100页 
       跳转到
       <input name="pageNum" type="text" style="width:20px">
       页</td>
   </tr>
 </table>
<br />
<!--
 <table width="95%" border="0" cellspacing="0" cellpadding="0"  align="center">
 <tr>
 	<td  align="left">
 <table id="test"  align="right" width="95%"></table>
 </td></tr></table>-->
</body>
</html>
<script>
		$(function(){
			$('#test').treegrid({
			   
				title:'审查信息',
				iconCls:'icon-save',
				nowrap: false,
				rownumbers: true,
				autowidth:true,
				animate:true,
				collapsible:true,
				url:'treegrid_data.json',
				idField:'project',
				treeField:'project',
				frozenColumns:[[
					{field:'ck',checkbox:true},
	                {title:'审查项目及要点',field:'project',width:220}
				]],
				columns:[[
					{field:'addr',title:'具体意见',width:1102 }
				]],
				onBeforeLoad:function(row,param){
					if (row){
						$(this).treegrid('options').url = 'treegrid_subdata.json';
					} else {
						$(this).treegrid('options').url = 'treegrid_data.json';
					}
				}
			});
		});
		
					$(window).bind('resize', function() {  
						// resize the datagrid to fit the page properly: 
						var size = getWidthAndHeigh(true);
						jQuery("#test").treegrid('resize',size.width * 0.95); 
						
					}); 
	</script>