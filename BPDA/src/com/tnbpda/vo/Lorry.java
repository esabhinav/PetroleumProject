package com.tnbpda.vo;

import java.io.Serializable;
import java.util.Date;

public class Lorry implements Serializable {
	private int ccid;
	private String registrationNo;
	private int capacity;
	private String dateOfRegistration;
	private String vendorId;
	 public int getCcid() {
		return ccid;
	}
	/**
	 * @param ccid the ccid to set
	 */
	public void setCcid(int ccid) {
		this.ccid = ccid;
	}
	/**
	 * @return the registrationNo
	 */
	public String getRegistrationNo() {
		return registrationNo;
	}
	/**
	 * @param registrationNo the registrationNo to set
	 */
	public void setRegistrationNo(String registrationNo) {
		this.registrationNo = registrationNo;
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
	/**
	 * @return the dateOfRegistration
	 */
	public String getDateOfRegistration() {
		return dateOfRegistration;
	}
	/**
	 * @param dateOfRegistration the dateOfRegistration to set
	 */
	public void setDateOfRegistration(String dateOfRegistration) {
		this.dateOfRegistration = dateOfRegistration;
	}
	public String getVendorId() {
		return vendorId;
	}
	public void setVendorId(String vendorId) {
		this.vendorId = vendorId;
	}
	
	
}
