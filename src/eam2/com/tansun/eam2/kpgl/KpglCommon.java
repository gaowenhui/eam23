package com.tansun.eam2.kpgl;

/**
 * 卡片操作类型常量
 * @author 陈煜霄
 * @date 2010-11-24
 */
public interface KpglCommon {
	// 卡片操作类型
	String KP_CZTYPE_CARDADD 		= "卡片新增";    // 新增
	String KP_CZTYPE_CARDREDUCE		= "卡片减少";  	// 减少
	String KP_CZTYPE_CARDMODIFY 	= "卡片修改";   	// 修改
	String KP_CZTYPE_CARDDEVALUE 	= "卡片减值";  	// 减值
	String KP_CZTYPE_CARDCHANGE 	= "卡片变动";  	// 变动
	String KP_CZTYPE_CARDALLOCATE 	= "卡片调配"; 	// 调配
	String KP_CZTYPE_CARDMERGE 		= "卡片合并";   	// 合并
	String KP_CZTYPE_CARDSPLIT 		= "卡片拆分";   	// 拆分
	
	static final String CHANGE_WAY_YZZJ   = "1";//原币增加
	static final String CHANGE_WAY_YZJS   = "2";//原值减少
	static final String CHANGE_WAY_GLBM   = "3";//管理部门
	static final String CHANGE_WAY_SYBM   = "4";//使用部门
	static final String CHANGE_WAY_SYZK   = "5";//使用状况
	static final String CHANGE_WAY_ZJLX   = "6";//折旧类型
	static final String CHANGE_WAY_SYYX   = "7";//使用月限
	static final String CHANGE_WAY_JCZ	  = "9";//净残值
	static final String CHANGE_WAY_LJZJ   = "10";//累计折旧
	static final String CHANGE_WAY_KPLB   = "11";//卡片类别，
	static final String CHANGE_WAY_ZJFS   = "12";//增加方式
	static final String CHANGE_WAY_ZJCDBM = "13";//折旧承担部门
	static final String CHANGE_WAY_SYR    = "14";//使用人
	
	String ZYZC_ZT_CG = "0";  		//0、采购
	String ZYZC_ZT_ZK = "1";  		//1、在库
	String ZYZC_ZT_JY = "2";  		//2、借用
	String ZYZC_ZT_LY = "3";  		//3、领用
	String ZYZC_ZT_WX = "4";  		//4、维修
	String ZYZC_ZT_BF = "5";  		//5、报废
}
