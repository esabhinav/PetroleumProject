package com.tnbpda.dao;

import java.util.List;

import com.tnbpda.vo.RO;

public interface RODAO {

	public void insertRO(RO ro);

	public RO readRO(RO ro);

	public void updateRO(RO ro);

	public void removeRO(RO ro);
	
	public List<RO> retrieveAllRos(RO ro);

}
