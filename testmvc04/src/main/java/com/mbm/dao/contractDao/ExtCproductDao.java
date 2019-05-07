package com.mbm.dao.contractDao;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import com.mbm.domian.ExtCproduct;

public interface ExtCproductDao {
	
	public List<ExtCproduct> selCproductByproductId(Map map);
	public void insertEXTCProduct(ExtCproduct extCproduct);
	public ExtCproduct selEXTCProductById(String id);
	public void updateEXTCProduct(ExtCproduct extCproduct);
	public void deleteEXTCProduct(String id);
	//关联删除
	public void deleteEXTCPByProductId(String contractProductId);
	//批量删除根据货物ID
	public void deleteByProductId(Serializable[] contractProductId);
	
	//查询附件数
	public Integer selectnum(String contractProductId);
}
