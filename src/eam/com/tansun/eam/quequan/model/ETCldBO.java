package com.tansun.eam.quequan.model;

import java.util.Date;

import com.tansun.rdp4j.common.web.vo.CommonBO;

/**
 * ETCld entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class ETCldBO extends CommonBO implements
		java.io.Serializable {

	// Fields

	private Long tid; //���
	private Long cldbh; //�������
	private String zt;//����
	private String cs;//����
	private Date sqqr; //��������
	private String sqbm;//���벿��
	private String sxlx;//��������
	private String jbr; //������
	private String jbrdh;// �����˵绰
	private String hqbm;//��ǩ����
	private Long sfsjfy;//�Ƿ��漰����
	private Double sqfyzje;//��������ܽ��
	private Double spfyzje;//���������ܽ��
	private String fjbt; //
	private String fj;
	private String lcbh;
	private String rwbh;

	// Constructors

	/** default constructor */
	public ETCldBO() {
	}

	/** minimal constructor */
	public ETCldBO(Long tid, Long cldbh) {
		this.tid = tid;
		this.cldbh = cldbh;
	}

	/** full constructor */
	public ETCldBO(Long tid, Long cldbh, String zt, String cs, Date sqqr,
			String sqbm, String sxlx, String jbr, String jbrdh, String hqbm,
			Long sfsjfy, Double sqfyzje, Double spfyzje, String fjbt,
			String fj, String lcbh, String rwbh) {
		this.tid = tid;
		this.cldbh = cldbh;
		this.zt = zt;
		this.cs = cs;
		this.sqqr = sqqr;
		this.sqbm = sqbm;
		this.sxlx = sxlx;
		this.jbr = jbr;
		this.jbrdh = jbrdh;
		this.hqbm = hqbm;
		this.sfsjfy = sfsjfy;
		this.sqfyzje = sqfyzje;
		this.spfyzje = spfyzje;
		this.fjbt = fjbt;
		this.fj = fj;
		this.lcbh = lcbh;
		this.rwbh = rwbh;
	}

	// Property accessors

	public Long getTid() {
		return this.tid;
	}

	public void setTid(Long tid) {
		this.tid = tid;
	}

	public Long getCldbh() {
		return this.cldbh;
	}

	public void setCldbh(Long cldbh) {
		this.cldbh = cldbh;
	}

	public String getZt() {
		return this.zt;
	}

	public void setZt(String zt) {
		this.zt = zt;
	}

	public String getCs() {
		return this.cs;
	}

	public void setCs(String cs) {
		this.cs = cs;
	}

	public Date getSqqr() {
		return this.sqqr;
	}

	public void setSqqr(Date sqqr) {
		this.sqqr = sqqr;
	}

	public String getSqbm() {
		return this.sqbm;
	}

	public void setSqbm(String sqbm) {
		this.sqbm = sqbm;
	}

	public String getSxlx() {
		return this.sxlx;
	}

	public void setSxlx(String sxlx) {
		this.sxlx = sxlx;
	}

	public String getJbr() {
		return this.jbr;
	}

	public void setJbr(String jbr) {
		this.jbr = jbr;
	}

	public String getJbrdh() {
		return this.jbrdh;
	}

	public void setJbrdh(String jbrdh) {
		this.jbrdh = jbrdh;
	}

	public String getHqbm() {
		return this.hqbm;
	}

	public void setHqbm(String hqbm) {
		this.hqbm = hqbm;
	}

	public Long getSfsjfy() {
		return this.sfsjfy;
	}

	public void setSfsjfy(Long sfsjfy) {
		this.sfsjfy = sfsjfy;
	}

	public Double getSqfyzje() {
		return this.sqfyzje;
	}

	public void setSqfyzje(Double sqfyzje) {
		this.sqfyzje = sqfyzje;
	}

	public Double getSpfyzje() {
		return this.spfyzje;
	}

	public void setSpfyzje(Double spfyzje) {
		this.spfyzje = spfyzje;
	}

	public String getFjbt() {
		return this.fjbt;
	}

	public void setFjbt(String fjbt) {
		this.fjbt = fjbt;
	}

	public String getFj() {
		return this.fj;
	}

	public void setFj(String fj) {
		this.fj = fj;
	}

	public String getLcbh() {
		return this.lcbh;
	}

	public void setLcbh(String lcbh) {
		this.lcbh = lcbh;
	}

	public String getRwbh() {
		return this.rwbh;
	}

	public void setRwbh(String rwbh) {
		this.rwbh = rwbh;
	}

	@Override
	public String getMid() {
		// TODO Auto-generated method stub
		return null;
	}

}