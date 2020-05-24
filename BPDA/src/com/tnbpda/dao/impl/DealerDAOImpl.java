package com.tnbpda.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

import com.tnbpda.dao.DBUtil;
import com.tnbpda.dao.DealerDAO;
import com.tnbpda.vo.Dealer;
import com.tnbpda.vo.RO;

public class DealerDAOImpl implements DealerDAO {

	@Override
	public Dealer readDealer(Dealer nallaya) {
		Statement stmt = null;
		ResultSet rs = null;
		Connection con = null;

		try {
			createDealer(nallaya);
			/*con = DBUtil.getConnection();

			stmt = con.createStatement();
			rs = stmt.executeQuery("select * from Dealer");*/
			while (rs.next()) {
			// fetchDealer(panneer,rs);
				
			}
			 
		} catch (Exception e) {

		}
		return nallaya;
	}
	private void fetchDealer(Dealer panneer, ResultSet rs) throws Exception {
		panneer.setCcNo(rs.getInt(1));
		panneer.setRoName(rs.getString("ROName"));
		if (rs.getString("Association") == "Y") {
			panneer.setAssociation(true);
		} else {
			panneer.setAssociation(false);
		}

		panneer.setFirstName(rs.getString("FirstName"));
		panneer.setLastName(rs.getString("LastName"));
		panneer.setMobileNo(rs.getString("MobileNo"));
		panneer.setLandLine(rs.getString("LandLine"));
		panneer.setEmailID(rs.getString("EmailId"));
		panneer.setDateOfBirth(rs.getString("DOB"));

		panneer.setAddress1(rs.getString("Address"));
		panneer.setAddress2(rs.getString("Address2"));
		panneer.setPost(rs.getString("Post"));
		panneer.setDistrict(rs.getString("EmailId"));
		panneer.setZipCode(rs.getInt("Zipcode"));
		panneer.setDistrict(rs.getString("District"));
		panneer.setSupplyLocation(rs.getString("SupplyLocation"));

		panneer.setTerriority(rs.getString("Terriority"));
	}

	@Override
	public List<Dealer> retrieveDealers(Dealer panneer) {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		List<Dealer> list = new ArrayList<Dealer>();

		try {
			  con = DBUtil.getConnection();
			  
			  stmt = con.createStatement();
				rs = stmt.executeQuery("select * from Dealer");
			  while (rs.next()) {
				  panneer = new Dealer();
				  System.out.println("CC "+panneer.getCcNo());
					 fetchDealer(panneer,rs);
					 list.add(panneer);
					}
			  DBUtil.closeConnection(con,stmt,rs);
		} catch (Exception e) {
		}

		return list;
	}

	@Override
	public Dealer updateDealer(Dealer dealer) {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			  con = DBUtil.getConnection();
			  
			  DBUtil.closeConnection(con,stmt,rs);
		} catch (Exception e) {
		}

		return null;
	}

	@Override
	public Dealer insertDealer(Dealer panneer) {
		Connection con = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String tempAssociation="N";

		try {
			
			  con = DBUtil.getConnection();
			  System.out.println(con);
			  stmt = con.prepareStatement("INSERT INTO Dealer values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			
			  if(panneer.isAssociation()) {
				  tempAssociation="Y";
			  } 
			  stmt.setInt(1, panneer.getCcNo());
			  stmt.setString(2, panneer.getRoName());
			  stmt.setString(3, tempAssociation);
			  stmt.setString(4, panneer.getFirstName());
			  stmt.setString(5, panneer.getLastName());
			  stmt.setInt(6, Integer.parseInt(panneer.getMobileNo()));
			  stmt.setString(7, panneer.getLandLine());
			  stmt.setString(8, panneer.getEmailID());
			  stmt.setString(9, panneer.getDateOfBirth());
			  stmt.setString(10, panneer.getAddress1());
			  stmt.setString(11, panneer.getAddress2());
			  stmt.setString(12, panneer.getPost());
			  stmt.setString(13, panneer.getCity());
			  stmt.setInt(14, Integer.parseInt(panneer.getDistrict()));
			  stmt.setInt(15, panneer.getZipCode());
			  stmt.setInt(16, Integer.parseInt(panneer.getSupplyLocation()));
			  stmt.setInt(17,Integer.parseInt(panneer.getTerriority()));
			  stmt.setString(18, "");
			  stmt.setString(19,"");	
			//  stmt.;
			  System.out.println(stmt);
		  int result =  stmt.executeUpdate();
			 System.out.println("resutt : "+result);
		     DBUtil.closeConnection(con,stmt,rs);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}
	
	public static void main(String[] args) {
		Dealer nallaya = new Dealer();
		createDealer(nallaya);
		//nallaya.;
		DealerDAOImpl dao = new DealerDAOImpl();
		resourceBundle();
		//dao.insertDealer(nallaya);
		
	}
	
	private static void createDealer(Dealer nallaya){
		nallaya.setCcNo(173813);
		nallaya.setRoName("Venketaswara Fuels");;
		nallaya.setAssociation(false);;
		nallaya.setFirstName("Mohan");
		nallaya.setLastName("Nataraj");;
		nallaya.setMobileNo("1298989898");;
		nallaya.setLandLine("042232322");;
		nallaya.setEmailID("venkatesh@gmail.com");;
		nallaya.setDateOfBirth("04-05-1949");;
		nallaya.setAddress1("405, Near Bus stop");;
		nallaya.setAddress2("Main road , Salem");;
		nallaya.setPost("Oma1lur");
		nallaya.setCity("Salem");
		nallaya.setDistrict("12");;
		
		nallaya.setZipCode(637232);;
		nallaya.setSupplyLocation("2");;
		nallaya.setTerriority("5");
		
	}
	
	private static void resourceBundle() {
	 ResourceBundle rb =   ResourceBundle.getBundle("com.tnbpda.prop.district");
	 System.out.println(rb.getObject("12"));
	}
/*	@Override
	public void updateRO(RO ro) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public RO readRO(RO ro) {
		// TODO Auto-generated method stub
		return null;
	}  */
	@Override
	public List<Dealer> deleteDealer(Dealer dealer) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void updateDealerPassword(Dealer dealer) {
		// TODO Auto-generated method stub
		
	}

}
