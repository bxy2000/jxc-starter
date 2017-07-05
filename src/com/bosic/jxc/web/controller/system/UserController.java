package com.bosic.jxc.web.controller.system;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.ExampleMatcher;
import org.springframework.data.domain.ExampleMatcher.StringMatcher;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bosic.jxc.domain.Role;
import com.bosic.jxc.domain.User;
import com.bosic.jxc.service.UserService;
import com.bosic.jxc.utils.JsonUtil;

@Controller
@RequestMapping("/admin/user")
public class UserController {
	@Autowired
	private UserService userService;

	@RequestMapping("/index")
	public String index() {
		return "admin/user/index";
	}

	@RequestMapping("/list")
	@ResponseBody
	public Map<String, Object> list(
			// 客户端传来的数据为：offset（第几条记录），limit（每页大小），search（查询字符串）
			@RequestParam(required = false, defaultValue = "10") Integer limit,
			@RequestParam(required = false, defaultValue = "0") Integer offset,
			@RequestParam(required = false, defaultValue = "") String search) {
		limit = limit == null ? 10 : limit;
		offset = offset == null ? 0 : offset;
		int pageSize = limit;
		// jpa 中，分页索引pageIndex重0开始, 正常情况下，pageIndex应该是
		// int pageIndex = offset / pageSize + 1;
		int pageIndex = offset / pageSize;

		User user = new User();
		if(!"".equals(search)){
			user.setUsername(search);
			user.setPassword(search);
			Role role = new Role();
			role.setRoleName(search);
			user.setRole(role);
		}
		ExampleMatcher matcher = ExampleMatcher
				.matchingAny()
				.withStringMatcher(StringMatcher.CONTAINING);
		Example<User> example = Example.of(user, matcher);
		Page<User> users = userService.findAll(example, new PageRequest(pageIndex, pageSize));
		Map<String, Object> result = new HashMap<>();
		result.put("rows", users.getContent());
		result.put("total", users.getTotalElements());

		return result;
	}

	@RequestMapping("/save")
	@ResponseBody
	public Map<String, Object> save(User user) {
		System.out.println(user);
		Map<String, Object> result = null;
		try {
			userService.save(user);
			result = JsonUtil.getResult("保存数据成功！", true);
		} catch (Exception e) {
			result = JsonUtil.getResult("保存数据失败！", false);
		}

		return result;
	}
	
	@RequestMapping("/delete/{id}")
	@ResponseBody
	public Map<String, Object> delete(@PathVariable Integer id){
		Map<String, Object> result = null;
		
		try {
			userService.delete(id);
			result = JsonUtil.getResult("删除用户成功！", true);
		} catch(Exception e){
			result = JsonUtil.getResult("删除用户失败！", false);
		}
		
		return result;
	}
	
	@RequestMapping("/deleteInBatch")
	@ResponseBody
	public Map<String, Object> deleteInBatch(@RequestParam(value="ids[]") Integer[] ids){
		Map<String, Object> result = null;
		List<User> users = new ArrayList<>();
		Arrays.asList(ids).forEach(i->{User user = new User(); user.setId(i); users.add(user);}); 
		try {
			userService.deleteInBatch(users);
			result = JsonUtil.getResult("删除用户成功！", true);
		} catch(Exception e){
			result = JsonUtil.getResult("删除用户失败！", false);
		}
		
		return result;
	}
}
