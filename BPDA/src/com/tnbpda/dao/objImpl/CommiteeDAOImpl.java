package com.tnbpda.dao.objImpl;

import java.io.IOException;
import java.io.Writer;
import java.util.List;

import org.dom4j.Comment;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.InvalidXPathException;
import org.dom4j.Node;
import org.dom4j.Visitor;
import org.dom4j.XPath;

import com.tnbpda.dao.CommiteeDAO;
import com.tnbpda.util.TNBPDAUtil;
import com.tnbpda.vo.AssocMember;
import com.tnbpda.vo.Dealer;

public class CommiteeDAOImpl implements CommiteeDAO {

	String fName = "association";

	@Override
	public void insertMember(AssocMember am) {
		try {
			List<Dealer> dealerList = (List<Dealer>) TNBPDAUtil
					.readFromStream(fName);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void fetchMember(AssocMember am) {
		try {
			List<Dealer> dealerList = (List<Dealer>) TNBPDAUtil
					.readFromStream(fName);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void removeMember(AssocMember am) {
		try {
			List<Dealer> dealerList = (List<Dealer>) TNBPDAUtil
					.readFromStream(fName);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
