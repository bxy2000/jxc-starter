package com.bosic.jxc.web.controller.system;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bosic.jxc.domain.Role;
import com.bosic.jxc.service.RoleService;

@Controller
@RequestMapping("/admin/role")
public class RoleController {
	@Autowired
	private RoleService roleService;
	
	@RequestMapping("/index")
	public String index(){
		return "admin/role/index";
	}
	
	@RequestMapping("/list")
	@ResponseBody
	public List<Role> list(){
		List<Role> result = roleService.findAll();
		
		return result;
	}
}
