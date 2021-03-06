package com.internousdev.ecsite.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.internousdev.ecsite.dto.LoginDTO;
import com.internousdev.ecsite.util.DBConnector;

public class LoginDAO {

	public LoginDTO getLoginUserInfo (String loginId, String loginPassword) {

		DBConnector db = new DBConnector();
		Connection con = db.getConnection();
		LoginDTO loginDTO = new LoginDTO();

		String sql = "SELECT * FROM login_user_transaction WHERE login_id=? AND login_pass=?";

		try {
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, loginId);
			ps.setString(2, loginPassword);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				loginDTO.setLoginId(rs.getString("login_id"));
				loginDTO.setLoginPassword(rs.getString("login_pass"));
				loginDTO.setName(rs.getString("name"));
				loginDTO.setNameKana(rs.getString("name_kana"));
				loginDTO.setAddress1(rs.getString("address1"));
				loginDTO.setAddress2(rs.getString("address2"));
				loginDTO.setSex(rs.getString("sex"));
				loginDTO.setEmail(rs.getString("email"));
				loginDTO.setTelNum(rs.getString("tel_num"));
				loginDTO.setPostalCode(rs.getString("postal_code"));
				loginDTO.setUserNumber(rs.getString("id"));

				if (!(rs.getString("login_id").equals(null))) {
					loginDTO.setLoginFlg(true);
				}

				if(rs.getString("login_id").equals("master") && rs.getString("login_pass").equals("master01")){
					loginDTO.setLoginMaster(true);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return loginDTO;
	}


}
