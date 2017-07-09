package com.bosic.jxc.domain;

import java.util.ArrayList;
import java.util.List;

public class Node {
	private Integer id;
	private Integer parentId;
	private String text;
	private List<Node> children = new ArrayList<>();
	
	public Node() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Node(Integer id, Integer parentId, String text) {
		super();
		this.id = id;
		this.parentId = parentId;
		this.text = text;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	
	public List<Node> getChildren() {
		return children;
	}
	public void setChildren(List<Node> children) {
		this.children = children;
	}
	@Override
	public String toString() {
		return "Node [id=" + id + ", parentId=" + parentId + ", text=" + text + "]";
	}
}
