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
 * Servlet implementation class SubscriptionController
 */
@WebServlet("/SubscriptionController")
public class SubscriptionController extends HttpServlet implements
		TNBPDAConstants {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SubscriptionController() {
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
		// TODO Auto-generated method stub
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
		Dealer user = (Dealer) session.getAttribute(TNBPDAConstants.AUTH_USER);
		System.out.println("hjjbhjujbjkb  :" + user.getCcNo());
		String targetPage = null;
		try {
			TNBPDAUtil.FILEPATH = request.getServletContext().getInitParameter(
					"ObjFile");
			System.out.println("fi PA " + TNBPDAUtil.FILEPATH);
			DAOFactory daoF = DAOFactory.getDAOFactory(4);
			SubscriptionDAO subsDAO = daoF.getSubscriptionDAO();

			int option = 0;
			if (strOption != null) {
				option = Integer.parseInt(strOption);
			}
			Subscription youTube = new Subscription();
			switch (option) {
			case 0:// go to Subscription page
				targetPage = "/jsp/subscription/subscription.jsp";
				break;
			case 1:// ADD NEW PAYMENT page
				Subscription facebook = new Subscription();
				SubscriptionPayment paytm = new SubscriptionPayment();
				int ccid = Integer.parseInt(request.getParameter("cc"));
				youTube.setCcNo(ccid);
				List<SubscriptionPayment> subsList = new ArrayList<SubscriptionPayment>();
				youTube.setCcNo(ccid);
				facebook = subsDAO.retrieveSubscriber(youTube);
				if(facebook.getAnnualPayment()!=null){
					subsList=facebook.getAnnualPayment();
				}
				youTube.setLifeLongSubscription(Boolean.parseBoolean(request
						.getParameter("life_subscription")));
				if (!youTube.isLifeLongSubscription()) {
					youTube.setYearlySubscription(Boolean.parseBoolean(request
							.getParameter("yearly_subscription")));
					paytm.setAmount(1000);
					paytm.setSubscriptionYear(Integer.parseInt(request
							.getParameter("subscription_year")));
					subsList.add(paytm);
				}
				youTube.setAnnualPayment(subsList);
				facebook = subsDAO.writeSubscriptionList(youTube);
				request.setAttribute(SUBSCRIBER, facebook);
				targetPage = "/jsp/subscription/subscriptionSuccess.jsp";
				break;
			case 2: // read the payment details.
				ccid = Integer.parseInt(request.getParameter("cci"));
				subsList = new ArrayList<SubscriptionPayment>();
				youTube.setCcNo(ccid);
				facebook = subsDAO.retrieveSubscriber(youTube);
				System.out.println("--------->"+facebook.getCcNo() +":"+facebook.getSubscriptionDate()+":"+facebook.getSubsEndDate());
				System.out.println(facebook.isLifeLongSubscription());
				request.setAttribute("SUBSCRIBER", facebook);
				request.setAttribute("PAYMENT", facebook.getAnnualPayment());
				targetPage = "/jsp/subscription/subscription.jsp";
				break;

			case 3: // delete payment
				ccid = Integer.parseInt(request.getParameter("cc"));
				System.out.println("CC ID "+ccid);
				int year = Integer.parseInt(request.getParameter("year"));
				youTube.setCcNo(ccid);
				SubscriptionPayment sp = new SubscriptionPayment();
				sp.setSubscriptionYear(year);
				//List<SubscriptionPayment> spList = youTube.getAnnualPayment();
				List<SubscriptionPayment> spList = new ArrayList<SubscriptionPayment>();
				spList.add(sp);
				youTube.setAnnualPayment(spList);
				facebook = subsDAO.deleteSubscriptionPayment(youTube);
	         	System.out.println("faceBook "+facebook);
	         	if(facebook!=null)
				request.setAttribute("SUBSCRIBER", facebook);
				if(facebook.getAnnualPayment()!=null)
				request.setAttribute("PAYMENT", facebook.getAnnualPayment());
				targetPage = "/jsp/subscription/subscription.jsp";
				break;
			case 4:
				List<Subscription> list = subsDAO.readSubscriptionList();
				request.setAttribute(SUB_LIST, list);
				targetPage = "/jsp/subscription/list.jsp";
				break;
			case 5:
				targetPage = "/jsp/subscription/alert.jsp";
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
			//System.out.println("Exception occured...." + e);
		}
		request.setAttribute(MODULE, "SubscriptionController");
		request.getRequestDispatcher(targetPage).forward(request, response);
	}

}
