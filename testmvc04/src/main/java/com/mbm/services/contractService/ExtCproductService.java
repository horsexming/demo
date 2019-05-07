package com.mbm.services.contractService;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbm.dao.contractDao.ExtCproductDao;
import com.mbm.domian.ExtCproduct;
@Service
public class ExtCproductService {
	
	@Autowired
	ExtCproductDao extCproductDao;
	
	public List<ExtCproduct> selCproductByproductId(Map map) {
		
		return extCproductDao.selCproductByproductId(map);
	}
	
	public void insertEXTCProduct(ExtCproduct extCproduct) {
		extCproduct.setId(UUID.randomUUID().toString());
		extCproduct.setAmount(extCproduct.getPrice()*extCproduct.getCnumber());
		extCproductDao.insertEXTCProduct(extCproduct);
	}
	
	public ExtCproduct selEXTCProductById(String id) {
		
		return extCproductDao.selEXTCProductById(id);
	}
	
	public void updateEXTCProduct(ExtCproduct extCproduct) {
		extCproduct.setAmount(extCproduct.getPrice()*extCproduct.getCnumber());
		extCproductDao.updateEXTCProduct(extCproduct);
	}
	
	public void deleteEXTCProduct(String id) {
		extCproductDao.deleteEXTCProduct(id);
		
	}
	
	//关联删除
	public void deleteEXTCPByProductId(String contractProductId) {
		extCproductDao.deleteEXTCPByProductId(contractProductId);
	}

}
