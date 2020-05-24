package com.tnbpda.dao;

import com.tnbpda.dao.impl.AdminDAOImpl;
import com.tnbpda.dao.impl.CustomerDAOImpl;
import com.tnbpda.dao.impl.DealerDAOImpl;
import com.tnbpda.dao.impl.ForumDAOImpl;
import com.tnbpda.dao.impl.LoginDAOImpl;
import com.tnbpda.dao.objImpl.LorryDAOImpl;
import com.tnbpda.dao.objImpl.LorryRenewalDAOImpl;
import com.tnbpda.dao.objImpl.SubscriptionDAOImpl;


/**
 * 
 * @author PanneerSelvam V(173813)
 * @version 1.0,
 */
public class MysqlDAOFactory extends DAOFactory {

	@Override
	public DealerDAO getDealerDAO() {

		return new DealerDAOImpl();
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
		return null;
	}

	@Override
	public FeedbackDAO getFeedbackDAO() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CommiteeDAO getCommitteeDAO() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ReminderDAO getReminderDAO() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public NonTradeDAO getNonTradeDAO() {
		// TODO Auto-generated method stub
		return null;
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