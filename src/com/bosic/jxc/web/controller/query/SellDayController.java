package com.bosic.jxc.web.controller.query;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/sell/day")
public class SellDayController {
	@RequestMapping("/index")
	public String index(){
		return "admin/sell/day/index";
	}
}
