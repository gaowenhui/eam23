<%@ page language="java" contentType="text/html; charset=utf-8" %> 
<%@ page import="rtx.RTXSvrApi" %> 
<%@ page import="com.tansun.eam2.common.util.RtxPropertiesLoader" %>
<html>  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />   
<script type="text/javascript" src="javascript/global.js"></script>  
<link rel="stylesheet" type="text/css" href="css/style.css">

<%
		String userID = null;
		String sessionKey = null;
		
		//获取门户传过来的登录用户名
		java.util.Enumeration names = request.getHeaderNames();
		  while(names.hasMoreElements())
		  {
		      String name = (String) names.nextElement();
		      System.out.println(name + ":<BR>" + request.getHeader(name) + "<BR><BR>");
			  if (name.equals("iv-user"))
			  {
				userID=request.getHeader(name);
				System.out.println("get user name from portal:" + userID);
			  }
		  }
		  
		if(userID == null){
			System.out.println("cannot get user name from portal!");
		}

		RTXSvrApi RtxsvrapiObj=new RTXSvrApi();
		//获取TRX配置文件信息
		RtxPropertiesLoader loader = RtxPropertiesLoader.getInstance();
		
		//设置服务器ID和端口
		RtxsvrapiObj.setServerIP(loader.getServerIP());
		RtxsvrapiObj.setServerPort(loader.getServerPort());
		
		String ip = RtxsvrapiObj.getServerIP();
				
//		System.out.println(RtxsvrapiObj.getServerIP());
//		System.out.println(RtxsvrapiObj.getServerPort());
		
		//根据用户名从RTX服务器 获取sessionKey  
	    if(RtxsvrapiObj.Init())  
	    {  
//	    	userID = "Xing";
	        sessionKey=RtxsvrapiObj.getSessionKey(userID);  
//	        System.out.println("sessionKey : " + sessionKey);
			if(sessionKey == null){
				System.out.println("sessionKey is null!");
				return;
			}
	        request.setAttribute("loginUser",userID);  
	        request.setAttribute("rtxSessionKey",sessionKey);  
	        RtxsvrapiObj.UnInit();  
	    }
 %> 

</head>  
  
<body onload="RtxSycn();"> 
    <OBJECT classid=clsid:5EEEA87D-160E-4A2D-8427-B6C333FEDA4D id=RTXAX></OBJECT> 
</body> 

</html>

<script language="javascript"> 
function RtxSycn(){ 
   try{ 
       var key="<%=sessionKey%>";           //上面取到的sessionkey 
       var account="<%=userID%>";   //用户登陆名,当然在RTX里面也要有一个一样的用户名 
       var ip="<%=ip%>"; 

      var RTXCRoot = RTXAX.GetObject("KernalRoot");   //客户端SDK 
  
       RTXCRoot.LoginSessionKey(ip,8000,account,key); 

      }catch(e){ 
      } 
      
} 
</script> 