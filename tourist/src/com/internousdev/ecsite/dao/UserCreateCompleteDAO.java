package com.internousdev.ecsite.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.internousdev.ecsite.util.DBConnector;
import com.internousdev.ecsite.util.DateUtil;

public class UserCreateCompleteDAO {
	private DateUtil dateUtil = new DateUtil();

	private String sql = "INSERT INTO login_user_transaction(login_id, login_pass, name, name_kana, sex, email, tel_num, postal_code, address1, address2, insert_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

	public void createUser(String userId, String userPassword, String name, String nameKana, String sex, String email, String telNum, String postalCode, String address1, String address2) throws SQLException {
		DBConnector db = new DBConnector();
		Connection con = db.getConnection();

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, userId);
			ps.setString(2, userPassword);
			ps.setString(3, name);
			ps.setString(4, nameKana);
			ps.setString(5, sex);
			ps.setString(6, email);
			ps.setString(7, telNum);
			ps.setString(8, postalCode);
			ps.setString(9, address1);
			ps.setString(10, address2);
			ps.setString(11, dateUtil.getDate());

			ps.execute();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			con.close();
		}
	}
}
