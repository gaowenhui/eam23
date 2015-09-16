package com.tansun.eam2.jfreeChart;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.io.Reader;
import java.io.StringReader;
import java.util.List;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.JDOMException;
import org.jdom.input.SAXBuilder;

import com.tansun.eam2.jfreeChart.map.ProvincePicture;

public class XML4Chart {

	/**
	 * @param args
	 * @throws IOException
	 * @throws JDOMException
	 */
	public static void main(String[] args) throws JDOMException, IOException {
		StringBuffer sb = new StringBuffer("");
		File file = new File("c:/XML4Chart.xml");

		
		BufferedReader reader = null;
		reader = new BufferedReader(new FileReader(file));
		String tempString = null;
		while ((tempString = reader.readLine()) != null) {
			sb.append(tempString);
		}
		reader.close();

		SAXBuilder builder = new SAXBuilder(false);
		Reader in = new StringReader(sb.toString());
		Document doc = builder.build(in);
		
		Element books = doc.getRootElement();
		
		List list = books.getChildren("percent");
		for (int i = 0; i < list.size(); i++) {
			Element book = (Element) list.get(i);
			List listChild = book.getChildren("childPercent");
			for (int j = 0; j < listChild.size(); j++) {
				Element book1 = (Element) listChild.get(j);
				System.out.print(book1.getTextTrim()+" ");
			}
			System.out.println("");
		}
		
		ProvincePicture p = new ProvincePicture();
		String [][] pic = p.getPic();
		String [] PROVINCE_CN_PY = p.PROVINCE_CN_PY;
		int flag=0;
		for (int j = 0; j < PROVINCE_CN_PY.length; j++) {
			if(PROVINCE_CN_PY[j].equals("河北")){
				flag = j;
				break;
			}
		}
		String []t = pic[flag];
		
	}
}
