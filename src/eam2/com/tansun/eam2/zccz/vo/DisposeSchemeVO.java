package com.tansun.eam2.zccz.vo;

import java.util.List;

import com.tansun.eam2.common.model.orm.bo.Cardinfo;
import com.tansun.eam2.common.model.orm.bo.CzCztzfaXx;

public class DisposeSchemeVO extends CzCztzfaXx{
	
	private static final long serialVersionUID = -7139426686912574622L;

	//主卡片
	private Cardinfo mainCard;
	
	//主卡片ID
	private String cardId;
		
	//挂接卡片列表
	private List<Cardinfo> cardList;
	
	public Cardinfo getMainCard() {
		return mainCard;
	}

	public void setMainCard(Cardinfo mainCard) {
		this.mainCard = mainCard;
	}

	public String getCardId() {
		return cardId;
	}

	public void setCardId(String cardId) {
		this.cardId = cardId;
	}

	public List<Cardinfo> getCardList() {
		return cardList;
	}

	public void setCardList(List<Cardinfo> cardList) {
		this.cardList = cardList;
	}

}
