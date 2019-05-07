package com.mbm.controller.contractController;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mbm.controller.BaseController;
import com.mbm.domian.Contract;
import com.mbm.services.contractService.ContractService;
import com.mbm.vo.ContractVo;

@RequestMapping("/contract")
@Controller
public class ContractController{
	@InitBinder  
	public void initBinder(WebDataBinder binder) {  
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");  
		dateFormat.setLenient(false);  
		binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}
	@Autowired
	ContractService contractService;
	
	@RequestMapping("/contractList")
	public String contractList(Model model) {
		model.addAttribute("contractList", contractService.FactoryList());
		return "contract/contractList";
	}
	
	@RequestMapping("/addcontract")
	public String addcontract() {
		System.out.println("销售合同新增");
		return "contract/contracadd";
	}
	
	@RequestMapping(value="/contractcommit")
	public String contractcommit(Contract contract) {
		System.out.println(contract.getTradeTerms());
		System.out.println(contract.getSigningTimeDate());
		System.out.println(contract.getPrintStyle());
		contractService.insertContract(contract);
		return "redirect:/contract/contractList";
	}
	
	@RequestMapping("/selectcontractById/{id}")
	public String selectcontractById(@PathVariable String id , Model model) {
		System.out.println(contractService.selectContract(id).getSigningTimeDate());
		System.out.println(contractService.selectContract(id).getShipTime());
		model.addAttribute("contract", contractService.selectContract(id));
		return "contract/updatecontract";
	}
	@RequestMapping("/updatecontract")
	public String updatecontract(Contract contract) {
		contractService.updatecontract(contract);
		return "redirect:/contract/contractList";
	}
	@ResponseBody
	@RequestMapping("/del")
	public void batchDeletes(HttpServletRequest request) {
		String items = request.getParameter("delitems");// System.out.println(items);
		String[] strs = items.split(",");
		contractService.deletes(strs);	
	}
	@ResponseBody
	@RequestMapping(value="/delByid" ,method=RequestMethod.POST)
	public void delByid(HttpServletRequest request) {
		String items = request.getParameter("delid");// System.out.println(items);
		System.out.println("delid");
		contractService.deleteByid(items);
	}
	@RequestMapping("/updateState")
	public String updateState(HttpServletRequest request){
		String items = request.getParameter("delitems");
		String[] strs = items.split(",");
		contractService.updateState(strs);
		return "redirect:/contract/contractList";
	}
	
	@RequestMapping("/updateState2")
	public String updateState2(HttpServletRequest request){
		String items = request.getParameter("delitems");
		String[] strs = items.split(",");
		contractService.updateState2(strs);
		return "redirect:/contract/contractList";
	}
	
	@RequestMapping("/selectAllById")
	public String selectAllById(String id,Model model) {
		System.out.println("selectAllById"+id);
		ContractVo contractVo = contractService.selectAll(id);	
		model.addAttribute("AllContract", contractVo);
		return "contract/selectallcontract";
		
	}

}
