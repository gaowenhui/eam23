package com.tansun.eam2.zccz.ucc.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.CzPgscJl;
import com.tansun.eam2.zccz.service.IEvalQueryBS;
import com.tansun.eam2.zccz.ucc.IEvalQueryUCC;
import com.tansun.eam2.zccz.vo.EvalVO1;
import com.tansun.eam2.zccz.vo.EvalVO2;
import com.tansun.eam2.zccz.vo.EvalVO3;
import com.tansun.eam2.zccz.vo.EvalVO4;
import com.tansun.rdp4j.common.util.Paginator;

@Service
public class EvalQueryUCCImpl implements IEvalQueryUCC {
	@Autowired
	IEvalQueryBS evalQueryBSImpl;

	public void init() {
	}

	public Map<String, String> findYjFl() {
		return evalQueryBSImpl.findYjFl();
	}

	public Map<String, String> findEjFl(String yjFlBm) {
		return evalQueryBSImpl.findEjFl(yjFlBm);
	}

	public CzPgscJl findLXbyID(String strId) {
		return evalQueryBSImpl.findLXbyID(strId);
	}

	public List<EvalVO1> queryCzPgscZskwhCld(Paginator paginator,
			EvalVO1 evalVO1) {
		return evalQueryBSImpl.queryCzPgscZskwhCld(paginator,evalVO1);
	}
	//评估报告问题明细表查询
	public List<EvalVO2> queryCzPgscZskwhCld2(Paginator paginator,
			EvalVO2 evalVO2) {
		return evalQueryBSImpl.queryCzPgscZskwhCld2(paginator, evalVO2);
	}
	//评估审查台账 全口径查询
	public List<EvalVO4> queryCzPgscZskwhCld3(Paginator paginator,
			EvalVO3 evalVO3) {
		return evalQueryBSImpl.queryCzPgscZskwhCld3(paginator,evalVO3);
	}
	//评估审查台账 统计查询
	public List<EvalVO4> queryCzPgscZskwhCld4(Paginator paginator,
			EvalVO3 evalVO3) {
		return evalQueryBSImpl.queryCzPgscZskwhCld4(paginator,evalVO3);
	}
	
	public void updateMemo(String strId, String strMemo) {
		evalQueryBSImpl.updateMemo(strId,strMemo);
	}
}
