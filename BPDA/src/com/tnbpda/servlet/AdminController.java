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

import com.tnbpda.dao.AdminDAO;
import com.tnbpda.dao.DAOFactory;
import com.tnbpda.util.TNBPDAConstants;
import com.tnbpda.util.TNBPDAUtil;
import com.tnbpda.vo.Dealer;
import com.tnbpda.vo.Message;

/**
 * Servlet implementation class AdminController
 */
@WebServlet("/admin")
public class AdminController extends HttpServlet implements TNBPDAConstants {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminController() {
        super();
        // TODO Auto-generated constructor stub
    }
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stubString strMod = request.getParameter("mod");
		String strOption = request.getParameter("option");
		int option = 1;
		if (strOption != null) {
			option = Integer.parseInt(strOption);
		}
		DAOFactory daoF = DAOFactory.getDAOFactory(4);
		AdminDAO adminDAO = daoF.getAdminDAO();
		HttpSession session = request.getSession();
		Dealer dealer = (Dealer)session.getAttribute(AUTH_USER);
		String targetPage = null;
 	 	switch (option) {

		case 1: //insert message 
			Message msg = new Message();
			msg.setCreatedBy(String.valueOf(dealer.getCcNo()));
			getMessage(request,msg);
			 adminDAO.insertMessage(msg);
			List<Message> msgList = adminDAO.readAllMessage();
	 		request.setAttribute(MSG_LIST, msgList);
			targetPage="/home";
			break;

		case 2: //delete message
			String messageId = request.getParameter("mid");
			int deleteId = Integer.parseInt(messageId);
			msg = new Message();
			msg.setMid(deleteId);
			adminDAO.deleteMessage(msg);
			targetPage="/home?option=1";
			break;
		default:
			break;
		}

		request.getRequestDispatcher(targetPage).forward(request, response);
	}
	
	private void getMessage(HttpServletRequest request,  Message msg) {
		String category = request.getParameter("category");
		String priority = request.getParameter("priority");
		String supplyLoc = request.getParameter("supply");
		String terriority = request.getParameter("terriority");
		String message = request.getParameter("message");
	
		String strGrp = request.getParameter("grp");
 		
		msg.setPriority(Byte.parseByte(priority));
	    msg.setCategory(Byte.parseByte(category));
		msg.setMessage(message);
		if(strGrp!=null && strGrp.equals("sup")) {
			//msg.setTerriority(Byte.parseByte(terriority));

		 msg.setSupplyLocation(Byte.parseByte(supplyLoc));
		//msg.setTerriority(Byte.parseByte(terriority));
		} else if(strGrp!=null && strGrp.equals("sup")) {
			msg.setTerriority(Byte.parseByte(terriority));
		} else  {
			msg.setAll(true);
		}
		msg.setDate(TNBPDAUtil.now());
		msg.setSubject( request.getParameter("subject"));
		
	}

}
