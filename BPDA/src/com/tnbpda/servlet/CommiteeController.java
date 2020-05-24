package com.tnbpda.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tnbpda.dao.AdminDAO;
import com.tnbpda.dao.DAOFactory;
import com.tnbpda.util.TNBPDAConstants;
import com.tnbpda.vo.Item;
import com.tnbpda.vo.Message;

/**
 * Servlet implementation class CalibrationController
 */
@WebServlet("/commitee")
public class CommiteeController extends HttpServlet implements TNBPDAConstants {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CommiteeController() {
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
		int option = 1;
		if (strOption != null) {
			option = Integer.parseInt(strOption);
		}
		DAOFactory daoF = DAOFactory.getDAOFactory(4);
		AdminDAO adminDAO = daoF.getAdminDAO();
		String targetPage = null;
		switch (option) {

		case 1:// Add EC Member

			List<Message> listMsg = adminDAO.readAllMessage();
			 
			request.setAttribute(MSG_LIST, listMsg);
			targetPage = "/jsp/association/blist.jsp";
			break;
		case 2: 
			break;
		case 3: 
			break;
		case 4: // retrieve members
			targetPage = "/jsp/association/list.jsp";
			break;
		default:
			break;
		}
		request.setAttribute("module", strMod);
		request.getRequestDispatcher(targetPage).forward(request, response);
	}

}
