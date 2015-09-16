package com.tansun.eam2.zccz.ucc;

import java.lang.reflect.InvocationTargetException;

import com.tansun.eam2.common.model.orm.bo.CzCztzfaXx;
import com.tansun.eam2.common.model.orm.bo.CzStcztz;
import com.tansun.eam2.common.model.orm.bo.CzXmSpwYj;
import com.tansun.eam2.common.model.orm.bo.CzXmxxLsb;
import com.tansun.eam2.zccz.vo.CzXmxxLsbVO;

public interface IApproveAdviceUCC {

	public CzXmxxLsbVO getXmxxByAdviceId(String czXmSpwYjId) throws IllegalAccessException, InvocationTargetException;
	
	public CzStcztz getHeadByAdviceId(String czXmSpwYjId);
	
	public CzXmSpwYj getCzXmSpwYjById(String id);
	
	public void update6Items(CzXmSpwYj czXmSpwYj);
	
	public CzStcztz getHeadByXiangmuId(String xiangmuId);
	
	public CzCztzfaXx getDisposeHeadByAdviceId(String czXmSpwYjId);
	
	public CzCztzfaXx getDisposeHeadByXiangmuId(String xiangmuId);
	
	public CzXmSpwYj getCzXmSpwYjByXmIdWyId(String xmId, String spwy);
	
	public CzXmxxLsbVO getXmxxByXmId(String xmId) throws IllegalAccessException, InvocationTargetException;
	
	public boolean isAllYjTjInXm(String id);
	
	public void todoToDid(String todoId);
}
