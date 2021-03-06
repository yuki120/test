package com.internousdev.ecsite.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.internousdev.ecsite.dto.BuyProductDTO;
import com.internousdev.ecsite.util.DBConnector;

public class MasterProductUpdateDAO {

	private DBConnector db = new DBConnector();
	private Connection con = db.getConnection();
	private ArrayList<BuyProductDTO> productUpdateList = new ArrayList<BuyProductDTO>();

	String sql = "SELECT * FROM product_info_transaction WHERE id = ?";

	public List<BuyProductDTO> ProductUpdateInfo (int id) {

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while(rs.next()){
				BuyProductDTO dto = new BuyProductDTO();
				dto.setId(rs.getInt("id"));
				dto.setProductName(rs.getString("product_name"));
				dto.setProductPrice(rs.getString("product_price"));
				dto.setProductStock(rs.getInt("product_stock"));
				dto.setProductDescription(rs.getString("product_description"));
				dto.setImageFilePath(rs.getString("image_file_path"));
				productUpdateList.add(dto);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}

		return productUpdateList;
	}


}
