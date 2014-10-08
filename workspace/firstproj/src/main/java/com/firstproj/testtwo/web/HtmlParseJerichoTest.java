package com.firstproj.testtwo.web;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import net.htmlparser.jericho.Element;
import net.htmlparser.jericho.HTMLElementName;
import net.htmlparser.jericho.Source;



public class HtmlParseJerichoTest {
	private static void basic() throws IOException, MalformedURLException {
	    Source source = new Source(new URL("http://www.koreabaseball.com/Record/HitterRecord.aspx?sort=HRA"));
	    source.fullSequentialParse();
	     
	    List<Element> elementList = source.getAllElementsByClass("tData");
	    
	    for(Element table : elementList){
	    	
	    	Element thead = table.getAllElements(HTMLElementName.THEAD).get(0);
	    	
	    	
	    	List<Element> th = thead.getAllElements(HTMLElementName.TH);
	    	
	    	Element tbody = table.getAllElements(HTMLElementName.TBODY).get(0);
	    	List<Element> tr = tbody.getAllElements(HTMLElementName.TR);
	    	
	    	List<String> attrList = new ArrayList<String>();
	    	
	    	for(Element attrName : th){
	    		String attrValue = attrName.getTextExtractor().toString();
	    		attrList.add(attrValue);
	    	}

	    	for(Element trElem : tr){
	    		
	    		List<Element> td = trElem.getAllElements(HTMLElementName.TD);
	    		StringBuilder sb = new StringBuilder();
	    		for(Element tdElem : td){
	    			
		    		sb.append(":" + tdElem.getTextExtractor().toString());	
		    		
	    		}
	    		System.out.println(sb.toString());
	    	}	    
	    }
	    // id 로 찾을 수 있다.
//	    Element div = source.getElementById("ranklst_total_day");
	     
	    // 자식 엘레멘트를 찾을 때 특정 엘레멘트만 찾도록 할 수 있다.
	    // 하나의 자식 엘레멘트만 가져오는 API 가 없어서 index 0 으로 찾아야 한다. 
//	    Element ul = div.getAllElements(HTMLElementName.UL).get(0);
//	    List<Element> liList = ul.getAllElements(HTMLElementName.LI);
	     
//	    for (Element li : liList) {
//	        Element dl = li.getAllElements(HTMLElementName.DL).get(0);
//	         
//	        Element dt = dl.getAllElements(HTMLElementName.DT).get(0);
//	        Element dd = dl.getAllElements(HTMLElementName.DD).get(0);
//	 
//	        // getAttributeValue 를 통해 엘레멘트의 속성을 가져 올 수 있다.
//	        String rank = dt.getAttributeValue("class").split(" ")[0].substring(6);
//	        String content = dt.getContent().getTextExtractor().toString();
//	         
//	        String position1 = dd.getAttributeValue("class").split(" ")[1];
//	        String position2 = dd.getContent().getTextExtractor().toString();
//	         
//	        System.out.println(rank + " " + content + " 변동폭(" + position1 + position2 + ")");
//	    }
	}	
	
	public static void main(String[] args) throws MalformedURLException, IOException{
		HtmlParseJerichoTest.basic();
	}
}
