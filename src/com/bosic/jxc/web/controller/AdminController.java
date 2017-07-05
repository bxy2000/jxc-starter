package com.bosic.jxc.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminController {
	@RequestMapping(value={"/", "/admin", "/admin/home", "/admin/home/index"})
	public String index() throws Exception {
		return "admin/home/index";
	}
}
