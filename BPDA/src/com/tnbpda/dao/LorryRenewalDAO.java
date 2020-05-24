package com.tnbpda.dao;

import java.util.List;

import com.tnbpda.vo.Lorry;
import com.tnbpda.vo.LorryRenewal;
import com.tnbpda.vo.Reminder;

public interface LorryRenewalDAO {
	
	public List<Reminder> readLorryInfo(Lorry lorry);
	
	public LorryRenewal updateLorry(LorryRenewal lorry);
	
	
}
