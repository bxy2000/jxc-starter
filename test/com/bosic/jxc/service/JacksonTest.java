package com.bosic.jxc.service;

import java.io.IOException;
import java.util.List;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.bosic.jxc.domain.Node;
import com.bosic.jxc.domain.Resource;
import com.fasterxml.jackson.core.JsonEncoding;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.ObjectMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:spring.xml"})
public class JacksonTest {
	private JsonGenerator jsonGenerator = null;
	private ObjectMapper objectMapper = null;
	@Autowired
	private ResourceService resourceService;
	@Before
	public void init() {
		objectMapper = new ObjectMapper();
		try {
			jsonGenerator = objectMapper.getFactory().createGenerator(System.out, JsonEncoding.UTF8);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@After
	public void destory() {
		try {
			if (jsonGenerator != null) {
				jsonGenerator.flush();
			}

			if (!jsonGenerator.isClosed()) {
				jsonGenerator.close();
			}

			jsonGenerator = null;
			objectMapper = null;
			System.gc();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@Test
	public void testFindTree() throws IOException{
		List<Node> nodes = resourceService.findTree();
		
        System.out.println("jsonGenerator");
        //writeObject可以转换java对象，eg:JavaBean/Map/List/Array等
        jsonGenerator.writeObject(nodes);
        System.out.println();
        System.out.println("ObjectMapper");
        //writeValue具有和writeObject相同的功能
        objectMapper.writeValue(System.out, nodes);
	}
	
	@Test
	public void testFindOne() throws IOException{
		Resource resource = resourceService.findOne(5);
		
        jsonGenerator.writeObject(resource);
	}
}
