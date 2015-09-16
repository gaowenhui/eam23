<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="/rdp4j-tags" prefix="r"%>
<%@ taglib uri="/eam2-tags" prefix="e"%>
<%
String path = request.getContextPath();
String serverName = request.getServerName();
  String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
  String erpPath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+"/";
String status="";
String statusjysy="";

%>
<script type="text/javascript">
    var basePathJs = "<%=basePath%>";
    var pathJs = "<%=path%>";
    var erpPathJs = "<%=erpPath%>";
</script>