package com.tnbpda.dao;

import com.tnbpda.dao.objImpl.AdminDAOImpl;
import com.tnbpda.dao.objImpl.ReminderDAOImpl;
import com.tnbpda.dao.objImpl.CommiteeDAOImpl;
import com.tnbpda.dao.objImpl.CustomerDAOImpl;
import com.tnbpda.dao.objImpl.DealerDAOImpl;
import com.tnbpda.dao.objImpl.DealerDAOImplHashMap;
import com.tnbpda.dao.objImpl.FeedbackDAOImpl;
import com.tnbpda.dao.objImpl.ForumDAOImpl;
import com.tnbpda.dao.objImpl.LoginDAOImpl;
import com.tnbpda.dao.objImpl.LorryDAOImpl;
import com.tnbpda.dao.objImpl.LorryRenewalDAOImpl;
import com.tnbpda.dao.objImpl.NonTradeDAOImpl;
import com.tnbpda.dao.objImpl.RODAOImpl;
import com.tnbpda.dao.objImpl.SubscriptionDAOImpl;

 


/**
 * 
 * @author PanneerSelvam V(173813)
 * @version 1.0,
 */
public class ObjDAOFactory extends DAOFactory {

	@Override
	public DealerDAO getDealerDAO() {

		return new DealerDAOImplHashMap();
	}

	@Override
	public LoginDAO getLoginDAO() {
		 
		return new LoginDAOImpl();
	}

	@Override
	public AdminDAO getAdminDAO() {
	 
		return new AdminDAOImpl();
	}

	@Override
	public CustomerDAO getCustomerDAO() {
		 
		return new CustomerDAOImpl();
	}

	@Override
	public ForumDAO getForumDAO() {
		 
		return new ForumDAOImpl();
	}

	@Override
	public RODAO getRODAO() {
		// TODO Auto-generated method stub
		return new RODAOImpl();
	}

	@Override
	public FeedbackDAO getFeedbackDAO() {
		// TODO Auto-generated method stub
		return new FeedbackDAOImpl();
	}

	@Override
	public CommiteeDAO getCommitteeDAO() {
		// TODO Auto-generated method stub
		return new CommiteeDAOImpl();
	}

	@Override
	public ReminderDAO getReminderDAO() {
		// TODO Auto-generated method stub
		return new ReminderDAOImpl();
	}

	@Override
	public NonTradeDAO getNonTradeDAO() {
		// TODO Auto-generated method stub
		return new NonTradeDAOImpl();
	}

	@Override
	public LorryDAO getLorryDAO() {
		// TODO Auto-generated method stub
		return new LorryDAOImpl();
	}

	@Override
	public LorryRenewalDAO getLorryRenewal() {
		// TODO Auto-generated method stub
		return new LorryRenewalDAOImpl();
	}

	@Override
	public SubscriptionDAO getSubscriptionDAO() {
		// TODO Auto-generated method stub
		return new SubscriptionDAOImpl();
	}

}