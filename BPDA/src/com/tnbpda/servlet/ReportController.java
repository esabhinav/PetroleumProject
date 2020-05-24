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
import com.tnbpda.dao.RODAO;
import com.tnbpda.util.TNBPDAConstants;
import com.tnbpda.vo.RO;

/**
 * Servlet implementation class AdminController
 */
@WebServlet("/report")
public class ReportController extends HttpServlet implements TNBPDAConstants {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReportController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stubString strMod =
		// request.getParameter("mod");
		String strOption = request.getParameter("option");
		int option = 4;
		if (strOption != null) {
			option = Integer.parseInt(strOption);
		}

		DAOFactory daoF = DAOFactory.getDAOFactory(4);
		RODAO roDAO = daoF.getRODAO();
		HttpSession session = request.getSession();
		RO ro = (RO) session.getAttribute(RO);

		String targetPage = null;
		System.out.println("option is>> " + option);
		switch (option) {

		case 1: //
			targetPage = "";
			break;
		case 2: //
			String product = request.getParameter("product");
			System.out.println("Prod" + product);
			int noOfNozzle = ro.getMpdList().get(product).getNoOfNozzle();
			request.setAttribute(PRODUCT, product);
			request.setAttribute(NOOF_NOZZLE, noOfNozzle);
			targetPage = "/jsp/inspection/report.jsp";
			break;
		case 3: //
			targetPage = "";
			break;
		case 4: // read All Vehicle
			request.setAttribute(NOOF_NOZZLE, 0);
			targetPage = "/jsp/inspection/report.jsp";
			break;

		case 6: // delete message

			break;
		default:
			break;
		}

		request.setAttribute(MODULE, "vehicle");
		request.getRequestDispatcher(targetPage).forward(request, response);
	}

}
