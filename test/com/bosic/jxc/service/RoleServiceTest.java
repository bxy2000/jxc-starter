package com.bosic.jxc.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bosic.jxc.domain.Role;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring.xml"})
public class RoleServiceTest {
	@Autowired
	private RoleService roleService;
	
	@Test
	public void testFindAll(){
		Page<Role> roles = roleService.findAll(new PageRequest(0, 10));
		
		for(Role role: roles){
			System.out.println(role);
		}
	}
}
