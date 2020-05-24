package com.tnbpda.vo;

import java.io.Serializable;

public class Message implements Serializable {

	private int mid;
	private String subject;
	private String message;
	private byte category;
	private byte priority;
	private byte supplyLocation;
	private boolean all;
	private byte terriority;
	private String date;
	private String createdBy;
	
	/**
	 * @return the message
	 */
	public String getMessage() {
		return message;
	}
	/**
	 * @param message the message to set
	 */
	public void setMessage(String message) {
		this.message = message;
	}
	/**
	 * @return the category
	 */
	public byte getCategory() {
		return category;
	}
	/**
	 * @param category the category to set
	 */
	public void setCategory(byte category) {
		this.category = category;
	}
	/**
	 * @return the priority
	 */
	public byte getPriority() {
		return priority;
	}
	/**
	 * @param priority the priority to set
	 */
	public void setPriority(byte priority) {
		this.priority = priority;
	}
	public byte getSupplyLocation() {
		return supplyLocation;
	}
	public void setSupplyLocation(byte supplyLocation) {
		this.supplyLocation = supplyLocation;
	}
	public byte getTerriority() {
		return terriority;
	}
	public void setTerriority(byte terriority) {
		this.terriority = terriority;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getMid() {
		return mid;
	}
	public void setMid(int mid) {
		this.mid = mid;
	}
	/**
	 * @return the subject
	 */
	public String getSubject() {
		return subject;
	}
	/**
	 * @param subject the subject to set
	 */
	public void setSubject(String subject) {
		this.subject = subject;
	}
	/**
	 * @return the createdBy
	 */
	public String getCreatedBy() {
		return createdBy;
	}
	/**
	 * @param createdBy the createdBy to set
	 */
	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	/**
	 * @return the all
	 */
	public boolean isAll() {
		return all;
	}
	/**
	 * @param all the all to set
	 */
	public void setAll(boolean all) {
		this.all = all;
	}
	
}
