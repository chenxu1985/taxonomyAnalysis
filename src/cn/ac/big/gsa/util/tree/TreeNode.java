package cn.ac.big.gsa.util.tree;


import java.util.ArrayList;
import java.util.List;

public class TreeNode<T> {

	private T t;
	private TreeNode<T> parent;
	private List<TreeNode<T>> children;
	private int depth;

	public TreeNode(T t) {
		this.t = t;
		this.parent = null;
		this.children = new ArrayList<TreeNode<T>>();
		this.depth = 1;
	}

	public T getT() {
		return t;
	}

	public void setT(T t) {
		this.t = t;
	}

	public TreeNode<T> getParent() {
		return parent;
	}

	public void setParent(TreeNode<T> parent) {
		this.parent = parent;
	}

	public List<TreeNode<T>> getChildren() {
		return children;
	}

	public void setChildren(List<TreeNode<T>> children) {
		this.children = children;
	}

	public boolean isLeaf() {
		if (this.getChildren().size()==0)
			return true;
		return false;
	}

	public boolean equals(TreeNode<T> node) {
		if (this.getT().equals(node.getT())) {
			return true;
		} else
			return false;
	}

	public boolean isRoot() {
		if (this.getParent() == null) {
			return true;
		}
		return false;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	
}
