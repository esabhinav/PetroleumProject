package com.tnbpda.util;

import java.util.Comparator;

import com.tnbpda.vo.Question;

public class QIDComparator implements Comparator<Question> {
	@Override
	public int compare(Question o1, Question o2) {
		// TODO Auto-generated method stub
		if(o2.getQid()>o1.getQid()){
			return o1.getQid();
		} else {
			return o2.getQid();
		}
	}

	 

}
