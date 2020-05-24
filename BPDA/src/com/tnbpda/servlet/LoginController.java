package com.tnbpda.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.util.HSSFColor.BLACK;

import com.tnbpda.dao.DAOFactory;
import com.tnbpda.dao.DealerDAO;
import com.tnbpda.dao.LoginDAO;
import com.tnbpda.dao.RODAO;
import com.tnbpda.dao.SubscriptionDAO;
import com.tnbpda.util.TNBPDAConstants;
import com.tnbpda.util.TNBPDAUtil;
import com.tnbpda.vo.Dealer;
import com.tnbpda.vo.Subscription;
import com.tnbpda.vo.SubscriptionPayment;
import com.tnbpda.vo.User;
import com.tnbpda.vo.RO;

/**
 * 173975 119083 // Manokaran Servlet implementation class LoginController
 */
@WebServlet("/login")
public class LoginController extends HttpServlet implements TNBPDAConstants {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String strMod = request.getParameter("mod");
		String strOption = request.getParameter("option");

		HttpSession session = request.getSession();
		String targetPage = null;
		try {
			TNBPDAUtil.FILEPATH = request.getServletContext().getInitParameter(
					"ObjFile");
			System.out.println("fi PA " + TNBPDAUtil.FILEPATH);
			DAOFactory daoF = DAOFactory.getDAOFactory(4);
			LoginDAO loginDAO = daoF.getLoginDAO();
			DealerDAO dealerDAO = daoF.getDealerDAO();

			RODAO roDAO = daoF.getRODAO();
			SubscriptionDAO subsDAO = daoF.getSubscriptionDAO();

			int option = 0;
			if (strOption != null) {
				option = Integer.parseInt(strOption);
			}
			session.setAttribute(DISTRICT, TNBPDAUtil.loadDistrict());
			session.setAttribute(SUPPLY, TNBPDAUtil.loadSupplyLocation());
			session.setAttribute(TERRIORITY, TNBPDAUtil.loadTerriority());
			session.setAttribute(USER_ACCESS, TNBPDAUtil.fetchAdminUsers());
			List<Dealer> listDealers = dealerDAO.retrieveDealers(new Dealer());
			// calculateBday(listDealers);
			String strCC = request.getParameter("cc");

			Dealer kumar = new Dealer();
			RO ro = new RO();
			switch (option) {
			case 0:
				targetPage = "/jsp/login/login.jsp";
				break;

			case 1: // validate logged in user //110924
				String strPW = request.getParameter("pw");
				kumar.setUserName(strCC);
				kumar.setPassword(strPW);
				System.out.println(strCC + ": " + strPW);
				Subscription subs = new Subscription();
				kumar = loginDAO.validateLogin(kumar);
				setAccessLevel(kumar);
				session.setAttribute(AUTH_USER, kumar);

				System.out.println("processing session ..." + kumar.getCcNo());
				if (!kumar.isStatus() && !kumar.isFirstTime()) {
					request.setAttribute("ERR", "Validation fails.");
					targetPage = "/home";
					// targetPage = "/dealer?option=7";
					// kumar.setFirstTime(true);
					targetPage = "/jsp/login/login.jsp";
				} else {
					if (kumar.isFirstTime()) {
						int count = loginDAO.totalCount();
						session.setAttribute("count", count);
						System.out.println("Count---->" + count);
						subs.setCcNo(kumar.getCcNo());
						subs = subsDAO.retrieveSubscriber(subs);
						if (!subs.isLifeLongSubscription()
								|| !subs.isYearlySubscription()) {
							SubscriptionPayment payment = new SubscriptionPayment();
							subsDAO.writeSubscriptionList(subs);
						}
						targetPage = "/jsp/login/login.jsp";
						// targetPage = "/dealer?option=7";
					} else {
						ro.setCcNo(strCC);
						ro = roDAO.readRO(ro);
						int count = loginDAO.totalCount();
						session.setAttribute("count", count);
						System.out.println("Count---->" + count);
						subs.setCcNo(kumar.getCcNo());
						subs = subsDAO.retrieveSubscriber(subs);
						System.out.println("-----"
								+ subs.isYearlySubscription());
						Date expDate = subs.getSubsEndDate();
						System.out.println(expDate);
						int i = 0;
						// if expdate is null, then temp access
						if (expDate != null) {
							i = subsDAO.isReminder(expDate);
							Date current = new Date();
							int daysRemaining = (int) ((expDate.getTime()-current.getTime()) /  86400000);
							if (i == TEMP_ACCESS) {
								System.out.println("Entered TEMP_ACCESS");
								session.setAttribute(DAYS_REMAINING, daysRemaining);
								session.setAttribute(SUBSCRIPTION, "Warning");
								targetPage = "/home";
							} else if (i == BLOCKED_ACCESS) {
								System.out.println("Entered BLOCKED_ACCESS");
								session.setAttribute(SUBSCRIPTION, "Membership");
								request.setAttribute("ERR", "Not a Member.");
								targetPage = "/jsp/login/login.jsp";
							} else {
								System.out.println("Entered Main");
								targetPage = "/home";
							}
						} else {
							request.setAttribute(SUBSCRIPTION, "Membership");
							request.setAttribute("ERR", "Validation fails.");
							targetPage = "/jsp/login/login.jsp";
						}
						// targetPage = "/jsp/login/login.jsp";
						// targetPage = "/dealer?option=3";
					}
				}
				System.out.println("Password : " + kumar.getPassword());
				break;
			case 2: // change the dealer password
				strCC = request.getParameter("ccode");
				strPW = request.getParameter("pw");
				System.out.println("111" + strPW);
				kumar.setPassword(strPW);
				kumar.setUserName(strCC);
				boolean status = loginDAO.updatePassword(kumar);
				int count = loginDAO.totalCount();
				request.setAttribute("count", count);
				System.out.println("Count---->" + count);
				targetPage = "/jsp/home/home.jsp";
				System.out.println("Status : " + status);
				kumar = (Dealer) session.getAttribute(AUTH_USER);
				System.out.println(" see in case 2");
				System.out.println("...................................."
						+ kumar.getCcNo() + ".................."
						+ kumar.getRoName());

				if (status) {
					count = loginDAO.totalCount();
					session.setAttribute("count", count);
					System.out.println("Count---->" + count);
					request.setAttribute("UD", true);
					targetPage = "/jsp/login/success_dealer.jsp";
					/* targetPage = "/jsp/dealer/update_dealer.jsp"; */
				}
				break;
			case 3: // Check subscription or log out..
				/*
				 * Subscription youTube = new Subscription();
				 * youTube.setCcNo(kumar.getCcNo());
				 * youTube=subsDAO.retrieveSubscriber(youTube);
				 * if(!youTube.isLifeLongSubscription
				 * ()||!youTube.isYearlySubscription()){
				 * 
				 * 
				 * }else{
				 */
				session.removeAttribute(AUTH_USER);
				session.removeAttribute(SUBSCRIPTION);
				targetPage = "/jsp/login/login.jsp";
				break;
			case 4: // redirect update dealer..
				kumar = (Dealer) session.getAttribute(AUTH_USER);
				System.out.println(" see in case 2");
				System.out.println("...................................."
						+ kumar.getCcNo() + ".................."
						+ kumar.getRoName());
				request.setAttribute("UD", true);
				targetPage = "/jsp/dealer/update_dealer.jsp";
				break;
			case 5: // redirect to home page..
				kumar = (Dealer) session.getAttribute(AUTH_USER);
				System.out.println(" see in case 2");
				System.out.println("...................................."
						+ kumar.getCcNo() + ".................."
						+ kumar.getRoName());
				targetPage = "/jsp/home/home.jsp";
				break;
			default:
				break;
			}

			// dealerDAO.readDealer(kumar);
			session.setAttribute(RO, ro);
			session.setAttribute(AUTH_USER, kumar);
			System.out.println("Kumatr :: " + targetPage);
		} catch (Exception e) {
			System.out.println("Exception occured...." + e);
		}

		request.getRequestDispatcher(targetPage).forward(request, response);
	}

	private void setAccessLevel(Dealer kumar) {
		Map<String, String> accessMap = TNBPDAUtil.loadAccess();
		Iterator<Map.Entry<String, String>> it = accessMap.entrySet()
				.iterator();
		while (it.hasNext()) {
			Map.Entry<String, String> me = it.next();
			String key = me.getKey();
			String value = me.getValue();
			if (value.contains(String.valueOf(kumar.getCcNo()))) {
				kumar.setAccessLevel(key);
			}
		}
		System.out.println(" SET ACCESS LEVEL : " + kumar.getAccessLevel());
	}

	private static List<Dealer> calculateBday(List<Dealer> dealerList) {
		List<Dealer> bList = new ArrayList<Dealer>();
		Date currentDate = new Date();
		SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy");
		String strDate = format.format(currentDate);
		System.out.println("dealerList : " + dealerList.size());
		System.out.println("TODAY DATE :" + strDate);
		for (Dealer abi : dealerList) {
			String dob = abi.getDateOfBirth();
			System.out.println(abi.getCcNo() + ": " + dob);
			if (dob.equals(strDate))
				// format.parse(dob);

				if (dob.equals(strDate)) {
					bList.add(abi);
					// System.out.println("------------MM ------- " +
					// abi.getEname());
				}
		}
		System.out.println(bList);
		return bList;
	}

	public static void main(String[] args) {
		List<Dealer> dealerList = (List<Dealer>) TNBPDAUtil
				.readFromStream("dealer");
		calculateBday(dealerList);
	}

}
