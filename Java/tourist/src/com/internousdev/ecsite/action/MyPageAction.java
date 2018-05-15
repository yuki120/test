package com.internousdev.ecsite.action;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dao.MyPageDAO;
import com.internousdev.ecsite.dto.BuyProductDTO;
import com.internousdev.ecsite.dto.MyPageDTO;
import com.opensymphony.xwork2.ActionSupport;

public class MyPageAction extends ActionSupport implements SessionAware {

	public Map<String, Object> session;
	public MyPageDAO myPageDAO = new MyPageDAO();
	public MyPageDTO myPageDTO = new MyPageDTO();
	public ArrayList<MyPageDTO> myPageList = new ArrayList<MyPageDTO>();
	private String deleteFlg;
	private String message;
	private List<BuyProductDTO> buyProductDTOList;

	public String execute() throws SQLException {

		@SuppressWarnings("unchecked")
		List<BuyProductDTO> buyProductDTOList = (List<BuyProductDTO>) session.get("list");
		if (!session.containsKey("id")) {
			return ERROR;
		}

		//商品履歴を削除しない場合
		if (deleteFlg == null) {
			if (buyProductDTOList != null) {
				for (int i = 0; i < buyProductDTOList.size(); i++) {
					String user_master_id = session.get("login_user_id").toString();
					myPageList = myPageDAO.getMyPageUserInfo(user_master_id);
				}

			}else{
				String user_master_id = session.get("login_user_id").toString();
				myPageList = myPageDAO.getMyPageUserInfo(user_master_id);
			}

			Iterator<MyPageDTO> iterator = myPageList.iterator();
			if (!(iterator.hasNext())) {
				myPageList = null;
			}
		}

		//商品履歴を削除する場合
		 else {
			delete();
		}
		String result = SUCCESS;
		return result;
	}

	@SuppressWarnings("unused")
	public void delete() throws SQLException {

		@SuppressWarnings("unchecked")
		List<BuyProductDTO> buyProductDTOList = (List<BuyProductDTO>) session.get("list");

		String user_master_id = session.get("login_user_id").toString();

		int res = myPageDAO.buyProductHistoryDelete(user_master_id);

		if (res > 0) {
			myPageList = null;
			setMessage("商品情報を正しく削除しました。");
		} else if (res == 0) {
			setMessage("商品情報の削除に失敗しました。");
		}
	}

	public String getDeleteFlg() {
		return deleteFlg;
	}

	public void setDeleteFlg(String deleteFlg) {
		this.deleteFlg = deleteFlg;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public List<BuyProductDTO> getBuyProductDTOList() {
		return buyProductDTOList;
	}

	public void setBuyProductDTOList (List<BuyProductDTO> buyProductDTOList) {
		this.buyProductDTOList = buyProductDTOList;
	}

}
