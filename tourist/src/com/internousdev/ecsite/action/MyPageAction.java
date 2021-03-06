package com.internousdev.ecsite.action;

import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class MyPageAction extends ActionSupport implements SessionAware {
	public Map<String, Object> session;

	public String execute() {

		if (!session.containsKey("id") && !session.containsKey("masterId")) {
			return ERROR;
		}

		return SUCCESS;
	}

	public Map<String, Object> getSession() {
		return session;
	}

	@Override
	public void setSession (Map<String, Object> session) {
		this.session = session;
	}
}
