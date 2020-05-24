package com.tnbpda.dao;

import java.util.List;
import java.util.TreeMap;

import com.tnbpda.vo.Dealer;
import com.tnbpda.vo.RO;

public interface DealerDAO {

	public Dealer insertDealer(Dealer dealer);
	
	public  Dealer readDealer(Dealer dealer);
	
    public List<Dealer> retrieveDealers(Dealer dealer);
    
    public Dealer updateDealer(Dealer dealer);
    
    public void updateDealerPassword(Dealer dealer);
    
    public List<Dealer> deleteDealer(Dealer dealer);
/*    
    public void updateRO(RO ro);
    
    public  RO readRO(RO ro);*/
}
