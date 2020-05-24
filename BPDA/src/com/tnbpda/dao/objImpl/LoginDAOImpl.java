package com.tnbpda.dao.objImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tnbpda.dao.DBUtil;
import com.tnbpda.dao.DealerDAO;
import com.tnbpda.dao.LoginDAO;
import com.tnbpda.util.TNBPDAUtil;
import com.tnbpda.vo.Customer;
import com.tnbpda.vo.Dealer;
import com.tnbpda.vo.Subscription;
import com.tnbpda.vo.User;

public class LoginDAOImpl implements LoginDAO {
	String fName = "dealer";
	String filename = "subscribers";
	@Override
	public Dealer validateLogin(User siva) {
		/**
		 * First Time user : user name is Customer code, password is same as
		 * customer code. Eg. user name 173813, password : 173813. Immediately
		 * set new password. Second Time user: user name is Customer code,
		 * password is already set new one
		 */
		Dealer selvam = new Dealer();
		selvam.setUserName(siva.getUserName());
		selvam.setPassword(siva.getPassword());
		String tempPassword = null;
		try {

			DealerDAO dMapDAO = new DealerDAOImplHashMap();
			
			List<Dealer> dealerList = dMapDAO.retrieveDealers(new Dealer());
			List<Subscription> subscriberList = retrieveSubscribers();
			int uName = Integer.parseInt(siva.getUserName());
			System.out.println("dealerList in Login DAO Impl "
					+ dealerList.size());
			/*for(Subscription YouTube : subscriberList){
				if(YouTube.getCcNo()==uName){*/
					for (Dealer panneer : dealerList) {
						if (panneer.getCcNo() == uName) {
					 		if (panneer.getPassword().equals(siva.getPassword())) {
								panneer.setStatus(true);
								// panneer.setFirstTime(true);
								selvam = panneer;
								selvam.setUserName(siva.getUserName());
								if (selvam.getTerriority() == null
										|| selvam.getTerriority().equals("")) {
									selvam.setTerriority("0");
								}
								if (selvam.getSupplyLocation() == null
										|| selvam.getSupplyLocation().equals("")) {
									selvam.setSupplyLocation("0");
								}
								if (selvam.getDistrict() == null
										|| selvam.getDistrict().equals("")) {
									selvam.setDistrict("0");
								}
								break;
							}
						}
					}
					return selvam;
				} 
		/*	}
		}*/catch (Exception ere) {
			ere.printStackTrace();
			return null;
		}
/*		return null;*/
	}

	@Override
	public boolean updatePassword(User siva) {
Dealer nallaya = new Dealer();
		try {
			DealerDAO dMapDAO = new DealerDAOImplHashMap();
  			nallaya.setCcNo(Integer.parseInt(siva.getUserName()));
			nallaya = dMapDAO.readDealer(nallaya);
			nallaya.setPassword(siva.getPassword());
			nallaya.setFirstTime(false);
			dMapDAO.updateDealerPassword(nallaya);
		 System.out.println("done");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public int totalCount(){
		int count=0;
		try{
			DealerDAO dMapDAO = new DealerDAOImplHashMap();
			List<Dealer> dealerList = dMapDAO.retrieveDealers(new Dealer());
			
			System.out.println("dealerList in Login DAO Impl "
					+ dealerList.size());
			for (Dealer panneer : dealerList) {
				if(!panneer.isFirstTime()){
					count++;
				}
			}
			return count;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	
	@Override
	public List<Subscription> retrieveSubscribers(){

		List<Subscription> subscriberList = null;

		try {
			subscriberList = (List<Subscription>) TNBPDAUtil.readFromStream(filename);
			if (subscriberList == null) {
				subscriberList = new ArrayList<Subscription>();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return subscriberList;
	}
	
	public static void main(String[] args) {
		Dealer d = new Dealer();
		d.setPassword("173813");
		d.setUserName("173813");
		LoginDAOImpl impl = new LoginDAOImpl();
		impl.updatePassword(d);
	}
}
