package com.tnbpda.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tnbpda.dao.AdminDAO;
import com.tnbpda.dao.DBUtil;
import com.tnbpda.vo.Message;
 

public class AdminDAOImpl implements AdminDAO {

	@Override
	public void insertMessage(Message msg) {
		Statement stmt = null;
		ResultSet rs = null;
		Connection con = null;

		try {
			con = DBUtil.getConnection();

			stmt = con.createStatement();
			rs = stmt.executeQuery("select * from Dealer");
			while (rs.next()) {
			 //
			}
			System.out.println(rs.getInt(1) + "  " + rs.getString(2) + "  "
					+ rs.getString(3));
		} catch (Exception e) {

		}
	}

	@Override
	public List<Message> readAllMessage() {
     List<Message> list  = new ArrayList<Message>();
     Statement stmt = null;
		ResultSet rs = null;
		Connection con = null;

		try {
			con = DBUtil.getConnection();

			stmt = con.createStatement();
			rs = stmt.executeQuery("select * from Message");
			while (rs.next()) {
				Message msg = new Message();
				msg.setCategory(rs.getByte(1));
				msg.setPriority(rs.getByte(2));
				msg.setMessage(rs.getString(3));
				list.add(msg);
 			}
	 
		} catch (Exception e) {

		}
     return list;
	}

	@Override
	public void deleteMessage(Message msg) {
		// TODO Auto-generated method stub

	}

}
