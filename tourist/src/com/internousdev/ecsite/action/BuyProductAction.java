package com.internousdev.ecsite.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dto.BuyProductDTO;
import com.opensymphony.xwork2.ActionSupport;

public class BuyProductAction extends ActionSupport implements SessionAware {
	private List<String> count;
	public Map<String, Object> session;
	private ArrayList<BuyProductDTO> buyProductDTOList = new ArrayList<BuyProductDTO>();
	private String result;

	public String execute() {
		result = SUCCESS;

		session.put("count", count);
		@SuppressWarnings("unchecked")
		List<BuyProductDTO> list= (List<BuyProductDTO>) session.get("buyProductDTOList");
		/*Objectは、データ型。「session.get」でデータ型を設定する必要がある。
		 Object → Stringは可能だが、Object → intはできないため、
		 Object → String → intにする必要がある。（下記処理）*/

		for (int i=0; i < count.size(); i++) {
			BuyProductDTO buyProductDTO = new BuyProductDTO();

			String buyProductName = list.get(i).getProductName();
			session.put("productName",buyProductName);

			String buyProductPrice = list.get(i).getProductPrice();
			session.put("productPrice",buyProductPrice);

			int id = list.get(i).getId();
			session.put("id",id);

			int productStock = list.get(i).getProductStock();

			/*Objectは、データ型。「session.get」でデータ型を設定する必要がある。
			 Object → Stringは可能だが、Object → intはできないため、
			 Object → String → intにする必要がある。（下記処理）*/
			int intCount = Integer.parseInt(count.get(i));
			int intPrice = Integer.parseInt(list.get(i).getProductPrice());


			if (intCount != 0) {
				buyProductDTO.setId((int) session.get("id"));
				buyProductDTO.setProductName(session.get("productName").toString());
				buyProductDTO.setProductPrice(session.get("productPrice").toString());
				buyProductDTO.setCount(intCount);
				buyProductDTO.setProductStock(productStock);
				buyProductDTO.setTotalPrice(intCount * intPrice);
				session.put("totalPrice",intCount * intPrice);

				/** ここまで合計 */

				buyProductDTOList.add(buyProductDTO);
			}
			/* ここまで繰り返す */
			session.put("list",buyProductDTOList);
		}

		//複数購入の場合の合計金額取得
		if (buyProductDTOList.size() > 1) {
			int allTotalPrice = 0;
			for (int a = 0; a < buyProductDTOList.size(); a++) {
				allTotalPrice = allTotalPrice + buyProductDTOList.get(a).getTotalPrice();
			}
			System.out.println(allTotalPrice);
			session.put("allTotalPrice", allTotalPrice);
		}

		return result;
	}

	public List<String> getCount() {
		return count;
	}

	public void setCount(List<String> count) {
		this.count = count;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public ArrayList<BuyProductDTO> getBuyProductDTOList() {
		return buyProductDTOList;
	}

	public void setBuyProductDTOList (ArrayList<BuyProductDTO> buyProductDTOList) {
		this.buyProductDTOList = buyProductDTOList;
	}

}
