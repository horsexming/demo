package com.mbm.dao.factoryDao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.omg.CORBA.PUBLIC_MEMBER;

import com.mbm.domian.Factory;

public interface FactoryDao {
	
	public void insertFactory(Factory factory);
	
	public List<Factory> FactoryList();
	
	//查询未停用的生产厂家
	public List<Factory> FactorystateList(Map map);
	
	public Factory selectFactoryById(String id);
	
	public void updateFactory(Factory factory);
	
	public void deleteByid(String id);
	
	public void deletes (Serializable[] id);
	
	public void updateState(Map map);

}
