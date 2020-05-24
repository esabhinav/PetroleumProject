package com.tnbpda.vo;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class RO implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String ccNo;
	private Map<String, MPD> mpdList; //
	private Map<String, Tank> tankList;
	private Map<String, Pump> pumpList;
	private EDFS edfs;

	private boolean isCanopy;
 
	private boolean automated;
	private boolean isPayOver;
 
	private boolean inOut;
	private boolean isATM;
	private String explosiveLic;
	private boolean cms;
	//private boolean pos;

	private String roType;
	private String generalComments;
	private String commisionDate;
	private String dealShipStatus;//
	private String rot;

	private String streetLights;
	private String canopyLights;
	private Generator generator;
	private Solar solar;
    private CMS fleet;
    private POS pos;
    private int lorry12kl;
    private int lorry20kl;
    private int lorry24kl;
    private boolean updated;
    
	public RO() {
		mpdList = new HashMap<String, MPD>();
		tankList = new HashMap<String, Tank>();
		pumpList = new HashMap<String, Pump>();

		mpdList.put("MS", new MPD());
		mpdList.put("Speed", new MPD());

		mpdList.put("Speed97", new MPD());

		mpdList.put("HSD", new MPD());

		mpdList.put("HiSpeed", new MPD());

		tankList.put("MS", new Tank());
		tankList.put("Speed", new Tank());
		tankList.put("Speed97", new Tank());
		tankList.put("HSD", new Tank());
		tankList.put("HiSpeed", new Tank());
		// pump list
		pumpList.put("Midco", new Pump());
		pumpList.put("LT", new Pump());
		pumpList.put("Gilbergo", new Pump());
		pumpList.put("Wayne", new Pump());
		pumpList.put("Tokheim", new Pump());
		generator = new Generator();
		solar = new Solar();
		fleet = new CMS();
		pos = new POS();
	}

	/**
	 * @return the isCanopy
	 */
	public boolean isCanopy() {
		return isCanopy;
	}

	/**
	 * @param isCanopy
	 *            the isCanopy to set
	 */
	public void setCanopy(boolean isCanopy) {
		this.isCanopy = isCanopy;
	}

	/**
	 * @return the isPayOver
	 */
	public boolean isPayOver() {
		return isPayOver;
	}

	/**
	 * @param isPayOver
	 *            the isPayOver to set
	 */
	public void setPayOver(boolean isPayOver) {
		this.isPayOver = isPayOver;
	}

 

	public boolean isInOut() {
		return inOut;
	}

	public void setInOut(boolean inOut) {
		this.inOut = inOut;
	}

	public boolean isATM() {
		return isATM;
	}

	public void setATM(boolean isATM) {
		this.isATM = isATM;
	}

	public String getExplosiveLic() {
		return explosiveLic;
	}

	public void setExplosiveLic(String explosiveLic) {
		this.explosiveLic = explosiveLic;
	}

	/**
	 * @return the mpdList
	 */
	public Map<String, MPD> getMpdList() {
		return mpdList;
	}

	/**
	 * @param mpdList
	 *            the mpdList to set
	 */
	public void setMpdList(Map<String, MPD> mpdList) {
		this.mpdList = mpdList;
	}

	/**
	 * @return the tankList
	 */
	public Map<String, Tank> getTankList() {
		return tankList;
	}

	/**
	 * @param tankList
	 *            the tankList to set
	 */
	public void setTankList(Map<String, Tank> tankList) {
		this.tankList = tankList;
	}

	/**
	 * @return the automated
	 */
	public boolean isAutomated() {
		return automated;
	}

	/**
	 * @param automated
	 *            the automated to set
	 */
	public void setAutomated(boolean automated) {
		this.automated = automated;
	}

	/**
	 * @return the cms
	 */
	public boolean isCms() {
		return cms;
	}

	/**
	 * @param cms
	 *            the cms to set
	 */
	public void setCms(boolean cms) {
		this.cms = cms;
	}

 
 
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
	 * @return the roType
	 */
	public String getRoType() {
		return roType;
	}

	/**
	 * @param roType
	 *            the roType to set
	 */
	public void setRoType(String roType) {
		this.roType = roType;
	}

	/**
	 * @return the generalComments
	 */
	public String getGeneralComments() {
		return generalComments;
	}

	/**
	 * @param generalComments
	 *            the generalComments to set
	 */
	public void setGeneralComments(String generalComments) {
		this.generalComments = generalComments;
	}

	/**
	 * @return the commisionDate
	 */
	public String getCommisionDate() {
		return commisionDate;
	}

	/**
	 * @param commisionDate
	 *            the commisionDate to set
	 */
	public void setCommisionDate(String commisionDate) {
		this.commisionDate = commisionDate;
	}

	/**
	 * @return the dealShipStatus
	 */
	public String getDealShipStatus() {
		return dealShipStatus;
	}

	/**
	 * @param dealShipStatus
	 *            the dealShipStatus to set
	 */
	public void setDealShipStatus(String dealShipStatus) {
		this.dealShipStatus = dealShipStatus;
	}

	/**
	 * @return the serialversionuid
	 */
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	/**
	 * @return the rot
	 */
	public String getRot() {
		return rot;
	}

	/**
	 * @param rot
	 *            the rot to set
	 */
	public void setRot(String rot) {
		this.rot = rot;
	}

	/**
	 * @return the pumpList
	 */
	public Map<String, Pump> getPumpList() {
		return pumpList;
	}

	/**
	 * @param pumpList
	 *            the pumpList to set
	 */
	public void setPumpList(Map<String, Pump> pumpList) {
		this.pumpList = pumpList;
	}

	/**
	 * @return the streetLights
	 */
	public String getStreetLights() {
		return streetLights;
	}

	/**
	 * @param streetLights
	 *            the streetLights to set
	 */
	public void setStreetLights(String streetLights) {
		this.streetLights = streetLights;
	}

	/**
	 * @return the canopyLights
	 */
	public String getCanopyLights() {
		return canopyLights;
	}

	/**
	 * @param canopyLights
	 *            the canopyLights to set
	 */
	public void setCanopyLights(String canopyLights) {
		this.canopyLights = canopyLights;
	}

	/**
	 * @return the generator
	 */
	public Generator getGenerator() {
		return generator;
	}

	/**
	 * @param generator
	 *            the generator to set
	 */
	public void setGenerator(Generator generator) {
		this.generator = generator;
	}

	/**
	 * @return the solar
	 */
	public Solar getSolar() {
		return solar;
	}

	/**
	 * @param solar
	 *            the solar to set
	 */
	public void setSolar(Solar solar) {
		this.solar = solar;
	}

	/**
	 * @return the fleet
	 */
	public CMS getFleet() {
		return fleet;
	}

	/**
	 * @param fleet the fleet to set
	 */
	public void setFleet(CMS fleet) {
		this.fleet = fleet;
	}

	/**
	 * @return the pos
	 */
	public POS getPos() {
		return pos;
	}

	/**
	 * @param pos the pos to set
	 */
	public void setPos(POS pos) {
		this.pos = pos;
	}
 

	/**
	 * @return the lorry12kl
	 */
	public int getLorry12kl() {
		return lorry12kl;
	}

	/**
	 * @param lorry12kl the lorry12kl to set
	 */
	public void setLorry12kl(int lorry12kl) {
		this.lorry12kl = lorry12kl;
	}

	/**
	 * @return the lorry20kl
	 */
	public int getLorry20kl() {
		return lorry20kl;
	}

	/**
	 * @param lorry20kl the lorry20kl to set
	 */
	public void setLorry20kl(int lorry20kl) {
		this.lorry20kl = lorry20kl;
	}

	/**
	 * @return the lorry24kl
	 */
	public int getLorry24kl() {
		return lorry24kl;
	}

	/**
	 * @param lorry24kl the lorry24kl to set
	 */
	public void setLorry24kl(int lorry24kl) {
		this.lorry24kl = lorry24kl;
	}

	/**
	 * @return the updated
	 */
	public boolean isUpdated() {
		return updated;
	}

	/**
	 * @param updated the updated to set
	 */
	public void setUpdated(boolean updated) {
		this.updated = updated;
	}

	/**
	 * @return the edfs
	 */
	public EDFS getEdfs() {
		return edfs;
	}

	/**
	 * @param edfs the edfs to set
	 */
	public void setEdfs(EDFS edfs) {
		this.edfs = edfs;
	}
}
