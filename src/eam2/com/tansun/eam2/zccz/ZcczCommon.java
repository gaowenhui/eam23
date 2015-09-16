package com.tansun.eam2.zccz;

public interface ZcczCommon {

	//处置、评估资产类别          
	String MANAGE_FIXED_ASSEET = "0";     //经营性固产
	String ENTITY_ASSET = "1";			  //实体内资产
	String LOAN_PLEDGE = "2";             //委贷抵债物
	String ENTITY = "3";             	  //实体（承继投资使用、评估审查使用）
	String ZYZC_ASSET = "4";              //自用资产
	String DEALING_ASSET = "5";           //待处置类固定资产
	String ENTRUST_ASSET = "6";           //受托固定资产
	String STOCK = "7";                   //债券
	
	//处置项目分类 			
	String ITEM_FOR_FIXED_ASSET = "0";      	// 0：经营性固产处置项目,对应表单资产处置投资方案信息表CZ_CZTZFA_XX 
	String ITEM_FOR_ENTITY_ASSET = "1";     	//1：实体内资产处置项目,对应表单资产处置投资方案信息表CZ_CZTZFA_XX，st_fsxx
	String ITEM_FOR_LOAN_PLEDGE_ASSET = "2"; 	//2：委贷抵债物处置项目,对应表单资产处置投资方案信息表CZ_CZTZFA_XX  st_fsxx
	String ITEM_FOR_ENTITY = "3";               //3：实体整体处置项目,对应表单实体整体处置人员安置及实体承继投资CZ_STCZTZ st_jbxx
	String ITEM_FOR_ENTITY_PERSON = "4";        //4：实体人员安置项目,对应表单实体整体处置人员安置及实体承继投资CZ_STCZTZ st_fsxx
	String ITEM_FOR_INVESTMENT = "5";            //5：承继投资项目,对应表单资产处置投资方案信息表CZ_CZTZFA_XX	
	//-------------------新增加处置项目-----------------------
	String ITEM_FOR_ZYZC = "6";                   //自用资产,对应表单资产处置投资方案信息表CZ_CZTZFA_XX     zy_zc
	String ITEM_FOR_DEALING_ASSET = "7";          //待处置类固定资产,对应表单资产处置投资方案信息表CZ_CZTZFA_XX  
	String ITEM_FOR_ENTRUST_ASSET = "8";          //受托固定资产,对应表单资产处置投资方案信息表CZ_CZTZFA_XX   
	String ITEM_FOR_STOCK = "9";				  //债券,对应表单资产处置投资方案信息表CZ_CZTZFA_XX     stock_info
	String ITEM_FOR_ENTRUST_DEBT = "10";          //受托债权,对应表单实体整体处置人员安置及实体承继投资CZ_STCZTZ DEBT_INFO
	
	
	//处置申报方式
	String SCHEME_FIRST_APPLY = "0";             //首次
	String SCHEME_SECOND_APPLY = "1";			 //重报
	String SCHEME_CHANGE_APPLY = "2";            //变更
	
	//处理单状态
	String FORM_HAVE_NOT_APPROVED = "0";        //未审批
	String FORM_IS_APPROVING = "1";             //审批中
	String FORM_HAVE_APPROVED = "2";             //审批结束
	String FORM_BE_RETURN = "3";             	//被退回
	String FORM_BE_ABANDONED = "4";                //被作废
	
	//处置资产状态
	String ASSET_HAVE_NOT_APPROVED = "0";        //未审批
	String ASSET_IS_APPROVING = "1";             //审批中
	String ASSET_HAVE_APPROVED = "2";             //已审批
	String ASSET_BE_ABANDONED = "3";             //流程被作废
	String ASSET_BE_DELETED= "4";             	//被删除
	
	//CZ_XM_SPW_YJ是主持人or审批委员
	String DEALTODO_ZCR  	  = "1";				//主持人 added by lantianbo
	String DEALTODO_SPWY 	  = "0";				//审批委员
	
	//CZ_XMXX_LSB中处置项目状态
	String DEALTODO_XMZT_WSH  = "0";				//0：未上会
	String DEALTODO_XMZT_SHZ  = "1";				//1：上会中
	String DEALTODO_XMZT_SHWB = "2";				//2：上会完毕
	String DEALTODO_XMZT_WYTJYJZ = "3";             //3: 委员提交意见中（发送委员材料后）
	String DEALTODO_XMZT_WYTJYJZWB = "4";    		//4: 委员提交意见完毕（所有的委员提交意见后）
	String DEALTODO_XMZT_ZCRTJYJZ = "5";    		//5: 主持人提交意见中（待办发送到主持人审批环节）
	String DEALTODO_XMZT_YJHZZ = "6";    			//6: 意见汇总中（主持人提交意见完毕）
	String DEALTODO_XMZT_YJHZWB = "7";				//7: 意见汇总完毕（汇总意见人办结）
	//会议状态
	String MEETING_STATE_SHZ = "0";                 //0:上会中（组织会议后）
	String MEETING_STATE_HYJYZLZ = "1";             //1:会议纪要整理人（发送会议纪要环节后）
	String MEETING_STATE_SHWB = "2";                //2:会议完毕（OA返回会议纪要信息后）
	

	//cz_hyxx中会签会议
	String DEALTODO_HUIYI	  = "1";				//会议
	String DEALTODO_HUIQIAN	  = "2";				//会签
	
	//角色
	String DEALTODO_ROLE_ZCR  = "143";				//资产处置主持人角色
	String DEALTODO_ROLE_SPWY = "142";				//资产处置审批委员角色
	String CJTZ_ROLE_ZCR = "140";				//资产处置审批委员角色
	String CJTZ_ROLE_SPWY = "139";				//资产处置审批委员角色
	
	//会议下项目排序sortType
	String SORT_SYI 	= "1";							//上移
	String SORT_XYI 	= "2";							//下移
	String SORT_ZDING   = "3";							//置顶
	String SORT_ZDI 	= "4";							//置底
	
	//CZ_XM_SPW_YJ 是否提交意见
	String DEALTODO_TJYJ_SHI = "1";				//提交意见
	String DEALTODO_TJYJ_FOU = "0";				//未提交意见
	
	//CZ_XM_SPW_YJ 是否同意
	Long DEALTODO_TONGYI   = 1l;				//tongyi
	Long DEALTODO_BUTONGYI = 0l;				//不同意
	
	//CZ_XM_SPW_YJ 是否提交意见
	String SHZT_WYTJYJZ = "委员提交意见中";	//委员提交意见中
	String SHZT_ZCRSP = "主持人审批";			//主持人审批
	
	//项目类型	
	String DEAL_XMLX_TZ = "1";				//投资项目
	String DEAL_XMLX_CZ = "0";				//处置项目
	
	//业务类型
	String DISPOSE_TYPE_GDZCCZ = "20";		//固定资产处置
	String DISPOSE_TYPE_STZTCZ = "21";		//实体整体处置
	String DISPOSE_TYPE_STRYCZ = "22";		//实体人员安置
	
	//项目状态
	String PROJECT_TYPE_WZX = "0";			//处置方案未执行
	String PROJECT_TYPE_ZXZ = "1";			//处置方案执行中
	String PROJECT_TYPE_YJA = "2";			//已结案
	
	//项目状态中文
	String PROJECT_TYPE_WZX_ZH = "处置方案未执行";			//处置方案未执行
	String PROJECT_TYPE_ZXZ_ZH = "处置方案执行中";			//处置方案执行中
	String PROJECT_TYPE_YJA_ZH = "已结案";				//已结案
	
	//资产处置模块流程名称
	String PROCESS_NAME_ASSET_DISPOSE = "资产处置";
	String PROCESS_NAME_ENTITY_DISPOSE = "实体整体处置";
	String PROCESS_NAME_ENTITY_PERSON_DISPOSE = "实体人员安置";
	String PROCESS_NAME_PGSC = "评估审查";
	String PROCESS_NAME_SHANGHUI = "上会流程";
	
	//处置方式
	String DISPOSE_GKPM_MAIN	= "disposeGkpmMain";	//公开拍卖
	String DISPOSE_JYSGP_MAIN	= "disposeJysgpMain";	//交易所挂牌
	String DISPOSE_XYZR_MAIN	= "disposeXyzrMain";	//协议转让
	String DISPOSE_CQ_MAIN		= "disposeCqMain";		//拆迁
	String DISPOSE_PCZX_MAIN	= "disposePczxMain";	//破产注销
	String DISPOSE_QSZX_MAIN	= "disposeQszxMain";	//清算注销
	String DISPOSE_GQZR_MAIN	= "disposeGqzrMain";	//股权转让
	String DISPOSE_STRYAZ_MAIN	= "disposeStryazMain";	//实体人员安置
	String DISPOSE_ZXQK_MAIN	= "disposeZxqkMain";	//执行情况
	
	//处置方式
	String DISPOSE_GKPM_TYPE	= "zc1";	//公开拍卖
	String DISPOSE_JYSGP_TYPE	= "zc2";	//交易所挂牌
	String DISPOSE_XYZR_TYPE	= "zc3";	//协议转让
	String DISPOSE_CQ_TYPE		= "zc4";	//拆迁
	String DISPOSE_PCZX_TYPE	= "st1";	//破产注销
	String DISPOSE_QSZX_TYPE	= "st2";	//清算注销
	String DISPOSE_GQZR_TYPE	= "st3";	//股权转让
	String DISPOSE_STRYAZ_TYPE	= "st4";	//实体人员安置
	String DISPOSE_ZXQK_TYPE	= "zxqk";	//执行情况
	
	//资产处置方式
	//value:"1:公开拍卖;2:交易所挂牌;3:协议转让;4:拆迁;5:其他"
	String ZC_DISPOSE_TYPE_GKPM = "1";
	String ZC_DISPOSE_TYPE_JYSGP = "2";
	String ZC_DISPOSE_TYPE_XYZR = "3";
	String ZC_DISPOSE_TYPE_CQ = "4";
	String ZC_DISPOSE_TYPE_QT = "5";
	
	//附属信息类型
	String DISPOSE_ADJUNCT_WCGPM = "wcgpm";
	

}
