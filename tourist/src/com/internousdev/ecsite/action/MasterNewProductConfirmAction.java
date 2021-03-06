package com.internousdev.ecsite.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.util.DateUtil;
import com.opensymphony.xwork2.ActionSupport;

public class MasterNewProductConfirmAction extends ActionSupport implements SessionAware {

	private String productCategory;
	private String productName;
	private String productPrice;
	private String productStock;
	private String productDescription;
	private String imageFilePath;
	private String errorMessage;

	public Map<String, Object> session;

	private DateUtil dateUtil = new DateUtil();

	public String execute() {
		String result = SUCCESS;

		/* sessionには、get、set、put が必要。
		 * DAO → set、本Action → get、前Action → put
		 * putがなければ、値がnullのままになっている。
		 */

		if (!(productCategory.equals(""))
				&& !(productName.equals(""))
				&& !(productPrice.equals(""))
				&& !(productStock.equals(""))
				&& !(productDescription.equals(""))
				&& !(imageFilePath.equals(""))) {
					session.put("productName", productName);
					session.put("productPrice", productPrice);
					session.put("productStock", productStock);
					session.put("productDescription", productDescription);
					session.put("imageFilePath", imageFilePath);
					session.put("insertDate", dateUtil.getDate());

		}else {
			errorMessage = "【入力漏れがございましたので、再度ご登録ください。】";
			result = ERROR;
		}

		return result;
	}


	public String getProductCategory() {
		return productCategory;
	}

	public void setProductCategory (String productCategory) {
		this.productCategory = productCategory;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName (String productName) {
		this.productName = productName;
	}

	public String getProductPrice() {
		return productPrice;
	}

	public void setProductPrice (String productPrice) {
		this.productPrice = productPrice;
	}

	public String getProductStock() {
		return productStock;
	}

	public void setProductStock (String productStock) {
		this.productStock = productStock;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription (String productDescription) {
		this.productDescription = productDescription;
	}

	public String getImageFilePath() {
		return imageFilePath;
	}

	public void setImageFilePath (String imageFilePath) {
		this.imageFilePath = imageFilePath;
	}

	public String getErrorMessage() {
		return errorMessage;
	}

	public void setErrorMessage (String errorMessage) {
		this.errorMessage = errorMessage;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}
