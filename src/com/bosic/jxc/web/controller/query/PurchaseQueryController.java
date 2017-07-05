package com.bosic.jxc.web.controller.query;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/purchase/query")
public class PurchaseQueryController {
	@RequestMapping("/index")
	public String index(){
		return "admin/purchase/query/index";
	}
}
