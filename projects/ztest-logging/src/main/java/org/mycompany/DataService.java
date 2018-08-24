package org.mycompany;

import java.util.Random;

public class DataService {
	
	//String channel; 
	//String location;
	//String region;
	//Integer orderamt;
	
	private static String[] Channels = {"WEB","SHOP","MINI-SHOP"};
	private static String[] Regions = {"APAC","EMEA","LTAM","NA"};
	
	
	private static String[] Beginning = { "Kr", "Ca", "Ra", "Mrok", "Cru",
	         "Ray", "Bre", "Zed", "Drak", "Mor", "Jag", "Mer", "Jar", "Mjol",
	         "Zork", "Mad", "Cry", "Zur", "Creo", "Azak", "Azur", "Rei", "Cro",
	         "Mar", "Luk" };
	private static String[] Middle = { "air", "ir", "mi", "sor", "mee", "clo",
	         "red", "cra", "ark", "arc", "miri", "lori", "cres", "mur", "zer",
	         "marac", "zoir", "slamar", "salmar", "urak" };
	private static String[] End = { "d", "ed", "ark", "arc", "es", "er", "der",
	         "tron", "med", "ure", "zur", "cred", "mur" };
	   
	private static Random rand = new Random();

	private String generateChannel() {
		return Channels[rand.nextInt(Channels.length)];
	}

	private String generateLocation() {
		return Beginning[rand.nextInt(Beginning.length)] + Middle[rand.nextInt(Middle.length)]+ End[rand.nextInt(End.length)];
	}
	
	private String generateRegion() {
		return Regions[rand.nextInt(Regions.length)];
	}
	
	private Integer generateOrderamt() {
		return rand.nextInt(900);
	}
	
	public Order genOrder() {
		
		Order order = new Order();
		order.setChannel(this.generateChannel());
		order.setLocation(this.generateLocation());
		order.setRegion(this.generateRegion());
		order.setOrderamt(this.generateOrderamt());
		return order;
	}
	
	
}
