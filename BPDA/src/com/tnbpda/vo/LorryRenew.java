package com.tnbpda.vo;

import java.io.Serializable;

public class LorryRenew implements Serializable{
private String renewalType;
private int period;
private String expDate;
private int reminder;
/**
 * @return the renewalType
 */
public String getRenewalType() {
	return renewalType;
}
/**
 * @param renewalType the renewalType to set
 */
public void setRenewalType(String renewalType) {
	this.renewalType = renewalType;
}
/**
 * @return the period
 */
public int getPeriod() {
	return period;
}
/**
 * @param period the period to set
 */
public void setPeriod(int period) {
	this.period = period;
}
/**
 * @return the expDate
 */
public String getExpDate() {
	return expDate;
}
/**
 * @param expDate the expDate to set
 */
public void setExpDate(String expDate) {
	this.expDate = expDate;
}
/**
 * @return the reminder
 */
public int getReminder() {
	return reminder;
}
/**
 * @param reminder the reminder to set
 */
public void setReminder(int reminder) {
	this.reminder = reminder;
}

}
