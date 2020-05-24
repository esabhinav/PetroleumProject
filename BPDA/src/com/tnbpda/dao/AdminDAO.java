package com.tnbpda.dao;

import java.util.List;

import com.tnbpda.vo.Message;

public interface AdminDAO {

	public void insertMessage(Message msg);

	public List<Message> readAllMessage();

	public void deleteMessage(Message msg);
}
