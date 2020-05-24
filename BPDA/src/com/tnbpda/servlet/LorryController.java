package com.tnbpda.servlet;

import java.io.IOException;
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
import com.tnbpda.util.TNBPDAConstants;
import com.tnbpda.util.TNBPDAUtil;
import com.tnbpda.vo.Answer;
import com.tnbpda.vo.Dealer;
import com.tnbpda.vo.Lorry;
import com.tnbpda.vo.Question;

/**
 * Servlet implementation class FeedbackController
 */
@WebServlet("/lorry")
public class LorryController extends HttpServlet implements TNBPDAConstants {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LorryController() {
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
			LorryDAO lorryDAO = daoF.getLorryDAO();
			Lorry lorry = new Lorry();
			int ccid = 5;
			switch (option) {
			case 0://getListofLorries
				ccid = Integer.parseInt(request.getParameter("ccid"));
				System.out.println(ccid);
				lorry.setCcid(ccid);
				List<Lorry> lorryList = lorryDAO.readLorryList(lorry);
				request.setAttribute(LORRY_LIST, lorryList);
				targetPage = "/jsp/lorry/list.jsp";
				System.out.println("sbkjafbbjaskfj");
				break;
			case 1: // insert Lorry.
				ccid = Integer.parseInt(request.getParameter("ccid"));
				System.out.println(ccid);
				String registrationNo = request.getParameter("registrationNo");
				int capacity = Integer.parseInt(request.getParameter("capacity"));
				String dateOfRegistration = request.getParameter("dateOfRegistration");
				String vendorId = request.getParameter("vendorId");
				lorry.setCcid(ccid);
				lorry.setRegistrationNo(registrationNo);
				lorry.setCapacity(capacity);
				lorry.setDateOfRegistration(dateOfRegistration);
				lorry.setVendorId(vendorId);
				lorryList = lorryDAO.insertLorry(lorry);
				if(lorryList==null){
					session.setAttribute(GET_ALERT, "Yes");//Just initialize a random variable.
					targetPage = "/jsp/lorry/add.jsp";
					break;
				}
				System.out.println("lorryList : " + lorryList);
				request.setAttribute(LORRY_LIST, lorryList);
				targetPage = "/jsp/lorry/list.jsp";
				break;
			case 2: // delete Lorry.
				ccid = Integer.parseInt(request.getParameter("ccid"));
				registrationNo = request.getParameter("regno");
				System.out.println(ccid);
				lorry.setCcid(ccid);
				lorry.setRegistrationNo(registrationNo);
				lorryDAO.deleteLorry(lorry);
				lorryList = lorryDAO.readLorryList(lorry);
				request.setAttribute(LORRY_LIST, lorryList);
				targetPage = "/jsp/lorry/list.jsp";
				break;
			case 3:
				session.setAttribute(GET_ALERT, "No");
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

