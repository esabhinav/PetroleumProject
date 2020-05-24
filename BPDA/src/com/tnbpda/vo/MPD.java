package com.tnbpda.vo;

import java.io.Serializable;

public class MPD implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String make;
	private int averageSales;
	private int noOfNozzle;
	public String getMake() {
		return make;
	}
	public void setMake(String make) {
		this.make = make;
	}
 
	public int getNoOfNozzle() {
		return noOfNozzle;
	}
	public void setNoOfNozzle(int noOfNozzle) {
		this.noOfNozzle = noOfNozzle;
	}
	/**
	 * @return the averageSales
	 */
	public int getAverageSales() {
		return averageSales;
	}
	/**
	 * @param averageSales the averageSales to set
	 */
	public void setAverageSales(int averageSales) {
		this.averageSales = averageSales;
	}
}
