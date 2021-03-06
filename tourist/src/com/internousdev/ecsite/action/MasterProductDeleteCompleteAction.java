package com.internousdev.ecsite.action;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dao.MasterProductDeleteDAO;
import com.internousdev.ecsite.dto.BuyProductDTO;
import com.opensymphony.xwork2.ActionSupport;

public class MasterProductDeleteCompleteAction extends ActionSupport implements SessionAware {

	public Map<String,Object> session;

	public String execute() throws SQLException{

		@SuppressWarnings("unchecked")
		List<String> name = (List<String>) session.get("name");

		for (int i=0; i<name.size(); i++) {
			@SuppressWarnings("unchecked")
			List<BuyProductDTO> list = (List<BuyProductDTO>) session.get("productDeleteList");
			String productName = list.get(i).getProductName();

			MasterProductDeleteDAO dao = new MasterProductDeleteDAO();
			dao.productDeleteInfo(productName);
		}
		String result=SUCCESS;
		return result;
	}

	@Override
	public void setSession(Map<String,Object> session) {
		this.session = session;
	}

}
