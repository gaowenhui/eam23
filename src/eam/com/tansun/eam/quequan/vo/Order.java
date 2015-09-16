package com.tansun.eam.quequan.vo;

import java.io.Serializable;

public class Order implements Serializable {
	String owner;
	public Order(String owner) {
	this.owner = owner;
	}
	public String getOwner() {
	return owner;
	}
	public void setOwner(String owner) {
	this.owner = owner;
	}
}
