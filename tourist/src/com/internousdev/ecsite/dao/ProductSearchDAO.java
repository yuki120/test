package com.internousdev.ecsite.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.internousdev.ecsite.dto.BuyProductDTO;
import com.internousdev.ecsite.util.DBConnector;

public class ProductSearchDAO {

	private DBConnector db = new DBConnector();
	private Connection con = db.getConnection();
	private List<BuyProductDTO> searchList = new ArrayList<BuyProductDTO>();

	public List<BuyProductDTO> getProductInfo (String searchWord) {

		String sql = "SELECT * FROM product_info_transaction";

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				String productCategory = rs.getString("product_category");
				String productName = rs.getString("product_name");

				if (productCategory.matches(".*" + searchWord + ".*") || productName.matches(".*" + searchWord + ".*")) {
					BuyProductDTO dto = new BuyProductDTO();
					dto.setId(rs.getInt("id"));
					dto.setProductCategory(productCategory);
					dto.setProductName(productName);
					dto.setProductPrice(rs.getString("product_price"));
					dto.setProductStock(rs.getInt("product_stock"));
					dto.setProductDescription(rs.getString("product_description"));
					dto.setImageFilePath(rs.getString("image_file_path"));
					searchList.add(dto);
				}
			}

		}catch(Exception e){
			e.printStackTrace();
		}

		return searchList;
	}

	public List<BuyProductDTO> getBuyProductDTO(){
		return searchList;
	}

}
