package com.tnbpda.vo;

import java.io.Serializable;

public class Tank implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String product;
	private int capacity;
	private String yearOfBuild;
	private int noOfTanks;
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public String getYearOfBuild() {
		return yearOfBuild;
	}
	public void setYearOfBuild(String yearOfBuild) {
		this.yearOfBuild = yearOfBuild;
	}
	/**
	 * @return the noOfTanks
	 */
	public int getNoOfTanks() {
		return noOfTanks;
	}
	/**
	 * @param noOfTanks the noOfTanks to set
	 */
	public void setNoOfTanks(int noOfTanks) {
		this.noOfTanks = noOfTanks;
	}
}
