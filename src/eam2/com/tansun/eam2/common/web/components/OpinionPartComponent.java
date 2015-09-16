package com.tansun.eam2.common.web.components;

import java.io.IOException;
import java.io.Writer;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.opensymphony.xwork2.util.ValueStack;
import com.tansun.eam2.common.ucc.ICommonOpinionUcc;
import com.tansun.rdp4j.common.model.orm.PublicDao;
import com.tansun.rdp4j.common.model.orm.bo.PTDeptBO;
import com.tansun.rdp4j.common.util.DateUtils;
import com.tansun.rdp4j.common.util.UserThreadLocal;
import com.tansun.rdp4j.common.util.ucc.CommonGlobal;
import com.tansun.rdp4j.generalapps.dept.ucc.IDeptUCC;
import com.tansun.rdp4j.generalapps.util.UserCache;
import com.tansun.rdp4j.workflow.common.model.PTCommonOpinionBO;
import java.util.Map;

public class OpinionPartComponent extends OpinionComponent {
	private String renderType;
	private String text;
	private String name;
	private String value;
	private String headid;
	private ValueStack stack;
	private String colspan;
	private String cols;
	private String rows;
	private String yjlx;
	private String leftTdStyle;
	private boolean isViewArea;
	
	public static final String ERP_RESULT = "ERP_RESULT";
	public static final String LEADER = "LEADER";
	public static final String OPERATION_GROUP = "OPERATION_GROUP";
	public static final String HANDLE_DEPT = "HANDLE_DEPT";
	public static final String MEETING_DEPT = "MEETING_DEPT";
	public static final String MEETING = "MEETING";
	public static final String DRAFT_DEPT = "DRAFT_DEPT";
	public static final String CHECK_DEPT = "CHECK_DEPT";
	public static final String ACCOUNT_DEPT = "ACCOUNT_DEPT";
	public static final String AGENT_DEPT = "AGENT_DEPT";
	public static final String WORK_DEPT = "WORK_DEPT";
	public static final String AGENT_MANAGE_DEPT = "AGENT_MANAGE_DEPT";
	public static final String WORK_MANAGE_DEPT = "WORK_MANAGE_DEPT";
	public static final String COMPERE = "COMPERE";
	public static final String SECRATARY = "SECRATARY";
	public static final String SUMMARY_SUGGEST = "SUMMARY_SUGGEST";
	public static final String APPROVEMENT = "APPROVEMENT";
	public static final String CHECK = "CHECK";
	public static final String HQZZ = "HQZZ";
	public static final String HQTH = "HQTH";
	public static final String DEPT_LEADER = "DEPT_LEADER";
    public static final String CHECK_DEPT_MODIFY = "CHECK_DEPT_MODIFY";
    public static final String AGENT_MEETING_DEPT ="AGENT_MEETING_DEPT";
	public static final String BLYJ_ZZYJ = "BLYJ_ZZYJ";
	public static final String BLYJ_GCYJ = "BLYJ_GCYJ";
	public static final String BLYJ_THYJ = "BLYJ_THYJ";
	public static final String REMARK = "REMARK";
	private HttpServletRequest request;
	private PTCommonOpinionBO temp;
	private StringBuffer table;
	public boolean isViewArea() {
		return isViewArea;
	}

	public void setViewArea(boolean isViewArea) {
		this.isViewArea = isViewArea;
	}

	public IDeptUCC getDeptUCCimpl() {
		return (IDeptUCC)WebApplicationContextUtils.getRequiredWebApplicationContext(request.getSession().getServletContext()).getBean("deptUCCimpl");
	}

	public ICommonOpinionUcc getCommonOpinionUcc() {
		return (ICommonOpinionUcc)WebApplicationContextUtils.getRequiredWebApplicationContext(request.getSession().getServletContext()).getBean("commonOpinionUcc");
	}

    public PublicDao getPublicDao(){
       return (PublicDao)WebApplicationContextUtils.getRequiredWebApplicationContext(request.getSession().getServletContext()).getBean("publicDao");
    }

	public OpinionPartComponent(ValueStack stack, HttpServletRequest req) {
		super(stack, req);
		this.request = req;
		this.stack = stack;
	}

	public boolean start(Writer writer) {
		boolean result = true;// 注意不能super.
		try {
			writer.write("<tr>");
			writer.write(getTextArea());
			table = genarateTable();
			writer.write(getTextAreaTd());
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	@Override
	public boolean end(Writer writer, String body) {
		try {
			writer.write(table.toString() + "</td>");
			writer.write("</tr>");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return true;
	}


	private String getTextArea() {
		StringBuffer sb = new StringBuffer();
		String leftTd = "td_zxy01";
		if(leftTdStyle != null && leftTdStyle.length() > 0)
			leftTd = leftTdStyle;
		sb.append("<td class=\"" + leftTd + "\" height=\"30\">" + text + "</td>").append("\n");
		return sb.toString();
	}
	
	private String getTextAreaTd() {
		StringBuffer sb = new StringBuffer();
		String rightTd = "td_zxy03";
		if(getStyle() != null && getStyle().length() > 0)
			rightTd = leftTdStyle;
		sb.append("<td class=\"" + rightTd + "\">" + findRenderType()).append("\n");
		return sb.toString();
	}
	
	/**
    byte OPINION_YJLX_NORMAL = -1; //无意见
	byte OPINION_YJLX_DISAGREE = 0; //不同意
    byte OPINION_YJLX_AGREE = 1; // 同意
    byte OPINION_YJLX_BACK = 2; // 退回
    byte OPINION_YJLX_NOIDEAR = 3; //最终意见
	 * @return
     * @deprecated
	 */
	private String getRadioBox(){
		StringBuffer sb = new StringBuffer();
		if(yjlx != null && yjlx.length() > 0)
			if ("disable".equals(renderType)){
				
			}else if("normal".equals(renderType)){
				if(yjlx.contains("0"))
					sb.append("&nbsp;<input type=\"radio\" name=\"" + name + "Radio\" value=\"-1\"/>").append("同意附意见");
				if(yjlx.contains("1"))
					sb.append("&nbsp;<input type=\"radio\" name=\"" + name + "Radio\" value=\"-1\"/>").append("无意见");
				if(yjlx.contains("2"))
					sb.append("&nbsp;<input type=\"radio\" name=\"" + name + "Radio\" value=\"0\"/>").append("不同意");
				if(yjlx.contains("3"))
					sb.append("&nbsp;<input type=\"radio\" name=\"" + name + "Radio\" value=\"1\"/>").append("同意");
				if(yjlx.contains("4"))
					sb.append("&nbsp;<input type=\"radio\" name=\"" + name + "Radio\" value=\"2\" />").append("退回意见");
				if(yjlx.contains("5"))
					sb.append("&nbsp;<input type=\"radio\" name=\"" + name + "Radio\" value=\"2\" />").append("过程意见");
				if(yjlx.contains("6"))
					sb.append("&nbsp;<input type=\"radio\" name=\"" + name + "Radio\" value=\"3\" />").append("最终意见");
				sb.append("<br>\n");
			}
		return sb.toString();
	}
	
	/**
	 * 根据id到，表单权限中，设置好，并放到ValueStack中的类型处理。
    byte OPINION_YJYLX_DRAFT_DEPT = 0; //拟稿部门意见
    byte OPINION_YJYLX_MEETING_DEPT = 1; //返回到主表单上的会签部门意见
    byte OPINION_YJYLX_MEETING = 2; //会签过程中的意见
    byte OPINION_YJYLX_OPERATION_GROUP = 3;// 业务运营组意见
    byte OPINION_YJYLX_ERP_RESULT = 4;// ERP处理结果
    byte OPINION_YJYLX_LEADER = 5;// 批示意见
    byte OPINION_YJYLX_HANDLE_DEPT = 6;//办理部门意见
    byte OPINION_YJYLX_HQZZ = 7; //会签最终意见域
    byte OPINION_YJYLX_HQTH = 8; //会签退回意见域
	 * @return
	 */
	private String findRenderType(){
		StringBuffer sb = new StringBuffer();
		renderType = getRenderType();
        boolean isAuth = getAuthByRoleId(UserThreadLocal.get().getUserTid().toString());
		if(!MEETING_DEPT.equals(name) && isAuth && isViewArea()){
			String contentNr = "";
			if(temp != null && temp.getYjnr() != null)
				contentNr = temp.getYjnr();
			if ("normal".equals(renderType)) {
				sb.append("<textarea id=\"" + getId() + "\" name=\"" + name + "\" style=\"width:94%;\" rows=\"" + (rows != null ? rows : "4") + "\" >" + contentNr + "</textarea><br>").append("\n");
			} else if ("disable".equals(renderType)) {
				sb.append("&nbsp;");
			} else if ("readonly".equals(renderType)) {
				sb.append("<textarea id=\"" + getId() + "\" name=\"" + name + "\" style=\"width:94%;\" rows=\"" + (rows != null ? rows : "4") + "\" readonly=\"readonly\">" + contentNr + "</textarea><br>").append("\n");
			}else{
				sb.append("<textarea id=\"" + getId() + "\" name=\"" + name + "\" style=\"width:94%;\" rows=\"" + (rows != null ? rows : "4") + "\" >" + contentNr + "</textarea><br>").append("\n");
			}
		}else{
			sb.append("&nbsp;");
		}
		return sb.toString();
	}

    private String getSubDepts(){
        String deptids = getDeptid();
        String depttids = "";
        if(deptids != null && deptids.length() > 0){
           deptids = deptids.replace(",", "','");
           deptids = "'" + deptids + "'";
           depttids = deptids + ",";
           List<Map<String, Object>> list = getPublicDao().queryForList(" select t.tid from p_t_dept t where t.par_id in (" + deptids + ") ", new String[]{});
           if(list != null && list.size() > 0){
               for (int i = 0; i < list.size(); i++) {
                   Map<String, Object> map = list.get(i);
                   depttids += "'" + map.get("tid");
                   if(i < list.size() - 1){
                       depttids += "',";
                   }
               }
           }
           depttids += "'";
        }
        return depttids;
    }

	private StringBuffer genarateTable(){
		StringBuffer sb = new StringBuffer();
		List<PTCommonOpinionBO> list = query4View();
        String depttids = getSubDepts();
		if(list != null && list.size() > 0){
			sb.append("<table id=\"" + getId() + "table\" width=\"" + getWidth() + "\" border=\"0\" cellspacing=\"0\" style=\"" + getStyle() + "\" align=\"left\">").append("\n");
			for (PTCommonOpinionBO pt : list) {
			    boolean yjlxValidate = 	pt.getYjlx() != null && (CommonGlobal.OPINION_YJLX_RETRIEVE == pt.getYjlx().byteValue() || CommonGlobal.OPINION_YJLX_SAVE == pt.getYjlx().byteValue());
                boolean yjylxValidate = pt.getYjylx() == CommonGlobal.OPINION_YJYLX_CHECK_DEPT_MODIFY && (getRenderType() != null ? !getRenderType().equals("disable") : true);
				if(yjlxValidate | yjylxValidate){
					temp = pt;
					String result = (String)request.getAttribute("BACK_OPERATION_IDS_TAG");
					if(result != null){
						result += "," + pt.getId();
					}else{
						result = pt.getId();
					}
					request.setAttribute("BACK_OPERATION_IDS_TAG", result);
					continue;
				}				
	            if((depttids.length() == 0) || (depttids.contains("'" + pt.getYjbm() + "'"))){
	                    sb.append("\t<tr height=\"20\">").append("\n");
	                    sb.append("\t\t<td align=\"left\" ><pre>").append(getYjnr(pt)).append(pt.getYjnr()).append("</pre></td>").append("\n");
	                    sb.append("\t</tr>").append("\n");
	                    if(CommonGlobal.OPINION_YJYLX_SUMMARY_SUGGEST != pt.getYjylx().byteValue()){
	                    	sb.append("\t<tr height=\"20\">").append("\n");
	                    	String tjrStr = pt.getYjylx() == CommonGlobal.OPINION_YJYLX_CHECK_DEPT_MODIFY ? "" : getTJR(pt.getTjr());
		                    sb.append("\t\t<td  align=\"right\">").append(getTJBM(pt.getYjbm())).append("&nbsp;&nbsp;").append(tjrStr).append("&nbsp;&nbsp;&nbsp;&nbsp;</td>").append("\n");
		                    sb.append("\t</tr>").append("\n");
		                    sb.append("\t<tr height=\"20\">").append("\n");
		                    sb.append("\t\t<td bgcolor=\"#E4F8F8\" align=\"right\">").append(DateUtils.formatDate(pt.getTjrq(), "yyyy-MM-dd HH:mm")).append("&nbsp;&nbsp;&nbsp;&nbsp;</td>").append("\n");
		                    sb.append("\t</tr>").append("\n");
	                    }					
				}
			}
			sb.append("</table>").append("\n");
		}
		return sb;
	}

	private String getYjnr(PTCommonOpinionBO pt){
		
		String prefix = "";
//		if(pt.yjlx != null && pt.yjlx.byteValue() == CommonGlobal.OPINION_YJLX_BACK){
//			 prefix = "退回意见：";
//		}else if(pt.yjlx != null && pt.yjlx.byteValue() == CommonGlobal.OPINION_YJLX_FINAL){
//			prefix = "最终意见：";
//		}
		return prefix;
	}

	private String getTJR(String userid){
		if(userid!=null){
			return UserCache.getUsernameById(Long.parseLong(userid));
		}
		return "";
	}
	
	private String getTJBM(Long deptid){
		PTDeptBO temp = getDeptUCCimpl().getSingleById(deptid);
		return temp != null ? temp.getDeptName() : "&nbsp;";
	}
	
	/**
    byte OPINION_YJYLX_DRAFT_DEPT = 0; //拟稿部门意见
    byte OPINION_YJYLX_MEETING_DEPT = 1; //返回到主表单上的会签部门意见
    byte OPINION_YJYLX_MEETING = 2; //会签过程中的意见
    byte OPINION_YJYLX_OPERATION_GROUP = 3;// 业务运营组意见
    byte OPINION_YJYLX_ERP_RESULT = 4;// ERP处理结果
    byte OPINION_YJYLX_LEADER = 5;// 批示意见
    byte OPINION_YJYLX_HANDLE_DEPT = 6;//办理部门意见
    byte OPINION_YJYLX_HQZZ = 7; //会签最终意见域
    byte OPINION_YJYLX_HQTH = 8; //会签退回意见域
	 * @return
	 */
	private List<PTCommonOpinionBO> query4View(){
		byte type = getType(name);
		
		List<PTCommonOpinionBO> list = null;
		if(headid != null && headid.length() != 0){
			String n = headid;
			if(headid.startsWith("%{") && headid.endsWith("}")){
				n = stack.findString(headid.substring(2, headid.length() - 1));
			}else{
				n = stack.findString(headid);
			}
			if(n == null || n.length() == 0)
				n = headid;
			list = getCommonOpinionUcc().query4View(n, new Integer(type));
		}
		return list;
	}

	public static byte getType(String str) {
		byte type = -1;
		if(OpinionPartComponent.DRAFT_DEPT.equals(str))
			type = CommonGlobal.OPINION_YJYLX_DRAFT_DEPT;//1
		else if(OpinionPartComponent.ERP_RESULT.equals(str))
			type = CommonGlobal.OPINION_YJYLX_ERP_RESULT;//2
		else if(OpinionPartComponent.LEADER.equals(str))
			type = CommonGlobal.OPINION_YJYLX_LEADER;//3
		else if(OpinionPartComponent.MEETING_DEPT.equals(str))
			type = CommonGlobal.OPINION_YJYLX_MEETING_DEPT;//4
		else if(OpinionPartComponent.MEETING.equals(str))
			type = CommonGlobal.OPINION_YJYLX_MEETING;//5
		else if(OpinionPartComponent.OPERATION_GROUP.equals(str))
			type = CommonGlobal.OPINION_YJYLX_OPERATION_GROUP;//6
		else if(OpinionPartComponent.HANDLE_DEPT.equals(str))
			type = CommonGlobal.OPINION_YJYLX_HANDLE_DEPT;//7
		else if(OpinionPartComponent.CHECK_DEPT.equals(str))
			type = CommonGlobal.OPINION_YJYLX_CHECK_DEPT;//8
		else if(OpinionPartComponent.ACCOUNT_DEPT.equals(str))
			type = CommonGlobal.OPINION_YJYLX_ACCOUNT_DEPT;//9
		else if(OpinionPartComponent.AGENT_DEPT.equals(str))
			type = CommonGlobal.OPINION_YJYLX_AGENT_DEPT;//10
		else if(OpinionPartComponent.WORK_DEPT.equals(str))
			type = CommonGlobal.OPINION_YJYLX_WORK_DEPT;//11
		else if(OpinionPartComponent.WORK_MANAGE_DEPT.equals(str))
			type = CommonGlobal.OPINION_YJYLX_WORK_MANAGE_DEPT;//12
		else if(OpinionPartComponent.AGENT_MANAGE_DEPT.equals(str))
			type = CommonGlobal.OPINION_YJYLX_AGENT_MANAGE_DEPT;//13
		else if(OpinionPartComponent.COMPERE.equals(str))
			type = CommonGlobal.OPINION_YJYLX_COMPERE;//14
		else if(OpinionPartComponent.SECRATARY.equals(str))
			type = CommonGlobal.OPINION_YJYLX_SECRATARY;//15
		else if(OpinionPartComponent.SUMMARY_SUGGEST.equals(str))
			type = CommonGlobal.OPINION_YJYLX_SUMMARY_SUGGEST;//16
		else if(OpinionPartComponent.APPROVEMENT.equals(str))
			type = CommonGlobal.OPINION_YJYLX_APPROVEMENT;//17
		else if(OpinionPartComponent.CHECK.equals(str))
			type = CommonGlobal.OPINION_YJYLX_CHECK;//18
		else if(OpinionPartComponent.HQTH.equals(str))
			type = CommonGlobal.OPINION_YJYLX_HQTH;//19
		else if(OpinionPartComponent.HQZZ.equals(str))
			type = CommonGlobal.OPINION_YJYLX_HQZZ;//20
        else if(OpinionPartComponent.DEPT_LEADER.equals(str))
			type = CommonGlobal.OPINION_YJYLX_DEPT_LEADER;//21
        else if(OpinionPartComponent.CHECK_DEPT_MODIFY.equals(str))
			type = CommonGlobal.OPINION_YJYLX_CHECK_DEPT_MODIFY;//22
         else if(OpinionPartComponent.AGENT_MEETING_DEPT.equals(str))
			type = CommonGlobal.OPINION_YJYLX_AGENT_MEETING_DEPT;//23
         else if(OpinionPartComponent.BLYJ_ZZYJ.equals(str))
        	 type = CommonGlobal.OPINION_YJYLX_BLYJ_ZZYJ;//24
         else if(OpinionPartComponent.BLYJ_GCYJ.equals(str))
        	 type = CommonGlobal.OPINION_YJYLX_BLYJ_GCYJ;//25
         else if(OpinionPartComponent.BLYJ_THYJ.equals(str))
        	 type = CommonGlobal.OPINION_YJYLX_BLYJ_THYJ;//26
         else if(OpinionPartComponent.REMARK.equals(str))
        	 type = CommonGlobal.OPINION_YJYLX_REMARK;//27
		return type;
	}
	
	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getHeadid() {
		return headid;
	}

	public void setHeadid(String headid) {
		this.headid = headid;
	}

	public String getColspan() {
		return colspan;
	}

	public void setColspan(String colspan) {
		this.colspan = colspan;
	}

	public String getCols() {
		return cols;
	}

	public void setCols(String cols) {
		this.cols = cols;
	}

	public String getRows() {
		return rows;
	}

	public void setRows(String rows) {
		this.rows = rows;
	}

	public String getYjlx() {
		return yjlx;
	}

	public void setYjlx(String yjlx) {
		this.yjlx = yjlx;
	}

	public String getLeftTdStyle() {
		return leftTdStyle;
	}

	public void setLeftTdStyle(String leftTdStyle) {
		this.leftTdStyle = leftTdStyle;
	}

}
