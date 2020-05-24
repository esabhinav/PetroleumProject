package com.tnbpda.vo;

import java.io.Serializable;

/**
 * 
 * @author Panneerselvam # CC173813
 *
 */
public class Dealer extends User implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int ccNo;
	private String roName;
	private String firstName;
	private String lastName;
	private String mobileNo;
	private String landLine;
	private String emailID;
	private String officialEmailId;
	private String address1;
	 
	
	private String address2;
	private String post;
	private String city;
	private int zipCode;
	private String district;
	private String supplyLocation;
	private String terriority;
	private String dateOfBirth;
	private String searchText;
	private  boolean association;
	
	private int subscriptinFee;
	
	private boolean lifeMember;
	
	private String lastUpdateDate;
	
	private String clubMember;
	
    private RO ro;
	/**
	 * @return the roName
	 */
	public String getRoName() {
		return roName;
	}
	/**
	 * @param roName the roName to set
	 */
	public void setRoName(String roName) {
		this.roName = roName;
	}
	/**
	 * @return the firstName
	 */
	public String getFirstName() {
		return firstName;
	}
	/**
	 * @param firstName the firstName to set
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return lastName;
	}
	/**
	 * @param lastName the lastName to set
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	/**
	 * @return the mobileNo
	 */
	public String getMobileNo() {
		return mobileNo;
	}
	/**
	 * @param mobileNo the mobileNo to set
	 */
	public void setMobileNo(String mobileNo) {
		this.mobileNo = mobileNo;
	}
	/**
	 * @return the landLine
	 */
	public String getLandLine() {
		return landLine;
	}
	/**
	 * @param landLine the landLine to set
	 */
	public void setLandLine(String landLine) {
		this.landLine = landLine;
	}
	/**
	 * @return the emailID
	 */
	public String getEmailID() {
		return emailID;
	}
	/**
	 * @param emailID the emailID to set
	 */
	public void setEmailID(String emailID) {
		this.emailID = emailID;
	}
	/**
	 * @return the address1
	 */
	public String getAddress1() {
		return address1;
	}
	/**
	 * @param address1 the address1 to set
	 */
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	/**
	 * @return the address2
	 */
	public String getAddress2() {
		return address2;
	}
	/**
	 * @param address2 the address2 to set
	 */
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	/**
	 * @return the post
	 */
	public String getPost() {
		return post;
	}
	/**
	 * @param post the post to set
	 */
	public void setPost(String post) {
		this.post = post;
	}
	/**
	 * @return the zipCode
	 */
	public int getZipCode() {
		return zipCode;
	}
	/**
	 * @param zipCode the zipCode to set
	 */
	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
	}
	/**
	 * @return the district
	 */
	public String getDistrict() {
		return district;
	}
	/**
	 * @param district the district to set
	 */
	public void setDistrict(String district) {
		this.district = district;
	}
	/**
	 * @return the supplyLocation
	 */
	public String getSupplyLocation() {
		return supplyLocation;
	}
	/**
	 * @param supplyLocation the supplyLocation to set
	 */
	public void setSupplyLocation(String supplyLocation) {
		this.supplyLocation = supplyLocation;
	}
	/**
	 * @return the terriority
	 */
	public String getTerriority() {
		return terriority;
	}
	/**
	 * @param terriority the terriority to set
	 */
	public void setTerriority(String terriority) {
		this.terriority = terriority;
	}
	/**
	 * @return the dateOfBirth
	 */
	public String getDateOfBirth() {
		return dateOfBirth;
	}
	/**
	 * @param dateOfBirth the dateOfBirth to set
	 */
	public void setDateOfBirth(String dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}
	/**
	 * @return the association
	 */
	public boolean isAssociation() {
		return association;
	}
	/**
	 * @param association the association to set
	 */
	public void setAssociation(boolean association) {
		this.association = association;
	}
	/**
	 * @return the ccNo
	 */
	public int getCcNo() {
		return ccNo;
	}
	/**
	 * @param ccNo the ccNo to set
	 */
	public void setCcNo(int ccNo) {
		this.ccNo = ccNo;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getSearchText() {
		return searchText;
	}
	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}
	/**
	 * @return the subscriptinFee
	 */
	public int getSubscriptinFee() {
		return subscriptinFee;
	}
	/**
	 * @param subscriptinFee the subscriptinFee to set
	 */
	public void setSubscriptinFee(int subscriptinFee) {
		this.subscriptinFee = subscriptinFee;
	}
	/**
	 * @return the lifeMember
	 */
	public boolean isLifeMember() {
		return lifeMember;
	}
	/**
	 * @param lifeMember the lifeMember to set
	 */
	public void setLifeMember(boolean lifeMember) {
		this.lifeMember = lifeMember;
	}
	/**
	 * @return the ro
	 */
	public RO getRo() {
		return ro;
	}
	/**
	 * @param ro the ro to set
	 */
	public void setRo(RO ro) {
		this.ro = ro;
	}
	/**
	 * @return the officialEmailId
	 */
	public String getOfficialEmailId() {
		return officialEmailId;
	}
	/**
	 * @param officialEmailId the officialEmailId to set
	 */
	public void setOfficialEmailId(String officialEmailId) {
		this.officialEmailId = officialEmailId;
	}
	/**
	 * @return the lastUpdateDate
	 */
	public String getLastUpdateDate() {
		return lastUpdateDate;
	}
	/**
	 * @param lastUpdateDate the lastUpdateDate to set
	 */
	public void setLastUpdateDate(String lastUpdateDate) {
		this.lastUpdateDate = lastUpdateDate;
	}
	/**
	 * @return the clubMember
	 */
	public String getClubMember() {
		return clubMember;
	}
	/**
	 * @param clubMember the clubMember to set
	 */
	public void setClubMember(String clubMember) {
		this.clubMember = clubMember;
	}
}
