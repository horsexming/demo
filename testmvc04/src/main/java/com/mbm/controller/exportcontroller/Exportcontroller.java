package com.mbm.controller.exportcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mbm.services.Export.ExportServices;

@Controller
@RequestMapping("/Export")
public class Exportcontroller {

	@Autowired
	ExportServices exportServices;
	@RequestMapping("/findList")
	public String findList(Model model) {
		model.addAttribute("exportlist", exportServices.findList());
		return "export/exportlist";
	}
}
