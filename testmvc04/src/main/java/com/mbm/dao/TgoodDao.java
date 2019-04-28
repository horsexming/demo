package com.mbm.dao;

import java.util.List;
import java.util.Map;

import com.mbm.domian.Tgoods;

public interface TgoodDao {
	public List<Map<String, Object>> queryForList();
	public List<Tgoods>selForList();

}
