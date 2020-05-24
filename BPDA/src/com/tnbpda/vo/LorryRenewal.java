package com.tnbpda.vo;

import java.io.Serializable;
import java.util.Date;

public class LorryRenewal implements Serializable {
	private String registrationNo;
	private String tLInsurDate;
	private String cLLInsurDate;
	private String fCDate;
	private String calibrationDate;
	private String explosiveDate;
	private String roadTaxDate;
	private String permitDate;
	private String fireGunDate;
	private boolean crewInsurance;
	private boolean lorryToll;
	private boolean rentalBill;
	
	/**
	 * @return the crewInsurance
	 */
	public boolean isCrewInsurance() {
		return crewInsurance;
	}
	/**
	 * @param crewInsurance the crewInsurance to set
	 */
	public void setCrewInsurance(boolean crewInsurance) {
		this.crewInsurance = crewInsurance;
	}
	/**
	 * @return the lorryToll
	 */
	public boolean isLorryToll() {
		return lorryToll;
	}
	/**
	 * @param lorryToll the lorryToll to set
	 */
	public void setLorryToll(boolean lorryToll) {
		this.lorryToll = lorryToll;
	}
	/**
	 * @return the rentalBill
	 */
	public boolean isRentalBill() {
		return rentalBill;
	}
	/**
	 * @param rentalBill the rentalBill to set
	 */
	public void setRentalBill(boolean rentalBill) {
		this.rentalBill = rentalBill;
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
	 * @return the tLInsurDate
	 */
	public String gettLInsurDate() {
		return tLInsurDate;
	}
	/**
	 * @param tLInsurDate the tLInsurDate to set
	 */
	public void settLInsurDate(String tLInsurDate) {
		this.tLInsurDate = tLInsurDate;
	}
	/**
	 * @return the cLLInsurDate
	 */
	public String getcLLInsurDate() {
		return cLLInsurDate;
	}
	/**
	 * @param cLLInsurDate the cLLInsurDate to set
	 */
	public void setcLLInsurDate(String cLLInsurDate) {
		this.cLLInsurDate = cLLInsurDate;
	}
	/**
	 * @return the fCDate
	 */
	public String getfCDate() {
		return fCDate;
	}
	/**
	 * @param fCDate the fCDate to set
	 */
	public void setfCDate(String fCDate) {
		this.fCDate = fCDate;
	}
	/**
	 * @return the calibrationDate
	 */
	public String getCalibrationDate() {
		return calibrationDate;
	}
	/**
	 * @param calibrationDate the calibrationDate to set
	 */
	public void setCalibrationDate(String calibrationDate) {
		this.calibrationDate = calibrationDate;
	}
	/**
	 * @return the explosiveDate
	 */
	public String getExplosiveDate() {
		return explosiveDate;
	}
	/**
	 * @param explosiveDate the explosiveDate to set
	 */
	public void setExplosiveDate(String explosiveDate) {
		this.explosiveDate = explosiveDate;
	}
	/**
	 * @return the roadTaxDate
	 */
	public String getRoadTaxDate() {
		return roadTaxDate;
	}
	/**
	 * @param roadTaxDate the roadTaxDate to set
	 */
	public void setRoadTaxDate(String roadTaxDate) {
		this.roadTaxDate = roadTaxDate;
	}
	/**
	 * @return the permitDate
	 */
	public String getPermitDate() {
		return permitDate;
	}
	/**
	 * @param permitDate the permitDate to set
	 */
	public void setPermitDate(String permitDate) {
		this.permitDate = permitDate;
	}
	/**
	 * @return the fireGunDate
	 */
	public String getFireGunDate() {
		return fireGunDate;
	}
	/**
	 * @param fireGunDate the fireGunDate to set
	 */
	public void setFireGunDate(String fireGunDate) {
		this.fireGunDate = fireGunDate;
	}
	
}
