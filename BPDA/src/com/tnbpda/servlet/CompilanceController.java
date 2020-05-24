package com.tnbpda.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CompilanceController
 */
@WebServlet("/compilance")
public class CompilanceController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CompilanceController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String strMod = request.getParameter("mod");
		String strOption = request.getParameter("option");
		int option = 1;
		if (strOption != null) {
			option = Integer.parseInt(strOption);
		}
		String targetPage = null;
		switch (option) {

		case 1:
			targetPage="/jsp/compilance/list.jsp";
			break;
		case 2:
			break;
		default:
			break;
		}
		request.setAttribute("module", strMod);
		request.getRequestDispatcher(targetPage).forward(request, response);
	}

}
