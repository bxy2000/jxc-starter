package com.bosic.jxc.web.controller.query;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/sell/query")
public class SellQueryController {
	
	@RequestMapping("/index")
	public String index(){
		return "admin/sell/query/index";
	}
}
