package com.tansun.eam2.jiekou.erp.model.bo.base;

import java.io.Serializable;

import com.tansun.eam2.jiekou.erp.model.bo.ErpCardaddsend;

/**
 * This is an object that contains data related to the ERP_CARDADDSEND table.
 * Do not modify this class because it will be overwritten if the configuration file
 * related to this class is modified.
 *
 * @hibernate.class
 *  table="ERP_CARDADDSEND"
 */

public abstract class BaseErpCardaddsend  implements Comparable, Serializable {

	public static String REF = "ErpCardaddsend";
	public static String PROP_LBBM = "lbbm";
	public static String PROP_YWDYTD = "ywdytd";
	public static String PROP_NZYP = "nzyp";
	public static String PROP_YBYZ = "ybyz";
	public static String PROP_ZXMJ = "zxmj";
	public static String PROP_YZJE = "yzje";
	public static String PROP_CLPZH = "clpzh";
	public static String PROP_GGXH = "ggxh";
	public static String PROP_ERPZCBM = "erpzcbm";
	public static String PROP_GZZL = "gzzl";
	public static String PROP_KPID = "kpid";
	public static String PROP_PGQYZ = "pgqyz";
	public static String PROP_JCZL = "jczl";
	public static String PROP_LY = "ly";
	public static String PROP_ZJFSBM = "zjfsbm";
	public static String PROP_GYSBM = "gysbm";
	public static String PROP_FBYZ = "fbyz";
	public static String PROP_XMDABM = "xmdabm";
	public static String PROP_SFJC = "sfjc";
	public static String PROP_JCZ = "jcz";
	public static String PROP_SXBXQ = "sxbxq";
	public static String PROP_FDJHM = "fdjhm";
	public static String PROP_SFBH = "sfbh";
	public static String PROP_NC = "nc";
	public static String PROP_CPUXH = "cpuxh";
	public static String PROP_JZZB = "jzzb";
	public static String PROP_QZSYZ = "qzsyz";
	public static String PROP_YZKPBJ = "yzkpbj";
	public static String PROP_BBYZ = "bbyz";
	public static String PROP_SBXLH = "sbxlh";
	public static String PROP_BZCW = "bzcw";
	public static String PROP_JKPBH = "jkpbh";
	public static String PROP_SYZKBM = "syzkbm";
	public static String PROP_TDZHM = "tdzhm";
	public static String PROP_DWZJ = "dwzj";
	public static String PROP_BDH = "bdh";
	public static String PROP_BZMC = "bzmc";
	public static String PROP_QYRQ = "qyrq";
	public static String PROP_WZYP = "wzyp";
	public static String PROP_LJGZL = "ljgzl";
	public static String PROP_YRYZ = "yryz";
	public static String PROP_ZJCDBM = "zjcdbm";
	public static String PROP_ZCLBBM = "zclbbm";
	public static String PROP_GZLDW = "gzldw";
	public static String PROP_ERPKPBM = "erpkpbm";
	public static String PROP_YRJE = "yrje";
	public static String PROP_LRRQ = "lrrq";
	public static String PROP_FHXX = "fhxx";
	public static String PROP_ZYYT = "zyyt";
	public static String PROP_FHBM = "fhbm";
	public static String PROP_HJY = "hjy";
	public static String PROP_ZYZT = "zyzt";
	public static String PROP_YZJL = "yzjl";
	public static String PROP_DYTDZSYQR = "dytdzsyqr";
	public static String PROP_GSBM = "gsbm";
	public static String PROP_XTXSQ = "xtxsq";
	public static String PROP_ZDMJ = "zdmj";
	public static String PROP_SYBMBM = "sybmbm";
	public static String PROP_CFDD = "cfdd";
	public static String PROP_LRRMC = "lrrmc";
	public static String PROP_LJZJ = "ljzj";
	public static String PROP_ZCTH = "zcth";
	public static String PROP_LBMC = "lbmc";
	public static String PROP_ZIBM = "zibm";
	public static String PROP_KSSYRQ = "kssyrq";
	public static String PROP_BZ = "bz";
	public static String PROP_SYYX = "syyx";
	public static String PROP_SYRBM = "syrbm";
	public static String PROP_PGQLJZJ = "pgqljzj";
	public static String PROP_HJN = "hjn";
	public static String PROP_YXTRRY = "yxtrry";
	public static String PROP_JZ = "jz";
	public static String PROP_YJTYF = "yjtyf";
	public static String PROP_YGZL = "ygzl";
	public static String PROP_ZXRQ = "zxrq";
	public static String PROP_DYPK = "dypk";
	public static String PROP_ZCMC = "zcmc";
	public static String PROP_JJMJ = "jjmj";
	public static String PROP_SMBXQ = "smbxq";
	public static String PROP_FCZHM = "fczhm";
	public static String PROP_JZFABM = "jzfabm";
	public static String PROP_BXQ = "bxq";
	public static String PROP_YRLJZJ = "yrljzj";
	public static String PROP_ID = "id";
	public static String PROP_JE = "je";
	public static String PROP_QSZM = "qszm";
	public static String PROP_GLBMBM = "glbmbm";


	// constructors
	public BaseErpCardaddsend () {
		initialize();
	}

	/**
	 * Constructor for primary key
	 */
	public BaseErpCardaddsend (java.lang.Integer id) {
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
	private java.lang.String fhxx;
	private java.lang.String erpzcbm;
	private java.lang.String sfbh;
	private java.lang.String erpkpbm;
	private java.lang.String fhbm;
	private java.lang.String kpid;
	private java.lang.String gsbm;
	private java.lang.String zibm;
	private java.lang.String zcmc;
	private java.lang.String kssyrq;
	private java.lang.String bzmc;
	private java.lang.String bzcw;
	private java.lang.String lrrmc;
	private java.lang.String lrrq;
	private java.lang.String syrbm;
	private java.lang.String ggxh;
	private java.lang.String cfdd;
	private java.lang.String gzldw;
	private java.lang.String zjfsbm;
	private java.lang.String zcth;
	private java.lang.String sybmbm;
	private java.lang.String glbmbm;
	private java.lang.String zjcdbm;
	private java.lang.String hjn;
	private java.lang.String hjy;
	private java.lang.String ybyz;
	private java.lang.String bbyz;
	private java.lang.String fbyz;
	private java.lang.String gzzl;
	private java.lang.String syyx;
	private java.lang.String ljzj;
	private java.lang.String ljgzl;
	private java.lang.String jzzb;
	private java.lang.String yjtyf;
	private java.lang.String ygzl;
	private java.lang.String dwzj;
	private java.lang.String jczl;
	private java.lang.String jcz;
	private java.lang.String yzkpbj;
	private java.lang.String zclbbm;
	private java.lang.String syzkbm;
	private java.lang.String jzfabm;
	private java.lang.String xmdabm;
	private java.lang.String gysbm;
	private java.lang.String ly;
	private java.lang.String yrje;
	private java.lang.String yrljzj;
	private java.lang.String yryz;
	private java.lang.String cpuxh;
	private java.lang.String bxq;
	private java.lang.String bz;
	private java.lang.String clpzh;
	private java.lang.String dytdzsyqr;
	private java.lang.String fdjhm;
	private java.lang.String fczhm;
	private java.lang.String jjmj;
	private java.lang.String je;
	private java.lang.String jz;
	private java.lang.String jkpbh;
	private java.lang.String lbbm;
	private java.lang.String lbmc;
	private java.lang.String nc;
	private java.lang.String nzyp;
	private java.lang.String pgqljzj;
	private java.lang.String pgqyz;
	private java.lang.String qyrq;
	private java.lang.String qszm;
	private java.lang.String qzsyz;
	private java.lang.String smbxq;
	private java.lang.String sbxlh;
	private java.lang.String sfjc;
	private java.lang.String sxbxq;
	private java.lang.String tdzhm;
	private java.lang.String wzyp;
	private java.lang.String xtxsq;
	private java.lang.String ywdytd;
	private java.lang.String yxtrry;
	private java.lang.String yzje;
	private java.lang.String yzjl;
	private java.lang.String zyzt;
	private java.lang.String zdmj;
	private java.lang.String zyyt;
	private java.lang.String zxrq;
	private java.lang.String zxmj;



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
	 * Return the value associated with the column: ZIBM
	 */
	public java.lang.String getZibm () {
		return zibm;
	}

	/**
	 * Set the value related to the column: ZIBM
	 * @param zibm the ZIBM value
	 */
	public void setZibm (java.lang.String zibm) {
		this.zibm = zibm;
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
	 * Return the value associated with the column: KSSYRQ
	 */
	public java.lang.String getKssyrq () {
		return kssyrq;
	}

	/**
	 * Set the value related to the column: KSSYRQ
	 * @param kssyrq the KSSYRQ value
	 */
	public void setKssyrq (java.lang.String kssyrq) {
		this.kssyrq = kssyrq;
	}



	/**
	 * Return the value associated with the column: BZMC
	 */
	public java.lang.String getBzmc () {
		return bzmc;
	}

	/**
	 * Set the value related to the column: BZMC
	 * @param bzmc the BZMC value
	 */
	public void setBzmc (java.lang.String bzmc) {
		this.bzmc = bzmc;
	}



	/**
	 * Return the value associated with the column: BZCW
	 */
	public java.lang.String getBzcw () {
		return bzcw;
	}

	/**
	 * Set the value related to the column: BZCW
	 * @param bzcw the BZCW value
	 */
	public void setBzcw (java.lang.String bzcw) {
		this.bzcw = bzcw;
	}



	/**
	 * Return the value associated with the column: LRRMC
	 */
	public java.lang.String getLrrmc () {
		return lrrmc;
	}

	/**
	 * Set the value related to the column: LRRMC
	 * @param lrrmc the LRRMC value
	 */
	public void setLrrmc (java.lang.String lrrmc) {
		this.lrrmc = lrrmc;
	}



	/**
	 * Return the value associated with the column: LRRQ
	 */
	public java.lang.String getLrrq () {
		return lrrq;
	}

	/**
	 * Set the value related to the column: LRRQ
	 * @param lrrq the LRRQ value
	 */
	public void setLrrq (java.lang.String lrrq) {
		this.lrrq = lrrq;
	}



	/**
	 * Return the value associated with the column: SYRBM
	 */
	public java.lang.String getSyrbm () {
		return syrbm;
	}

	/**
	 * Set the value related to the column: SYRBM
	 * @param syrbm the SYRBM value
	 */
	public void setSyrbm (java.lang.String syrbm) {
		this.syrbm = syrbm;
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



	/**
	 * Return the value associated with the column: GZLDW
	 */
	public java.lang.String getGzldw () {
		return gzldw;
	}

	/**
	 * Set the value related to the column: GZLDW
	 * @param gzldw the GZLDW value
	 */
	public void setGzldw (java.lang.String gzldw) {
		this.gzldw = gzldw;
	}



	/**
	 * Return the value associated with the column: ZJFSBM
	 */
	public java.lang.String getZjfsbm () {
		return zjfsbm;
	}

	/**
	 * Set the value related to the column: ZJFSBM
	 * @param zjfsbm the ZJFSBM value
	 */
	public void setZjfsbm (java.lang.String zjfsbm) {
		this.zjfsbm = zjfsbm;
	}



	/**
	 * Return the value associated with the column: ZCTH
	 */
	public java.lang.String getZcth () {
		return zcth;
	}

	/**
	 * Set the value related to the column: ZCTH
	 * @param zcth the ZCTH value
	 */
	public void setZcth (java.lang.String zcth) {
		this.zcth = zcth;
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
	 * Return the value associated with the column: GLBMBM
	 */
	public java.lang.String getGlbmbm () {
		return glbmbm;
	}

	/**
	 * Set the value related to the column: GLBMBM
	 * @param glbmbm the GLBMBM value
	 */
	public void setGlbmbm (java.lang.String glbmbm) {
		this.glbmbm = glbmbm;
	}



	/**
	 * Return the value associated with the column: ZJCDBM
	 */
	public java.lang.String getZjcdbm () {
		return zjcdbm;
	}

	/**
	 * Set the value related to the column: ZJCDBM
	 * @param zjcdbm the ZJCDBM value
	 */
	public void setZjcdbm (java.lang.String zjcdbm) {
		this.zjcdbm = zjcdbm;
	}



	/**
	 * Return the value associated with the column: HJN
	 */
	public java.lang.String getHjn () {
		return hjn;
	}

	/**
	 * Set the value related to the column: HJN
	 * @param hjn the HJN value
	 */
	public void setHjn (java.lang.String hjn) {
		this.hjn = hjn;
	}



	/**
	 * Return the value associated with the column: HJY
	 */
	public java.lang.String getHjy () {
		return hjy;
	}

	/**
	 * Set the value related to the column: HJY
	 * @param hjy the HJY value
	 */
	public void setHjy (java.lang.String hjy) {
		this.hjy = hjy;
	}



	/**
	 * Return the value associated with the column: YBYZ
	 */
	public java.lang.String getYbyz () {
		return ybyz;
	}

	/**
	 * Set the value related to the column: YBYZ
	 * @param ybyz the YBYZ value
	 */
	public void setYbyz (java.lang.String ybyz) {
		this.ybyz = ybyz;
	}



	/**
	 * Return the value associated with the column: BBYZ
	 */
	public java.lang.String getBbyz () {
		return bbyz;
	}

	/**
	 * Set the value related to the column: BBYZ
	 * @param bbyz the BBYZ value
	 */
	public void setBbyz (java.lang.String bbyz) {
		this.bbyz = bbyz;
	}



	/**
	 * Return the value associated with the column: FBYZ
	 */
	public java.lang.String getFbyz () {
		return fbyz;
	}

	/**
	 * Set the value related to the column: FBYZ
	 * @param fbyz the FBYZ value
	 */
	public void setFbyz (java.lang.String fbyz) {
		this.fbyz = fbyz;
	}



	/**
	 * Return the value associated with the column: GZZL
	 */
	public java.lang.String getGzzl () {
		return gzzl;
	}

	/**
	 * Set the value related to the column: GZZL
	 * @param gzzl the GZZL value
	 */
	public void setGzzl (java.lang.String gzzl) {
		this.gzzl = gzzl;
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
	 * Return the value associated with the column: LJZJ
	 */
	public java.lang.String getLjzj () {
		return ljzj;
	}

	/**
	 * Set the value related to the column: LJZJ
	 * @param ljzj the LJZJ value
	 */
	public void setLjzj (java.lang.String ljzj) {
		this.ljzj = ljzj;
	}



	/**
	 * Return the value associated with the column: LJGZL
	 */
	public java.lang.String getLjgzl () {
		return ljgzl;
	}

	/**
	 * Set the value related to the column: LJGZL
	 * @param ljgzl the LJGZL value
	 */
	public void setLjgzl (java.lang.String ljgzl) {
		this.ljgzl = ljgzl;
	}



	/**
	 * Return the value associated with the column: JZZB
	 */
	public java.lang.String getJzzb () {
		return jzzb;
	}

	/**
	 * Set the value related to the column: JZZB
	 * @param jzzb the JZZB value
	 */
	public void setJzzb (java.lang.String jzzb) {
		this.jzzb = jzzb;
	}



	/**
	 * Return the value associated with the column: YJTYF
	 */
	public java.lang.String getYjtyf () {
		return yjtyf;
	}

	/**
	 * Set the value related to the column: YJTYF
	 * @param yjtyf the YJTYF value
	 */
	public void setYjtyf (java.lang.String yjtyf) {
		this.yjtyf = yjtyf;
	}



	/**
	 * Return the value associated with the column: YGZL
	 */
	public java.lang.String getYgzl () {
		return ygzl;
	}

	/**
	 * Set the value related to the column: YGZL
	 * @param ygzl the YGZL value
	 */
	public void setYgzl (java.lang.String ygzl) {
		this.ygzl = ygzl;
	}



	/**
	 * Return the value associated with the column: DWZJ
	 */
	public java.lang.String getDwzj () {
		return dwzj;
	}

	/**
	 * Set the value related to the column: DWZJ
	 * @param dwzj the DWZJ value
	 */
	public void setDwzj (java.lang.String dwzj) {
		this.dwzj = dwzj;
	}



	/**
	 * Return the value associated with the column: JCZL
	 */
	public java.lang.String getJczl () {
		return jczl;
	}

	/**
	 * Set the value related to the column: JCZL
	 * @param jczl the JCZL value
	 */
	public void setJczl (java.lang.String jczl) {
		this.jczl = jczl;
	}



	/**
	 * Return the value associated with the column: JCZ
	 */
	public java.lang.String getJcz () {
		return jcz;
	}

	/**
	 * Set the value related to the column: JCZ
	 * @param jcz the JCZ value
	 */
	public void setJcz (java.lang.String jcz) {
		this.jcz = jcz;
	}



	/**
	 * Return the value associated with the column: YZKPBJ
	 */
	public java.lang.String getYzkpbj () {
		return yzkpbj;
	}

	/**
	 * Set the value related to the column: YZKPBJ
	 * @param yzkpbj the YZKPBJ value
	 */
	public void setYzkpbj (java.lang.String yzkpbj) {
		this.yzkpbj = yzkpbj;
	}



	/**
	 * Return the value associated with the column: ZCLBBM
	 */
	public java.lang.String getZclbbm () {
		return zclbbm;
	}

	/**
	 * Set the value related to the column: ZCLBBM
	 * @param zclbbm the ZCLBBM value
	 */
	public void setZclbbm (java.lang.String zclbbm) {
		this.zclbbm = zclbbm;
	}



	/**
	 * Return the value associated with the column: SYZKBM
	 */
	public java.lang.String getSyzkbm () {
		return syzkbm;
	}

	/**
	 * Set the value related to the column: SYZKBM
	 * @param syzkbm the SYZKBM value
	 */
	public void setSyzkbm (java.lang.String syzkbm) {
		this.syzkbm = syzkbm;
	}



	/**
	 * Return the value associated with the column: JZFABM
	 */
	public java.lang.String getJzfabm () {
		return jzfabm;
	}

	/**
	 * Set the value related to the column: JZFABM
	 * @param jzfabm the JZFABM value
	 */
	public void setJzfabm (java.lang.String jzfabm) {
		this.jzfabm = jzfabm;
	}



	/**
	 * Return the value associated with the column: XMDABM
	 */
	public java.lang.String getXmdabm () {
		return xmdabm;
	}

	/**
	 * Set the value related to the column: XMDABM
	 * @param xmdabm the XMDABM value
	 */
	public void setXmdabm (java.lang.String xmdabm) {
		this.xmdabm = xmdabm;
	}



	/**
	 * Return the value associated with the column: GYSBM
	 */
	public java.lang.String getGysbm () {
		return gysbm;
	}

	/**
	 * Set the value related to the column: GYSBM
	 * @param gysbm the GYSBM value
	 */
	public void setGysbm (java.lang.String gysbm) {
		this.gysbm = gysbm;
	}



	/**
	 * Return the value associated with the column: LY
	 */
	public java.lang.String getLy () {
		return ly;
	}

	/**
	 * Set the value related to the column: LY
	 * @param ly the LY value
	 */
	public void setLy (java.lang.String ly) {
		this.ly = ly;
	}



	/**
	 * Return the value associated with the column: YRJE
	 */
	public java.lang.String getYrje () {
		return yrje;
	}

	/**
	 * Set the value related to the column: YRJE
	 * @param yrje the YRJE value
	 */
	public void setYrje (java.lang.String yrje) {
		this.yrje = yrje;
	}



	/**
	 * Return the value associated with the column: YRLJZJ
	 */
	public java.lang.String getYrljzj () {
		return yrljzj;
	}

	/**
	 * Set the value related to the column: YRLJZJ
	 * @param yrljzj the YRLJZJ value
	 */
	public void setYrljzj (java.lang.String yrljzj) {
		this.yrljzj = yrljzj;
	}



	/**
	 * Return the value associated with the column: YRYZ
	 */
	public java.lang.String getYryz () {
		return yryz;
	}

	/**
	 * Set the value related to the column: YRYZ
	 * @param yryz the YRYZ value
	 */
	public void setYryz (java.lang.String yryz) {
		this.yryz = yryz;
	}



	/**
	 * Return the value associated with the column: CPUXH
	 */
	public java.lang.String getCpuxh () {
		return cpuxh;
	}

	/**
	 * Set the value related to the column: CPUXH
	 * @param cpuxh the CPUXH value
	 */
	public void setCpuxh (java.lang.String cpuxh) {
		this.cpuxh = cpuxh;
	}



	/**
	 * Return the value associated with the column: BXQ
	 */
	public java.lang.String getBxq () {
		return bxq;
	}

	/**
	 * Set the value related to the column: BXQ
	 * @param bxq the BXQ value
	 */
	public void setBxq (java.lang.String bxq) {
		this.bxq = bxq;
	}



	/**
	 * Return the value associated with the column: BZ
	 */
	public java.lang.String getBz () {
		return bz;
	}

	/**
	 * Set the value related to the column: BZ
	 * @param bz the BZ value
	 */
	public void setBz (java.lang.String bz) {
		this.bz = bz;
	}



	/**
	 * Return the value associated with the column: CLPZH
	 */
	public java.lang.String getClpzh () {
		return clpzh;
	}

	/**
	 * Set the value related to the column: CLPZH
	 * @param clpzh the CLPZH value
	 */
	public void setClpzh (java.lang.String clpzh) {
		this.clpzh = clpzh;
	}



	/**
	 * Return the value associated with the column: DYTDZSYQR
	 */
	public java.lang.String getDytdzsyqr () {
		return dytdzsyqr;
	}

	/**
	 * Set the value related to the column: DYTDZSYQR
	 * @param dytdzsyqr the DYTDZSYQR value
	 */
	public void setDytdzsyqr (java.lang.String dytdzsyqr) {
		this.dytdzsyqr = dytdzsyqr;
	}



	/**
	 * Return the value associated with the column: FDJHM
	 */
	public java.lang.String getFdjhm () {
		return fdjhm;
	}

	/**
	 * Set the value related to the column: FDJHM
	 * @param fdjhm the FDJHM value
	 */
	public void setFdjhm (java.lang.String fdjhm) {
		this.fdjhm = fdjhm;
	}



	/**
	 * Return the value associated with the column: FCZHM
	 */
	public java.lang.String getFczhm () {
		return fczhm;
	}

	/**
	 * Set the value related to the column: FCZHM
	 * @param fczhm the FCZHM value
	 */
	public void setFczhm (java.lang.String fczhm) {
		this.fczhm = fczhm;
	}



	/**
	 * Return the value associated with the column: JJMJ
	 */
	public java.lang.String getJjmj () {
		return jjmj;
	}

	/**
	 * Set the value related to the column: JJMJ
	 * @param jjmj the JJMJ value
	 */
	public void setJjmj (java.lang.String jjmj) {
		this.jjmj = jjmj;
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
	 * Return the value associated with the column: JZ
	 */
	public java.lang.String getJz () {
		return jz;
	}

	/**
	 * Set the value related to the column: JZ
	 * @param jz the JZ value
	 */
	public void setJz (java.lang.String jz) {
		this.jz = jz;
	}



	/**
	 * Return the value associated with the column: JKPBH
	 */
	public java.lang.String getJkpbh () {
		return jkpbh;
	}

	/**
	 * Set the value related to the column: JKPBH
	 * @param jkpbh the JKPBH value
	 */
	public void setJkpbh (java.lang.String jkpbh) {
		this.jkpbh = jkpbh;
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
	 * Return the value associated with the column: LBMC
	 */
	public java.lang.String getLbmc () {
		return lbmc;
	}

	/**
	 * Set the value related to the column: LBMC
	 * @param lbmc the LBMC value
	 */
	public void setLbmc (java.lang.String lbmc) {
		this.lbmc = lbmc;
	}



	/**
	 * Return the value associated with the column: NC
	 */
	public java.lang.String getNc () {
		return nc;
	}

	/**
	 * Set the value related to the column: NC
	 * @param nc the NC value
	 */
	public void setNc (java.lang.String nc) {
		this.nc = nc;
	}



	/**
	 * Return the value associated with the column: NZYP
	 */
	public java.lang.String getNzyp () {
		return nzyp;
	}

	/**
	 * Set the value related to the column: NZYP
	 * @param nzyp the NZYP value
	 */
	public void setNzyp (java.lang.String nzyp) {
		this.nzyp = nzyp;
	}



	/**
	 * Return the value associated with the column: PGQLJZJ
	 */
	public java.lang.String getPgqljzj () {
		return pgqljzj;
	}

	/**
	 * Set the value related to the column: PGQLJZJ
	 * @param pgqljzj the PGQLJZJ value
	 */
	public void setPgqljzj (java.lang.String pgqljzj) {
		this.pgqljzj = pgqljzj;
	}



	/**
	 * Return the value associated with the column: PGQYZ
	 */
	public java.lang.String getPgqyz () {
		return pgqyz;
	}

	/**
	 * Set the value related to the column: PGQYZ
	 * @param pgqyz the PGQYZ value
	 */
	public void setPgqyz (java.lang.String pgqyz) {
		this.pgqyz = pgqyz;
	}



	/**
	 * Return the value associated with the column: QYRQ
	 */
	public java.lang.String getQyrq () {
		return qyrq;
	}

	/**
	 * Set the value related to the column: QYRQ
	 * @param qyrq the QYRQ value
	 */
	public void setQyrq (java.lang.String qyrq) {
		this.qyrq = qyrq;
	}



	/**
	 * Return the value associated with the column: QSZM
	 */
	public java.lang.String getQszm () {
		return qszm;
	}

	/**
	 * Set the value related to the column: QSZM
	 * @param qszm the QSZM value
	 */
	public void setQszm (java.lang.String qszm) {
		this.qszm = qszm;
	}



	/**
	 * Return the value associated with the column: QZSYZ
	 */
	public java.lang.String getQzsyz () {
		return qzsyz;
	}

	/**
	 * Set the value related to the column: QZSYZ
	 * @param qzsyz the QZSYZ value
	 */
	public void setQzsyz (java.lang.String qzsyz) {
		this.qzsyz = qzsyz;
	}



	/**
	 * Return the value associated with the column: SMBXQ
	 */
	public java.lang.String getSmbxq () {
		return smbxq;
	}

	/**
	 * Set the value related to the column: SMBXQ
	 * @param smbxq the SMBXQ value
	 */
	public void setSmbxq (java.lang.String smbxq) {
		this.smbxq = smbxq;
	}



	/**
	 * Return the value associated with the column: SBXLH
	 */
	public java.lang.String getSbxlh () {
		return sbxlh;
	}

	/**
	 * Set the value related to the column: SBXLH
	 * @param sbxlh the SBXLH value
	 */
	public void setSbxlh (java.lang.String sbxlh) {
		this.sbxlh = sbxlh;
	}



	/**
	 * Return the value associated with the column: SFJC
	 */
	public java.lang.String getSfjc () {
		return sfjc;
	}

	/**
	 * Set the value related to the column: SFJC
	 * @param sfjc the SFJC value
	 */
	public void setSfjc (java.lang.String sfjc) {
		this.sfjc = sfjc;
	}



	/**
	 * Return the value associated with the column: SXBXQ
	 */
	public java.lang.String getSxbxq () {
		return sxbxq;
	}

	/**
	 * Set the value related to the column: SXBXQ
	 * @param sxbxq the SXBXQ value
	 */
	public void setSxbxq (java.lang.String sxbxq) {
		this.sxbxq = sxbxq;
	}



	/**
	 * Return the value associated with the column: TDZHM
	 */
	public java.lang.String getTdzhm () {
		return tdzhm;
	}

	/**
	 * Set the value related to the column: TDZHM
	 * @param tdzhm the TDZHM value
	 */
	public void setTdzhm (java.lang.String tdzhm) {
		this.tdzhm = tdzhm;
	}



	/**
	 * Return the value associated with the column: WZYP
	 */
	public java.lang.String getWzyp () {
		return wzyp;
	}

	/**
	 * Set the value related to the column: WZYP
	 * @param wzyp the WZYP value
	 */
	public void setWzyp (java.lang.String wzyp) {
		this.wzyp = wzyp;
	}



	/**
	 * Return the value associated with the column: XTXSQ
	 */
	public java.lang.String getXtxsq () {
		return xtxsq;
	}

	/**
	 * Set the value related to the column: XTXSQ
	 * @param xtxsq the XTXSQ value
	 */
	public void setXtxsq (java.lang.String xtxsq) {
		this.xtxsq = xtxsq;
	}



	/**
	 * Return the value associated with the column: YWDYTD
	 */
	public java.lang.String getYwdytd () {
		return ywdytd;
	}

	/**
	 * Set the value related to the column: YWDYTD
	 * @param ywdytd the YWDYTD value
	 */
	public void setYwdytd (java.lang.String ywdytd) {
		this.ywdytd = ywdytd;
	}



	/**
	 * Return the value associated with the column: YXTRRY
	 */
	public java.lang.String getYxtrry () {
		return yxtrry;
	}

	/**
	 * Set the value related to the column: YXTRRY
	 * @param yxtrry the YXTRRY value
	 */
	public void setYxtrry (java.lang.String yxtrry) {
		this.yxtrry = yxtrry;
	}



	/**
	 * Return the value associated with the column: YZJE
	 */
	public java.lang.String getYzje () {
		return yzje;
	}

	/**
	 * Set the value related to the column: YZJE
	 * @param yzje the YZJE value
	 */
	public void setYzje (java.lang.String yzje) {
		this.yzje = yzje;
	}



	/**
	 * Return the value associated with the column: YZJL
	 */
	public java.lang.String getYzjl () {
		return yzjl;
	}

	/**
	 * Set the value related to the column: YZJL
	 * @param yzjl the YZJL value
	 */
	public void setYzjl (java.lang.String yzjl) {
		this.yzjl = yzjl;
	}



	/**
	 * Return the value associated with the column: ZYZT
	 */
	public java.lang.String getZyzt () {
		return zyzt;
	}

	/**
	 * Set the value related to the column: ZYZT
	 * @param zyzt the ZYZT value
	 */
	public void setZyzt (java.lang.String zyzt) {
		this.zyzt = zyzt;
	}



	/**
	 * Return the value associated with the column: ZDMJ
	 */
	public java.lang.String getZdmj () {
		return zdmj;
	}

	/**
	 * Set the value related to the column: ZDMJ
	 * @param zdmj the ZDMJ value
	 */
	public void setZdmj (java.lang.String zdmj) {
		this.zdmj = zdmj;
	}



	/**
	 * Return the value associated with the column: ZYYT
	 */
	public java.lang.String getZyyt () {
		return zyyt;
	}

	/**
	 * Set the value related to the column: ZYYT
	 * @param zyyt the ZYYT value
	 */
	public void setZyyt (java.lang.String zyyt) {
		this.zyyt = zyyt;
	}



	/**
	 * Return the value associated with the column: ZXRQ
	 */
	public java.lang.String getZxrq () {
		return zxrq;
	}

	/**
	 * Set the value related to the column: ZXRQ
	 * @param zxrq the ZXRQ value
	 */
	public void setZxrq (java.lang.String zxrq) {
		this.zxrq = zxrq;
	}



	/**
	 * Return the value associated with the column: ZXMJ
	 */
	public java.lang.String getZxmj () {
		return zxmj;
	}

	/**
	 * Set the value related to the column: ZXMJ
	 * @param zxmj the ZXMJ value
	 */
	public void setZxmj (java.lang.String zxmj) {
		this.zxmj = zxmj;
	}





	public boolean equals (Object obj) {
		if (null == obj) return false;
		if (!(obj instanceof ErpCardaddsend)) return false;
		else {
			ErpCardaddsend erpCardaddsend = (ErpCardaddsend) obj;
			if (null == this.getId() || null == erpCardaddsend.getId()) return false;
			else return (this.getId().equals(erpCardaddsend.getId()));
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
