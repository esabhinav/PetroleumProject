package com.tnbpda.vo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class Question implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int qid;
	private int createdBy;
	private String createdDate;
	private Date updateDate;
	private String question;
	private String category;
	private List<Answer> answerList;
	public int getQid() {
		return qid;
	}
	public void setQid(int qid) {
		this.qid = qid;
	}
	public String getQuestion() {
		return question;
	}
	public void setQuestion(String question) {
		this.question = question;
	}
	public List<Answer> getAnswerList() {
		return answerList;
	}
	public void setAnswerList(List<Answer> answerList) {
		this.answerList = answerList;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getCreatedDate() {
		return createdDate;
	}
	public void setCreatedDate(String createdDate) {
		this.createdDate = createdDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public int getCreatedBy() {
		return createdBy;
	}
	public void setCreatedBy(int createdBy) {
		this.createdBy = createdBy;
	}
}
