package com.tnbpda.dao.objImpl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.tnbpda.dao.ForumDAO;
import com.tnbpda.util.QIDComparator;
import com.tnbpda.util.TNBPDAUtil;
import com.tnbpda.vo.Answer;
import com.tnbpda.vo.Dealer;
import com.tnbpda.vo.Question;

public class ForumDAOImpl implements ForumDAO {

	String fName = "forum";

	@Override
	public List<Question> insertQuestion(Question question) {
		// TODO Auto-generated method stub
		try {
			List<Question> questionList = (List<Question>) TNBPDAUtil
					.readFromStream(fName); 
			if(questionList==null) {
				questionList = new ArrayList<Question>();
			}
			Collections.sort(questionList, new QIDComparator());
		 
			int tid = 0;
			if (questionList == null) {
				questionList = new ArrayList<Question>();
			} else {
				if(!questionList.isEmpty()) {
				tid = questionList.get(questionList.size()-1).getQid();
 				}
			}
			question.setQid(tid  + 1);
			questionList.add(question);
			TNBPDAUtil.writeToStream(questionList, fName);
			questionList = (List<Question>) TNBPDAUtil.readFromStream(fName);
			return questionList;
		} catch (Exception e) {
			// TODO: handle exception

			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void insertAnswer(Answer ans) {
		// TODO Auto-generated method stub
		try {
			List<Question> questionList = (List<Question>) TNBPDAUtil
					.readFromStream(fName);
	 			for (Question que : questionList) {
				if (que.getQid()==ans.getQid()) {
		 			List<Answer> ansList = que.getAnswerList();
					if (ansList == null) {
						ansList = new ArrayList<Answer>();
					}
					ans.setAid(ansList.size() + 1);
					ansList.add(ans);
					que.setAnswerList(ansList);
		 		}

			}
			TNBPDAUtil.writeToStream(questionList, fName);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	@Override
	public List<Question> questionList(Question question) {
		// TODO Auto-generated method stub
		List<Question> tempList = new ArrayList();
		try {
			List<Question> questionList = (List<Question>) TNBPDAUtil
					.readFromStream(fName);
		 	for(Question ques: questionList) {
	 			if(ques.getCategory().equalsIgnoreCase("oth")) {
					tempList.add(ques);
				}
				else if(ques.getCategory().equalsIgnoreCase(question.getCategory())){
			 		tempList.add(ques);
				} else {
					tempList.add(ques);
				} 
			}
			return tempList;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public void deleteQuestion(Question que) {
		// TODO Auto-generated method stub
		Question temp = null;
		try {
			List<Question> questionList = (List<Question>) TNBPDAUtil
					.readFromStream(fName);
			for (Question qus : questionList) {
				if (qus.getQid() == que.getQid()) {
					temp = qus;
					break;
				}
			}
			questionList.remove(temp);
			TNBPDAUtil.writeToStream(questionList, fName);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	@Override
	public void deleteAnswer(Answer ans) {
		// TODO Auto-generated method stub
		Answer tempAns = null;
		try {
			List<Question> questionList = (List<Question>) TNBPDAUtil
					.readFromStream(fName);
			for (Question qus : questionList) {
				if (ans.getQid() == qus.getQid()) {
					List<Answer> ansList = qus.getAnswerList();
					if (ansList != null) {
						for (Answer answer : ansList) {
							tempAns = answer;
							break;
						}
						ansList.remove(tempAns);
					}
				}

			}
			TNBPDAUtil.writeToStream(questionList, fName);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}

	@Override
	public Question readQuestion(Question question) {
		// TODO Auto-generated method stub
		try {
			List<Question> questionList = (List<Question>) TNBPDAUtil
					.readFromStream(fName);
	  		for(Question ques: questionList) {
 				if(ques.getQid()==question.getQid()){
		 			if(ques.getAnswerList()==null) {
					 ques.setAnswerList(new ArrayList<Answer>());
					}
				   return ques;
				}
			}
			 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		 return null;
	}

}
