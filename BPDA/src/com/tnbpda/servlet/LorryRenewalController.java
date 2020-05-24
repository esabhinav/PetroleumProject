package com.tnbpda.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tnbpda.dao.DAOFactory;
import com.tnbpda.dao.DealerDAO;
import com.tnbpda.dao.ForumDAO;
import com.tnbpda.dao.LorryDAO;
import com.tnbpda.dao.LorryRenewalDAO;
import com.tnbpda.util.TNBPDAConstants;
import com.tnbpda.util.TNBPDAUtil;
import com.tnbpda.vo.Answer;
import com.tnbpda.vo.Dealer;
import com.tnbpda.vo.Lorry;
import com.tnbpda.vo.LorryRenew;
import com.tnbpda.vo.LorryRenewal;
import com.tnbpda.vo.Question;

/**
 * Servlet implementation class FeedbackController
 */
@WebServlet("/lorryRenewal")
public class LorryRenewalController extends HttpServlet implements TNBPDAConstants {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LorryRenewalController() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String strMod = request.getParameter("mod");
		String strOption = request.getParameter("option");
		HttpSession session = request.getSession();
		Dealer panneer = (Dealer) session.getAttribute(AUTH_USER);
		int option = 0;
		if (strOption != null) {
			option = Integer.parseInt(strOption);
		}
		String targetPage = null;
		try {
			System.out.println("option" + option);
			DAOFactory daoF = DAOFactory.getDAOFactory(4);
			LorryRenewalDAO lorryRenewalDAO = daoF.getLorryRenewal();
			LorryDAO lorryDAO = daoF.getLorryDAO();
			Lorry lorry = new Lorry();
			LorryRenewal lorryRenewal = new LorryRenewal();
			int ccid = 5;
			switch (option) {
			case 0://view Lorry Renewal.
				ccid = Integer.parseInt(request.getParameter("ccid"));
				String registrationNo = request.getParameter("regno");
				lorry.setCcid(ccid);
				lorry.setRegistrationNo(registrationNo);
				//lorryRenewal=lorryRenewalDAO.readLorryInfo(lorry);
				if(lorryRenewal==null)
					lorryRenewal = new LorryRenewal();
				request.setAttribute(LORRY_RENEWAL, lorryRenewal);
			 
				targetPage = "/jsp/lorry/info.jsp";
			 
				break;
			case 1: // insert Lorry Renewal.
				System.out.println("ASJNFJ");
				ccid = Integer.parseInt(request.getParameter("ccid"));
				String tldate = request.getParameter("tldate");
				String clldate = request.getParameter("clldate");
				String fcdate = request.getParameter("fcdate");
				String calidate = request.getParameter("calidate");
				String edate = request.getParameter("edate");
				String rodate = request.getParameter("rodate");
				String pedate = request.getParameter("pedate");
				String fgdate = request.getParameter("fgdate");
				int tlperiod = Integer.parseInt(request.getParameter("tlperiod"));
				int cllperiod = Integer.parseInt(request.getParameter("cllperiod"));
				int fcperiod = Integer.parseInt(request.getParameter("fcperiod"));
				int caliperiod = Integer.parseInt(request.getParameter("caliperiod"));
				int eperiod = Integer.parseInt(request.getParameter("eperiod"));
				int roperiod = Integer.parseInt(request.getParameter("roperiod"));
				int peperiod = Integer.parseInt(request.getParameter("peperiod"));
				int fgperiod = Integer.parseInt(request.getParameter("fgperiod"));
				int tlreminder = Integer.parseInt(request.getParameter("tlreminder"));
				int cllreminder = Integer.parseInt(request.getParameter("cllreminder"));
				int fcreminder = Integer.parseInt(request.getParameter("fcreminder"));
				int calireminder = Integer.parseInt(request.getParameter("calireminder"));
				int ereminder = Integer.parseInt(request.getParameter("ereminder"));
				int roreminder = Integer.parseInt(request.getParameter("roreminder"));
				int pereminder = Integer.parseInt(request.getParameter("pereminder"));
				int fgreminder = Integer.parseInt(request.getParameter("fgreminder"));
				LorryRenew lorryrenew = new LorryRenew();
				List<LorryRenew> listRenew = new ArrayList<LorryRenew>();
				lorryrenew.setRenewalType("TL");
				lorryrenew.setExpDate(tldate);
				lorryrenew.setPeriod(tlperiod);
				lorryrenew.setReminder(tlreminder);
				listRenew.add(lorryrenew);
				lorryrenew.setRenewalType("CLL");
				lorryrenew.setExpDate(clldate);
				lorryrenew.setPeriod(cllperiod);
				lorryrenew.setReminder(cllreminder);
				listRenew.add(lorryrenew);
				lorryrenew.setRenewalType("FC");
				lorryrenew.setExpDate(fcdate);
				lorryrenew.setPeriod(fcperiod);
				lorryrenew.setReminder(fcreminder);
				listRenew.add(lorryrenew);
				lorryrenew.setRenewalType("Calibration");
				lorryrenew.setExpDate(calidate);
				lorryrenew.setPeriod(caliperiod);
				lorryrenew.setReminder(calireminder);
				listRenew.add(lorryrenew);
				lorryrenew.setRenewalType("Explosive");
				lorryrenew.setExpDate(edate);
				lorryrenew.setPeriod(eperiod);
				lorryrenew.setReminder(ereminder);
				listRenew.add(lorryrenew);
				lorryrenew.setRenewalType("Road");
				lorryrenew.setExpDate(rodate);
				lorryrenew.setPeriod(roperiod);
				lorryrenew.setReminder(roreminder);
				listRenew.add(lorryrenew);
				lorryrenew.setRenewalType("Permit");
				lorryrenew.setExpDate(pedate);
				lorryrenew.setPeriod(peperiod);
				lorryrenew.setReminder(pereminder);
				listRenew.add(lorryrenew);
				lorryrenew.setRenewalType("FireGun");
				lorryrenew.setExpDate(fgdate);
				lorryrenew.setPeriod(fgperiod);
				lorryrenew.setReminder(fgreminder);
				listRenew.add(lorryrenew);
				Boolean insured = Boolean.parseBoolean(request.getParameter("insured"));
				Boolean toll = Boolean.parseBoolean(request.getParameter("toll"));
				Boolean bill = Boolean.parseBoolean(request.getParameter("bill"));
				registrationNo = request.getParameter("regno");
				System.out.println(registrationNo);
				lorryRenewal.settLInsurDate(tldate);
				System.out.println(lorryRenewal.gettLInsurDate());
				lorryRenewal.setcLLInsurDate(clldate);
				lorryRenewal.setfCDate(fcdate);
				lorryRenewal.setCalibrationDate(calidate);
				lorryRenewal.setExplosiveDate(edate);
				lorryRenewal.setRoadTaxDate(rodate);
				lorryRenewal.setPermitDate(pedate);
				lorryRenewal.setFireGunDate(fgdate);
				lorryRenewal.setCrewInsurance(insured);
				lorryRenewal.setLorryToll(toll);
				lorryRenewal.setRentalBill(bill);
				lorryRenewal.setRegistrationNo(registrationNo);
				System.out.println(lorryRenewal.getRegistrationNo());
				LorryRenewal lor = lorryRenewalDAO.updateLorry(lorryRenewal);
				System.out.println("lorryRenewal : " + lor);
				request.setAttribute(LORRY_RENEWAL, lor);
				targetPage = "/jsp/lorry/info.jsp";
				break;
			case 2: // Edit Lorry.
				ccid = Integer.parseInt(request.getParameter("ccid"));
				registrationNo = request.getParameter("regno");
				System.out.println(ccid);
				System.out.println(registrationNo);
				lorry.setCcid(ccid);
				lorry.setRegistrationNo(registrationNo);
				//lorryRenewal=lorryRenewalDAO.readLorryInfo(lorry);
				if(lorryRenewal==null)
					lorryRenewal = new LorryRenewal();
				lorryRenewal.setRegistrationNo(registrationNo);
				System.out.println();
				request.setAttribute(LORRY_RENEWAL, lorryRenewal);
				targetPage = "/jsp/lorry/edit.jsp";
				break;
			case 3:
				ccid = Integer.parseInt(request.getParameter("ccid"));
				System.out.println(ccid);
				lorry.setCcid(ccid);
				List<Lorry> lorryList = lorryDAO.readLorryList(lorry);
				request.setAttribute(LORRY_LIST, lorryList);
				targetPage = "/jsp/lorry/pick.jsp";
				System.out.println("sbkjafbbjaskfj");
				break;
			case 4:
				targetPage = "/jsp/lorry/add.jsp";
				break;
			default:
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("module", "lorry");
		request.getRequestDispatcher(targetPage).forward(request, response);
	}

}