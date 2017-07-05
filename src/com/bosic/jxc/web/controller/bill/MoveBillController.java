package com.bosic.jxc.web.controller.bill;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/move/bill")
public class MoveBillController {
	
	@RequestMapping("/index")
	public String index(){
		return "admin/move/bill/index";
	}

}
