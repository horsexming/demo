package com.mbm.services;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbm.dao.TgoodDao;
import com.mbm.domian.Tgoods;

@Service("tgoodService")
public class TgoodService {
	
	@Autowired
	TgoodDao tgoodDao;
	public List<Map<String, Object>> queryForList() {
        return tgoodDao.queryForList();
    }
	
	public List<Tgoods> queryForList2() {
        return tgoodDao.selForList();
    }

}
