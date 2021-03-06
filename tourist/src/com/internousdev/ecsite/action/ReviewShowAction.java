package com.internousdev.ecsite.action;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dao.ReviewDAO;
import com.internousdev.ecsite.dto.ReviewDTO;
import com.opensymphony.xwork2.ActionSupport;

public class ReviewShowAction extends ActionSupport implements SessionAware {

	private String result;
	private Map<String, Object> session;
	private List<ReviewDTO> reviewDTOList;

	public String execute() throws SQLException {

		ReviewDAO reviewDAO = new ReviewDAO();
		ReviewDTO reviewDTO = new ReviewDTO();

		result = SUCCESS;

		reviewDTOList = reviewDAO.getReviewInfo();

		session.put("reviewDTOList", reviewDTOList);
		session.put("reviewId", reviewDTO.getId());

		return result;
	}



	public List<ReviewDTO> getReviewDTOList(){
		return reviewDTOList;
	}

	public void setReviewDTOList(List<ReviewDTO> reviewDTOList){
		this.reviewDTOList = reviewDTOList;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}



}
