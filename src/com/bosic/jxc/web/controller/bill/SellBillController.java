package com.bosic.jxc.web.controller.bill;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/sell/bill")
public class SellBillController {
	
	@RequestMapping("/index")
	public String index(){
		return "admin/sell/bill/index";
	}

}
