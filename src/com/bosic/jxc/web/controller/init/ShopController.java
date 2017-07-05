package com.bosic.jxc.web.controller.init;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/shop")
public class ShopController {
	@RequestMapping("/index")
	public String index(){
		return "admin/shop/index";
	}
}
