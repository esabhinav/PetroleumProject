package com.tnbpda.dao;

import java.util.List;

import com.tnbpda.vo.Feedback;

 

public interface FeedbackDAO {

	public void insertFeedback(Feedback fb);
	public Feedback readFeedback(Feedback fb);
	public List<Feedback> allFeedback(Feedback fb);
	public void deleteFeedback(Feedback fb);
}
