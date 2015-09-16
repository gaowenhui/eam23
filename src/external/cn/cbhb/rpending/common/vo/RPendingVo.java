/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package cn.cbhb.rpending.common.vo;

/**
 *
 * @author Baitin.Fong
 */
public class RPendingVo {

	private String optType;
	private String pscode;
	private String pCode;
	private String pTitle;
	private String pDate;
//	private String pOraniger;
	private String pPrincipal;
	private String pURL;
	private String ptype;
	private String pstatus;
	private String pnote;
	private String pworkflow;
	private String pstage;
	private String plevel;
	private String md5info;
	private String pn;
	private String pscodeZH;
	private String ngPerson;
	private String ngDept;
	private String wenHao;
	private String ngDate;
	
	
	public String getPscodeZH() {
		return pscodeZH;
	}

	public void setPscodeZH(String pscodeZH) {
		this.pscodeZH = pscodeZH;
	}

	public RPendingVo() {

	}

	public RPendingVo(String optType, String psCode, String pCode,
			String pTitle, String pDate, String pPrincipal,
			String pURL, String pStatus,String ptype,String PSCODEZH,String NGPERSON,String NGDEPT,String WENHAO,String NGDATE) {
		
		this.optType = optType;
		this.pscode = psCode;
		this.pCode = pCode;
		this.pTitle = pTitle;
		this.pDate = pDate;
//		this.pOraniger = pOraniger;
		this.pPrincipal = pPrincipal;
		this.pURL = pURL;
		this.pstatus = pStatus;
		this.ptype = ptype;
		this.pscodeZH = PSCODEZH;
		this.ngPerson = NGPERSON;
		this.ngDept = NGDEPT;
		this.wenHao = WENHAO;
		this.ngDate = NGDATE;
	
	
	}
	public RPendingVo(String optType, String psCode, String pCode,String ptype,String pPrincipal) {
		this.optType = optType;
		this.pscode = psCode;
		this.pCode = pCode;
		this.ptype = ptype;
		this.pPrincipal = pPrincipal;
		
		
	}
	public String getOptType() {
		return optType;
	}
	public void setOptType(String optType) {
		this.optType = optType;
	}
	public String getPCode() {
		return pCode;
	}
	public void setPCode(String code) {
		pCode = code;
	}
	public String getPTitle() {
		return pTitle;
	}
	public void setPTitle(String title) {
		pTitle = title;
	}
	public String getPDate() {
		return pDate;
	}
	public void setPDate(String date) {
		pDate = date;
	}

	public String getPPrincipal() {
		return pPrincipal;
	}
	public void setPPrincipal(String principal) {
		pPrincipal = principal;
	}
	public String getPURL() {
		return pURL;
	}
	public void setPURL(String purl) {
		pURL = purl;
	}
	public String getPn() {
		return pn;
	}
	public void setPn(String pn) {
		this.pn = pn;
	}
	public String getPscode() {
		return pscode;
	}
	public void setPscode(String pscode) {
		this.pscode = pscode;
	}
	public String getPtype() {
		return ptype;
	}
	public void setPtype(String ptype) {
		this.ptype = ptype;
	}
	public String getPstatus() {
		return pstatus;
	}
	public void setPstatus(String pstatus) {
		this.pstatus = pstatus;
	}
	public String getPnote() {
		return pnote;
	}
	public void setPnote(String pnote) {
		this.pnote = pnote;
	}
	public String getPworkflow() {
		return pworkflow;
	}
	public void setPworkflow(String pworkflow) {
		this.pworkflow = pworkflow;
	}
	public String getPstage() {
		return pstage;
	}
	public void setPstage(String pstage) {
		this.pstage = pstage;
	}
	public String getPlevel() {
		return plevel;
	}
	public void setPlevel(String plevel) {
		this.plevel = plevel;
	}
	public String getMd5info() {
		return md5info;
	}
	public void setMd5info(String md5info) {
		this.md5info = md5info;
	}

	public String getNgPerson() {
		return ngPerson;
	}

	public void setNgPerson(String ngPerson) {
		this.ngPerson = ngPerson;
	}

	public String getNgDept() {
		return ngDept;
	}

	public void setNgDept(String ngDept) {
		this.ngDept = ngDept;
	}

	public String getWenHao() {
		return wenHao;
	}

	public void setWenHao(String wenHao) {
		this.wenHao = wenHao;
	}

	public String getNgDate() {
		return ngDate;
	}

	public void setNgDate(String ngDate) {
		this.ngDate = ngDate;
	}
	
}