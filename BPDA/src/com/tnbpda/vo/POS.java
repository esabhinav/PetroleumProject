package com.tnbpda.vo;

import java.io.Serializable;

public class POS implements Serializable {
	private boolean available;
	private int quantity;
	private String banks;

	/**
	 * @return the quantity
	 */
	public int getQuantity() {
		return quantity;
	}

	/**
	 * @param quantity
	 *            the quantity to set
	 */
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	/**
	 * @return the banks
	 */
	public String getBanks() {
		return banks;
	}

	/**
	 * @param banks
	 *            the banks to set
	 */
	public void setBanks(String banks) {
		this.banks = banks;
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
}
