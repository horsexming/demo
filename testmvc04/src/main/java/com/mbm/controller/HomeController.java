package com.mbm.controller;

import java.awt.GridLayout;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.JFrame;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mbm.domian.Factory;
import com.mbm.domian.Tgoods;
import com.mbm.services.TgoodService;
import com.mbm.services.factoryservices.FactoryServices;
import com.mbm.util.tongjitu.EchartData;
import com.mbm.util.tongjitu.Series;

@Controller
public class HomeController {
	//系统首页模块
	@Autowired
	FactoryServices factoryServices;
	@Autowired
	TgoodService tgoodService;
		@RequestMapping(value={"/home"})		//配合web下<url-pattern>/</url-pattern>
		public String login(){
			
			return "index";			//首页，删除根目录下index.jsp，否则上面url将被拦截进不来
		}
		
		@RequestMapping(value="/factory")
		public String fmain(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model){
			PageHelper.startPage(pn, 5);
	 		List<Factory>list = factoryServices.FactoryList();
	 		PageInfo<Factory>page = new PageInfo<Factory>(list,5);
	 		model.addAttribute("pageInfo", page);
	 		model.addAttribute("Factorys",list);
			return "home/fmain";
		}
		
		@RequestMapping(value="/title")
		public String title(){
			return "/home/title";
		}
		
		@RequestMapping(value="/left")
		public String left(){
			return "/home/left";
		}
		
		@RequestMapping(value="/main")
		public String main(){
			return "/home/olmsgList";			//首页转向留言板
		}
		
		//系统管理模块
		
		@RequestMapping("/sysadminMain.action")
		public String sysadminMain(){
			return "/sysadmin/main.jsp";
		}
		
		@RequestMapping("/sysadminLeft.action")
		public String sysadminLeft(){
			return "/sysadmin/left.jsp";
		}
		
		//基础信息模块
		
		@RequestMapping("/baseinfoMain.action")
		public String baseinfoMain(){
			return "/baseinfo/main.jsp";
		}
		
		@RequestMapping("/baseinfoLeft.action")
		public String baseinfoLeft(){
			return "/baseinfo/left.jsp";
		}
		
		//货运管理模块
		
		@RequestMapping("/cargoMain.action")
		public String cargoMain(){
			return "/cargo/main.jsp";
		}
		
		@RequestMapping("/cargoLeft.action")
		public String cargoLeft(){
			return "/cargo/left.jsp";
		}
		
		//统计信息
		@RequestMapping("/xinxitongji")
		public String xinxitongji() {
			
			return "message/message";
		}
		
		//验证手机验证码
		@RequestMapping("/yanzhengma")
		public String yanzhengma() {
			
			return "yanzhengma/yanzhengma";
		}
		//验证手机验证码
		@RequestMapping("/yanzhengma02")
		public String yanzhengma02() {
					
			return "yanzhengma/yanzhengma02";
		}
		
		@RequestMapping("/rili")
		public String rili() {
					
			return "yanzhengma/index";
		}
		
		/*@RequestMapping("/zhu")
		public void zhu() {		
			JFrame frame=new JFrame("Java数据统计图");
			frame.setLayout(new GridLayout(1,2,10,10));
			frame.add(new BarChart().getChartPanel()); 
		}
*/
		@RequestMapping("/zhu")
		public String zhu() {		
			return "tubiao/zhu";
		}
		
		@RequestMapping("/zhe")
		public String zhe() {
			System.out.println("a"+tgoodService.queryForList2().size());
			return "tubiao/zhe";
		}
		 @RequestMapping("/queryForList")
		 public @ResponseBody List<Map<String, Object>> queryForList() {
			 System.out.println(tgoodService.queryForList().size());
		        return tgoodService.queryForList();
		}
		 
		@RequestMapping("/showEchartLine")
		 @ResponseBody
		 public EchartData lineData() {
		     System.out.println("折线图");
		     List<String> category = new ArrayList<String>();
		     List<Integer> serisData=new ArrayList<Integer>();
		     List<Tgoods> list = tgoodService.queryForList2();
		     for (Tgoods totalNum : list) {
		         category.add(totalNum.getGoodsName());
		         serisData.add(totalNum.getGoodsT());
		     }
		     List<String> legend = new ArrayList<String>(Arrays.asList(new String[] { "总数" }));// 数据分组
		     List<Series> series = new ArrayList<Series>();// 纵坐标
		     series.add(new Series("总数", "line", serisData));		
		     EchartData data = new EchartData(legend, category, series);
		     return data;
		 }

}
