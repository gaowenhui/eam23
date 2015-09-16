package com.tansun.eam2.common.ucc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tansun.eam2.common.model.orm.bo.Individualtree;
import com.tansun.rdp4j.common.model.orm.PublicDao;

@Service("iTreeUcc")
public class IndividualTreeImpl implements IIndividualTree {
	
	@Autowired
	private PublicDao publicDao;
	
	public PublicDao getPublicDao() {
		return publicDao;
	}

	public void setPublicDao(PublicDao publicDao) {
		this.publicDao = publicDao;
	}
	
	@SuppressWarnings("unchecked")
	public List<Individualtree> findByTreeTypeArray(String[] treeType) {
		String sql = "From Individualtree t where t.treetype in (";
		for (int i = 0; i < treeType.length; i++) {
			sql +="?";
			if(i != treeType.length - 1){
				sql += ",";
			}
			
		}
		sql +=") and t.activitystatus='Y' and t.rootnote='Y' ";
		List<Individualtree> result = (List<Individualtree>)publicDao.find(sql, treeType);
		return result;
	}
	
	public Individualtree findByTreeType(String treeType) {
		Individualtree tree = (Individualtree)publicDao.findSingleResult("From Individualtree t where t.treetype=? and t.activitystatus='Y' and t.rootnote='Y' ", new String[]{treeType});
		return tree;
	}
	
	public Individualtree findByTreeType(String treeType, String nodeValue) {
		Individualtree tree = (Individualtree)publicDao.findSingleResult("From Individualtree t where t.treetype=? and t.nodevalue=?", new String[]{treeType, nodeValue});
		return tree;
	}

}
