package com.bosic.jxc.web.controller.bill;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/purchase/bill")
public class PurchaseBillController {
	
	@RequestMapping("/index")
	public String index(){
		return "admin/purchase/bill/index";
	}
}
