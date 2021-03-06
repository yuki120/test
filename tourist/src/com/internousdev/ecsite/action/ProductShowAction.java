package com.internousdev.ecsite.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dao.BuyProductDAO;
import com.internousdev.ecsite.dao.ReviewDAO;
import com.internousdev.ecsite.dto.BuyProductDTO;
import com.internousdev.ecsite.dto.ReviewDTO;
import com.opensymphony.xwork2.ActionSupport;

public class ProductShowAction extends ActionSupport implements SessionAware {

	private String result;
	private Map<String, Object> session;
	private List<BuyProductDTO> buyProductDTOList;
	private List<ReviewDTO> reviewDTOList;

	public String execute() {
		BuyProductDAO buyProductDAO = new BuyProductDAO();
		BuyProductDTO buyProductDTO = new BuyProductDTO();
		ReviewDAO reviewDAO = new ReviewDAO();
		ReviewDTO reviewDTO = new ReviewDTO();

		if (!session.containsKey("id") && !session.containsKey("masterId")) {
			return ERROR;
		}

		else {
			result = SUCCESS;

			// アイテム情報を取得
			buyProductDTOList = buyProductDAO.getBuyProductInfo();
			reviewDTOList = reviewDAO.getReviewInfo();

			session.put("buyProductDTOList", buyProductDTOList);
			session.put("id", buyProductDTO.getId());

			session.put("reviewDTOList", reviewDTOList);
			session.put("reviewId", reviewDTO.getId());
		}
		return result;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public List<BuyProductDTO> getBuyProductDTOList(){
		return buyProductDTOList;
	}

	public void setBuyProductDTOList(List<BuyProductDTO> buyProductDTOList){
		this.buyProductDTOList=buyProductDTOList;
	}

	public List<ReviewDTO> getReviewDTOList(){
		return reviewDTOList;
	}

	public void setReviewDTOList(List<ReviewDTO> reviewDTOList){
		this.reviewDTOList = reviewDTOList;
	}


}
