package com.tnbpda.dao.objImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.tnbpda.dao.NonTradeDAO;
import com.tnbpda.util.TNBPDAUtil;
import com.tnbpda.vo.NonTrade;

public class NonTradeDAOImpl implements NonTradeDAO {
	String fName = "nontrade";

	@Override
	public void insertBusiness(NonTrade business) {
		String ccNo = business.getCcNo();
		HashMap<String, List<NonTrade>> map = (HashMap<String, List<NonTrade>>) TNBPDAUtil
				.readFromStream(fName);
		if (map == null) {
			map = new HashMap<String, List<NonTrade>>();
		}
		business.setNtid(findNtID(map));
		List<NonTrade> list = null;
		if (map.containsKey(business.getCcNo())) {
			list = (List<NonTrade>) map.get(ccNo);

			map.remove(ccNo);

		} else {
			if (list == null) {
				list = new ArrayList<NonTrade>();
			}
		}
		list.add(business);
		map.put(ccNo, list);
		TNBPDAUtil.writeToStream(map, fName);
	}

	private int findNtID(HashMap<String, List<NonTrade>> map) {
		List<NonTrade> count = new ArrayList<NonTrade>();
		int id = 0;
		System.out.println(map.containsKey("count")+":"+map.size());
		if (map.containsKey("count")) {
			count = map.get("count");
			System.out.println("count"+count);
			 id = count.get(0).getNtid();
			count.get(0).setNtid(id + 1);
			//map.remove()
			//map.put("count", count);
		} else {

			NonTrade nt = new NonTrade();
			nt.setNtid(1);
			count.add(nt);
			map.put("count", count);
		}
		return id + 1;
	}

	@Override
	public HashMap<String, List<NonTrade>> readAll(NonTrade business) {
		HashMap<String, List<NonTrade>> map = (HashMap<String, List<NonTrade>>) TNBPDAUtil
				.readFromStream(fName);
		if(map==null) {

			map = new HashMap<String,List<NonTrade>>();
			List<NonTrade> newTradeList =  new ArrayList<NonTrade>();
			NonTrade nt = new NonTrade();
			nt.setNtid(1);
			newTradeList.add(nt);
			map.put("count", newTradeList);
		 
		}
		return map;
	}

	@Override
	public void deleteTrade(NonTrade business) {
		HashMap<String, List<NonTrade>> map = (HashMap<String, List<NonTrade>>) TNBPDAUtil
				.readFromStream(fName);
		Iterator<Map.Entry<String, List<NonTrade>>> it = map.entrySet()
				.iterator();

		while (it.hasNext()) {
			Map.Entry<String, List<NonTrade>> me = it.next();
			List<NonTrade> list = me.getValue();
			for (NonTrade nt : list) {
				if (nt.getNtid() == business.getNtid()) {
					list.remove(nt);
					break;
				}

			}
		}
		TNBPDAUtil.writeToStream(map, fName);
	}

}
