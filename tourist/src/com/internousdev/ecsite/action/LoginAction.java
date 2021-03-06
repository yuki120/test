package com.internousdev.ecsite.action;

import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dao.BuyProductDAO;
import com.internousdev.ecsite.dao.LoginDAO;
import com.internousdev.ecsite.dao.ReviewDAO;
import com.internousdev.ecsite.dto.BuyProductDTO;
import com.internousdev.ecsite.dto.LoginDTO;
import com.internousdev.ecsite.dto.ReviewDTO;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport implements SessionAware {
	private String loginUserId;
	private String loginPassword;
	private String result;
	private Map<String, Object> session;
	private List<BuyProductDTO> buyProductDTOList;
	private List<ReviewDTO> reviewDTOList;

	public String execute() {
		LoginDAO loginDAO = new LoginDAO();
		LoginDTO loginDTO = new LoginDTO();
		BuyProductDAO buyProductDAO = new BuyProductDAO();
		BuyProductDTO buyProductDTO = new BuyProductDTO();
		ReviewDAO reviewDAO = new ReviewDAO();
		ReviewDTO reviewDTO = new ReviewDTO();

		result = ERROR;
		loginDTO = loginDAO.getLoginUserInfo(loginUserId, loginPassword);
		session.put("loginUser", loginDTO);

		// ログイン情報を比較
		if(((LoginDTO) session.get("loginUser")).getLoginMaster()){
			buyProductDTOList = buyProductDAO.getBuyProductInfo();
			session.put("buyProductDTOList", buyProductDTOList);
			session.put("masterId",loginUserId);

			reviewDTOList = reviewDAO.getReviewInfo();
			session.put("reviewDTOList", reviewDTOList);
			session.put("reviewId", reviewDTO.getId());

			session.put("login_user_id",loginDTO.getLoginId());
			session.put("name", loginDTO.getName());
			session.put("sex", loginDTO.getSex());
			session.put("address1", loginDTO.getAddress1());
			session.put("address2", loginDTO.getAddress2());
			session.put("telNum", loginDTO.getTelNum());
			session.put("email", loginDTO.getEmail());

			result = "master";
		}

		if(result != "master"){

			/* データ型を強制的に(LoginDTO)に変更している。
			 * getLoginFlg()のメソッドを呼び出すため。 */
			if (((LoginDTO)session.get("loginUser")).getLoginFlg()) {
				result = SUCCESS;

				// アイテム情報、レビュー情報を取得
				buyProductDTOList = buyProductDAO.getBuyProductInfo();
				reviewDTOList = reviewDAO.getReviewInfo();

				/* 今後のアクションで利用したいため、"buyProductDTOList"、"reviewDTOList"という鍵の名前で
					buyProductDTOList、reviewDTOListのデータを保管する。*/
				session.put("buyProductDTOList", buyProductDTOList);
				session.put("id", buyProductDTO.getId());

				session.put("reviewDTOList", reviewDTOList);
				session.put("reviewId", reviewDTO.getId());

				session.put("login_user_id",loginDTO.getLoginId());
				session.put("name", loginDTO.getName());
				session.put("sex", loginDTO.getSex());
				session.put("address1", loginDTO.getAddress1());
				session.put("address2", loginDTO.getAddress2());
				session.put("telNum", loginDTO.getTelNum());
				session.put("email", loginDTO.getEmail());
			}
		}
		return result;
	}

	public String getLoginUserId() {
		return loginUserId;
	}

	public void setLoginUserId(String loginUserId) {
		this.loginUserId = loginUserId;
	}

	public String getLoginPassword() {
		return loginPassword;
	}

	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword;
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
