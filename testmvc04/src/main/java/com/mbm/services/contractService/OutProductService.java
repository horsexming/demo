package com.mbm.services.contractService;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbm.dao.contractDao.OutProductDao;
import com.mbm.vo.OutProductVo;

@Service
public class OutProductService {
	@Autowired
	OutProductDao outProductDao;
	
	public List<OutProductVo>selectOutProduct(Map map){
		
		return outProductDao.selectOutProduct(map);
	}

}
