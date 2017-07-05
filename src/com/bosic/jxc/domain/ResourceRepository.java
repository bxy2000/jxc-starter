package com.bosic.jxc.domain;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface ResourceRepository extends JpaRepository<Resource, Integer>{
	@Query("from Resource r where r.resource.id = null")
	List<Resource> findRoot();
	@Query("from Resource r where r.resource.id = ?1")
	List<Resource> findChild(Integer parentId);
}
