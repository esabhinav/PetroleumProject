package com.tnbpda.dao.objImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.tnbpda.dao.RODAO;
import com.tnbpda.util.TNBPDAUtil;
import com.tnbpda.vo.Dealer;
import com.tnbpda.vo.MPD;
import com.tnbpda.vo.RO;

public class RODAOImpl implements RODAO {

	String fName = "ro";

	@Override
	public void insertRO(RO ro) {
		try {
			
		System.out.println("insert : "+ro.getCcNo());
		
		HashMap<String, RO> roMap = (HashMap<String, RO>) TNBPDAUtil
				.readFromStream(fName);
		if (roMap == null) {
			roMap = new HashMap<String, RO>();
		}
		roMap.remove(ro.getCcNo());
		roMap.put(ro.getCcNo(), ro);
		TNBPDAUtil.writeToStream(roMap, fName);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public RO readRO(RO ro) {
		RO nallaya = null;
		String ccNo = ro.getCcNo();
		try {

			HashMap<String, RO> roMap = (HashMap<String, RO>) TNBPDAUtil
					.readFromStream(fName);
			if (roMap != null && roMap.get(ccNo)!=null) {
				System.out.println("iff");
				System.out.println(roMap.size() + " : "+ccNo);
				Iterator<String> it =  roMap.keySet().iterator();
				while(it.hasNext()) {
				System.out.println(it.next()); 
				}
				nallaya = roMap.get(ccNo);
			} else {
				System.out.println("wlse");
				roMap = new HashMap<String, RO>();
				nallaya = new RO();
				roMap.put(ccNo, nallaya);
			}
			System.out.println("nallaya : "+nallaya);

		} catch (Exception e) {
			e.printStackTrace();
		}
	 		return nallaya;
	}

	@Override
	public void updateRO(RO ro) {
		String ccNo = ro.getCcNo();
		
		System.out.println("update : "+ro.getCcNo());
		
 		try {

			HashMap<String, RO> roMap = (HashMap<String, RO>) TNBPDAUtil
					.readFromStream(fName);
	 		if (roMap == null) {
				roMap = new HashMap<String, RO>();

			} else {
				System.out.println("SIZE :::::::::::::::::: PABBNBEER "+roMap.size());
			}
			RO exRo = roMap.get(ccNo);
	 		roMap.remove(ccNo);
			roMap.put(ccNo, ro);
			
			if (exRo == null) {

			}
	 		TNBPDAUtil.writeToStream(roMap, fName);
	 	} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	public static void main(String[] args) {
		HashMap<String, RO> roMap = (HashMap<String, RO>) TNBPDAUtil
				.readFromStream("ro");
		System.out.println(roMap.size());
		roMap.remove(null);
		TNBPDAUtil.writeToStream(roMap, "ro");
		System.out.println(roMap.size());
	}


	/**
	 * 
	 * @param args
	 */
	public static void main1(String[] args) {
		List<Dealer> dealerList = (List<Dealer>) TNBPDAUtil
				.readFromStream("dealer");
		
		RODAOImpl rp =  new RODAOImpl();
		RO ro = new RO();
		ro.setCcNo(String.valueOf(173813));
		ro = rp.readRO(ro);
		

		HashMap<String, RO> roMap = (HashMap<String, RO>) TNBPDAUtil
				.readFromStream("ro");
		System.out.println(roMap.size());
		Iterator<Map.Entry<String, RO>> itt =  roMap.entrySet().iterator();
		while(itt.hasNext()) {
			Map.Entry<String, RO> mee = itt.next();
			ro = mee.getValue();
			System.out.println("------------------"+mee.getKey());
		 Iterator<Map.Entry<String,MPD>>  it = ro.getMpdList().entrySet().iterator();
		 while(it.hasNext()) {
			 Map.Entry<String, MPD> me =  it.next();
			 System.out.println(me.getKey());
			 MPD mpd = me.getValue();
			 System.out.println("NPOZZ "+mpd.getNoOfNozzle());
		 }
		}
	/*	HashMap<String, RO> roMap = new HashMap<String, RO>();
		for (Dealer dealer : dealerList) {
			RO ro = new RO();
			ro.setCcNo(String.valueOf(dealer.getCcNo()));
			Map<String, MPD> mpdMap = ro.getMpdList();
			mpdMap.put("MS", new MPD());
			mpdMap.put("Speed", new MPD());
			mpdMap.put("Speed97", new MPD());
			mpdMap.put("HSD", new MPD());
			mpdMap.put("HiSpeed", new MPD());
			
			Map<String,Tank> tankMap = ro.getTankList();
			tankMap.put("MS", new Tank());
			tankMap.put("Speed", new Tank());
			tankMap.put("Speed97", new Tank());
			tankMap.put("HSD", new Tank());
			tankMap.put("HiSpeed", new Tank());
			
			roMap.put(String.valueOf(dealer.getCcNo()), ro);
		}*/
	/*	TNBPDAUtil.writeToStream(roMap, "ro");
		System.out.println(roMap.size());*/
		ro.setCcNo(null);
	//	rp.removeRO(ro);
	}

	@Override
	public void removeRO(RO ro) {
		String ccNo = ro.getCcNo();
		System.out.println(ccNo + "LLL ");
		try {

			HashMap<String, RO> roMap = (HashMap<String, RO>) TNBPDAUtil
					.readFromStream(fName);
	 		if (roMap == null) {
				roMap = new HashMap<String, RO>();

			}
	 
	 		roMap.remove(ccNo);
		 
			
			 
	 		TNBPDAUtil.writeToStream(roMap, fName);
	 		System.out.println("size >>"+roMap.size());
	 	} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<RO> retrieveAllRos(RO ro) {
		HashMap<String, RO> roMap = (HashMap<String, RO>) TNBPDAUtil
				.readFromStream("ro");
		List<RO> listRO = new ArrayList<RO>();
		System.out.println(roMap.size());
		Iterator<Map.Entry<String, RO>> itt =  roMap.entrySet().iterator();
		while(itt.hasNext()) {
			 Map.Entry<String, RO> me= itt.next();
			 listRO.add(me.getValue());
		} 
		return listRO;
	}

}
