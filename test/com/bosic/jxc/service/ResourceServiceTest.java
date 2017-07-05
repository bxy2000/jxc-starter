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

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring.xml"})
public class ResourceServiceTest {
	@Autowired
	private ResourceService resourceService;
	
	@Test
	public void testFindAll(){
		Page<Resource> resources = resourceService.findAll(new PageRequest(0, 10));
		
		for(Resource resource: resources){
			System.out.println(resource);
		}
	}
	
	@Test
	public void testFindAll2(){
		List<Resource> resources = resourceService.findAll();
		
		for(Resource resource: resources){
			System.out.println(resource);
		}
	}
}
