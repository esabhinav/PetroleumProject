package com.tnbpda.dao.objImpl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.tnbpda.dao.AdminDAO;
import com.tnbpda.dao.DBUtil;
import com.tnbpda.util.TNBPDAUtil;
import com.tnbpda.vo.Message;

public class AdminDAOImpl implements AdminDAO {
	String fname = "msg";

	@Override
	public void insertMessage(Message msg) {
		try {
			List<Message> msgList = (List<Message>) TNBPDAUtil
					.readFromStream(fname);
			if (msgList == null) {
				msgList = new ArrayList<Message>();
			}
			int messageCount = msgList.size();

			msgList.add(msg);
			msg.setMid(messageCount++);
			TNBPDAUtil.writeToStream(msgList, fname);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Message> readAllMessage() {
		List<Message> list = null;

		try {
			list = (List<Message>) TNBPDAUtil.readFromStream(fname);
			if (list == null) {
				list = new ArrayList<Message>();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void deleteMessage(Message msg) {
		// TODO Auto-generated method stub
		try {
			List<Message> msgList = (List<Message>) TNBPDAUtil
					.readFromStream(fname);
			if (msgList == null) {
				msgList = new ArrayList<Message>();
			}
			for (Message message : msgList) {
				if (message.getMid() == msg.getMid()) {
					msgList.remove(message);
					break;
				}
			}
			TNBPDAUtil.writeToStream(msgList, fname);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
