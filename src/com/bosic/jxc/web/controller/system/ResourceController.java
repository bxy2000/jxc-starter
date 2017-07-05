package com.bosic.jxc.web.controller.system;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bosic.jxc.domain.Node;
import com.bosic.jxc.domain.Resource;
import com.bosic.jxc.service.ResourceService;
import com.bosic.jxc.utils.JsonUtil;

@Controller
@RequestMapping("/admin/resource")
public class ResourceController {
	@Autowired
	private ResourceService resourceService;
	
	@RequestMapping("/index")
	public String index(){
		return "admin/resource/index";
	}
	
	@RequestMapping("/tree")
	@ResponseBody
	public List<Node> list() {
		return resourceService.findTree();
	}
	
	@RequestMapping("/details/{id}")
	@ResponseBody
	public Resource details(@PathVariable Integer id){
		return resourceService.findOne(id);
	}
	
	@RequestMapping("/save")
	@ResponseBody
	public Map<String, Object> save(Resource resource){
		if(resource.getResource().getId() == null){
			resource.setResource(null);
		}
		Map<String, Object> result = null;
		try {
			resourceService.save(resource);
			result = JsonUtil.getResult("保存资源数据成功！", true);
		} catch(Exception e){
			result = JsonUtil.getResult("保存资源数据失败！", false);
		}
		return result;
	}
}
