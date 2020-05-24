package com.tnbpda.dao;

import java.util.Date;
import java.util.List;

import com.tnbpda.vo.Subscription;
import com.tnbpda.vo.SubscriptionPayment;

public interface SubscriptionDAO {

	public Subscription retrieveSubscriber(Subscription subscription);
	
	public Subscription writeSubscriptionList(Subscription subscription);
	
	public List<Subscription> readSubscriptionList();
	
	public Subscription deleteSubscriptionPayment(Subscription paytm);
	
	public int isReminder(Date ipDate);
}
