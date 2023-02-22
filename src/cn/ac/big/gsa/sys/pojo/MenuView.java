package cn.ac.big.gsa.sys.pojo;

import java.util.ArrayList;
import java.util.List;

public class MenuView {
	private Module menu;
	private List<MenuAuth> menuAuthList = new ArrayList<MenuAuth>();
	
	public void addMenuAuth(MenuAuth menuAuth){
		menuAuthList.add(menuAuth);		
	}
	
	public Module getMenu() {
		return menu;
	}
	
	public void setMenu(Module menu) {
		this.menu = menu;
	}

	public List<MenuAuth> getMenuAuthList() {
		return menuAuthList;
	}

	public void setMenuAuthList(List<MenuAuth> menuAuthList) {
		this.menuAuthList = menuAuthList;
	}
	
}
