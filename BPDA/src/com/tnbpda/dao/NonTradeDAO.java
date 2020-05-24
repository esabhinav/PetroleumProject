package com.tnbpda.dao;

import java.util.HashMap;
import java.util.List;

import com.tnbpda.vo.NonTrade;

public interface NonTradeDAO {

	public void insertBusiness(NonTrade business);
	
	public  HashMap<String,List<NonTrade>> readAll(NonTrade business);
	
	public void deleteTrade(NonTrade business);
}
