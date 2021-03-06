package com.internousdev.ecsite.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dto.BuyProductDTO;
import com.opensymphony.xwork2.ActionSupport;

public class MasterProductDeleteAction extends ActionSupport implements SessionAware {

	public Map<String,Object> session;

	private ArrayList<BuyProductDTO> buyProductDTOList = new ArrayList<>();

	@SuppressWarnings("unchecked")
	public String execute(){

		buyProductDTOList = (ArrayList<BuyProductDTO>) session.get("buyProductDTOList");

		String result=SUCCESS;
		return result;
	}

	public ArrayList<BuyProductDTO> getBuyProductDTOList(){
		return buyProductDTOList;
	}

	public void setBuyProductDTOList(ArrayList<BuyProductDTO> buyProductDTOList){
		this.buyProductDTOList=buyProductDTOList;
	}

	@Override
	public void setSession(Map<String,Object> session){
		this.session=session;
	}

}
