package com.internousdev.ecsite.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dao.UserCreateConfirmDAO;
import com.internousdev.ecsite.dto.LoginDTO;
import com.opensymphony.xwork2.ActionSupport;

public class UserInfoUpdateConfirmAction extends ActionSupport implements SessionAware {

	private String loginId;
	private String loginPassword;
	private String name;
	private String nameKana;
	private String address1;
	private String address2;
	private String sex;
	private String email;
	private String telNum;
	private String postalCode;
	public Map<String,Object> session;
	private String errorMassage;
	@SuppressWarnings("unused")
	private LoginDTO loginDTO = new LoginDTO();
	private UserCreateConfirmDAO userCreateConfirmDAO = new UserCreateConfirmDAO();

	public String execute(){
		String result = SUCCESS;

		boolean dateCheck = false;

		if(!(loginId.length() == 0) && !(loginPassword.length() == 0) && !(name.length() == 0) && !(nameKana.length() == 0)
				&& !(address1.length() == 0l) && !(address2.length() == 0) && !(email.length() == 0)
				&& !(telNum.length() == 0) && !(postalCode.length() == 0)){

			String defaultLoginId = ((LoginDTO) session.get("loginUser")).getLoginId();
			String defaultPassword=((LoginDTO) session.get("loginUser")).getLoginPassword();
			session.put("defaultLoginId", defaultLoginId);

			if( defaultLoginId.equals(loginId) || defaultPassword.equals(loginPassword)){

				//パスワードを変更する場合
				if(defaultLoginId.equals(loginId)){

					dateCheck = true;

				}else{
					//IDを変更する場合
					dateCheck = userCreateConfirmDAO.getUserId(loginPassword);
				}
			}else{

				//パスワード、ID両方変更する場合
				dateCheck = userCreateConfirmDAO.getUserId(loginPassword);
			}

			if(dateCheck){
				System.out.println(loginId);
				System.out.println(defaultLoginId);
				session.put("loginId", loginId);
				session.put("loginPassword", loginPassword);
				session.put("name", name);
				session.put("nameKana", nameKana);
				session.put("address1", address1);
				session.put("address2", address2);
				session.put("sex", sex);
				session.put("email", email);
				session.put("telNum", telNum);
				session.put("postalCode", postalCode);
			}else{
				setErrorMassage("同じIDまたはパスワードが存在します。");
				result = ERROR;
			}

		}else{
			setErrorMassage("未入力の項目があります。");
			result = ERROR;
		}
		return result;
	}

	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getLoginPassword() {
		return loginPassword;
	}

	public void setLoginPassword(String loginPassword) {
		this.loginPassword = loginPassword;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNameKana() {
		return nameKana;
	}

	public void setNameKana(String nameKana) {
		this.nameKana = nameKana;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelNum() {
		return telNum;
	}

	public void setTelNum(String telNum) {
		this.telNum = telNum;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getErrorMassage() {
		return errorMassage;
	}

	public void setErrorMassage(String errorMassage) {
		this.errorMassage = errorMassage;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}
