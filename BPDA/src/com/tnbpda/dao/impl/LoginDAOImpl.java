package com.tnbpda.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import com.tnbpda.dao.DBUtil;
import com.tnbpda.dao.LoginDAO;
import com.tnbpda.vo.Dealer;
import com.tnbpda.vo.Subscription;
import com.tnbpda.vo.User;

public class LoginDAOImpl implements LoginDAO {

	@Override
	public Dealer validateLogin(User siva) {

		PreparedStatement ps;
		ResultSet rs = null;
		Connection con = null;
		String tempPassword = null;
		Dealer dealer=null;
		try {
		/*	con = DBUtil.getConnection();
			ps = con.prepareStatement("select * from dealer where CCNo(?)");
			ps.setString(1, siva.getUserName());
		 
			rs = ps.executeQuery();

			if (rs.next()) {
				tempPassword = rs.getString("Password");
			}*/
			//tempPassword="173813";
			tempPassword="Prakash123";
			/**
			 * User name '172537', password '172537'. - > first time. user name
			 * '172537', password 'pass123' --> success.
			 */
			if (siva.getPassword().equals(siva.getUserName()) && siva.getPassword().equals(tempPassword) ) {
				siva.setFirstTime(true);
			} else if (siva.getPassword().equals(tempPassword)) {
				siva.setStatus(true);
			}
			System.out.println("First Time  : "+siva.isFirstTime());
			System.out.println("Stat usTIme  : "+siva.isStatus());
return dealer;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean updatePassword(User user) {

		PreparedStatement ps;
		ResultSet rs = null;
		Connection con = null;
		String tempPassword = null;
		try {
			con = DBUtil.getConnection();
			ps = con.prepareStatement("update dealers set Password=? where CCNo=?");
			ps.setString(1, user.getPassword());
			ps.setString(2, user.getUserName());
			int val = ps.executeUpdate();
			return true;
		} catch (Exception e) {
			return false;
		}
	}

	@Override
	public int totalCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Subscription> retrieveSubscribers() {
		// TODO Auto-generated method stub
		return null;
	}

}
