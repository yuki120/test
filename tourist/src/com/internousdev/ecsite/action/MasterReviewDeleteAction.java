package com.internousdev.ecsite.action;

import java.util.ArrayList;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dto.ReviewDTO;
import com.opensymphony.xwork2.ActionSupport;

public class MasterReviewDeleteAction extends ActionSupport implements SessionAware {

	public Map<String,Object> session;
	private ArrayList<ReviewDTO> reviewDTOList = new ArrayList<>();

	@SuppressWarnings("unchecked")
	public String execute(){

		reviewDTOList = (ArrayList<ReviewDTO>) session.get("reviewDTOList");

		session.put("reviewDTOList", reviewDTOList);

		String result=SUCCESS;
		return result;
	}

	public ArrayList<ReviewDTO> getReviewDTOList(){
		return reviewDTOList;
	}

	public void setReviewDTOList(ArrayList<ReviewDTO> reviewDTOList){
		this.reviewDTOList = reviewDTOList;
	}

	@Override
	public void setSession(Map<String,Object> session){
		this.session=session;
	}

}
