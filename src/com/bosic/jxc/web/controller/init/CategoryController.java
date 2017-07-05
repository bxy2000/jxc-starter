package com.bosic.jxc.web.controller.init;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/category")
public class CategoryController {
	
	@RequestMapping("/index")
	public String index(){
		return "admin/category/index";
	}
}
