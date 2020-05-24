package com.tnbpda.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.tnbpda.dao.AdminDAO;
import com.tnbpda.dao.ReminderDAO;
import com.tnbpda.dao.DAOFactory;
import com.tnbpda.util.DealerExcelWrite;
import com.tnbpda.util.TNBPDAConstants;
import com.tnbpda.util.TNBPDAUtil;
import com.tnbpda.vo.Calibration;
import com.tnbpda.vo.Dealer;
import com.tnbpda.vo.Item;
import com.tnbpda.vo.Message;
import com.tnbpda.vo.RO;
import com.tnbpda.vo.Reminder;

/**
 * Servlet implementation class HomeController
 */
@WebServlet("/home")
public class HomeController extends HttpServlet implements TNBPDAConstants {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HomeController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String strMod = request.getParameter("mod");
		String strOption = request.getParameter("option");
		int option = 1;
		if (strOption != null) {
			option = Integer.parseInt(strOption);
		}
		HttpSession session = request.getSession();
		Dealer nallaya = (Dealer) session.getAttribute(TNBPDAConstants.AUTH_USER);

		DAOFactory daoF = DAOFactory.getDAOFactory(4);

		ReminderDAO reminderDAO = daoF.getReminderDAO();
		AdminDAO adminDAO = daoF.getAdminDAO();
		String targetPage = null;
		Reminder reminder = new Reminder();
		reminder.setCcNo(nallaya.getCcNo() + "");
		switch (option) {

		case 1: // view home page details.

			List<Message> listMsg = adminDAO.readAllMessage();
			List<Reminder> listReminder = reminderDAO.readDetails(reminder);
			request.setAttribute(CALIB, listReminder);
			request.setAttribute(MSG_LIST, listMsg);
			System.out.println(" :::::   msg list " + listMsg);
			targetPage = "/jsp/home/home.jsp";
			break;
		case 2:
			listMsg = adminDAO.readAllMessage();
			listReminder = reminderDAO.readDetails(reminder);
			request.setAttribute(CALIB, listReminder);
			request.setAttribute(MSG_LIST, listMsg);
			System.out.println(" :::::   msg list " + listMsg);
			targetPage = "/jsp/association/displayNotificaton.jsp";
			break;
		}
		if (option != 3) {
			request.setAttribute("module", strMod);
			request.getRequestDispatcher(targetPage).forward(request, response);
		} else {
			int ccid = nallaya.getCcNo();
			generateExcel(response, ccid, true);
		}
	}

	private HashMap<String, Item> findCalibrationDueDate(Calibration cali) {
		Date hydroMeterHSD = cali.getHrdroMeterHSDDate();
		Date hydroMeterMS = cali.getHrdroMeterMSDate();
		Date thermoMeter = cali.getTheromMeterDate();
		Date fireDate = cali.getFireExtingDate();
		Date pumpDate = cali.getPumpCalibrateDate();
		Date fiveDate = cali.getFiveLitrDate();
		HashMap<String, Item> itMap = new HashMap<String, Item>();
		Item it = new Item();
		if (hydroMeterHSD != null && TNBPDAUtil.isReminder(hydroMeterHSD)) {
			it.setNo(cali.getHrdroMeterHSDNo());
			it.setExpDate(hydroMeterHSD);
			itMap.put("HydroMeter - HSD", it);
		}
		if (hydroMeterMS != null && TNBPDAUtil.isReminder(hydroMeterMS)) {
			it = new Item();
			it.setNo(cali.getHrdroMeterMSNo());
			it.setExpDate(hydroMeterMS);
			itMap.put("HydroMeter - MS ", it);
		}
		if (thermoMeter != null && TNBPDAUtil.isReminder(thermoMeter)) {
			it = new Item();
			it.setNo(cali.getTheromMeterNo());
			it.setExpDate(thermoMeter);
			itMap.put("ThermoMeter", it);
		}
		if (fireDate != null && TNBPDAUtil.isReminder(fireDate)) {
			it = new Item();
			it.setNo(" ");
			it.setExpDate(fireDate);
			itMap.put("Fire Extingusher", it);
		}
		if (pumpDate != null && TNBPDAUtil.isReminder(pumpDate)) {
			it = new Item();
			it.setNo(" ");
			it.setExpDate(hydroMeterHSD);
			itMap.put("Pump", it);
		}
		if (fiveDate != null && TNBPDAUtil.isReminder(fiveDate)) {
			it = new Item();
			it.setNo(" ");
			it.setExpDate(fiveDate);
			itMap.put("5 Liter can", it);
		}
		return itMap;
		/*
		 * // TNBPDAUtil. System.out.println("getHrdroMeterHSDDate : " +
		 * hydroMeterHSD); System.out.println("hydroMeterMS : " + hydroMeterMS);
		 * System.out.println("thermoMeter : " + thermoMeter);
		 * System.out.println("fireDate : " + fireDate);
		 * System.out.println("pumpDate : " + pumpDate);
		 */

	}

	private void generateExcel(HttpServletResponse response, int ccid, boolean isDownload) {
		try {

			String FOLDER_PATH = "C:\\tnbpda\\reminder\\";
			String numberAsString = Integer.toString(ccid);
			String FILE_NAME = numberAsString + ".xls";

			// fileName="Dealers_List.xls";
			FileInputStream file = new FileInputStream(new File(FOLDER_PATH + FILE_NAME));

			// Create Workbook instance holding reference to .xlsx file
			HSSFWorkbook workbook = new HSSFWorkbook(file);
			if (isDownload) {
				downloadExcel(response, workbook);
			} else {
				writeToExcel(response, workbook);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * @param response
	 * @param workbook
	 */
	private void downloadExcel(HttpServletResponse response, HSSFWorkbook workbook) {
		try {
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition", "attachment; filename=YourReminder" + ".xls");
			workbook.write(response.getOutputStream());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * @param response
	 * @param workbook
	 */
	private void writeToExcel(HttpServletResponse response, HSSFWorkbook workbook) {
		String fName = "C:\\tnbpda\\_obj\\Excel\\Dealers.xls";
		try {
			FileOutputStream fos = new FileOutputStream(new File(fName));

			workbook.write(fos);

		} catch (Exception e) {

		}
	}

}
