package com.tnbpda.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.tnbpda.vo.Lorry;

public interface LorryDAO {

	public List<Lorry> insertLorry(Lorry lorry);
	
	public void deleteLorry(Lorry lorry);

	public ArrayList<Lorry> readLorryList(Lorry lorry);
	
	
}
