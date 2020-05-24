package com.tnbpda.dao.objImpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.tnbpda.dao.LorryRenewalDAO;
import com.tnbpda.util.TNBPDAConstants;
import com.tnbpda.util.TNBPDAUtil;
import com.tnbpda.vo.Answer;
import com.tnbpda.vo.Lorry;
import com.tnbpda.vo.LorryRenewal;
import com.tnbpda.vo.Question;
import com.tnbpda.vo.Reminder;

public class LorryRenewalDAOImpl implements LorryRenewalDAO,TNBPDAConstants{

	String fName="lorryrenewal";
	@Override
	public List<Reminder> readLorryInfo(Lorry benz) {
		List<Reminder> reminderList = TNBPDAUtil.retrieveItems(String.valueOf(benz.getCcid()));
		List<Reminder> showList = new ArrayList<Reminder>();
		try {
			Date currentDate = new Date();
			for (Reminder re : reminderList) {
     			int remDay = re.getReminder();
				Date expDate = TNBPDAUtil.getFormat(re.getExpDate(),FORMAT);
				long remainingDate = (expDate.getTime() - currentDate.getTime()) / 86400000;
				if (remainingDate < remDay) {
					showList.add(re);
	 			}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		 return showList;
	}
	 
	public LorryRenewal readLorryInfoOld(Lorry lorry) {
		try {
			HashMap<String,ArrayList<LorryRenewal>> lorryInfoMap = (HashMap<String,ArrayList<LorryRenewal>>)TNBPDAUtil
					.readFromStream(fName);
			List<LorryRenewal> lList = lorryInfoMap.get(lorry.getRegistrationNo());
			if(lList==null){
				return new LorryRenewal();
			}
			for(LorryRenewal lor: lList) {
	  			if(lor.getRegistrationNo().equalsIgnoreCase(lorry.getRegistrationNo())){
		 			{
					 return lor;
					} 
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		 return null;
	}
		
	@Override
	public LorryRenewal updateLorry(LorryRenewal lorry) {
		ArrayList<LorryRenewal> list = new ArrayList<LorryRenewal>();
		try {
			HashMap<String,ArrayList<LorryRenewal>> lorryInfoMap = (HashMap<String,ArrayList<LorryRenewal>>)TNBPDAUtil
					.readFromStream(fName); 
			if(lorryInfoMap==null) {
				lorryInfoMap = new HashMap<String,ArrayList<LorryRenewal>>();
			}
			String regNoString;
			regNoString = lorry.getRegistrationNo();
			System.out.println(regNoString);
			ArrayList<LorryRenewal> lList = lorryInfoMap.get(regNoString);
			if(lList==null){
				lList = new ArrayList<LorryRenewal>();
				lList.add(lorry);
			}
			else{
			for(LorryRenewal l : lList){
				if(!(l.getRegistrationNo().equalsIgnoreCase(lorry.getRegistrationNo()))){
					list.add(l);
				}
			}
			list.add(lorry);
			}
			lorryInfoMap.remove(regNoString);
			lorryInfoMap.put(regNoString, list);
			TNBPDAUtil.writeToStream(lorryInfoMap, fName);
			return lorry;
			} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return null;
	}

	public static void main(String[] args) {
		LorryRenewal lor0=new LorryRenewal();
		lor0.setRegistrationNo("KA 25");
		lor0.setCrewInsurance(true);
		/*lor0.setDateOfRegistration('1-11-2017');*/
		//LorryInfo lor1=new LorryInfo();
		LorryRenewalDAOImpl lid=new LorryRenewalDAOImpl();
		lid.updateLorry(lor0);
		Lorry lor = new Lorry();
		lor.setRegistrationNo("123");
	//	lor0 = lid.readLorryInfo(lor);
		System.out.println(lor0.isCrewInsurance());
	}
}
