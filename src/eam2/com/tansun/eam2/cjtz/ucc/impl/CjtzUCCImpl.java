package com.tansun.eam2.cjtz.ucc.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.cjtz.service.ICjtzService;
import com.tansun.eam2.cjtz.ucc.ICjtzUCC;

@Service
public class CjtzUCCImpl implements ICjtzUCC {

	@Autowired
	private ICjtzService bs;
	
	public String findXmxxByZc(String zcId, String zclb){
		return bs.findXmxxByZc( zcId,  zclb);
	}
}
