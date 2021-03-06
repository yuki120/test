package com.internousdev.ecsite.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.ecsite.util.DBConnector;
import com.internousdev.ecsite.util.DateUtil;

public class MasterProductUpdateCompleteDAO {

	private DBConnector db = new DBConnector();
	private Connection con = db.getConnection();
	private DateUtil dateUtil = new DateUtil();

	private String sql="UPDATE product_info_transaction SET product_name = ?, product_price = ?, product_stock = ?, "
			+ "product_description = ?, image_file_path = ?, update_date = ? WHERE id = ?";

	public boolean productUpdateInfo(String product_name, String product_price, String product_stock, String product_description, String image_file_path, int id) throws SQLException{

		boolean result = false;

		try{
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, product_name);
			ps.setString(2, product_price);
			ps.setString(3, product_stock);
			ps.setString(4, product_description);
			ps.setString(5, image_file_path);
			ps.setString(6, dateUtil.getDate());
			ps.setInt(7, id);

			int checkUpdate = ps.executeUpdate();

			if(checkUpdate > 0){
				result = true;
			}
		}catch(Exception  e){
			e.printStackTrace();
		}finally{
			con.close();
		}
		return result;
	}


}
