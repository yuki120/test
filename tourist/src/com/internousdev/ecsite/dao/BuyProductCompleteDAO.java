package com.internousdev.ecsite.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.ecsite.util.DBConnector;
import com.internousdev.ecsite.util.DateUtil;


public class BuyProductCompleteDAO {
	private DateUtil dateUtil = new DateUtil();

	private String sql = "INSERT INTO user_buy_item_transaction (item_transaction_id,"
			+ "total_price, total_count, user_master_id, pay, insert_date) VALUES (?, ?, ?, ?, ?, ?)";

	public void buyProductInfo(int item_transaction_id, String user_master_id, String total_price, int total_count, String pay, int product_stock) throws SQLException {

		DBConnector db = new DBConnector();
		Connection con = db.getConnection();
		PreparedStatement ps;

		try {
			ps = con.prepareStatement(sql);
			ps.setInt(1, item_transaction_id);
			ps.setString(2, total_price);
			ps.setInt(3, total_count);
			ps.setString(4, user_master_id);
			ps.setString(5, pay);
			ps.setString(6, dateUtil.getDate());

			int checkCount = ps.executeUpdate();
			if (checkCount > 0) {
				String sql2 = "UPDATE product_info_transaction SET product_stock = ? WHERE id = ?";

				ps = con.prepareStatement(sql2);
				ps.setInt(1, product_stock);
				ps.setInt(2, item_transaction_id);
				ps.executeUpdate();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
		}
	}
}
