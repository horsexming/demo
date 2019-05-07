package com.mbm.services.factoryservices;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbm.dao.factoryDao.FactoryDao;
import com.mbm.domian.Factory;

@Service("factoryServices")
public class FactoryServices extends SqlSessionDaoSupport{
	@Autowired
	//mybatis-spring 1.0无需此方法；mybatis-spring1.2必须注入。
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory){
		super.setSqlSessionFactory(sqlSessionFactory);
		
	}
	@Autowired
	FactoryDao factoryDao;
	
	public void insertFactory(Factory factory) {
		factory.setId(UUID.randomUUID().toString());
		factory.setState("1");
		factoryDao.insertFactory(factory);
	}
	public List<Factory> FactoryList(){
		return factoryDao.FactoryList();
	}
	
	public List<Factory> FactorystateList(){
		Map map = new HashMap<>();
		map.put("state", "1");
		return factoryDao.FactorystateList(map);
	}
	
	public Factory selectFactoryById(String id) {
		
		return factoryDao.selectFactoryById(id);
	}
	
	public void updateFactory(Factory factory) {
		System.out.println(factory.getId());
		factoryDao.updateFactory(factory);
		
	}
	
	public void deleteByid(String id) {
		factoryDao.deleteByid(id);
	}
	
	public void deletes (Serializable[] id) {
		
		factoryDao.deletes(id);
	}
	
	public void updateState(String id) {
		Map map = new HashMap<>();
		map.put("id", id);
		if(factoryDao.selectFactoryById(id).getState().equals("1")) {
			map.put("state", "0");
		}
		
		if(factoryDao.selectFactoryById(id).getState().equals("0")) {
			map.put("state", "1");
		}
			
		factoryDao.updateState(map);
		
	}

}
