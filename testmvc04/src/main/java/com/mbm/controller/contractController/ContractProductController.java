package com.mbm.controller.contractController;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import com.mbm.domian.ContractProduct;
import com.mbm.services.contractService.ContractProductService;
import com.mbm.services.factoryservices.FactoryServices;

@RequestMapping("/ContractProduct")
@Controller
public class ContractProductController {
	@Autowired
	FactoryServices factoryServices;
	@Autowired
	ContractProductService contractProductService;
	//转向货物页面
	@RequestMapping("/contractProductadd")
	public String ContractProduct(String contractId,Model model,Map map) {	
		model.addAttribute("factorys", factoryServices.FactorystateList());
		model.addAttribute("contractId", contractId);
		
		System.out.println(contractId);
			map.put("contractId",contractId);

		if(contractProductService.selectContractProduct(map).size()!=0) {
			model.addAttribute("Productlist", contractProductService.selectContractProduct(map));
			System.out.println(contractProductService.selectContractProduct(map).size());
		}else {
			model.addAttribute("Productlist", null);
			System.out.println("0000000");
		}
		return "contract/contractProduct";
	}
	@RequestMapping("/insContractProduct")
	public String insContractProduct(ContractProduct contractProduct,Model model) {
		model.addAttribute("contractId", contractProduct.getContractId());
		contractProductService.insertContractProduct(contractProduct);		
		return "redirect:/ContractProduct/contractProductadd";
	}
	
	//修改
	@RequestMapping("/updateProduct")
	public String updateProduct(String id,Model model) {
		model.addAttribute("factorys", factoryServices.FactorystateList());
		model.addAttribute("Product", contractProductService.selectProductById(id));
		return "contract/updateProduct";
	}
	@RequestMapping("/updateProducto")
	public String updateProducto(ContractProduct contractProduct,Model model) {
		System.out.println("ractId"+contractProduct.getContractId());
		model.addAttribute("contractId", contractProduct.getContractId());
		contractProductService.updateProduct(contractProduct);
		return "redirect:/ContractProduct/contractProductadd";
	}
	
	//删除
	@RequestMapping("/deleteProduct")
	public String deleteProduct(String id ,String contractId,Model model) {
		model.addAttribute("contractId", contractId);
		System.out.println("666"+contractId);
		System.out.println("777"+id);
		contractProductService.deleteProduct(id);
		return "redirect:/ContractProduct/contractProductadd";
	}
}
