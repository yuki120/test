package com.internousdev.ecsite.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dao.ProductSearchDAO;
import com.internousdev.ecsite.dto.BuyProductDTO;
import com.opensymphony.xwork2.ActionSupport;

public class ProductSearchAction extends ActionSupport implements SessionAware {

	private String searchWord;
	private String message;
	public Map<String, Object> session;

	private List<BuyProductDTO> buyProductDTOList = new ArrayList<BuyProductDTO>();
	private ProductSearchDAO ProductSearchDAO = new ProductSearchDAO();

	@SuppressWarnings("unchecked")
	public String execute(){

		String result = ERROR;

		 //ワードを入力した時のみ実行
		if (searchWord.equals("")) {

			result = ERROR;
			buyProductDTOList =(List<BuyProductDTO>) session.get("buyProductDTOList");
			setMessage("検索ワードを入力してください。");

		}else{
			buyProductDTOList = ProductSearchDAO.getProductInfo(searchWord);

			if (buyProductDTOList.size() > 0) {
				session.put("buyProductDTOList", buyProductDTOList);
				int productCount = buyProductDTOList.size();
				String count = Integer.toString(productCount);
				setMessage(count + "件のパッケージツアーが見つかりました。");
				result = SUCCESS;

			}else{
				result = ERROR;
				buyProductDTOList =(List<BuyProductDTO>) session.get("buyProductDTOList");
				setMessage("該当するパッケージツアーが見つかりませんでした。");
			}
		}

		return result;
	}


	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}


	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}


	public List<BuyProductDTO> getBuyProductDTOList(){
		return buyProductDTOList;
	}

	public void setBuyProductDTOList(List<BuyProductDTO> buyProductDTOList){
		this.buyProductDTOList=buyProductDTOList;
	}

	@Override
	public void setSession(Map<String, Object> session){
		this.session=session;
	}
}
