package com.internousdev.ecsite.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dto.BuyProductDTO;
import com.opensymphony.xwork2.ActionSupport;

public class MasterProductDeleteConfirmAction extends ActionSupport implements SessionAware {

	private List<String> name;
	private ArrayList<BuyProductDTO> productDeleteList = new ArrayList<>();
	public Map<String,Object> session;

	public String execute(){

		session.put("name", name);
		session.put("productDeleteListSize", name.size());


		for (int i=0; i<name.size(); i++) {

			String productName = name.get(i);

			BuyProductDTO dto = new BuyProductDTO();

			dto.setProductName(productName);

			productDeleteList.add(dto);
			session.put("productDeleteList", productDeleteList);
		}
		String result=SUCCESS;
		return result;
	}

	public List<String> getName() {
		return name;
	}

	public void setName(List<String> name) {
		this.name=name;
	}

	public ArrayList<BuyProductDTO> getProductDeleteList() {
		return productDeleteList;
	}
	public void setProductDeleteList(ArrayList<BuyProductDTO> productDeleteList) {
		this.productDeleteList = productDeleteList;
	}

	@Override
	public void setSession(Map<String,Object> session) {
		this.session=session;
	}

}
