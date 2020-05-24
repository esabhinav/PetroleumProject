package com.tnbpda.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tnbpda.dao.ReminderDAO;
import com.tnbpda.dao.DAOFactory;
import com.tnbpda.dao.FeedbackDAO;
import com.tnbpda.util.TNBPDAConstants;
import com.tnbpda.util.TNBPDAUtil;
import com.tnbpda.vo.Calibration;
import com.tnbpda.vo.Dealer;

/**
 * Servlet implementation class CalibrationController
 */
@WebServlet("/calibration")
public class CalibrationController extends HttpServlet implements TNBPDAConstants {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CalibrationController() {
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
		HttpSession session = request.getSession();
		String strMod = request.getParameter("mod");
		if(strMod== null || strMod=="") {
			strMod = "cali";
		}
		Dealer nallaya = (Dealer) session
				.getAttribute(TNBPDAConstants.AUTH_USER);
		String strOption = request.getParameter("option");
		int option = 0;
		if (strOption != null) {
			option = Integer.parseInt(strOption);
		}
	 	DAOFactory daoF = DAOFactory.getDAOFactory(4);
		ReminderDAO caliDAO = daoF.getReminderDAO();
		String targetPage = null;
		Calibration cali = new Calibration();
		cali.setCcNo(nallaya.getCcNo() + "");
		switch (option) {
		case 0: // calculate  due date
		 
			request.setAttribute(CALIB, cali);
	 		targetPage = "/jsp/calibration/update.jsp";
			break;
		case 1: // insert calibration detailsp
			updateCalibration(request, cali);
			 
			targetPage = "/jsp/calibration/list.jsp";
			break;
		case 2:
			targetPage = "/jsp/calibration/list.jsp";
			break;
		default:
			break;
		}
		request.setAttribute("module", strMod);
		request.getRequestDispatcher(targetPage).forward(request, response);
	}

	public void updateCalibration(HttpServletRequest request, Calibration cali) {
		cali.setCcNo(request.getParameter("cc"));
		cali.setFireExtingDate(TNBPDAUtil.stringToDate(request
				.getParameter("edate")));
		cali.setFiveLitrDate(TNBPDAUtil.stringToDate(request
				.getParameter("fdate")));
		cali.setHrdroMeterHSDDate(TNBPDAUtil.stringToDate(request
				.getParameter("hsdDate")));
		cali.setHrdroMeterHSDNo(request.getParameter("hhsd"));
		cali.setHrdroMeterMSDate(TNBPDAUtil.stringToDate(request
				.getParameter("msdate")));
		cali.setHrdroMeterMSNo(request.getParameter("hms"));

		cali.setPumpCalibrateDate(TNBPDAUtil.stringToDate(request
				.getParameter("pdate")));
		cali.setTheromMeterDate(TNBPDAUtil.stringToDate(request
				.getParameter("tdate")));
		cali.setTheromMeterNo(request.getParameter("therometer")); 
	}
}
