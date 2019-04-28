package com.mbm.dao.contractDao;

import java.util.List;
import java.util.Map;

import com.mbm.vo.OutProductVo;

public interface OutProductDao {
	
	public List<OutProductVo>selectOutProduct(Map map);

}
