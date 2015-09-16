<%@ page language="java" pageEncoding="UTF-8"%>
<table class='newTable' cellspacing=1 cellpadding=1 width="100%"  height='40px'>
	<tr>
		<td class="td_zxy01" norawp>
			传阅人员：
		</td>
		<td class="td_zxy03">
			<span id='chuanyue_user' style='align: left; width: 100%'></span>
		</td>
	</tr>
</table>
<script>
$.ajax({
    url: '<%=basePath%>/message/userMessage_listMessageByHeadId.do?headid=<%=headId%>',
    
    
    type: 'GET',
    dataType: 'html',
    timeout: 1000,
    error: function(){
        // alert('Error loading XML document');
    },
    success: function(xml){
        document.getElementById("chuanyue_user").innerText=xml.replace("\\r","<br>");
    }
});
 
</script>




