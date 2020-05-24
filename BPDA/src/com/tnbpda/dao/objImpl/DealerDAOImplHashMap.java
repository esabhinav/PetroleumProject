package com.tnbpda.dao.objImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.TreeMap;

import com.tnbpda.dao.DBUtil;
import com.tnbpda.dao.DealerDAO;
import com.tnbpda.util.TNBPDAUtil;
import com.tnbpda.vo.Dealer;
import com.tnbpda.vo.RO;

public class DealerDAOImplHashMap implements DealerDAO {

	String fName = "dealer";
	String roFileName = "ro";

	@Override
	public Dealer readDealer(Dealer nallaya) {

		try {
			TreeMap<String, Dealer> dealerMap = (TreeMap<String, Dealer>) TNBPDAUtil
					.readFromStream(fName);

			return dealerMap.get(String.valueOf(nallaya.getCcNo()));

		} catch (Exception e) {
			e.printStackTrace();
		}
		return nallaya;
	}

	private void fetchDealer(Dealer panneer, ResultSet rs) throws Exception {

	}

	@Override
	public List<Dealer> retrieveDealers(Dealer panneer) {

		TreeMap<String, Dealer> mapDealer = null;
		List<Dealer> dList = new ArrayList<Dealer>();
		try {
			mapDealer = (TreeMap<String, Dealer>) TNBPDAUtil
					.readFromStream(fName);
			if (mapDealer == null) {
				mapDealer = new TreeMap<String, Dealer>();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		Iterator<Map.Entry<String, Dealer>> col = mapDealer.entrySet()
				.iterator();
		while (col.hasNext()) {
			Map.Entry<String, Dealer> me = col.next();
			dList.add(me.getValue());
		//	System.out.println(me.getValue().getCcNo()+"PW : "+me.getValue().getPassword());
		}
		return dList;
	}

	@Override
	public Dealer updateDealer(Dealer dealer) {
		TreeMap<String, Dealer> mapDealer = null;
		System.out.println(dealer.getCcNo() + " : dealer SDF "+dealer.getPassword());
		String strCCNo = String.valueOf(dealer.getCcNo());
		try {
			mapDealer = (TreeMap<String, Dealer>) TNBPDAUtil
					.readFromStream(fName);
		 Dealer nallaya = mapDealer.get(strCCNo);
		 System.out.println("-------------BEFORE -----------------"+nallaya.getPassword());
		 dealer.setPassword(nallaya.getPassword());
		dealer.setFirstTime(false);
		dealer.setRoName(nallaya.getRoName());
		dealer.setLastUpdateDate(TNBPDAUtil.now());
		 mapDealer.remove(strCCNo);
			 System.out.println("222 :"+dealer.getPassword());
			mapDealer.put(strCCNo, dealer);
		 	
			TNBPDAUtil.writeToStream(mapDealer, fName);
			dealer.setStatus(true);

		} catch (Exception e) {
			e.printStackTrace();
			dealer.setStatus(false);
		}

		return null;
	}

	@Override
	public Dealer insertDealer(Dealer panneer) {
		TreeMap<String, Dealer> mapDealer = null;
		try {
			mapDealer = (TreeMap<String, Dealer>) TNBPDAUtil
					.readFromStream(fName);
			if (mapDealer == null) {
				mapDealer = new TreeMap<String, Dealer>();
			}

			mapDealer.put(String.valueOf(panneer.getCcNo()), panneer);
			TNBPDAUtil.writeToStream(mapDealer, fName);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public Dealer insertAllDealer(TreeMap<String, Dealer> panneer) {

		try {
			 TNBPDAUtil.writeToStream(panneer, fName);
 	} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	public static void main(String[] args) {
		Dealer nallaya = new Dealer();

		// nallaya.;
		DealerDAOImplHashMap dao = new DealerDAOImplHashMap();
		// resourceBundle();
		// dao.insertDealers(nallaya);

	}

	private static void resourceBundle() {
		ResourceBundle rb = ResourceBundle
				.getBundle("com.tnbpda.prop.district");
	}

	@Override
	public List<Dealer> deleteDealer(Dealer dealer) {
		TreeMap<String, Dealer> mapDealer = null;
		try {
			mapDealer = (TreeMap<String, Dealer>) TNBPDAUtil
					.readFromStream(fName);
			if (mapDealer == null) {
				mapDealer = new TreeMap<String, Dealer>();
			}
			mapDealer.remove(String.valueOf(dealer.getCcNo()));
			TNBPDAUtil.writeToStream(mapDealer, fName);
			mapDealer = (TreeMap<String, Dealer>) TNBPDAUtil
					.readFromStream(fName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return (List<Dealer>) mapDealer.values();
	}

	@Override
	public void updateDealerPassword(Dealer dealer) {
		TreeMap<String, Dealer> mapDealer = null;
		System.out.println(dealer.getCcNo() + " : dealer SDF "+dealer.getPassword());
		String strCCNo = String.valueOf(dealer.getCcNo());
		try {
			mapDealer = (TreeMap<String, Dealer>) TNBPDAUtil
					.readFromStream(fName);
		 Dealer nallaya = mapDealer.get(strCCNo);
		 if(nallaya!=null) {
			 nallaya.setPassword(dealer.getPassword());
		 }else {
		 mapDealer.put(strCCNo, dealer);
		 }
		 TNBPDAUtil.writeToStream(mapDealer, fName);
		}catch(Exception e) {
			
		}
		
	}

}
