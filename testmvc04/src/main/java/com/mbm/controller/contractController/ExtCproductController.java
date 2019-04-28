/**
 * 
 */
package com.mbm.controller.contractController;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mbm.domian.ExtCproduct;
import com.mbm.services.contractService.ExtCproductService;
import com.mbm.services.factoryservices.FactoryServices;

/**
 * @author Administrator
 * @ExtCproductController 附件
 */
@Controller
@RequestMapping("/ExtCproduct")
public class ExtCproductController {
	
	@Autowired
	ExtCproductService extCproductService;
	@Autowired
	FactoryServices factoryServices;
	
	@RequestMapping("/ToExtCproduct")
	public String ToExtCproduct(String contractProductId ,Model model) {
		model.addAttribute("factorys", factoryServices.FactorystateList());
		model.addAttribute("contractProductId", contractProductId);
		Map map = new HashMap<>();
		map.put("contractProductId", contractProductId);
		System.out.println("ExtCproduct"+extCproductService.selCproductByproductId(map).size());
		model.addAttribute("ExtCproduct", extCproductService.selCproductByproductId(map));
		return "contract/extCproduct";
	}
	@RequestMapping("/insertEXTCProduct")
	public String insertEXTCProduct(ExtCproduct extCproduct,Model model) {
		model.addAttribute("contractProductId", extCproduct.getContractProductId());	
		extCproductService.insertEXTCProduct(extCproduct);
		return "redirect:/ExtCproduct/ToExtCproduct";
	}
	
	@RequestMapping("/ToUpdateEXTCProduct")
	public String ToUpdateEXTCProduct(String id,Model model) {
		model.addAttribute("factorys", factoryServices.FactorystateList());
		model.addAttribute("EXTProduct", extCproductService.selEXTCProductById(id));
		return "contract/updateExtCproduct";
	}
	
	@RequestMapping("/UpdateEXTCProduct")
	public String UpdateEXTCProduct(ExtCproduct extCproduct,Model model) {
		model.addAttribute("contractProductId", extCproduct.getContractProductId());
		extCproductService.updateEXTCProduct(extCproduct);
		return "redirect:/ExtCproduct/ToExtCproduct";
	}
	
	@RequestMapping("/deleteEXTCProduct")
	public String deleteEXTCProduct(String id,String contractProductId,Model model) {
		
		System.out.println("String id" +id);
		System.out.println("String contractProductId" +contractProductId);
		model.addAttribute("contractProductId", contractProductId);
		extCproductService.deleteEXTCProduct(id);
		return "redirect:/ExtCproduct/ToExtCproduct";
	}
}
