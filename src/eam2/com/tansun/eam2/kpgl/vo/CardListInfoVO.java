package com.tansun.eam2.kpgl.vo;

import java.lang.reflect.InvocationTargetException;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.Cardinfo;
import com.tansun.rdp4j.common.model.orm.PublicDao;

@Service
public class CardListInfoVO extends Cardinfo {

	private static final long serialVersionUID = -7606415960357479134L;

	private String kplx;
	private String zcbh;
	private String zcmc;

	public void copyProperties(Cardinfo cardinfo) {
		try {
			BeanUtils.copyProperties(this, cardinfo);
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			e.printStackTrace();
		}
	}

	public String getZcbh() {
		return zcbh;
	}

	public String getZcmc() {
		return zcmc;
	}

	public void setZcbh(String zcbh) {
		this.zcbh = zcbh;
	}

	public void setZcmc(String zcmc) {
		this.zcmc = zcmc;
	}

	public String getKplx() {
		return kplx;
	}

	public void setKplx(String kplx) {
		this.kplx = kplx;
	}
}
