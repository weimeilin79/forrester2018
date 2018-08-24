package org.mycompany;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

public class DataService {
	
	Map<String, Object> result = new HashMap<String, Object>();
	
	
	public Map<String, Object> createData(ArrayList<Object> sqlresult) {
		Map<String, Object> result = new LinkedHashMap<String, Object>();
		
		result.put("orderid", "123");
		result.put("customer", "Christina");
		result.put("arrivaltime", "1534951955911");
		result.put("orderdata", sqlresult);
		
		return result;
		
		
	}
	

}
