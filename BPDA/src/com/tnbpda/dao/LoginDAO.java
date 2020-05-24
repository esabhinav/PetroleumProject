package com.tnbpda.dao;

import java.util.List;

import com.tnbpda.vo.Dealer;
import com.tnbpda.vo.Subscription;
import com.tnbpda.vo.User;

public interface LoginDAO {

	//public  boolean firstTimeLogin(User user);
	
	public  Dealer validateLogin(User user);
	
	public boolean updatePassword(User user);
	
	public int totalCount();

	public List<Subscription> retrieveSubscribers();
}
