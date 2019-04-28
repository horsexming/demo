package com.mbm.controller.PackingList;


import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.mbm.domian.PackingList;
import com.mbm.services.PackingList.PackingListServices;

@Controller
@RequestMapping("/PackingList")
public class PackingListController {
	
	@InitBinder  
	public void initBinder(WebDataBinder binder) {  
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		dateFormat.setLenient(false);  
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	@Autowired
	PackingListServices packingListServices;
	
	@RequestMapping("/findPackingList")
	public String findPackingList(Model model) {
		
		model.addAttribute("packingList", packingListServices.find());
		
		return "packingList/PackingList";
	}
	@RequestMapping("/Packing")
	public String Packing(String packings, Model model,HttpServletRequest request) {
		
		//String items = request.getParameter("packings");// System.out.println(items);
		String[] strs = packings.split(",");
		model.addAttribute("divData",packingListServices.getDivDataCreate(strs));
		return "packingList/Packing";
	}
	
	@RequestMapping(value="/insertPacking",method=RequestMethod.POST)
	public String Packingin(PackingList packingList) {
		
		System.out.println(packingList.getBuyer());
		System.out.println(packingList.getExportIds());
		System.out.println(packingList.getInvoiceNo());
		System.out.println(packingList.getInvoiceDate());
		packingListServices.insertPackingList(packingList);
		return "redirect:/PackingList/findPackingList";
	}
	

}
