package com.internousdev.ecsite.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.internousdev.ecsite.dto.MyPageDTO;
import com.internousdev.ecsite.util.DBConnector;

public class MyPageDAO {
	private DBConnector db = new DBConnector();
	private Connection con = db.getConnection();

	public ArrayList<MyPageDTO> getMyPageUserInfo(String user_master_id) throws SQLException {

		ArrayList<MyPageDTO> myPageDTO = new ArrayList<MyPageDTO>();
		String sql ="SELECT ubit.id, pit.product_name, ubit.total_price, ubit.total_count, ubit.pay, ubit.insert_date "
				+ "FROM user_buy_item_transaction ubit "
				+ "LEFT JOIN product_info_transaction pit "
				+ "ON ubit.item_transaction_id = pit.id "
				+ "WHERE ubit.user_master_id = ? "
				+ "ORDER BY insert_date DESC";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user_master_id);
			ResultSet rs = ps.executeQuery();

			/* 取得した結果を1件ずつDTOに格納し、更にDTOをArrayListに格納。*/
			while (rs.next()) {
				MyPageDTO dto = new MyPageDTO();
				dto.setId(rs.getString("id"));
				dto.setProductName(rs.getString("product_name"));
				dto.setTotalPrice(rs.getString("total_price"));
				dto.setTotalCount(rs.getString("total_count"));
				dto.setPayment(rs.getString("pay"));
				dto.setInsert_date(rs.getString("insert_date"));
				myPageDTO.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
		}
		return myPageDTO;
	}

	public int buyProductHistoryDelete(String user_master_id) throws SQLException {

		String sql ="DELETE FROM user_buy_item_transaction WHERE user_master_id = ?";
		int result = 0;

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user_master_id);
			result = ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
		}
		return result;
	}
}
