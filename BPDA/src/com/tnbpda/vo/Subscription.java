package com.tnbpda.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Subscription implements Serializable {

	private int ccNo;
	private boolean lifeLongSubscription;
	private boolean yearlySubscription;
	private List<SubscriptionPayment> annualPayment;
	private Date subscriptionDate;
	private Date subsEndDate;

	/**
	 * @return the ccNo
	 */
	public int getCcNo() {
		return ccNo;
	}

	/**
	 * @param ccNo
	 *            the ccNo to set
	 */
	public void setCcNo(int ccNo) {
		this.ccNo = ccNo;
	}

	/**
	 * @return the lifeLongSubscription
	 */
	public boolean isLifeLongSubscription() {
		return lifeLongSubscription;
	}

	/**
	 * @param lifeLongSubscription
	 *            the lifeLongSubscription to set
	 */
	public void setLifeLongSubscription(boolean lifeLongSubscription) {
		this.lifeLongSubscription = lifeLongSubscription;
	}

	/**
	 * @return the yearlySubscription
	 */
	public boolean isYearlySubscription() {
		return yearlySubscription;
	}

	/**
	 * @param yearlySubscription
	 *            the yearlySubscription to set
	 */
	public void setYearlySubscription(boolean yearlySubscription) {
		this.yearlySubscription = yearlySubscription;
	}

	/**
	 * @return the subscriptionDate
	 */
	public Date getSubscriptionDate() {
		return subscriptionDate;
	}

	/**
	 * @param subscriptionDate
	 *            the subscriptionDate to set
	 */
	public void setSubscriptionDate(Date subscriptionDate) {
		this.subscriptionDate = subscriptionDate;
	}

	/**
	 * @return the subsEndDate
	 */
	public Date getSubsEndDate() {
		return subsEndDate;
	}

	/**
	 * @param subsEndDate
	 *            the subsEndDate to set
	 */
	public void setSubsEndDate(Date subsEndDate) {
		this.subsEndDate = subsEndDate;
	}

	/**
	 * @return the annualPayment
	 */
	public List<SubscriptionPayment> getAnnualPayment() {
		return annualPayment;
	}

	/**
	 * @param annualPayment
	 *            the annualPayment to set
	 */
	public void setAnnualPayment(List<SubscriptionPayment> annualPayment) {
		this.annualPayment = annualPayment;
	}

}
