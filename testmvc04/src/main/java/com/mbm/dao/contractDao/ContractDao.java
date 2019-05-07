package com.mbm.dao.contractDao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.mbm.domian.Contract;
import com.mbm.vo.ContractVo;


public interface ContractDao {
	public List<Contract> ContractList();
	public void insertContract(Contract contract);
	public Contract selectContract(String id);
	public void updatecontract(Contract contract);
	public void deleteByid(String id);
	public void deletes (Serializable[] id);
	public void updateState(Map map);
	
	//查询合同下的货物和附件
	public ContractVo selectAll(String id);
	

}
