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
import com.tnbpda.dao.DealerDAO;
import com.tnbpda.dao.ForumDAO;
import com.tnbpda.util.TNBPDAConstants;
import com.tnbpda.util.TNBPDAUtil;
import com.tnbpda.vo.Answer;
import com.tnbpda.vo.Dealer;
import com.tnbpda.vo.Question;

/**
 * Servlet implementation class FeedbackController
 */
@WebServlet("/forum")
public class ForumController extends HttpServlet implements TNBPDAConstants {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ForumController() {
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
			ForumDAO forumDAO = daoF.getForumDAO();
			Question question = new Question();

			switch (option) {
			case 0:
				question.setCategory("all");
				
				List<Question> listQuestion = forumDAO.questionList(question);
				request.setAttribute(QUESTION_LIST, listQuestion);
				targetPage = "/jsp/forum/list.jsp";
				break;
			case 1: // insertQuestion
				String cat = request.getParameter("cat");
				String strQuestion = request.getParameter("question");
				question.setCategory(cat);
				question.setQuestion(strQuestion);
				question.setCreatedBy(panneer.getCcNo());
				question.setCreatedDate(TNBPDAUtil.now());
				 listQuestion = forumDAO.insertQuestion(question);
				System.out.println("listQuestion : " + listQuestion);
				request.setAttribute("QL", listQuestion);
				targetPage = "/jsp/forum/list.jsp";
				break;
			case 2: // read question
				cat = request.getParameter("cat");
				session.removeAttribute(QUESTION);
				System.out.println("cat " + cat);
				question.setCategory(cat);
				listQuestion = forumDAO.questionList(question);
				request.setAttribute(QUESTION_LIST, listQuestion);
				targetPage = "/jsp/forum/list.jsp";
				break;
			case 3: // insert Answer to question
				String qid = request.getParameter("qid");
				int id = Integer.parseInt(qid);
				question.setQid(id);
				String qa = request.getParameter("qa");
				System.out.println(qid + ": " + qa);
				if (qa == null) {
					request.setAttribute("RE", "Y");
				} else {
					Answer ans = new Answer();
					ans.setAnswer(qa);
					ans.setQid(id);
					ans.setPostedBy("" + panneer.getCcNo());
					ans.setPostedDate(TNBPDAUtil.now());
					forumDAO.insertAnswer(ans);
					question = forumDAO.readQuestion(question);
					session.setAttribute(QUESTION, question);
				}
				targetPage = "/jsp/forum/list.jsp";
				break;
			case 4: // view question.
				qid = request.getParameter("qid");
				question.setQid(Integer.parseInt(qid));
				question = forumDAO.readQuestion(question);
				System.out.println("Qeustion "
						+ question.getAnswerList().size());
				session.setAttribute(QUESTION, question);
				targetPage = "/jsp/forum/list.jsp";
				break;
			case 5: // delete question.
				qid = request.getParameter("qid");
				id = Integer.parseInt(qid);
				question.setQid(id);
				forumDAO.deleteQuestion(question);
				listQuestion = forumDAO.questionList(question);
				request.setAttribute(QUESTION_LIST, listQuestion);
				targetPage = "/jsp/forum/list.jsp";
				break;
			case 6:
				targetPage = "/jsp/forum/add.jsp";
				break;
			default:
				break;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("module", "forum");
		request.getRequestDispatcher(targetPage).forward(request, response);
	}

}
