package com.tansun.eam2.jiekou.erp.model.bo.base;

import java.lang.Comparable;
import java.io.Serializable;
//��Ϊjsf 
import com.tansun.eam2.jiekou.erp.model.bo.ErpCardspdaddsend;
import com.tansun.easycare.control.internal.impl.ActionFormImpl;



/**
 * This is an object that contains data related to the ERP_CARDSPDADDSEND table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="ERP_CARDSPDADDSEND"
 */

public abstract class BaseErpCardspdaddsend implements Comparable, Serializable {

	public static String REF = "ErpCardspdaddsend";
	public static String PROP_LBBM = "lbbm";
	public static String PROP_ERPKPBM = "erpkpbm";
	public static String PROP_JBRBM = "jbrbm";
	public static String PROP_ZJFS = "zjfs";
	public static String PROP_FHXX = "fhxx";
	public static String PROP_ZDRQ = "zdrq";
	public static String PROP_FHBM = "fhbm";
	public static String PROP_GGXH = "ggxh";
	public static String PROP_ERPZCBM = "erpzcbm";
	public static String PROP_KPID = "kpid";
	public static String PROP_GSBM = "gsbm";
	public static String PROP_CFDD = "cfdd";
	public static String PROP_SYBMBM = "sybmbm";
	public static String PROP_SQBMBM = "sqbmbm";
	public static String PROP_SQLY = "sqly";
	public static String PROP_SHRBM = "shrbm";
	public static String PROP_SYYX = "syyx";
	public static String PROP_SHRQ = "shrq";
	public static String PROP_SFBH = "sfbh";
	public static String PROP_SYZK = "syzk";
	public static String PROP_SQDWBM = "sqdwbm";
	public static String PROP_DYPK = "dypk";
	public static String PROP_ZDRBM = "zdrbm";
	public static String PROP_ZCMC = "zcmc";
	public static String PROP_DJH = "djh";
	public static String PROP_SL = "sl";
	public static String PROP_SQRQ = "sqrq";
	public static String PROP_ZCBM = "zcbm";
	public static String PROP_BDH = "bdh";
	public static String PROP_SFCJ = "sfcj";
	public static String PROP_ID = "id";
	public static String PROP_JE = "je";


	// constructors
	public BaseErpCardspdaddsend () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseErpCardspdaddsend (java.lang.Integer id) {
		this.setId(id);
		initialize();
	}

	protected void initialize () {}



	private int hashCode = Integer.MIN_VALUE;

	// primary key
	private java.lang.Integer id;

	// fields
	private java.lang.String bdh;
	private java.lang.String dypk;
	private java.lang.String erpzcbm;
	private java.lang.String erpkpbm;
	private java.lang.String fhbm;
	private java.lang.String fhxx;
	private java.lang.String sfbh;
	private java.lang.String kpid;
	private java.lang.String gsbm;
	private java.lang.String djh;
	private java.lang.String sqdwbm;
	private java.lang.String sqbmbm;
	private java.lang.String sqrq;
	private java.lang.String sqly;
	private java.lang.String jbrbm;
	private java.lang.String zdrbm;
	private java.lang.String zdrq;
	private java.lang.String shrbm;
	private java.lang.String shrq;
	private java.lang.String je;
	private java.lang.String sl;
	private java.lang.String zjfs;
	private java.lang.String sfcj;
	private java.lang.String syyx;
	private java.lang.String syzk;
	private java.lang.String lbbm;
	private java.lang.String zcbm;
	private java.lang.String zcmc;
	private java.lang.String sybmbm;
	private java.lang.String ggxh;
	private java.lang.String cfdd;



	/**
	 * Return the unique identifier of this class
     * @hibernate.id
     *  generator-class="increment"
     *  column="ID"
     */
	public java.lang.Integer getId () {
		return id;
	}

	/**
	 * Set the unique identifier of this class
	 * @param id the new ID
	 */
	public void setId (java.lang.Integer id) {
		this.id = id;
		this.hashCode = Integer.MIN_VALUE;
	}




	/**
	 * Return the value associated with the column: BDH
	 */
	public java.lang.String getBdh () {
		return bdh;
	}

	/**
	 * Set the value related to the column: BDH
	 * @param bdh the BDH value
	 */
	public void setBdh (java.lang.String bdh) {
		this.bdh = bdh;
	}



	/**
	 * Return the value associated with the column: DYPK
	 */
	public java.lang.String getDypk () {
		return dypk;
	}

	/**
	 * Set the value related to the column: DYPK
	 * @param dypk the DYPK value
	 */
	public void setDypk (java.lang.String dypk) {
		this.dypk = dypk;
	}



	/**
	 * Return the value associated with the column: ERPZCBM
	 */
	public java.lang.String getErpzcbm () {
		return erpzcbm;
	}

	/**
	 * Set the value related to the column: ERPZCBM
	 * @param erpzcbm the ERPZCBM value
	 */
	public void setErpzcbm (java.lang.String erpzcbm) {
		this.erpzcbm = erpzcbm;
	}



	/**
	 * Return the value associated with the column: ERPKPBM
	 */
	public java.lang.String getErpkpbm () {
		return erpkpbm;
	}

	/**
	 * Set the value related to the column: ERPKPBM
	 * @param erpkpbm the ERPKPBM value
	 */
	public void setErpkpbm (java.lang.String erpkpbm) {
		this.erpkpbm = erpkpbm;
	}



	/**
	 * Return the value associated with the column: FHBM
	 */
	public java.lang.String getFhbm () {
		return fhbm;
	}

	/**
	 * Set the value related to the column: FHBM
	 * @param fhbm the FHBM value
	 */
	public void setFhbm (java.lang.String fhbm) {
		this.fhbm = fhbm;
	}



	/**
	 * Return the value associated with the column: FHXX
	 */
	public java.lang.String getFhxx () {
		return fhxx;
	}

	/**
	 * Set the value related to the column: FHXX
	 * @param fhxx the FHXX value
	 */
	public void setFhxx (java.lang.String fhxx) {
		this.fhxx = fhxx;
	}



	/**
	 * Return the value associated with the column: SFBH
	 */
	public java.lang.String getSfbh () {
		return sfbh;
	}

	/**
	 * Set the value related to the column: SFBH
	 * @param sfbh the SFBH value
	 */
	public void setSfbh (java.lang.String sfbh) {
		this.sfbh = sfbh;
	}



	/**
	 * Return the value associated with the column: KPID
	 */
	public java.lang.String getKpid () {
		return kpid;
	}

	/**
	 * Set the value related to the column: KPID
	 * @param kpid the KPID value
	 */
	public void setKpid (java.lang.String kpid) {
		this.kpid = kpid;
	}



	/**
	 * Return the value associated with the column: GSBM
	 */
	public java.lang.String getGsbm () {
		return gsbm;
	}

	/**
	 * Set the value related to the column: GSBM
	 * @param gsbm the GSBM value
	 */
	public void setGsbm (java.lang.String gsbm) {
		this.gsbm = gsbm;
	}



	/**
	 * Return the value associated with the column: DJH
	 */
	public java.lang.String getDjh () {
		return djh;
	}

	/**
	 * Set the value related to the column: DJH
	 * @param djh the DJH value
	 */
	public void setDjh (java.lang.String djh) {
		this.djh = djh;
	}



	/**
	 * Return the value associated with the column: SQDWBM
	 */
	public java.lang.String getSqdwbm () {
		return sqdwbm;
	}

	/**
	 * Set the value related to the column: SQDWBM
	 * @param sqdwbm the SQDWBM value
	 */
	public void setSqdwbm (java.lang.String sqdwbm) {
		this.sqdwbm = sqdwbm;
	}



	/**
	 * Return the value associated with the column: SQBMBM
	 */
	public java.lang.String getSqbmbm () {
		return sqbmbm;
	}

	/**
	 * Set the value related to the column: SQBMBM
	 * @param sqbmbm the SQBMBM value
	 */
	public void setSqbmbm (java.lang.String sqbmbm) {
		this.sqbmbm = sqbmbm;
	}



	/**
	 * Return the value associated with the column: SQRQ
	 */
	public java.lang.String getSqrq () {
		return sqrq;
	}

	/**
	 * Set the value related to the column: SQRQ
	 * @param sqrq the SQRQ value
	 */
	public void setSqrq (java.lang.String sqrq) {
		this.sqrq = sqrq;
	}



	/**
	 * Return the value associated with the column: SQLY
	 */
	public java.lang.String getSqly () {
		return sqly;
	}

	/**
	 * Set the value related to the column: SQLY
	 * @param sqly the SQLY value
	 */
	public void setSqly (java.lang.String sqly) {
		this.sqly = sqly;
	}



	/**
	 * Return the value associated with the column: JBRBM
	 */
	public java.lang.String getJbrbm () {
		return jbrbm;
	}

	/**
	 * Set the value related to the column: JBRBM
	 * @param jbrbm the JBRBM value
	 */
	public void setJbrbm (java.lang.String jbrbm) {
		this.jbrbm = jbrbm;
	}



	/**
	 * Return the value associated with the column: ZDRBM
	 */
	public java.lang.String getZdrbm () {
		return zdrbm;
	}

	/**
	 * Set the value related to the column: ZDRBM
	 * @param zdrbm the ZDRBM value
	 */
	public void setZdrbm (java.lang.String zdrbm) {
		this.zdrbm = zdrbm;
	}



	/**
	 * Return the value associated with the column: ZDRQ
	 */
	public java.lang.String getZdrq () {
		return zdrq;
	}

	/**
	 * Set the value related to the column: ZDRQ
	 * @param zdrq the ZDRQ value
	 */
	public void setZdrq (java.lang.String zdrq) {
		this.zdrq = zdrq;
	}



	/**
	 * Return the value associated with the column: SHRBM
	 */
	public java.lang.String getShrbm () {
		return shrbm;
	}

	/**
	 * Set the value related to the column: SHRBM
	 * @param shrbm the SHRBM value
	 */
	public void setShrbm (java.lang.String shrbm) {
		this.shrbm = shrbm;
	}



	/**
	 * Return the value associated with the column: SHRQ
	 */
	public java.lang.String getShrq () {
		return shrq;
	}

	/**
	 * Set the value related to the column: SHRQ
	 * @param shrq the SHRQ value
	 */
	public void setShrq (java.lang.String shrq) {
		this.shrq = shrq;
	}



	/**
	 * Return the value associated with the column: JE
	 */
	public java.lang.String getJe () {
		return je;
	}

	/**
	 * Set the value related to the column: JE
	 * @param je the JE value
	 */
	public void setJe (java.lang.String je) {
		this.je = je;
	}



	/**
	 * Return the value associated with the column: SL
	 */
	public java.lang.String getSl () {
		return sl;
	}

	/**
	 * Set the value related to the column: SL
	 * @param sl the SL value
	 */
	public void setSl (java.lang.String sl) {
		this.sl = sl;
	}



	/**
	 * Return the value associated with the column: ZJFS
	 */
	public java.lang.String getZjfs () {
		return zjfs;
	}

	/**
	 * Set the value related to the column: ZJFS
	 * @param zjfs the ZJFS value
	 */
	public void setZjfs (java.lang.String zjfs) {
		this.zjfs = zjfs;
	}



	/**
	 * Return the value associated with the column: SFCJ
	 */
	public java.lang.String getSfcj () {
		return sfcj;
	}

	/**
	 * Set the value related to the column: SFCJ
	 * @param sfcj the SFCJ value
	 */
	public void setSfcj (java.lang.String sfcj) {
		this.sfcj = sfcj;
	}



	/**
	 * Return the value associated with the column: SYYX
	 */
	public java.lang.String getSyyx () {
		return syyx;
	}

	/**
	 * Set the value related to the column: SYYX
	 * @param syyx the SYYX value
	 */
	public void setSyyx (java.lang.String syyx) {
		this.syyx = syyx;
	}



	/**
	 * Return the value associated with the column: SYZK
	 */
	public java.lang.String getSyzk () {
		return syzk;
	}

	/**
	 * Set the value related to the column: SYZK
	 * @param syzk the SYZK value
	 */
	public void setSyzk (java.lang.String syzk) {
		this.syzk = syzk;
	}



	/**
	 * Return the value associated with the column: LBBM
	 */
	public java.lang.String getLbbm () {
		return lbbm;
	}

	/**
	 * Set the value related to the column: LBBM
	 * @param lbbm the LBBM value
	 */
	public void setLbbm (java.lang.String lbbm) {
		this.lbbm = lbbm;
	}



	/**
	 * Return the value associated with the column: ZCBM
	 */
	public java.lang.String getZcbm () {
		return zcbm;
	}

	/**
	 * Set the value related to the column: ZCBM
	 * @param zcbm the ZCBM value
	 */
	public void setZcbm (java.lang.String zcbm) {
		this.zcbm = zcbm;
	}



	/**
	 * Return the value associated with the column: ZCMC
	 */
	public java.lang.String getZcmc () {
		return zcmc;
	}

	/**
	 * Set the value related to the column: ZCMC
	 * @param zcmc the ZCMC value
	 */
	public void setZcmc (java.lang.String zcmc) {
		this.zcmc = zcmc;
	}



	/**
	 * Return the value associated with the column: SYBMBM
	 */
	public java.lang.String getSybmbm () {
		return sybmbm;
	}

	/**
	 * Set the value related to the column: SYBMBM
	 * @param sybmbm the SYBMBM value
	 */
	public void setSybmbm (java.lang.String sybmbm) {
		this.sybmbm = sybmbm;
	}



	/**
	 * Return the value associated with the column: GGXH
	 */
	public java.lang.String getGgxh () {
		return ggxh;
	}

	/**
	 * Set the value related to the column: GGXH
	 * @param ggxh the GGXH value
	 */
	public void setGgxh (java.lang.String ggxh) {
		this.ggxh = ggxh;
	}



	/**
	 * Return the value associated with the column: CFDD
	 */
	public java.lang.String getCfdd () {
		return cfdd;
	}

	/**
	 * Set the value related to the column: CFDD
	 * @param cfdd the CFDD value
	 */
	public void setCfdd (java.lang.String cfdd) {
		this.cfdd = cfdd;
	}





	public boolean equals (Object obj) {
		if (null == obj) return false;
		if (!(obj instanceof ErpCardspdaddsend)) return false;
		else {
			ErpCardspdaddsend erpCardspdaddsend = (ErpCardspdaddsend) obj;
			if (null == this.getId() || null == erpCardspdaddsend.getId()) return false;
			else return (this.getId().equals(erpCardspdaddsend.getId()));
		}
	}

	public int hashCode () {
		if (Integer.MIN_VALUE == this.hashCode) {
			if (null == this.getId()) return super.hashCode();
			else {
				String hashStr = this.getClass().getName() + ":" + this.getId().hashCode();
				this.hashCode = hashStr.hashCode();
			}
		}
		return this.hashCode;
	}

	public int compareTo (Object obj) {
		if (obj.hashCode() > hashCode()) return 1;
		else if (obj.hashCode() < hashCode()) return -1;
		else return 0;
	}

	public String toString () {
		return super.toString();
	}


}