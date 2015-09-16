package com.tansun.eam2.common.ucc;

import java.util.List;

import com.tansun.eam2.common.model.orm.bo.Individualtree;

public interface IIndividualTree {
	List<Individualtree> findByTreeTypeArray(String[] treeType);
	Individualtree findByTreeType(String treeType);
	Individualtree findByTreeType(String treeType, String notevalue);
}
