package com.mbm.dao.Export;

import java.util.List;

import com.mbm.domian.Export;

public interface ExportDao {
	public Export getExportList(String id);
	public List<Export>findList();
}
