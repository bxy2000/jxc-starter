package com.bosic.jxc.service;

import java.io.Serializable;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Example;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

@Transactional
public abstract class GenericService<T, PK extends Serializable> {
	@Autowired
	protected JpaRepository<T, PK> repository;
	
	/**
	 * 保存（新增或者修改）
	 * 		如果enitity.id != null 则新增
	 * 		否则，修改
	 * @param t
	 */
	public void save(T t) {
		repository.save(t);
	}
	
	/**
	 * 删除
	 * @param id
	 */
	public void delete(PK id) {
		repository.delete(id);
	}
	
	/**
	 * 批量删除
	 * @param id
	 * @return
	 */
	public void deleteInBatch(Iterable<T> ids){
		repository.deleteInBatch(ids);
	}
	
	/**
	 * 查找一条记录
	 * @param id
	 * @return
	 */
	public T findOne(PK id) {
		return repository.findOne(id);
	}
	
	public T findOne(Example<T> example){
		return repository.findOne(example);
	}
	
	public List<T> findAll(){
		return repository.findAll();
	}
	
	public Page<T> findAll(Pageable pageable){
		return repository.findAll(pageable);
	}
	
	public Page<T> findAll(Example<T> example, Pageable pageable){
		return repository.findAll(example, pageable);
	}
}
