package org.mycompany;

public class BonusPoint {
	
	public Integer calculatePoint(Integer orderamt) {
		Long points = Math.round(orderamt/10.0);
		return points.intValue();
	}

}
