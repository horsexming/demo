package com.mbm.services.Export;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbm.dao.Export.ExportDao;
import com.mbm.domian.Export;

@Service
public class ExportServices implements ExportDao{
	@Autowired
	ExportDao exportDao;
	@Override
	public Export getExportList(String id) {
		
		return exportDao.getExportList(id);
	}
	@Override
	public List<Export> findList() {
		// TODO Auto-generated method stub
		return exportDao.findList();
	}

}
