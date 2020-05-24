package com.tnbpda.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tnbpda.dao.DAOFactory;
import com.tnbpda.dao.DealerDAO;
import com.tnbpda.dao.NonTradeDAO;
import com.tnbpda.util.TNBPDAConstants;
import com.tnbpda.vo.Dealer;
import com.tnbpda.vo.NonTrade;

/**
 * Servlet implementation class TradeController
 */
@WebServlet("/trade")
public class TradeController extends HttpServlet implements TNBPDAConstants {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public TradeController() {
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
		if(strMod==null) {
			strMod= "nttrade";
		}
		String strOption = request.getParameter("option");
		int option = 1;
		if (strOption != null) {
			option = Integer.parseInt(strOption);
		}
		String targetPage = null;
		HttpSession session = request.getSession();
		DAOFactory daoF = DAOFactory.getDAOFactory(4);
		NonTradeDAO nonTradeDAO = daoF.getNonTradeDAO();
		NonTrade business = new NonTrade();
		
		Dealer dealer = (Dealer)session.getAttribute(AUTH_USER);

		switch (option) {

		case 1:
			if(strMod.equals("trade")) {
			targetPage = "/jsp/trade/templatelist.jsp";
			} else {
				targetPage = "/jsp/trade/non_trade_add.jsp";
			}
			break;
		case 2: // insert non trade details
			insertBusiness(request, business);
			nonTradeDAO.insertBusiness(business);
			HashMap<String,List<NonTrade>> map = nonTradeDAO.readAll(business);
			request.setAttribute(NON_TRADE_MAP, map);
			targetPage = "/jsp/trade/non_fuel_list.jsp";
			break;
		case 3: // Template
			targetPage = "/jsp/trade/templatelist.jsp";
			break;
		case 4:  // delete trade...
			business.setNtid(Integer.parseInt(request.getParameter("ntid")));
			nonTradeDAO.deleteTrade(business);
			map = nonTradeDAO.readAll(business);
			request.setAttribute(NON_TRADE_MAP, map);
			targetPage = "/jsp/trade/non_fuel_list.jsp";
			break;
		case 5: // Non Fuel Trade
			//business.setCcNo(dealer.getCcNo());
			 map = nonTradeDAO.readAll(business);
			request.setAttribute(NON_TRADE_MAP, map);
			targetPage = "/jsp/trade/non_fuel_list.jsp";
			break;
		default:
			break;
		}
		request.setAttribute("module", strMod);
		request.getRequestDispatcher(targetPage).forward(request, response);
	}

	private void insertBusiness(HttpServletRequest request, NonTrade business) {
		business.setCcNo(request.getParameter("ccNo"));
		business.setDistrict(request.getParameter("dr"));
		business.setBusinessCategory(request.getParameter("bc"));
		business.setbType(request.getParameter("bType"));
		business.setContact(request.getParameter("cname"));
		business.setMobile(request.getParameter("bmobile"));
		business.setAddress(request.getParameter("caddr")); 
		business.setComments(request.getParameter("comments"));
		business.setBname(request.getParameter("bname"));

	}
}
