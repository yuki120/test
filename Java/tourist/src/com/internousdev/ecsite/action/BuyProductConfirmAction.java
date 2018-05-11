package com.internousdev.ecsite.action;

import java.sql.SQLException;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dao.BuyProductCompleteDAO;
import com.opensymphony.xwork2.ActionSupport;

public class BuyProductConfirmAction extends ActionSupport implements SessionAware {
	public Map<String, Object> session;

	public String execute() throws SQLException {
		BuyProductCompleteDAO buyProductCompleteDAO = new BuyProductCompleteDAO();
		buyProductCompleteDAO.buyProductInfo(
				session.get("id").toString(),
				session.get("login_user_id").toString(),
				session.get("total_price").toString(),
				session.get("count").toString(),
				session.get("pay").toString());
		String result = SUCCESS;
		return result;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}


}