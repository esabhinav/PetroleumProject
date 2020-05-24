package com.tnbpda.vo;

import java.io.Serializable;

public class Solar implements Serializable{
    private boolean available;
	private int capacity;
	private String make;
 
	/**
	 * @return the make
	 */
	public String getMake() {
		return make;
	}
	/**
	 * @param make the make to set
	 */
	public void setMake(String make) {
		this.make = make;
	}
	/**
	 * @return the available
	 */
	public boolean isAvailable() {
		return available;
	}
	/**
	 * @param available the available to set
	 */
	public void setAvailable(boolean available) {
		this.available = available;
	}
	/**
	 * @return the capacity
	 */
	public int getCapacity() {
		return capacity;
	}
	/**
	 * @param capacity the capacity to set
	 */
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	
}
