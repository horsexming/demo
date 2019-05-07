package com.mbm.controller.contractController;

import static org.hamcrest.CoreMatchers.nullValue;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mbm.services.contractService.OutProductService;
import com.mbm.util.DownloadUtil;
import com.mbm.vo.OutProductVo;

/*
 * 出货表
 * */

@Controller
@RequestMapping("/OutProduct")
public class OutProductController {
	
	@Autowired
	OutProductService outProductService;
	
	@RequestMapping("/ToOutProductDATE")
	public String ToOutProductDATE() {
		
		return "outproduct/outProduct";
	}
	@RequestMapping("/outProductList")
	public String outProductLists(String shipTime,Model model) {
		System.out.println("aa"+shipTime);
		Map map = new HashMap(); 
		map.put("shipTime", shipTime);
		outProductService.selectOutProduct(map);
		model.addAttribute("outProductList", outProductService.selectOutProduct(map));
		System.out.println(outProductService.selectOutProduct(map).size());
		return "outproduct/outProductList";
	}
	
	/*@RequestMapping("/outProductPrint")*/
	public void print(String shipTime) throws Exception {
		System.out.println("print"+shipTime);
		Map map = new HashMap(); 
		map.put("shipTime", shipTime);
		List<OutProductVo> list = outProductService.selectOutProduct(map);
		System.out.println("prnt1"+list.size());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat simFormat = new SimpleDateFormat("yyyy年MM");
		//实现打印
		Workbook wb = new HSSFWorkbook();// 创建一个工作簿
		Sheet st = wb.createSheet();// 创建一个工作表
		Row row = null;//  创建一个行对象
		Cell cell = null;		
		int rowNo = 0;							//行号
		int colNo = 1;							//列号
		//处理大标题	sheet.addMergedRegion(new CellRangeAddress(开始行，结束行，开始列，结束列));
		st.addMergedRegion(new CellRangeAddress(0, 0, 1, 8));
		row = st.createRow(rowNo++);
		cell = row.createCell(1);
		OutProductVo outProductVo = list.get(0);
		cell.setCellValue(simFormat.format(outProductVo.getShipTime())+"月份出货表");
		//处理标题
		String[] title = new String[]{"客户","订单号","货号","数量","工厂","工厂交期","船期","贸易条款"};	//标题数组
		row = st.createRow(rowNo++);
		for(int i=0;i<title.length;i++){
			cell = row.createCell(i+1);
			cell.setCellValue(title[i]);
		}
		
		//处理内容
		
		for(int j=0;j<list.size();j++) {
			colNo = 1;
			OutProductVo oVo = list.get(j);
			row = st.createRow(rowNo++);
			
			cell = row.createCell(colNo++);
			cell.setCellValue(oVo.getCustomName());
			
			cell = row.createCell(colNo++);
			cell.setCellValue(oVo.getContractNo());
			
			cell = row.createCell(colNo++);
			cell.setCellValue(oVo.getProductNo());
			
			cell = row.createCell(colNo++);
			cell.setCellValue(oVo.getCnumber());
			
			cell = row.createCell(colNo++);
			cell.setCellValue(oVo.getFactoryName());
			
			cell = row.createCell(colNo++);
			cell.setCellValue(sdf.format(oVo.getDeliveryPeriod()));
			
			cell = row.createCell(colNo++);
			cell.setCellValue(sdf.format(oVo.getShipTime()));
			
			cell = row.createCell(colNo++);
			cell.setCellValue(oVo.getTradeTerms());
		}
		
		OutputStream outputStream = new FileOutputStream("D:\\testpoi.xls");
		wb.write(outputStream);
		outputStream.flush();
		outputStream.close();
	}
	
	//模板开发
	@RequestMapping("/outProductPrint")
	public void mobanprint(String shipTime,HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String path = request.getSession().getServletContext().getRealPath("/") + "/make/xlsprint/";
		InputStream is = new FileInputStream(new File(path + "toproduct.xls"));
		
		Workbook wb = new HSSFWorkbook(is);		//打开一个模板文件，工作簿
		Sheet sheet = wb.getSheetAt(0);			//获取到第一个工作表
		Row nRow = null;
		Cell nCell = null;
		int rowNo = 0;							//行号
		int colNo = 1;							//列号
		
		//获取模板上的单元格样式
		nRow = sheet.getRow(2);
		//客户的样式
		nCell = nRow.getCell(1);
		CellStyle customStyle = nCell.getCellStyle();		
				
		//订单号的样式
		nCell = nRow.getCell(2);
		CellStyle contractNoStyle = nCell.getCellStyle();		
				
		//货号的样式
		nCell = nRow.getCell(3);
		CellStyle productNoStyle = nCell.getCellStyle();		
				
		//数量的样式
		nCell = nRow.getCell(4);
		CellStyle numStyle = nCell.getCellStyle();		
				
		//生产厂家的样式
		nCell = nRow.getCell(5);
		CellStyle factoryStyle = nCell.getCellStyle();		
				
		//日期的样式
		nCell = nRow.getCell(6);
		CellStyle dateStyle = nCell.getCellStyle();		
				
		//贸易条款的样式
		nCell = nRow.getCell(8);
		CellStyle tradeStyle = nCell.getCellStyle();
		
		//处理大标题
		nRow = sheet.getRow(rowNo++);			//获取一个行对象
		nCell = nRow.getCell(colNo);			//获取一个单元格对象
		Map map = new HashMap(); 
		map.put("shipTime", shipTime);
		List<OutProductVo> list = outProductService.selectOutProduct(map);
		System.out.println("prnt1"+list.size());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat simFormat = new SimpleDateFormat("yyyy年MM");
		OutProductVo outProductVo = list.get(0);
		nCell.setCellValue(simFormat.format(outProductVo.getShipTime())+"月份出货表");
	
		rowNo++;								//跳过静态表格头
		
		for(int j=0;j<list.size();j++){
			colNo = 1;				//初始化
			OutProductVo op = list.get(j);
			
			nRow = sheet.createRow(rowNo++);
			nRow.setHeightInPoints(24);
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(op.getCustomName());
			nCell.setCellStyle(customStyle);
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(op.getContractNo());
			nCell.setCellStyle(contractNoStyle);
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(op.getProductNo());
			nCell.setCellStyle(productNoStyle);
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(op.getCnumber());
			nCell.setCellStyle(numStyle);
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(op.getFactoryName());
			nCell.setCellStyle(factoryStyle);
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(sdf.format(op.getDeliveryPeriod()));
			nCell.setCellStyle(dateStyle);
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(sdf.format(op.getShipTime()));
			nCell.setCellStyle(dateStyle);
			
			nCell = nRow.createCell(colNo++);
			nCell.setCellValue(op.getTradeTerms());
			nCell.setCellStyle(tradeStyle);
		}
		
		OutputStream outputStream = new FileOutputStream("D:\\testpoi.xls");
		wb.write(outputStream);
		outputStream.flush();
		outputStream.close();
	
	}
	
	//模板下载
		@RequestMapping("/outProductPrintdownload")
		public void mobandownload(String shipTime,HttpServletRequest request, HttpServletResponse response) throws Exception{
			
			String path = request.getSession().getServletContext().getRealPath("/") + "/make/xlsprint/";
			InputStream is = new FileInputStream(new File(path + "toproduct.xls"));
			
			Workbook wb = new HSSFWorkbook(is);		//打开一个模板文件，工作簿
			Sheet sheet = wb.getSheetAt(0);			//获取到第一个工作表
			Row nRow = null;
			Cell nCell = null;
			int rowNo = 0;							//行号
			int colNo = 1;							//列号
			
			//获取模板上的单元格样式
			nRow = sheet.getRow(2);
			//客户的样式
			nCell = nRow.getCell(1);
			CellStyle customStyle = nCell.getCellStyle();		
					
			//订单号的样式
			nCell = nRow.getCell(2);
			CellStyle contractNoStyle = nCell.getCellStyle();		
					
			//货号的样式
			nCell = nRow.getCell(3);
			CellStyle productNoStyle = nCell.getCellStyle();		
					
			//数量的样式
			nCell = nRow.getCell(4);
			CellStyle numStyle = nCell.getCellStyle();		
					
			//生产厂家的样式
			nCell = nRow.getCell(5);
			CellStyle factoryStyle = nCell.getCellStyle();		
					
			//日期的样式
			nCell = nRow.getCell(6);
			CellStyle dateStyle = nCell.getCellStyle();		
					
			//贸易条款的样式
			nCell = nRow.getCell(8);
			CellStyle tradeStyle = nCell.getCellStyle();
			
			//处理大标题
			nRow = sheet.getRow(rowNo++);			//获取一个行对象
			nCell = nRow.getCell(colNo);			//获取一个单元格对象
			Map map = new HashMap(); 
			map.put("shipTime", shipTime);
			List<OutProductVo> list = outProductService.selectOutProduct(map);
			System.out.println("prnt1"+list.size());
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat simFormat = new SimpleDateFormat("yyyy年MM");
			OutProductVo outProductVo = list.get(0);
			nCell.setCellValue(simFormat.format(outProductVo.getShipTime())+"月份出货表");
		
			rowNo++;								//跳过静态表格头
			
			for(int j=0;j<list.size();j++){
				colNo = 1;				//初始化
				OutProductVo op = list.get(j);
				
				nRow = sheet.createRow(rowNo++);
				nRow.setHeightInPoints(24);
				
				nCell = nRow.createCell(colNo++);
				nCell.setCellValue(op.getCustomName());
				nCell.setCellStyle(customStyle);
				
				nCell = nRow.createCell(colNo++);
				nCell.setCellValue(op.getContractNo());
				nCell.setCellStyle(contractNoStyle);
				
				nCell = nRow.createCell(colNo++);
				nCell.setCellValue(op.getProductNo());
				nCell.setCellStyle(productNoStyle);
				
				nCell = nRow.createCell(colNo++);
				nCell.setCellValue(op.getCnumber());
				nCell.setCellStyle(numStyle);
				
				nCell = nRow.createCell(colNo++);
				nCell.setCellValue(op.getFactoryName());
				nCell.setCellStyle(factoryStyle);
				
				nCell = nRow.createCell(colNo++);
				nCell.setCellValue(sdf.format(op.getDeliveryPeriod()));
				nCell.setCellStyle(dateStyle);
				
				nCell = nRow.createCell(colNo++);
				nCell.setCellValue(sdf.format(op.getShipTime()));
				nCell.setCellStyle(dateStyle);
				
				nCell = nRow.createCell(colNo++);
				nCell.setCellValue(op.getTradeTerms());
				nCell.setCellStyle(tradeStyle);
			}
			ByteArrayOutputStream bt = new ByteArrayOutputStream();
			//OutputStream outputStream = new FileOutputStream("D:\\testpoi.xls");
			wb.write(bt);
			DownloadUtil downloadUtil = new DownloadUtil();
			downloadUtil.download(bt, response, "出货表.xls");	
			bt.flush();
			bt.close();
		
		}
	

}
