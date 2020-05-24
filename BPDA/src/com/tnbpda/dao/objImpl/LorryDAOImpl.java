package com.tnbpda.dao.objImpl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;

import com.tnbpda.dao.LorryDAO;
import com.tnbpda.util.QIDComparator;
import com.tnbpda.util.TNBPDAUtil;
import com.tnbpda.vo.Answer;
import com.tnbpda.vo.Lorry;
import com.tnbpda.vo.Question;

public class LorryDAOImpl implements LorryDAO {

	String fName = "lorry";
	
	@Override
	public List<Lorry> insertLorry(Lorry lorry) {
		ArrayList<Lorry> lList = new ArrayList<Lorry>();
		try {
			HashMap<Integer,ArrayList<Lorry>> lorryMap = (HashMap<Integer,ArrayList<Lorry>>)TNBPDAUtil
					.readFromStream(fName); 
			if(lorryMap==null) {
				lorryMap = new HashMap<Integer,ArrayList<Lorry>>();
			}
			int ccid = lorry.getCcid();
			lList = lorryMap.get(ccid);
			if(lList==null){
				lList=new ArrayList<Lorry>();
			}for(Lorry l : lList){
	  			if(l.getRegistrationNo().equalsIgnoreCase(lorry.getRegistrationNo())){
	  				return null;
	  			}
			}
			lList.add(lorry);
			lorryMap.remove(ccid);
			lorryMap.put(ccid, lList);
			TNBPDAUtil.writeToStream(lorryMap, fName);
			return lList;
		} catch (Exception e) {
			// TODO: handle exception

			e.printStackTrace();
		}
		return lList;
	}

	@Override
	public ArrayList<Lorry> readLorryList(Lorry lor0) {
		ArrayList<Lorry> lList = new ArrayList<Lorry>();
		try {
			HashMap<Integer,ArrayList<Lorry>> lorryMap = (HashMap<Integer,ArrayList<Lorry>>) TNBPDAUtil
					.readFromStream(fName); 
	  		lList = lorryMap.get(lor0.getCcid());
	  		if(lList != null){
	  			return lList;
	  		}
	  		
			 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		 return lList;
	}

	@Override
	public void deleteLorry(Lorry lorry) {
		try {
			HashMap<Integer,ArrayList<Lorry>> lorryMap = (HashMap<Integer,ArrayList<Lorry>>) TNBPDAUtil
					.readFromStream(fName); 
			ArrayList<Lorry> lList = lorryMap.get(lorry.getCcid());
			ArrayList<Lorry> lorryList = new ArrayList<Lorry>();
	  		for(Lorry l : lList){
	  			if(!(l.getRegistrationNo().equalsIgnoreCase(lorry.getRegistrationNo()))){
	  				lorryList.add(l);
	  			}
	  		}
			lorryMap.remove(lorry.getCcid());
			lorryMap.put(lorry.getCcid(), lorryList);
			TNBPDAUtil.writeToStream(lorryMap, fName);			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		Lorry lor0=new Lorry();
		lor0.setRegistrationNo("1231");
		lor0.setCapacity(4);
		lor0.setCcid(7);
		lor0.setVendorId("1212");
		/*lor0.setDateOfRegistration('1-11-2017');*/
		//LorryInfo lor1=new LorryInfo();
		LorryDAOImpl lid=new LorryDAOImpl();
		List<Lorry> listin = new ArrayList<Lorry>();
		/*listin = lid.insertLorry(lor0);*/
		for(Lorry l : listin)
		System.out.println(l.getCcid());
		lid.deleteLorry(lor0);
		listin=lid.readLorryList(lor0);
		for(Lorry l : listin)
		System.out.println(l.getCcid()+"-->"+l.getRegistrationNo());
		
	}

}
