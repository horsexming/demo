package com.mbm.controller.statCntroller;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.FileNotFoundException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mbm.springdao.SqlDao;
import com.mbm.util.FileUtil;
import com.mysql.cj.fabric.xmlrpc.base.Data;

@Controller
@RequestMapping("/stat")
public class StatController {
	
	@Resource
	SqlDao sqlDao;
	
	@RequestMapping("/factoryseal")
	public String factoryseal(HttpServletRequest request) throws Exception {
		String path = request.getSession().getServletContext().getRealPath("/");
		String sql = "SELECT f.factoryName ,cp.numb FROM factory_c f LEFT JOIN\r\n" + 
				"(select factoryId, COUNT(*) AS numb FROM contract_product_c GROUP BY factoryId)cp\r\n" + 
				"ON f.id = cp.factoryId";
		List<String>dateList = sqlDao.executeSQL(sql);
		StringBuffer sBuf = new StringBuffer();
		sBuf.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		sBuf.append("<pie>");
		for(int i=0;i<dateList.size();) {
			sBuf.append("<slice title=\"").append(dateList.get(i++))
			.append("\">").append(dateList.get(i++)).append("</slice>");		
		}
		sBuf.append("</pie>");
		FileUtil fileUtil = new FileUtil();
		fileUtil.createTxt(path+"stat/chart/factorysale","data.xml",sBuf.toString(),"utf_8");
		

		return"/stat/chart/jStat.jsp?forward=factorysale";
	}
	
	
	
}
