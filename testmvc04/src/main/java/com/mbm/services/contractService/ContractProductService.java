package com.mbm.services.contractService;

import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbm.dao.contractDao.ContractProductDao;
import com.mbm.dao.contractDao.ExtCproductDao;
import com.mbm.dao.factoryDao.FactoryDao;
import com.mbm.domian.ContractProduct;
import com.mbm.domian.Factory;
@Service
public class ContractProductService {
	@Autowired
	ContractProductDao contractProductDao;
	@Autowired
	FactoryDao factoryDao;
	@Autowired
	ExtCproductDao extCproductDao;
	public List<ContractProduct> selectContractProduct(Map map){
		return contractProductDao.selectContractProduct(map);
	}
	
	public void insertContractProduct(ContractProduct contractProduct) {
		contractProduct.setId(UUID.randomUUID().toString());
		contractProduct.setAmount(contractProduct.getPrice()*contractProduct.getCnumber());
		contractProductDao.insertContractProduct(contractProduct);
	}
	public ContractProduct selectProductById(String id) {
		return contractProductDao.selectProductById(id);
	}
	
	public void updateProduct(ContractProduct contractProduct) {
		System.out.println("contractProduct.g"+contractProduct.getId());
		contractProduct.setAmount(contractProduct.getPrice()*contractProduct.getCnumber());
		contractProductDao.updateProduct(contractProduct);
	}
	
	public void deleteProduct(String id) {
		System.out.println("delete+"+id);
		extCproductDao.deleteEXTCPByProductId(id);
		contractProductDao.deleteProduct(id);
	}
	
	//查询附件数
		public Integer selectnum(String contractProductId) {
			return extCproductDao.selectnum(contractProductId);
		}
	
}
