package com.internousdev.ecsite.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class BuyProductUserInfoConfirmAction extends ActionSupport implements SessionAware {
	private String totalPrice;
	private String allTotalPrice;
	private String pay;
	public Map<String, Object> session;
	private String result;

	public String execute() {
		result = SUCCESS;

		/** ここから支払い方法を選択する処理 */

		String payment;

		if(pay.equals("1")) {
			payment="銀行振込";
			session.put("pay",payment);
		} else {
			payment="クレジットカード";
			session.put("pay",payment);
		}
		/** ここまで支払い選択処理 */



		return result;
	}


	public String getPay() {
		return pay;
	}

	public void setPay(String pay) {
		this.pay = pay;
	}

	public String getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(String totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getAllTotalPrice() {
		return allTotalPrice;
	}

	public void setAllTotalPrice(String allTotalPrice) {
		this.allTotalPrice = allTotalPrice;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}



}
