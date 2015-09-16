package com.tansun.eam2.zccz.ucc;

public interface IDealTrace5HeadService {

	

	/**
	 * 新建入口
	 */
	public void newHead();    
	
	/**
	 * 草稿箱入口
	 */
	public void viewDraft();  
	
	
	/**
	 * 待办入口
	 */
	public void viewToDo();   
	
	/**
	 * 已办入口
	 */
	public void viewDone();   
	
	/**
	 * 办结入口
	 */
	public void viewFinished();
	
	/**
	 * 作废入口
	 */
	public void viewRubbish();
}
