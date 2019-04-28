package testmvc04;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.junit.Test;

import com.mbm.services.contractService.OutProductService;
import com.mbm.vo.OutProductVo;

/*测试操作工作簿
 * 1.创建一个工作簿
 * 2.创建一个工作表
 * 3.创建一个行对象
 * 4.创建一个单元格对象指定列
 * 5.给单元格设置内容
 * 6.样式修饰
 * 7.写出保存
 * 8.关闭
 * 
 * */

public class TestHSSF {
	
	@Test
	public void testHSSF() throws IOException {
		Workbook wb = new HSSFWorkbook();
		Sheet st = wb.createSheet();
		Row row = st.createRow(7);
		Cell cell = row.createCell(4);
		cell.setCellValue("测试一下");
		//设置样式
		CellStyle cStyle = wb.createCellStyle();//创建单元格样式
		Font font = wb.createFont();//创建一个字体对象
		
		font.setFontName("华文隶书");//设置字体样式
		font.setFontHeightInPoints((short)24);//设置字体大小
		cStyle.setFont(font);//绑定字体样式
		cell.setCellStyle(cStyle);//设置单元格样式
		
		try {
			OutputStream outputStream = new FileOutputStream("D:\\testpoi.xls");
			wb.write(outputStream);
			outputStream.flush();
			outputStream.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	
	

}
