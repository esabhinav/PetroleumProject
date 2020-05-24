package com.tnbpda.dao.objImpl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.tnbpda.dao.CustomerDAO;
import com.tnbpda.util.TNBPDAUtil;
import com.tnbpda.vo.Customer;
import com.tnbpda.vo.Dealer;

public class CustomerDAOImpl implements CustomerDAO {
	String fName = "customer";

	@Override
	public void insertCustomer(Customer guna) {
		try {
			List<Customer> customerList = (List<Customer>) TNBPDAUtil
					.readFromStream(fName);
			if (customerList == null) {
				customerList = new ArrayList<Customer>();
			}
			guna.setCid(customerList.size() + 1);
			guna.setStatus("P");
			customerList.add(guna);
			TNBPDAUtil.writeToStream(customerList, fName);
			customerList = (List<Customer>) TNBPDAUtil.readFromStream(fName);
 		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void updateCustomer(Customer guna) {
		// TODO Auto-generated method stub
		List<Customer> customerList = (List<Customer>) TNBPDAUtil
				.readFromStream(fName);
		for (Customer cust : customerList) {
			if (cust.getCid() == guna.getCid()) {
				cust.setApproverComments(guna.getApproverComments());
				 cust.setStatus(guna.getStatus());

				break;
			}
		}
		System.out.println("dnoe");
		TNBPDAUtil.writeToStream(customerList, fName);
	}

	@Override
	public List<Customer> deleteCustomer(Customer guna) {
		Customer temp = null;
		try {
			List<Customer> customerList = (List<Customer>) TNBPDAUtil
					.readFromStream(fName);
			for (Customer siva : customerList) {
				if (siva.getCid() == guna.getCid()) {

					temp = siva;
					break;
				}
			}
			customerList.remove(temp);
			TNBPDAUtil.writeToStream(customerList, fName);
			return (List<Customer>) TNBPDAUtil.readFromStream(fName);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public Customer readCustomer(Customer guna) {
 		try {
			List<Customer> customerList = (List<Customer>) TNBPDAUtil
					.readFromStream(fName);
			for (Customer siva : customerList) {
				if (siva.getCid() == guna.getCid()) {
					System.out.println("matched in DAO read");
					guna = siva;
					break;
				}
			}
			return guna;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

	}

	// @Override
	// public List<Customer> cutomerLists(Customer guna) {
	// List<Customer> list = new ArrayList<Customer>();
	// try {
	// List<Customer> customerList = (List<Customer>) TNBPDAUtil
	// .readFromStream(fName);
	// if (customerList == null) {
	// customerList = new ArrayList<Customer>();
	// }
	// for (Customer siva: customerList) {
	// switch (guna.getSearchText()) {
	// case "adhar":
	// if (siva.getAharNo().equals(guna.getAharNo())) {
	// list.add(siva);
	// }
	// break;
	// case "tin":
	//
	// if (siva.getTno().equals(guna.getTno())) {
	// list.add(siva);
	// }
	// break;
	// case "dr":
	// if (siva.getDistrict()==guna.getDistrict()) {
	// list.add(siva);
	// }
	// break;
	//
	// default:
	// list.add(siva);
	// }
	//
	// }
	// System.out.println("TGotal size DAO Impl : is "+list.size());
	// } catch (Exception e) {
	// e.printStackTrace();
	// }
	//
	//
	// return list;
	// }

	public static void main(String[] args) {
		System.out.println();
		CustomerDAOImpl custdao = new CustomerDAOImpl();
		Customer guna = new Customer();
		switch(2) {
		case 1:
		guna.setCcNo(173813);
		guna.setName("guna");
		guna.setComments("its pedn8ding wth lasdt one year");
		// guna.setDate(new Date());
		guna.setDistrict(2);
		guna.setMobileNo("9487334343");
		guna.setAharNo("54321");
		guna.setTno("12345");
		guna.setDueAmount(10000);
	 
		guna.setDueAmount(20000);
		
		custdao.insertCustomer(guna);
		break;
		case 2:
			guna.setCid(1);
			guna.setStatus("P");
			//guna.setApproverComments("please proceeed");
			custdao.updateCustomer(guna);
			break;
		}
	}

	@Override
	public List<Customer> cutomerList(Customer guna) {
		List<Customer> customerList = null;
		try {
			customerList = (List<Customer>) TNBPDAUtil.readFromStream(fName);
			if (customerList == null) {
				customerList = new ArrayList<Customer>();
			}
		} catch (Exception e) {

		}
		return customerList;
	}

}
