package com.bosic.jxc.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.data.domain.Example;
import org.springframework.stereotype.Service;

import com.bosic.jxc.domain.Resource;
import com.bosic.jxc.domain.RoleResource;
import com.bosic.jxc.domain.User;

@Service
public class UserService extends GenericService<User, Integer> {
	public boolean login(String username, String password) {
		User user = findByUsername(username);

		return user != null && user.getPassword().equals(password);
	}

	public User findByUsername(String username) {
		User user = new User();
		user.setUsername(username);

		Example<User> example = Example.of(user);

		User result = this.findOne(example);

		return result;
	}

	/**
	 * 获取该用户权限
	 * @param userId
	 * @return
	 */
	public List<Resource> findResources(Integer userId) {
		List<Resource> resources = getResources(userId);

		return resources;
	}

	private List<Resource> getResources(Integer userId) {
		List<Resource> target = new ArrayList<Resource>();
		//System.out.println(userId);
		List<RoleResource> source = findOne(userId).getRole().getRoleResources();
		
		getResources(target, source, null);

		return target;
	}

	private void getResources(List<Resource> target, List<RoleResource> source, Integer parentId) {
		List<Resource> subResources = new ArrayList<Resource>();

		for (RoleResource rr : source) {
			if (parentId == null) {
				if (rr.getResource().getResource() == null) {
					subResources.add(rr.getResource());
				}
			} else {
				if (rr.getResource().getResource() != null && 
					rr.getResource().getResource().getId().equals(parentId)) {
					subResources.add(rr.getResource());
				}
			}
		}

		for (Resource resource : subResources) {
			target.add(resource);
			// !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			// 自己创建Resource集合，避免hibernate产生相关代理类，否则形成懒加载。
			resource.setResources(new ArrayList<Resource>());
			getResources(resource.getResources(), source, resource.getId());
		}
	}
}
