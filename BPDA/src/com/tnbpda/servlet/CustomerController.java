package com.tnbpda.servlet;

import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tnbpda.dao.CustomerDAO;
import com.tnbpda.dao.DAOFactory;
import com.tnbpda.dao.DealerDAO;
import com.tnbpda.util.TNBPDAConstants;
import com.tnbpda.vo.Customer;
import com.tnbpda.vo.User;

/**
 * Servlet implementation class Customer
 */
@WebServlet("/customer")
public class CustomerController extends HttpServlet implements TNBPDAConstants {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CustomerController() {
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

		int option = 0;
		if (strOption != null) {
			option = Integer.parseInt(strOption);
		}
		if (strMod == null) {
			strMod = "customer";
		}
		DAOFactory daoF = DAOFactory.getDAOFactory(4);
		CustomerDAO custDAO = daoF.getCustomerDAO();
		HttpSession session = request.getSession();
		// session.setAttribute("AUTH_USER", new User());
		String targetPage = null;
		String cid = null;
		Customer guna = new Customer();
		switch (option) {
		case 0:

			targetPage = "/jsp/customers/add.jsp";
			break;
		case 1: // insert customer
			createNewCustomer(request,guna);
			custDAO.insertCustomer(guna);
			List<Customer> cList = custDAO.cutomerList(guna);
			request.setAttribute(CUSTOMER_LIST, cList);
			targetPage = "/jsp/customers/list.jsp";
			break;
		case 2: // update customer
			cid = request.getParameter("cid");
			guna.setCid(Integer.parseInt(cid));
			String ac = request.getParameter("ac");
			String stat = request.getParameter("stat");
			 guna.setStatus(stat);
			guna.setApproverComments(ac);
			custDAO.updateCustomer(guna);
			targetPage = "/jsp/customers/list.jsp";
			break;
		case 3: // read customer and redirect to edit page.
			cid = request.getParameter("cid");
			guna.setCid(Integer.parseInt(cid));
			String cOption = request.getParameter("l");
			request.setAttribute("L",cOption);
			request.setAttribute("CUST", custDAO.readCustomer(guna));
			targetPage = "/jsp/customers/edit.jsp";
			break;
		case 4: // list customer
		  	cList = custDAO.cutomerList(guna);
			request.setAttribute(CUSTOMER_LIST, cList);
			targetPage = "/jsp/customers/list.jsp";
			break;
		case 5: // delete customer
			cid = request.getParameter("cid");
			guna.setCid(Integer.parseInt(cid));
			cList = custDAO.deleteCustomer(guna);
			request.setAttribute(CUSTOMER_LIST, cList);
			targetPage = "/jsp/customers/list.jsp";
			break;
		case 6: // pending customer review.
			cList = custDAO.cutomerList(guna);
			request.setAttribute(CUSTOMER_LIST, cList);
			targetPage = "/jsp/customers/admin.jsp";

			break;

		default:
			break;
		}
		request.setAttribute("module", strMod);
		request.getRequestDispatcher(targetPage).forward(request, response);
	}

	private void createNewCustomer(HttpServletRequest request, Customer guna) {
		String cName = request.getParameter("cname");
		String cc = request.getParameter("cc");

		String adharNo = request.getParameter("adharNo");
		String tin = request.getParameter("tin");
		String mobilNo = request.getParameter("cmobile");
		String dr = request.getParameter("dr");
		String address = request.getParameter("addr1");
		String date = request.getParameter("date");
		String comments =  request.getParameter("dcomments");
		float dueAmount = Float.parseFloat(request.getParameter("bill"));
		guna.setCcNo(Integer.parseInt(cc));
		guna.setName(cName);
		guna.setDate(date);
		guna.setAharNo(adharNo);
		guna.setMobileNo(mobilNo);
		guna.setDueAmount(dueAmount);
		guna.setTno(tin);
		guna.setAddress(address);
		guna.setDistrict(Integer.parseInt(dr));
		guna.setComments(comments);
	}

	/**
	 * 
	 * @param cList
	 */
	private void findPendingCustomer(List<Customer> cList) {
		Iterator<Customer> it = cList.iterator();
		while (it.hasNext()) {
			Customer cust = it.next();
			if (!cust.getStatus().equals("P")) {
				it.remove();
			}
		}
	}

}
