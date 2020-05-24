package com.tnbpda.dao.objImpl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.tnbpda.dao.FeedbackDAO;
import com.tnbpda.util.TNBPDAUtil;
import com.tnbpda.vo.Dealer;
import com.tnbpda.vo.Feedback;

public class FeedbackDAOImpl implements FeedbackDAO {
	String fName = "feedback";

	@Override
	public void insertFeedback(Feedback fb) {
		try {
			List<Feedback> feedbackList = (List<Feedback>) TNBPDAUtil
					.readFromStream(fName);
			if (feedbackList == null) {
				feedbackList = new ArrayList<Feedback>();
			}
			fb.setFid(feedbackList.size() + 1);
			feedbackList.add(fb);
			TNBPDAUtil.writeToStream(feedbackList, fName);
  		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public Feedback readFeedback(Feedback fb) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Feedback> allFeedback(Feedback fb) {
		List<Feedback> feedbackList = (List<Feedback>) TNBPDAUtil
				.readFromStream(fName);
		return feedbackList;
	}

	@Override
	public void deleteFeedback(Feedback fb) {
		List<Feedback> feedbackList = (List<Feedback>) TNBPDAUtil
				.readFromStream(fName);
		Iterator<Feedback> it = feedbackList.iterator();
		while (it.hasNext()) {
			Feedback f = it.next();
			if (f.getFid() == fb.getFid()) {
				f.setStatus("I");
				break;
			}
		}
		TNBPDAUtil.writeToStream(feedbackList, fName);

	}

}
