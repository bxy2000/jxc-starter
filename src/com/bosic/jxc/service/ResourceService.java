package com.bosic.jxc.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bosic.jxc.domain.Node;
import com.bosic.jxc.domain.Resource;
import com.bosic.jxc.domain.ResourceRepository;

@Service
public class ResourceService extends GenericService<Resource, Integer> {
	@Autowired 
	private ResourceRepository resourceRepository;
	
	public List<Node> findTree(){
		List<Node> nodes = new ArrayList<>();
		
		findTree(nodes, null);
		
		return nodes;
	}
	
	private void findTree(List<Node> nodes, Integer parentId){
		List<Resource> resources = findResources(parentId);
		
		for(Resource resource: resources){
			Node node = new Node(resource.getId(), parentId, resource.getTitle());
			nodes.add(node);
			
			findTree(node.getChildren(), resource.getId());
		}
	}
	
	private List<Resource> findResources(Integer parentId){
		if(parentId == null){
			return resourceRepository.findRoot();
		} else {
			return resourceRepository.findChild(parentId);
		}
	}
}
