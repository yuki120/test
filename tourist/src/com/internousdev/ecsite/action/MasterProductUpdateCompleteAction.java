package com.internousdev.ecsite.action;

import java.sql.SQLException;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dao.MasterProductUpdateCompleteDAO;
import com.internousdev.ecsite.util.DateUtil;
import com.opensymphony.xwork2.ActionSupport;

public class MasterProductUpdateCompleteAction extends ActionSupport implements SessionAware {

	private String product_name;
	private String product_price;
	private String product_stock;
	private String product_description;
	private String image_file_path;
	public Map<String,Object> session;
	private MasterProductUpdateCompleteDAO dao = new MasterProductUpdateCompleteDAO();
	private DateUtil dateUtil=new DateUtil();

	public String execute() throws SQLException{

		int id=(int) session.get("updateId");

		dao.productUpdateInfo(product_name, product_price, product_stock, product_description, image_file_path, id);

		session.put("product_name", product_name);
		session.put("product_price", product_price);
		session.put("product_stock", product_stock);
		session.put("product_description", product_description);
		session.put("image_file_path", image_file_path);
		session.put("update_date", dateUtil.getDate());

		String result = SUCCESS;
		return result;

	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public String getProduct_price() {
		return product_price;
	}
	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}

	public String getProduct_stock() {
		return product_stock;
	}
	public void setProduct_stock(String product_stock) {
		this.product_stock = product_stock;
	}

	public String getProduct_description() {
		return product_description;
	}
	public void setProduct_description(String product_description) {
		this.product_description = product_description;
	}

	public String getImage_file_path() {
		return image_file_path;
	}

	public void setImage_file_path(String image_file_path) {
		this.image_file_path = image_file_path;
	}

	@Override
	public void setSession(Map<String,Object> session) {
		this.session = session;
	}
}
