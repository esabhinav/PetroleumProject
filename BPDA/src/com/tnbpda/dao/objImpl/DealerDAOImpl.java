package com.tnbpda.dao.objImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.ResourceBundle;
import java.util.TreeMap;

import com.tnbpda.dao.DBUtil;
import com.tnbpda.dao.DealerDAO;
import com.tnbpda.util.TNBPDAUtil;
import com.tnbpda.vo.Dealer;
import com.tnbpda.vo.RO;

public class DealerDAOImpl implements DealerDAO {

	String fName = "dealer";
	String roFileName = "ro";

	@Override
	public Dealer readDealer(Dealer nallaya) {
		Dealer temp = null;
		try {
			List<Dealer> dealerList = (List<Dealer>) TNBPDAUtil
					.readFromStream(fName);
			for (Dealer selva : dealerList) {
				if (selva.getCcNo() == nallaya.getCcNo()) {
					return selva;

				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return nallaya;
	}

	private void fetchDealer(Dealer panneer, ResultSet rs) throws Exception {

	}

	@Override
	public List<Dealer> retrieveDealers(Dealer panneer) {

		List<Dealer> dealerList = null;

		try {
			dealerList = (List<Dealer>) TNBPDAUtil.readFromStream(fName);
			if (dealerList == null) {
				dealerList = new ArrayList<Dealer>();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return dealerList;
	}

	@Override
	public Dealer updateDealer(Dealer dealer) {

		try {
			List<Dealer> dealerList = (List<Dealer>) TNBPDAUtil
					.readFromStream(fName);
			Iterator<Dealer> it = dealerList.iterator();
			while (it.hasNext()) {
				Dealer nallaya = it.next();
				if (dealer.getCcNo() == nallaya.getCcNo()) {

					nallaya.setAddress1(dealer.getAddress1());
					nallaya.setAddress2(dealer.getAddress2());

					nallaya.setDistrict(dealer.getDistrict());

					nallaya.setSupplyLocation(dealer.getSupplyLocation());

					nallaya.setTerriority(dealer.getTerriority());

					nallaya.setFirstName(dealer.getFirstName());

					nallaya.setLastName(dealer.getLastName());
					nallaya.setMobileNo(dealer.getMobileNo());

					nallaya.setEmailID(dealer.getEmailID());

					nallaya.setLandLine(dealer.getLandLine());
					nallaya.setPost(dealer.getPost());
					nallaya.setZipCode(dealer.getZipCode());
					nallaya.setDateOfBirth(dealer.getDateOfBirth());
					dealer.setRoName(nallaya.getRoName());

					break;
				}
			}
		//	dealerList.add(dealer);

			TNBPDAUtil.writeToStream(dealerList, fName);
			dealer.setStatus(true);

		} catch (Exception e) {
			e.printStackTrace();
			dealer.setStatus(false);
		}

		return null;
	}

	@Override
	public Dealer insertDealer(Dealer panneer) {

		try {
			List<Dealer> dealerList = (List<Dealer>) TNBPDAUtil
					.readFromStream(fName);
			if (dealerList == null) {
				dealerList = new ArrayList<Dealer>();
			}

			dealerList.add(panneer);
			TNBPDAUtil.writeToStream(dealerList, fName);
			dealerList = (List<Dealer>) TNBPDAUtil.readFromStream(fName);
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
		DealerDAOImpl dao = new DealerDAOImpl();
		// resourceBundle();
		// dao.insertDealers(nallaya);

	}

	private static void resourceBundle() {
		ResourceBundle rb = ResourceBundle
				.getBundle("com.tnbpda.prop.district"); 
	}

	@Override
	public List<Dealer> deleteDealer(Dealer dealer) {
		List<Dealer> dealerList  = null;
		try {
			 dealerList = (List<Dealer>) TNBPDAUtil
					.readFromStream(fName);
			if (dealerList == null) {
				dealerList = new ArrayList<Dealer>();
			}
		 Iterator<Dealer> it =  dealerList.iterator();
		 while(it.hasNext()) {
			 Dealer panneer = it.next();
			 if(panneer.getCcNo()==dealer.getCcNo()) {
				 it.remove();
				 break;
			 }
		 } 
			TNBPDAUtil.writeToStream(dealerList, fName);
			dealerList = (List<Dealer>) TNBPDAUtil.readFromStream(fName);
	 	} catch (Exception e) {
			e.printStackTrace();
		}
		return dealerList;
	}

	@Override
	public void updateDealerPassword(Dealer dealer) {
		// TODO Auto-generated method stub
		
	}
 

}
