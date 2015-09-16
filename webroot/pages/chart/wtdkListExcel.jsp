<%
/**
 * COPYRIGHT (C) 2011 TANSUN. ALL RIGHTS RESERVED.
 *
 * No part of this publication may be reproduced, stored in a retrieval system,
 * or transmitted, on any form or by any means, electronic, mechanical, photocopying,
 * recording, or otherwise, without the prior written permission of TANSUN.
 *
 * Created By: ZCX	
 * Created On: 2011-01-26
 *
 * Amendment History:
 *
 * Amended By       Amended On      Amendment Description
 * ------------     -----------     ---------------------------------------------
 *
 */
%>

<%@ page contentType="text/html; charset=GBK"%>
<%@ include file="../common/common.jsp"%>
<%
	response.setContentType("application/vnd.ms-excel; charset=GBK");
	response.setHeader("Content-Disposition", "attachment; filename=CURRENT_PROJECT_LIST.xls");
%>
<html:html>
<head>
	<title> Ա��һ�� </title>
	<meta http-equiv="Content-Type" content="text/html; charset=GBK">
 </head>
<body onload="refreshSelection(); ProjectListForm.onkeypress=onFormKeyPress;">

<html:form action="/UserManageAction.do" >

    <table width="100%"  border="1"  cellpadding="0" cellspacing="0" bordercolor="#CCCCCC" id="editTable">
    <tr bgcolor="#FBFEED" name="headDefine">
      <td width="100%" align="center" valign="middle" height="45" colspan="9"><font size="5"><b>Ա��һ��
        <logic:present name="message" scope="request">
			      <bean:write name="message"/>
	    </logic:present>
  			  </b></font>
  	  </td>
    </tr> 
        <tr height="30" align="center" valign="middle" bgcolor="#E7EFFF">
            <th nowrap>Ա�����</th>
            <th nowrap>Ա������</th>
            <th nowrap>Ա���Ա�</th>
            <th nowrap>�ֻ�����</th>
            <th nowrap>���ڲ���</th>
            <th nowrap>Ա��״̬</th>
        </tr>
        <logic:present name="ManageForm" property="userList">
            <logic:iterate name="ManageForm" property="userList" id="element" indexId="ind">
                <tr>
                    <td align="center">
                        <logic:notEmpty name="element" property="staffCode">
                                <bean:write name="element" property="staffCode"/>
                        </logic:notEmpty>
                        <logic:empty name="element" property="staffCode">
                            &nbsp;
                        </logic:empty>
                    </td>
                    <td align="center">
                        <logic:notEmpty name="element" property="staffName">
                            <bean:write name="element" property="staffName"/>
                        </logic:notEmpty>
                        <logic:empty name="element" property="staffName">
                            &nbsp;
                        </logic:empty>
                    </td>
                    <td align="center">
                         <logic:notEmpty name="element" property="gender">
                             <logic:equal name="element" property="gender" value="1">
                                 ��
                            </logic:equal>
                            <logic:equal name="element" property="gender" value="2">
                                 Ů
                            </logic:equal>
                        </logic:notEmpty>
                        <logic:empty name="element" property="gender">
                            &nbsp;
                        </logic:empty>
                    </td>
                    
                    
                    <td align="center"><font size="2"><logic:notEmpty name="element" property="mobile"><bean:write name="element" property="mobile"/></logic:notEmpty></font></td>
                    
                    <td align="center">
                        <logic:notEmpty name="element" property	="unitName">
                            	<bean:write name="element" property="unitName"/>
                        </logic:notEmpty>
                        <logic:empty name="element" property="unitName">
                            &nbsp;
                        </logic:empty>
                    </td>
                    <td align="center">
                         <logic:notEmpty name="element" property="cuworkStatus">
                          <logic:equal name="element" property="cuworkStatus" value="1">
                                ��ְ
                            </logic:equal>
                            <logic:equal name="element" property="cuworkStatus" value="2">
                                 ���
                            </logic:equal>
                              <logic:equal name="element" property="cuworkStatus" value="3">
                                 ��ְ
                            </logic:equal>
                        </logic:notEmpty>
                        <logic:empty name="element" property="cuworkStatus">
                            &nbsp;
                        </logic:empty>
                    </td>
                </tr>
            </logic:iterate>
        </logic:present>
    </table>
</html:form>
</body>

</html:html>