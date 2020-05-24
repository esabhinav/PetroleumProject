package com.tnbpda.dao.objImpl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import com.tnbpda.dao.SubscriptionDAO;
import com.tnbpda.util.TNBPDAConstants;
import com.tnbpda.util.TNBPDAUtil;
import com.tnbpda.vo.Dealer;
import com.tnbpda.vo.Subscription;
import com.tnbpda.vo.SubscriptionPayment;

public class SubscriptionDAOImpl implements SubscriptionDAO, TNBPDAConstants {
	String fName = "subscribers";

	@Override
	public Subscription retrieveSubscriber(Subscription subscription) {
		List<Subscription> subscriberList = readSubscriptionList();
		for (Subscription youTube : subscriberList) {
			if (youTube.getCcNo() == subscription.getCcNo()) {
				System.out.println(youTube.getCcNo() + ":"
						+ youTube.isLifeLongSubscription() + ":"
						+ youTube.isYearlySubscription());
				return youTube;
			}
		}
		Subscription facebook = new Subscription();
		facebook.setLifeLongSubscription(false);
		facebook.setYearlySubscription(false);
		return facebook;
	}

	@Override
	public List<Subscription> readSubscriptionList() {
		List<Subscription> subscriberList = null;

		try {
			subscriberList = (List<Subscription>) TNBPDAUtil
					.readFromStream(fName);
			if (subscriberList == null) {
				System.out.println("Did it enter here?");
				subscriberList = new ArrayList<Subscription>();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return subscriberList;
	}

	@Override
	public Subscription writeSubscriptionList(Subscription subscription) {
		// default for 15 days.
		List<Subscription> subscriberList = null;
		Subscription panneer = null;
		Date expDate = new Date();
		try {
			
			Date currentDate = new Date();
			long ltime = currentDate.getTime() + 15 * 24 * 60 * 60 * 1000;
			subscriberList = (List<Subscription>) TNBPDAUtil
					.readFromStream(fName);
			for(Subscription scb:subscriberList) {
				if(subscription.getCcNo()==scb.getCcNo()) {
					if (subscription.isLifeLongSubscription()) {
						Calendar cal = Calendar.getInstance();
						expDate = new Date();
						cal.setTime(expDate);
						cal.add(Calendar.YEAR, 10); // Where n is int
						expDate = cal.getTime();
						expDate = cal.getTime();
						scb.setSubsEndDate(expDate);
						scb.setLifeLongSubscription(true);
					} else if (subscription.isYearlySubscription()) {
						Calendar cal = Calendar.getInstance();
						expDate = new Date();
						cal.setTime(expDate);
						cal.add(Calendar.YEAR, 1); // Where n is int
						expDate = cal.getTime();
						expDate = cal.getTime();
						scb.setSubsEndDate(expDate);
						scb.setYearlySubscription(true);
						List<SubscriptionPayment> subPayList = scb.getAnnualPayment();
						subPayList.add(subscription.getAnnualPayment().get(0));
					} else { // not yet registered. so 15 days
						scb.setSubsEndDate(new Date(ltime));
					
					}
					scb.setSubscriptionDate(currentDate);
					System.out.println("SUB SC "+scb.getSubsEndDate());
					break;
				}
			}
			
			
			TNBPDAUtil.writeToStream(subscriberList, fName);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return panneer;
	}
	//@Override
	public Subscription writeSubscriptionListd(Subscription subscription) {
		List<Subscription> subscriberList = null;
		List<Subscription> youTubeList = new ArrayList<Subscription>();
		List<SubscriptionPayment> paymentList;
		Date currentDate = new Date();
		long ltime = currentDate.getTime() + 15 * 24 * 60 * 60 * 1000;
		Date expDate = new Date(ltime);
		try {
			subscription.setSubscriptionDate(currentDate);
			subscription.setSubsEndDate(expDate);
			System.out.println(currentDate);
			subscriberList = (List<Subscription>) TNBPDAUtil
					.readFromStream(fName);
			if (subscriberList == null) {
				subscriberList = new ArrayList<Subscription>();
			}
			for (Subscription youTube : subscriberList) {
				if (youTube.getCcNo() != subscription.getCcNo()) {
					youTubeList.add(youTube);
				} else if (youTube.getCcNo() == subscription.getCcNo()) {
					if (subscription.isLifeLongSubscription()) {
						Calendar cal = Calendar.getInstance();
						expDate = new Date();
						cal.setTime(expDate);
						cal.add(Calendar.YEAR, 10); // Where n is int
						expDate = cal.getTime();
						expDate = cal.getTime();
						subscription.setSubsEndDate(expDate);
					} else if (subscription.isYearlySubscription()) {
						Calendar cal = Calendar.getInstance();
						expDate = new Date();
						cal.setTime(expDate);
						cal.add(Calendar.YEAR, 1); // Where n is int
						expDate = cal.getTime();
						expDate = cal.getTime();
						subscription.setSubsEndDate(expDate);
					}
				}
			}
			youTubeList.add(subscription);
			TNBPDAUtil.writeToStream(youTubeList, fName);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public Subscription deleteSubscriptionPayment(Subscription subscription) {
		List<Subscription> subscriberList = null;
		List<SubscriptionPayment> spList = null;
		try {
			subscriberList = (List<Subscription>) TNBPDAUtil
					.readFromStream(fName);
			for (Subscription youTube : subscriberList) {
				if (youTube.getCcNo() == subscription.getCcNo()) {
					spList = youTube.getAnnualPayment();
					Iterator<SubscriptionPayment> it = spList.iterator();
					while (it.hasNext()) {
						SubscriptionPayment sp = it.next();
						if (sp.getSubscriptionYear() == subscription
								.getAnnualPayment().get(0)
								.getSubscriptionYear()) {
							it.remove();
							break;
						}
					}

				}
			}
			TNBPDAUtil.writeToStream(subscriberList, fName);
			subscriberList = (List<Subscription>) TNBPDAUtil
					.readFromStream(fName);
			for (Subscription youTube : subscriberList) {
				if (youTube.getCcNo() == subscription.getCcNo()) {
					System.out.println("matched................");
					return youTube;

				}
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	public int isReminder(Date ipDate) {
		Date currentDate = new Date();
		long remainingDate = (ipDate.getTime() - currentDate.getTime()) / 86400000;
		System.out.println(remainingDate);
		if (remainingDate > 0 & remainingDate <= 15) {
			return TEMP_ACCESS;
		} else if (remainingDate < 0) {
			return BLOCKED_ACCESS;
		} else
			return PERMENANT_ACCESS;
	}
}
