package com.tnbpda.dao;

//Abstract class DAO Factory
public abstract class DAOFactory {

	// List of DAO types supported by the factory
	public static final int MYSQL = 1;
	public static final int ORACLE = 2;
	public static final int XML = 3;
	public static final int OBJ = 4;

	// There will be a method for each DAO that can be
	// created. The concrete factories will have to
	// implement these methods.

	public abstract DealerDAO getDealerDAO();
	
	public abstract RODAO getRODAO();

	public abstract LoginDAO getLoginDAO();

	public abstract AdminDAO getAdminDAO();

	public abstract CustomerDAO getCustomerDAO();

	public abstract ForumDAO getForumDAO();
	
	public abstract FeedbackDAO getFeedbackDAO();
	
	public abstract CommiteeDAO getCommitteeDAO();
	
	public abstract ReminderDAO getReminderDAO();

	public abstract NonTradeDAO getNonTradeDAO();
	
	public abstract LorryDAO getLorryDAO();
	
	public abstract LorryRenewalDAO getLorryRenewal();
	
	public abstract SubscriptionDAO getSubscriptionDAO();
	
	public static DAOFactory getDAOFactory(int whichFactory) {

		switch (whichFactory) {
		case MYSQL:
			return new MysqlDAOFactory();
		case ORACLE:
			// / return new OracleDAOFactory();	
		case XML:
			// / return new OracleDAOFactory();
		case OBJ:
			  return new ObjDAOFactory();
		default:
			return null;
		}
	}
}
