package com.tnbpda.dao;

import java.util.List;

import com.tnbpda.vo.Answer;
import com.tnbpda.vo.AssocMember;
import com.tnbpda.vo.Question;

public interface CommiteeDAO {

	 
	public void insertMember(AssocMember am);
 
	public void fetchMember(AssocMember am);
	
	public void removeMember(AssocMember am);
}
