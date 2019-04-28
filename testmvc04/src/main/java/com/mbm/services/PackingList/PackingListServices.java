package com.mbm.services.PackingList;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mbm.dao.Export.ExportDao;
import com.mbm.dao.PackingList.PackingListDao;
import com.mbm.domian.Export;
import com.mbm.domian.PackingList;
import com.mbm.util.UtilFuns;

@Service
public class PackingListServices implements PackingListDao {

	@Autowired
	PackingListDao packingListDao;
	@Autowired
	ExportDao exportDao;
	
	@Override
	public List<PackingList> find() {
		
		return packingListDao.find();
	}
	
	public String getDivDataCreate(String[] exportIds){
		StringBuffer sBuf = new StringBuffer();
		for(int i=0;i<exportIds.length;i++){
			Export export = exportDao.getExportList(exportIds[i]);
			sBuf.append("<input type=\"checkbox\" name=\"exportIds\" checked value=\"").append(exportIds[i]).append("|").append(export.getCustomerContract()).append("\" class=\"input\"/>");
			sBuf.append(export.getCustomerContract()).append("&nbsp;&nbsp;");
		}
		
		return sBuf.toString();
	}

	@Override
	public void insertPackingList(PackingList packingList) { 
		String _exportIds = "";		//存储报运的id的串
		String _exportNos = "";		//存储报运号	
		String [] _s = packingList.getExportIds().split(",");
		
		for(int i=0;i<_s.length;i++) {
			System.out.println("****"+_s[i]);
			String[] _temp = _s[i].split("\\|");
			System.out.println("$$$$"+_temp[1]);
			_exportIds += _temp[0]+"|";
			_exportNos += _temp[1]+"|";
		}
		_exportIds = UtilFuns.delLastChar(_exportIds);
		_exportNos = UtilFuns.delLastChar(_exportNos);
		System.out.println(_exportIds);
		System.out.println(_exportNos);
		packingList.setExportIds(_exportIds);
		packingList.setExportNos(_exportNos);
		packingList.setId(UUID.randomUUID().toString());
		packingList.setState(0);					//0草稿1已上报
		packingListDao.insertPackingList(packingList);
	}

}
