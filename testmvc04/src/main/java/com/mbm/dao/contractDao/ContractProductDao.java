package com.mbm.dao.contractDao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.mbm.domian.ContractProduct;

public interface ContractProductDao {
	public List<ContractProduct> selectContractProduct(Map map);
	public void insertContractProduct(ContractProduct contractProduct);
	public ContractProduct selectProductById(String id);
	public void updateProduct(ContractProduct contractProduct);
	public void deleteProduct(String id);
	
	//批量删除合同下的货物
	public void deleteBycontractId(Serializable[] contractId);

}
