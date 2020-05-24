package com.tnbpda.vo;

import java.io.Serializable;
import java.util.Date;

public class Calibration implements Serializable {

	private String ccNo;
	private Date pumpCalibrateDate;
	private Date fiveLitrDate;
	private Date fireExtingDate;
	private String hrdroMeterMSNo;
	private Date hrdroMeterMSDate;
	private String hrdroMeterHSDNo;
	private Date hrdroMeterHSDDate;
	private String theromMeterNo;
	private Date theromMeterDate;
	private boolean update;

	/**
	 * @return the ccNo
	 */
	public String getCcNo() {
		return ccNo;
	}

	/**
	 * @param ccNo
	 *            the ccNo to set
	 */
	public void setCcNo(String ccNo) {
		this.ccNo = ccNo;
	}

	/**
	 * @return the pumpCalibrateDate
	 */
	public Date getPumpCalibrateDate() {
		return pumpCalibrateDate;
	}

	/**
	 * @param pumpCalibrateDate
	 *            the pumpCalibrateDate to set
	 */
	public void setPumpCalibrateDate(Date pumpCalibrateDate) {
		this.pumpCalibrateDate = pumpCalibrateDate;
	}

	/**
	 * @return the fiveLitrDate
	 */
	public Date getFiveLitrDate() {
		return fiveLitrDate;
	}

	/**
	 * @param fiveLitrDate
	 *            the fiveLitrDate to set
	 */
	public void setFiveLitrDate(Date fiveLitrDate) {
		this.fiveLitrDate = fiveLitrDate;
	}

	/**
	 * @return the fireExtingDate
	 */
	public Date getFireExtingDate() {
		return fireExtingDate;
	}

	/**
	 * @param fireExtingDate
	 *            the fireExtingDate to set
	 */
	public void setFireExtingDate(Date fireExtingDate) {
		this.fireExtingDate = fireExtingDate;
	}

	/**
	 * @return the hrdroMeterMSDate
	 */
	public Date getHrdroMeterMSDate() {
		return hrdroMeterMSDate;
	}

	/**
	 * @param hrdroMeterMSDate
	 *            the hrdroMeterMSDate to set
	 */
	public void setHrdroMeterMSDate(Date hrdroMeterMSDate) {
		this.hrdroMeterMSDate = hrdroMeterMSDate;
	}

	/**
	 * @return the hrdroMeterHSDDate
	 */
	public Date getHrdroMeterHSDDate() {
		return hrdroMeterHSDDate;
	}

	/**
	 * @param hrdroMeterHSDDate
	 *            the hrdroMeterHSDDate to set
	 */
	public void setHrdroMeterHSDDate(Date hrdroMeterHSDDate) {
		this.hrdroMeterHSDDate = hrdroMeterHSDDate;
	}

	/**
	 * @return the theromMeterDate
	 */
	public Date getTheromMeterDate() {
		return theromMeterDate;
	}

	/**
	 * @param theromMeterDate
	 *            the theromMeterDate to set
	 */
	public void setTheromMeterDate(Date theromMeterDate) {
		this.theromMeterDate = theromMeterDate;
	}

	/**
	 * @return the hrdroMeterMSNo
	 */
	public String getHrdroMeterMSNo() {
		return hrdroMeterMSNo;
	}

	/**
	 * @param hrdroMeterMSNo
	 *            the hrdroMeterMSNo to set
	 */
	public void setHrdroMeterMSNo(String hrdroMeterMSNo) {
		this.hrdroMeterMSNo = hrdroMeterMSNo;
	}

	/**
	 * @return the hrdroMeterHSDNo
	 */
	public String getHrdroMeterHSDNo() {
		return hrdroMeterHSDNo;
	}

	/**
	 * @param hrdroMeterHSDNo
	 *            the hrdroMeterHSDNo to set
	 */
	public void setHrdroMeterHSDNo(String hrdroMeterHSDNo) {
		this.hrdroMeterHSDNo = hrdroMeterHSDNo;
	}

	/**
	 * @return the theromMeterNo
	 */
	public String getTheromMeterNo() {
		return theromMeterNo;
	}

	/**
	 * @param theromMeterNo
	 *            the theromMeterNo to set
	 */
	public void setTheromMeterNo(String theromMeterNo) {
		this.theromMeterNo = theromMeterNo;
	}

	/**
	 * @return the update
	 */
	public boolean isUpdate() {
		return update;
	}

	/**
	 * @param update the update to set
	 */
	public void setUpdate(boolean update) {
		this.update = update;
	}

}
