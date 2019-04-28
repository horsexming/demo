package com.mbm.controller.factorycontroller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mbm.domian.Factory;
import com.mbm.services.factoryservices.FactoryServices;

@Controller
@RequestMapping("/factory")
public class FactoryController {
	@Autowired
	FactoryServices factoryServices;
	
	@RequestMapping("/factoryadd")
	public String add(Factory factory) {
		System.out.println("添加成功");
		factoryServices.insertFactory(factory);
		return "redirect:/factory";
	}
	@RequestMapping("/addfactory")
	public String addfactory() {
		
		return "factory/addfactory";
	}
	
	@RequestMapping("/selectfactorybyid/{id}")
	public String selectfactorybyid(@PathVariable String id ,Model model) {
		System.out.println("id"+id);	
		model.addAttribute("factory", factoryServices.selectFactoryById(id));
		return "factory/updatefactory";
	}
	@RequestMapping("/updatefactory")
	public String updatefactory(Factory factory) {
		System.out.println("id"+factory.getId());	
		factoryServices.updateFactory(factory);
		return "redirect:/factory";
	
	}
	
	@ResponseBody
	@RequestMapping("/del")
	public void batchDeletes(HttpServletRequest request) {
		String items = request.getParameter("delitems");// System.out.println(items);
		String[] strs = items.split(",");
		factoryServices.deletes(strs);	
	}
	@ResponseBody
	@RequestMapping(value="/delByid" ,method=RequestMethod.POST)
	public void delByid(HttpServletRequest request) {
		String items = request.getParameter("delid");// System.out.println(items);
		System.out.println("delid");
		factoryServices.deleteByid(items);
	}
	
	@RequestMapping("/updateState/{id}")
	public String updateState(@PathVariable String id){
		factoryServices.updateState(id);
		return "redirect:/factory";
	}


}
