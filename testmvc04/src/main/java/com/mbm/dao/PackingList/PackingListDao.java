package com.mbm.dao.PackingList;

import java.util.List;

import com.mbm.domian.PackingList;

public interface PackingListDao {
	public List<PackingList>find();
	public void insertPackingList(PackingList packingList);

}
