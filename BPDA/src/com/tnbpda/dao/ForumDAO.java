package com.tnbpda.dao;

import java.util.List;

import com.tnbpda.vo.Answer;
import com.tnbpda.vo.Question;

public interface ForumDAO {

	public List<Question> insertQuestion(Question question);

	public void insertAnswer(Answer ans);

	public List<Question> questionList(Question question);

	public void deleteQuestion(Question qus);

	public void deleteAnswer(Answer ans);
 
	public Question readQuestion(Question question);
	 
}
