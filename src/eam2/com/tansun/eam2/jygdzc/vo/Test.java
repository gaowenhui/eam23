package com.tansun.eam2.jygdzc.vo;

import java.text.NumberFormat;

public class Test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub\
		NumberFormat format = NumberFormat.getInstance();
		
		System.out.println(format.format(new Double(0)));
		System.out.println(new Double("111111111111111"));
	}

}
