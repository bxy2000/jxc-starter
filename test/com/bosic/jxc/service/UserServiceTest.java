package com.bosic.jxc.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bosic.jxc.domain.Resource;
import com.bosic.jxc.domain.User;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring.xml"})
public class UserServiceTest {
	@Autowired
	private UserService userService;
	
	@Test
	public void testFindAll(){
		Page<User> users = userService.findAll(new PageRequest(0, 10));
		
		for(User user: users){
			System.out.println(user);
		}
	}
	
	@Test
	public void testFindResources(){
		List<Resource> resources = userService.findResources(1);
		
		for(Resource resource: resources){
			System.out.println(resource);
			for(Resource r: resource.getResources()){
				System.out.println(r);
			}
		}
	}
}
