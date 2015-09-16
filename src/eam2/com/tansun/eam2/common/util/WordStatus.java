package com.tansun.eam2.common.util;

import java.util.List;
import java.util.Map;

import com.tansun.eam2.common.word.components.WordTemplate;
import com.tansun.eam2.common.word.components.WordTemplates;
import com.tansun.rdp4j.common.util.ucc.CommonGlobal;
import com.tansun.rdp4j.file.model.orm.bo.PTAttachment;
import com.tansun.rdp4j.file.service.impl.AttachHandleServiceImpl;

public final class WordStatus {
	public static String getWordStatus(String biaodanid, String wordKey){
		Map<String, WordTemplate> templates = ((WordTemplates)SpringContextHelper.getBean(WordTemplates.class)).getTemplates();
		WordTemplate template = templates.get(wordKey);
		List<PTAttachment> attach = ((AttachHandleServiceImpl)SpringContextHelper.getBean(AttachHandleServiceImpl.class)).queryAttachment(biaodanid, "" + CommonGlobal.ATTACHMENT_WORD_CONTENT, template.getWordTemplateID());
		String status = "0";
		if(attach != null && attach.size() > 0){
			status = attach.get(0).getState();
		}
		return status;
	}
}
