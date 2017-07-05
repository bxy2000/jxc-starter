package com.bosic.jxc.web.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bosic.jxc.domain.User;
import com.bosic.jxc.service.UserService;

@Controller
@RequestMapping("/account")
public class AccountController {
	@Autowired UserService userService;
	
	@RequestMapping("/login")
	public String login() {
		return "account/login";
	}
	
	@RequestMapping("/validate")
	public String validate(User user, HttpServletRequest request){
		if(userService.login(user.getUsername(), user.getPassword())){
			user = userService.findByUsername(user.getUsername());
			
			request.getSession().setAttribute("user", user);
			
			return "redirect:/admin/home/index";
		} else {
			request.setAttribute("error", "用户名密码错误！");
			return "account/login";
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().removeAttribute("user");
		return "redirect:/";
	}
}
