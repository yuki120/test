package com.internousdev.ecsite.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dao.BuyProductCompleteDAO;
import com.internousdev.ecsite.dto.BuyProductDTO;
import com.opensymphony.xwork2.ActionSupport;

public class BuyProductConfirmAction extends ActionSupport implements SessionAware {
	public Map<String, Object> session;
	private ArrayList<BuyProductDTO> buyProductDTOList = new ArrayList<BuyProductDTO>();

	@SuppressWarnings("unchecked")
	public String execute() throws SQLException {
		buyProductDTOList = (ArrayList<BuyProductDTO>) session.get("list");

		for (int i=0; i < buyProductDTOList.size(); i++) {

			int a = buyProductDTOList.get(i).getProductStock();

			int id = buyProductDTOList.get(i).getId();

			int b = buyProductDTOList.get(i).getTotalPrice();
			String totalPrice = String.valueOf(b);

			int count = buyProductDTOList.get(i).getCount();

			int product_stock = a - count;
			System.out.println(product_stock);

			if (product_stock < 0) {
				String result = ERROR;
				return result;
			}


		BuyProductCompleteDAO buyProductCompleteDAO = new BuyProductCompleteDAO();
		buyProductCompleteDAO.buyProductInfo(
				id,
				session.get("login_user_id").toString(),
				totalPrice,
				count,
				session.get("pay").toString(),
				product_stock
				);
		}
		String result = SUCCESS;
		return result;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public ArrayList<BuyProductDTO> getBuyProductDTOList() {
		return buyProductDTOList;
	}

	public void setBuyProductDTOList (ArrayList<BuyProductDTO> buyProductDTOList) {
		this.buyProductDTOList = buyProductDTOList;
	}


}
