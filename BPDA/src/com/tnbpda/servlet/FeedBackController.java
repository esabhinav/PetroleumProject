package com.tnbpda.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



import com.tnbpda.dao.DAOFactory;
import com.tnbpda.dao.FeedbackDAO;
import com.tnbpda.util.TNBPDAConstants;
import com.tnbpda.util.TNBPDAUtil;
import com.tnbpda.vo.Dealer;
import com.tnbpda.vo.Feedback;

 

/**
 * Servlet implementation class CompilanceController
 */
@WebServlet("/feedback")
public class FeedBackController extends HttpServlet implements TNBPDAConstants{
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FeedBackController() {
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
		int option = 0;
		if (strOption != null) {
			option = Integer.parseInt(strOption);
		}
		DAOFactory daoF = DAOFactory.getDAOFactory(4);
		FeedbackDAO fbDAO = daoF.getFeedbackDAO();
		HttpSession session = request.getSession();
		Dealer siva = (Dealer)session.getAttribute(TNBPDAConstants.AUTH_USER);

		String targetPage = null;
		Feedback fb = new Feedback();
		switch (option) {
		case 0: // fetch add page.
			targetPage="/jsp/feedback/add.jsp";
			break;
		case 1: // insert feedback.
			fb.setFeedback(request.getParameter("feedback"));
			fb.setRating(Integer.parseInt(request.getParameter("rating")));
			fb.setInterestModule(request.getParameter("moduleinterest"));
			fb.setCcNo(siva.getCcNo()+"");
			fb.setDate(TNBPDAUtil.now());
			fbDAO.insertFeedback(fb);
			List<Feedback> listFeedback = fbDAO.allFeedback(fb);
			request.setAttribute(TNBPDAConstants.FEEDBACK_LIST, listFeedback);
			targetPage="/jsp/feedback/list.jsp";
			break;
		case 2: // read feedback
			targetPage="/jsp/feedback/list.jsp";
			break;
		case 3: // update feedback.
			targetPage="/jsp/feedback/list.jsp";
			break;
		case 4: // fetch feedback list
			List<Feedback> listFeedBack =fbDAO.allFeedback(fb);
			request.setAttribute(FEEDBACK_LIST, listFeedBack);
			targetPage="/jsp/feedback/list.jsp";
			break;
		case 5: // delete feedback .
			fb.setFid(Integer.parseInt(request.getParameter("fid")));
			fbDAO.deleteFeedback(fb);
			 listFeedback = fbDAO.allFeedback(fb);
			request.setAttribute(TNBPDAConstants.FEEDBACK_LIST, listFeedback);
			targetPage="/jsp/feedback/list.jsp";
			break;
		default:
			break;
		}
		request.setAttribute("module", strMod);
		request.getRequestDispatcher(targetPage).forward(request, response);
	}

}
