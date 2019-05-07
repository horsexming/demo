package com.mbm.services.contractService;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbm.dao.contractDao.ContractDao;
import com.mbm.dao.contractDao.ContractProductDao;
import com.mbm.domian.Contract;
import com.mbm.vo.ContractVo;

@Service
public class ContractService {
	
	@Autowired
	ContractDao contractDao;
	@Autowired
	ContractProductDao contractProductDao;
	public List<Contract> FactoryList(){	
		return contractDao.ContractList();
	}
	
	public void insertContract(Contract contract) {
		contract.setId(UUID.randomUUID().toString());
		contract.setState(0);
		contract.setOldState(0);
		contract.setOutState(0);
		contractDao.insertContract(contract);		
	}
	
	public Contract selectContract(String id) {
		return contractDao.selectContract(id);
	}
	
	public void updatecontract(Contract contract) {
		contractDao.updatecontract(contract);
	}
	
	public void deleteByid(String id) {
		contractDao.deleteByid(id);
	}
	
	public void deletes (Serializable[] id) {
		contractDao.deletes(id);
	}
	
	public void updateState(String []id) {
		Map map = new HashMap<>();
		map.put("ids", id);															
		map.put("state", "1");						
		contractDao.updateState(map);
		
	}
	public void updateState2(String []id) {
		Map map = new HashMap<>();
		map.put("ids", id);															
		map.put("state", "0");						
		contractDao.updateState(map);
		
	}
	
	//查询合同下的货物和附件
	public ContractVo selectAll(String id) {
		
		return contractDao.selectAll(id);
	}

}
