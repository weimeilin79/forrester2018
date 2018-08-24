package org.mycompany;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class SalesReportBean {
	
	
	public Map<String, ArrayList<Integer>> setGraphList(List<Map<String, Object>> sqlresult) {
		
		Map<Timestamp, Map<String, Integer>> timeCache = new HashMap<Timestamp, Map<String, Integer>>();
		
		for(Map<String, Object> rowresult : sqlresult) {
			
			System.out.println("rowresult"+ rowresult);
			Map<String, Integer> allcatCache = (Map<String, Integer>)timeCache.get(rowresult.get("TIMESTAMP"));
			
			if (allcatCache == null) {
				allcatCache = new HashMap<String, Integer>();
			}
			
			allcatCache.put((String)rowresult.get("PRODUCTCATEGORY"), new BigDecimal((Long)rowresult.get("AMT")).intValueExact());
			
			timeCache.put((Timestamp)rowresult.get("TIMESTAMP"), allcatCache);
		}
		
		
		ArrayList<Integer> electronicList = new ArrayList<Integer>();
		ArrayList<Integer> foodList = new ArrayList<Integer>();
		ArrayList<Integer> pharmacyList = new ArrayList<Integer>();
		ArrayList<Integer> toyList = new ArrayList<Integer>();
		ArrayList<Integer> clothingList = new ArrayList<Integer>();
		
		for(Timestamp timestamp : timeCache.keySet()) {
			
			Map<String, Integer>  resultvalue = timeCache.get(timestamp);
			
			Integer electronicValue = ((resultvalue.get("Electronics & Office") == null) ? 0 : resultvalue.get("Electronics & Office"));
			electronicList.add(electronicValue);
			Integer foodValue = ((resultvalue.get("Food, Household & Pets") == null) ? 0 : resultvalue.get("Food, Household & Pets"));
			foodList.add(foodValue);
			
			Integer pharmacyValue = ((resultvalue.get("Pharmacy, Health & Beauty") == null) ? 0 : resultvalue.get("Pharmacy, Health & Beauty"));
			pharmacyList.add(pharmacyValue);
			
			
			Integer toyValue = ((resultvalue.get("Toys & Video Games") == null) ? 0 : resultvalue.get("Toys & Video Games"));
			toyList.add(toyValue);
			
			
			Integer clothingValue = ((resultvalue.get("Clothing, Shoes & Accessories") == null) ? 0 : resultvalue.get("Clothing, Shoes & Accessories"));
			clothingList.add(clothingValue);
			
		}
		
		Map<String, ArrayList<Integer>> returnMap = new HashMap<String, ArrayList<Integer>>();
		returnMap.put("Electronics & Office", electronicList);
		returnMap.put("Food, Household & Pets", foodList);
		returnMap.put("Pharmacy, Health & Beauty", pharmacyList);
		returnMap.put("Toys & Video Games", toyList);
		returnMap.put("Clothing, Shoes & Accessories", clothingList);
		
		return returnMap; 
	}
	
	

}
