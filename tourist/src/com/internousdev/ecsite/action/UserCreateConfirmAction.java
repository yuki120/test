package com.internousdev.ecsite.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.internousdev.ecsite.dao.UserCreateConfirmDAO;
import com.opensymphony.xwork2.ActionSupport;

public class UserCreateConfirmAction extends ActionSupport implements SessionAware {
	private String userId;
	private String userPassword;
	private String name;
	private String nameKana;
	private String sex;
	private String email;
	private String telNum;
	private String postalCode;
	private String address1;
	private String address2;
	private String errorId;
	private String errorPass;
	private String errorName;
	private String errorNameKana;
	private String errorEmail;
	private String errorTelNum;
	private String errorPostalCode;
	private String errorAddress;

	public Map<String, Object> session;

	public String execute() {
		String result = SUCCESS;
		UserCreateConfirmDAO userCreateConfirmDAO = new UserCreateConfirmDAO();

		/* sessionには、get、set、put が必要。
		 * DAO → set、本Action → get、前Action → put
		 * putがなければ、値がnullのままになっている。
		 */

		if (!(userId.equals(""))
				&& !(userPassword.equals(""))
				&& !(email.equals(""))) {
					session.put("userId", userId);
					session.put("userPassword", userPassword);
					session.put("name", name);
					session.put("nameKana", nameKana);
					session.put("sex", sex);
					session.put("email", email);
					session.put("telNum", telNum);
					session.put("postalCode", postalCode);
					session.put("address1", address1);
					session.put("address2", address2);
		}

		/*ユーザーID*/
		//未入力
		if (userId.equals("")) {
			errorId = "【ユーザーIDを入力してください】";
			result = ERROR;
		}

		//文字数エラー
		else if (!(userId.length() >= 1 && userId.length() <= 8)) {
			errorId = "【ユーザーIDは8文字以内で入力してください】";
			result = ERROR;
		}

		//文字種エラー
		else if (!(userId.matches("^[a-zA-Z0-9]+$"))) {
			errorId = "【ユーザーIDは半角英数字で入力してください】";
			result = ERROR;
		}

		//ID重複チェック
		else if (userCreateConfirmDAO.getUserId(userId)) {
			errorId = "【そのIDは既に使われています】";
			result = ERROR;
		}

		/*パスワード*/
		//未入力
		if (userPassword.equals("")) {
			errorPass = "【パスワードを入力してください】";
			result = ERROR;
		}

		//文字数エラー
		else if (!(userPassword.length() <= 16)) {
			errorPass = "【パスワードは16文字以内で入力してください】";
			result = ERROR;
		}

		//文字種エラー
		else if (!(userPassword.matches("^[a-zA-Z0-9]+$"))) {
			errorPass = "【パスワードは半角英数字で入力してください】";
			result = ERROR;
		}

		/*名前*/
		//未入力
		if (name.equals("")) {
			errorName = "【名前を入力してください】";
			result = ERROR;
		}

		//文字種エラー
		else if (!(name.matches("^[a-zA-Zぁ-ゞ一-龠]+$"))) {
			errorName = "【名前は半角英字,漢字,ひらがなで入力してください】";
			result = ERROR;
		}

		/*なまえ（ふりがな）*/
		//未入力
		if (nameKana.equals("")) {
			errorNameKana = "【なまえ（ふりがな）を入力してください】";
			result = ERROR;
		}

		//文字種エラー
		else if (!(nameKana.matches("^[ぁ-ゞ]+$"))) {
			errorNameKana = "【なまえ（ふりがな）は「ひらがな」で入力してください】";
			result = ERROR;
		}

		/*メールアドレス*/
		//未入力
		if (email.equals("")) {
			errorEmail = "【メールアドレスを入力してください】";
			result = ERROR;
		}

		//文字種エラー @ 及び . を必要とする
		else if (!(email.matches("^[a-zA-Z0-9@.,;:!#$%&'*+-/=?^_`{|}~]+@+[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)+.+[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*$"))) {
			errorEmail = "【メールアドレスは半角英数字記号で、正しいものを入力してください】";
			result = ERROR;
		}

		/*電話番号*/
		//未入力
		if (telNum.equals("")) {
			errorTelNum = "【電話番号を入力してください】";
			result = ERROR;
		}

		/*郵便番号*/
		//未入力
		if (postalCode.equals("")) {
			errorPostalCode = "【郵便番号を入力してください】";
			result = ERROR;
		}

		/*住所*/
		//未入力
		if (address1.equals("")) {
			errorAddress = "【住所を入力してください】";
			result = ERROR;
		}

		return result;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
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

	public String getErrorId() {
		return errorId;
	}

	public void setErrorId(String errorId) {
		this.errorId = errorId;
	}

	public String getErrorPass() {
		return errorPass;
	}

	public void setErrorPass(String errorPass) {
		this.errorPass = errorPass;
	}

	public String getErrorName() {
		return errorName;
	}

	public void setErrorName(String errorName) {
		this.errorName = errorName;
	}

	public String getErrorNameKana() {
		return errorNameKana;
	}

	public void setErrorNameKana(String errorNameKana) {
		this.errorNameKana = errorNameKana;
	}

	public String getErrorEmail() {
		return errorEmail;
	}

	public void setErrorEmail(String errorEmail) {
		this.errorEmail = errorEmail;
	}

	public String getErrorTelNum() {
		return errorTelNum;
	}

	public void setErrorTelNum(String errorTelNum) {
		this.errorTelNum = errorTelNum;
	}

	public String getErrorPostalCode() {
		return errorPostalCode;
	}

	public void setErrorPostalCode(String errorPostalCode) {
		this.errorPostalCode = errorPostalCode;
	}

	public String getErrorAddress() {
		return errorAddress;
	}

	public void setErrorAddress(String errorAddress) {
		this.errorAddress = errorAddress;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

}
