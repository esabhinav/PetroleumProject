package com.tnbpda.vo;

import java.io.Serializable;
import java.util.Date;

public class Customer implements Serializable{
	private int cid;
	private String name;
	private String mobileNo;
	private String aharNo;
	private String tno;
	private float dueAmount;
	private String date;
	private String comments;
	private String approverComments;
	private String closerComments;
	private int ccNo;
	private int district;
	private String searchText;
	/** P- Pending, A- Active, C-closed */
	private String status;
	private String vechNo;
	private String address;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMobileNo() {
		return mobileNo;
	}
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	public String getAharNo() {
		return aharNo;
	}
	public void setAharNo(String aharNo) {
		this.aharNo = aharNo;
	}
 
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public int getCcNo() {
		return ccNo;
	}
	public void setCcNo(int ccNo) {
		this.ccNo = ccNo;
	}
	public int getDistrict() {
		return district;
	}
	public void setDistrict(int district) {
		this.district = district;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	public String getTno() {
		return tno;
	}
	public void setTno(String tno) {
		this.tno = tno;
	}
	public int getCid() {
		return cid;
	}
	public void setCid(int cid) {
		this.cid = cid;
	}
	public float getDueAmount() {
		return dueAmount;
	}
	public void setDueAmount(float dueAmount) {
		this.dueAmount = dueAmount;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getVechNo() {
		return vechNo;
	}
	public void setVechNo(String vechNo) {
		this.vechNo = vechNo;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getApproverComments() {
		return approverComments;
	}
	public void setApproverComments(String approverComments) {
		this.approverComments = approverComments;
	}
	/**
	 * @return the closerComments
	 */
	public String getCloserComments() {
		return closerComments;
	}
	/**
	 * @param closerComments the closerComments to set
	 */
	public void setCloserComments(String closerComments) {
		this.closerComments = closerComments;
	}
}
