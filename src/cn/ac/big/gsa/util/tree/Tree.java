package cn.ac.big.gsa.util.tree;

import java.util.ArrayList;
import java.util.List;

public class Tree<T> {
	private TreeNode<T> root;
	private List <TreeNode<T>> leafList;
	
	public TreeNode<T> getRoot() {
		return root;
	}
	public List<TreeNode<T>> getLeafList(){
		return leafList;
	}
	// add a new child node for the exist node
	public void addNode(TreeNode<T> node, T newNode) {
		// add a child node to a given node
		if (null == node) {
			if (null == root) {
				root = new TreeNode<T>(newNode);
				root.setParent(node);
				root.setDepth(1);
			}
		} else {
			TreeNode<T> temp = new TreeNode<T>(newNode);
			temp.setParent(node);
			temp.setDepth(node.getDepth()+1);
			node.getChildren().add(temp);			
		}
	}

	public TreeNode<T> search(TreeNode<T> input, T newNode) {

		TreeNode<T> temp = null;

		if (input.getT().equals(newNode)) {
			return input;
		}
		for (int i = 0; i < input.getChildren().size(); i++) {
			temp = search(input.getChildren().get(i), newNode);

			if (null != temp) {
				break;
			}
		}

		return temp;
	}

	public TreeNode<T> getNode(T newNode) {
		return search(root, newNode);
	}
	
	public List<T> showNodes(){
		TreeNode rootNode = this.getRoot();
		if(rootNode!=null){
			return showNode(rootNode);
		}
		return null;
	}
	public List<T> showNode(TreeNode<T> node){
		List<T> t = new ArrayList<T>();
		if(null!=node){
			t.add(node.getT());
			for (int i = 0; i < node.getChildren().size(); i++) {
				t.addAll(showNode(node.getChildren().get(i)));
			}
		}
		return t;
	}
	public List<T> showLeafNode(TreeNode<T> node){
		List<T> t = new ArrayList<T>();
		if(null!=node){
			if(node.isLeaf()){
				t.add(node.getT());
			}				
			for (int i = 0; i < node.getChildren().size(); i++) {
				t.addAll(showLeafNode(node.getChildren().get(i)));
			}
		}
		return t;
	}
	public boolean isLastChildOfParent(T newNode) {
		TreeNode<T> node = this.getNode(newNode);
		if(node.isRoot()){
			return true;
		}
		TreeNode<T> parentNode = node.getParent();
		List<TreeNode<T>> moduleNodes = parentNode.getChildren();
		if (node.equals(moduleNodes.get(moduleNodes.size() - 1)))
			return true;
		else
			return false;
	}

	public boolean isLastNodeOfTree(T newNode) {
		TreeNode<T> node = this.getNode(newNode);
		for(TreeNode<T> tmpNode = node;!tmpNode.isRoot();tmpNode=node.getParent()){
			if(!isLastChildOfParent(tmpNode.getT())){
				return false;
			}
		}
		return true;
	}
}
