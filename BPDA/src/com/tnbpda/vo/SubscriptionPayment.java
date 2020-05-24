package com.tnbpda.vo;

import java.io.Serializable;
import java.util.Date;

public class SubscriptionPayment implements Serializable {

	private String type;
	private Date subSciptionDate;
	private int subscriptionYear;
	private int amount;
	/**
	 * @return the type
	 */
	public String getType() {
		return type;
	}
	/**
	 * @param type the type to set
	 */
	public void setType(String type) {
		this.type = type;
	}
	/**
	 * @return the subSciptionDate
	 */
	public Date getSubSciptionDate() {
		return subSciptionDate;
	}
	/**
	 * @param subSciptionDate the subSciptionDate to set
	 */
	public void setSubSciptionDate(Date subSciptionDate) {
		this.subSciptionDate = subSciptionDate;
	}
	/**
	 * @return the subscriptionYear
	 */
	public int getSubscriptionYear() {
		return subscriptionYear;
	}
	/**
	 * @param subscriptionYear the subscriptionYear to set
	 */
	public void setSubscriptionYear(int subscriptionYear) {
		this.subscriptionYear = subscriptionYear;
	}
	/**
	 * @return the amount
	 */
	public int getAmount() {
		return amount;
	}
	/**
	 * @param amount the amount to set
	 */
	public void setAmount(int amount) {
		this.amount = amount;
	}
}
