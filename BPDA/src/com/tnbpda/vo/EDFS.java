package com.tnbpda.vo;

import java.io.Serializable;

public class EDFS implements Serializable{
/**
	 * 
	 */
private static final long serialVersionUID = 1L;
private boolean availed;
private String bank;
/**
 * @return the availed
 */
public boolean isAvailed() {
	return availed;
}
/**
 * @param availed the availed to set
 */
public void setAvailed(boolean availed) {
	this.availed = availed;
}
/**
 * @return the bank
 */
public String getBank() {
	return bank;
}
/**
 * @param bank the bank to set
 */
public void setBank(String bank) {
	this.bank = bank;
}

}
