package com.tnbpda.vo;

import java.io.Serializable;

public class Feedback implements Serializable  {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int fid;
	private int rating;
	private String interestModule;
	private String ccNo;
	private String date;
	private String feedback;
	private String status;
	 
	/**
	 * @return the ccNo
	 */
	public String getCcNo() {
		return ccNo;
	}
	/**
	 * @param ccNo the ccNo to set
	 */
	public void setCcNo(String ccNo) {
		this.ccNo = ccNo;
	}
	/**
	 * @return the date
	 */
	public String getDate() {
		return date;
	}
	/**
	 * @param date the date to set
	 */
	public void setDate(String date) {
		this.date = date;
	}
	/**
	 * @return the feedback
	 */
	public String getFeedback() {
		return feedback;
	}
	/**
	 * @param feedback the feedback to set
	 */
	public void setFeedback(String feedback) {
		this.feedback = feedback;
	}
	/**
	 * @return the fid
	 */
	public int getFid() {
		return fid;
	}
	/**
	 * @param fid the fid to set
	 */
	public void setFid(int fid) {
		this.fid = fid;
	}
	/**
	 * @return the rating
	 */
	public int getRating() {
		return rating;
	}
	/**
	 * @param rating the rating to set
	 */
	public void setRating(int rating) {
		this.rating = rating;
	}
	/**
	 * @return the interestModule
	 */
	public String getInterestModule() {
		return interestModule;
	}
	/**
	 * @param interestModule the interestModule to set
	 */
	public void setInterestModule(String interestModule) {
		this.interestModule = interestModule;
	}
	/**
	 * @return the status
	 */
	public String getStatus() {
		return status;
	}
	/**
	 * @param status the status to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}

}