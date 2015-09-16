  <%@page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
  <!-- 附件控件-->
  <object CLASSID='clsid:E020D23A-3F8A-44D0-8E5F-5338817C70E4' id='myword' name='myword' height=1 width=1 codebase='<%=basePath %>ocx/xclient.cab#Version=5,0,0,23'>
  </object>
  <script language="javascript">
  myword.attachEvent( "WordDocClosed",function()   { 
            if('beforeWordSubmit' in window){//在提交之前调用beforeWorkFlowSubmit()
                        if(beforeWordSubmit instanceof Function){
                            beforeWordSubmit();
                        }
           }
      wordUpdate();
  });
 
  </script>